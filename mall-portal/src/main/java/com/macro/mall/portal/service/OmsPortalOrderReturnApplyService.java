package com.macro.mall.portal.service;

import com.macro.mall.model.OmsOrderReturnApply;
import com.macro.mall.portal.domain.OmsOrderReturnApplyParam;

import java.util.List;

/**
 * 订单退货管理Service
 * Created by zjjjjkkk on 2018/10/17.
 */
public interface OmsPortalOrderReturnApplyService {
    /**
     * 提交申请退货
     */
    int create(OmsOrderReturnApplyParam returnApplyParam, Long memberId, String username);

    /**
     * 获取退款申请列表
     */
    List<OmsOrderReturnApply> list(Long memberId, Integer pageNum, Integer pageSize);

    /**
     * 获取退款申请详情
     */
    OmsOrderReturnApply detail(Long id, Long memberId);

    /**
     * 取消退款申请
     */
    int cancel(Long id, Long memberId);
}
