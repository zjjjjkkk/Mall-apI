package com.macro.mall.portal.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.mapper.PmsBrandMapper;
import com.macro.mall.mapper.PmsRepairMapper;
import com.macro.mall.model.PmsBrand;
import com.macro.mall.model.PmsRepair;
import com.macro.mall.model.PmsRepairExample;
import com.macro.mall.model.UmsMember;
import com.macro.mall.portal.service.PmsRepairService;
import com.macro.mall.portal.service.UmsMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 商品报修服务实现类
 */
@Service
public class PmsRepairServiceImpl implements PmsRepairService {

    @Autowired
    private PmsRepairMapper repairMapper;

    @Autowired
    private PmsBrandMapper brandMapper;

    @Autowired
    private UmsMemberService memberService;

    @Override
    public PmsRepair createRepair(PmsRepair repair) {
        UmsMember currentMember = memberService.getCurrentMember();
        if (currentMember == null) {
            throw new RuntimeException("用户未登录");
        }

        // 设置会员信息
        repair.setMemberId(currentMember.getId());
        repair.setMemberNickName(currentMember.getNickname());
        repair.setCreateTime(new Date());
        repair.setStatus(0); // 待处理
        // 兼容新流程，默认应付金额 200，未支付
        if (repair.getPayAmount() == null) {
            repair.setPayAmount(BigDecimal.valueOf(200));
        }
        repair.setPayStatus(0);

        // 获取品牌地址信息
        if (repair.getBrandId() != null) {
            PmsBrand brand = brandMapper.selectByPrimaryKey(repair.getBrandId());
            if (brand != null) {
                repair.setBrandName(brand.getName());
                // 从品牌表获取地址和经纬度
                if (brand.getAddress() != null) {
                    repair.setShopAddress(brand.getAddress());
                }
                if (brand.getLongitude() != null && brand.getLatitude() != null) {
                    repair.setShopLongitude(brand.getLongitude());
                    repair.setShopLatitude(brand.getLatitude());
                }
            }
        }

        // 计算距离和时间（如果是线下到店）
        if (repair.getRepairType() != null && repair.getRepairType() == 1) {
            if (repair.getUserLongitude() != null && repair.getUserLatitude() != null
                    && repair.getShopLongitude() != null && repair.getShopLatitude() != null) {
                BigDecimal distance = calculateDistance(
                    repair.getUserLatitude().doubleValue(),
                    repair.getUserLongitude().doubleValue(),
                    repair.getShopLatitude().doubleValue(),
                    repair.getShopLongitude().doubleValue()
                );
                repair.setDistance(distance);
                // 计算步行时间（假设步行速度5km/h）
                repair.setWalkingTime((int) (distance.doubleValue() / 1000.0 / 5.0 * 60));
                // 计算骑车时间（假设骑车速度15km/h）
                repair.setCyclingTime((int) (distance.doubleValue() / 1000.0 / 15.0 * 60));
            }
        }

        repairMapper.insertSelective(repair);
        return repair;
    }

    @Override
    public int payAndSubmitReceiveInfo(Long id, String receiveName, String receivePhone, String receiveAddress) {
        UmsMember currentMember = memberService.getCurrentMember();
        if (currentMember == null) {
            throw new RuntimeException("用户未登录");
        }
        PmsRepair repair = repairMapper.selectByPrimaryKey(id);
        if (repair == null || !Objects.equals(repair.getMemberId(), currentMember.getId())) {
            throw new RuntimeException("报修单不存在或无权限");
        }
        // 取消的单不允许支付，其余状态（待处理/已受理/维修中/已完成/待支付/待发货/已发货）都放行，便于兼容老流程
        if (repair.getStatus() != null && repair.getStatus() == 4) {
            throw new RuntimeException("当前状态不可支付");
        }
        PmsRepair update = new PmsRepair();
        update.setId(id);
        update.setReceiveName(receiveName);
        update.setReceivePhone(receivePhone);
        update.setReceiveAddress(receiveAddress);
        update.setPayStatus(1);
        update.setPayTime(new Date());
        update.setPayAmount(repair.getPayAmount() != null ? repair.getPayAmount() : BigDecimal.valueOf(200));
        // 如果已发货或已完成，仅更新支付信息不改状态；否则进入待发货
        if (repair.getStatus() != null && (repair.getStatus() == 7 || repair.getStatus() == 3)) {
            update.setStatus(repair.getStatus());
        } else {
            update.setStatus(6); // 待发货
        }
        update.setUpdateTime(new Date());
        return repairMapper.updateByPrimaryKeySelective(update);
    }

    @Override
    public int confirmReceive(Long id) {
        UmsMember currentMember = memberService.getCurrentMember();
        if (currentMember == null) {
            throw new RuntimeException("用户未登录");
        }
        PmsRepair repair = repairMapper.selectByPrimaryKey(id);
        if (repair == null || !Objects.equals(repair.getMemberId(), currentMember.getId())) {
            throw new RuntimeException("报修单不存在或无权限");
        }
        if (repair.getStatus() == null || (repair.getStatus() != 7 && repair.getStatus() != 6)) {
            throw new RuntimeException("当前状态不可确认收货");
        }
        PmsRepair update = new PmsRepair();
        update.setId(id);
        update.setStatus(3); // 已完成
        update.setReceiveConfirmTime(new Date());
        update.setUpdateTime(new Date());
        return repairMapper.updateByPrimaryKeySelective(update);
    }

    @Override
    public List<PmsRepair> getMyRepairList(Integer pageNum, Integer pageSize) {
        UmsMember currentMember = memberService.getCurrentMember();
        if (currentMember == null) {
            throw new RuntimeException("用户未登录");
        }

        PageHelper.startPage(pageNum, pageSize);
        PmsRepairExample example = new PmsRepairExample();
        example.createCriteria().andMemberIdEqualTo(currentMember.getId());
        example.setOrderByClause("create_time desc");
        return repairMapper.selectByExample(example);
    }

    @Override
    public PmsRepair getRepairDetail(Long id) {
        UmsMember currentMember = memberService.getCurrentMember();
        if (currentMember == null) {
            throw new RuntimeException("用户未登录");
        }

        PmsRepair repair = repairMapper.selectByPrimaryKey(id);
        if (repair != null && !repair.getMemberId().equals(currentMember.getId())) {
            throw new RuntimeException("无权访问该报修记录");
        }
        return repair;
    }

    @Override
    public int cancelRepair(Long id) {
        UmsMember currentMember = memberService.getCurrentMember();
        if (currentMember == null) {
            throw new RuntimeException("用户未登录");
        }

        PmsRepair repair = repairMapper.selectByPrimaryKey(id);
        if (repair == null || !repair.getMemberId().equals(currentMember.getId())) {
            throw new RuntimeException("无权操作该报修记录");
        }

        if (repair.getStatus() == 3 || repair.getStatus() == 4) {
            throw new RuntimeException("该报修记录已完成或已取消，无法再次取消");
        }

        repair.setStatus(4); // 已取消
        repair.setUpdateTime(new Date());
        return repairMapper.updateByPrimaryKeySelective(repair);
    }

    /**
     * 计算两点之间的距离（米）
     * 使用Haversine公式
     */
    private BigDecimal calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        final int R = 6371000; // 地球半径（米）
        double latDistance = Math.toRadians(lat2 - lat1);
        double lonDistance = Math.toRadians(lon2 - lon1);
        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = R * c;
        return BigDecimal.valueOf(distance).setScale(2, java.math.RoundingMode.HALF_UP);
    }
}

