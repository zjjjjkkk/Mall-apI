package com.macro.mall.service.impl;

import com.macro.mall.dao.OmsStatisticsDao;
import com.macro.mall.dto.*;
import com.macro.mall.service.OmsStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

/**
 * 数据统计Service实现类
 */
@Service
public class OmsStatisticsServiceImpl implements OmsStatisticsService {
    
    @Autowired
    private OmsStatisticsDao statisticsDao;
    
    @Override
    public StatisticsOverviewResult getOverview() {
        Calendar calendar = Calendar.getInstance();
        Date today = calendar.getTime();
        
        // 今日数据
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date todayStart = calendar.getTime();
        
        // 昨日数据
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        Date yesterdayStart = calendar.getTime();
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        Date yesterdayEnd = calendar.getTime();
        
        // 本月数据
        calendar.setTime(today);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date monthStart = calendar.getTime();
        
        // 上月数据（用于计算增长率，暂时不使用）
        // calendar.add(Calendar.MONTH, -1);
        // Date lastMonthStart = calendar.getTime();
        // calendar.add(Calendar.MONTH, 1);
        // calendar.add(Calendar.DAY_OF_MONTH, -1);
        // calendar.set(Calendar.HOUR_OF_DAY, 23);
        // calendar.set(Calendar.MINUTE, 59);
        // calendar.set(Calendar.SECOND, 59);
        // Date lastMonthEnd = calendar.getTime();
        
        // 获取今日数据
        Map<String, Object> todayStats = statisticsDao.getOrderStatistics(todayStart, today);
        StatisticsOverviewResult result = buildOverviewResult(todayStats);
        
        // 获取昨日数据（用于计算增长率）
        Map<String, Object> yesterdayStats = statisticsDao.getOrderStatistics(yesterdayStart, yesterdayEnd);
        Long yesterdayOrderCount = ((Number) yesterdayStats.get("orderCount")).longValue();
        BigDecimal yesterdayOrderAmount = new BigDecimal(yesterdayStats.get("orderAmount").toString());
        
        // 计算增长率
        if (yesterdayOrderCount > 0) {
            double orderCountGrowth = ((result.getOrderCount() - yesterdayOrderCount) * 100.0) / yesterdayOrderCount;
            result.setOrderCountGrowthRate(orderCountGrowth);
        }
        if (yesterdayOrderAmount.compareTo(BigDecimal.ZERO) > 0) {
            double orderAmountGrowth = result.getOrderAmount()
                    .subtract(yesterdayOrderAmount)
                    .divide(yesterdayOrderAmount, 4, RoundingMode.HALF_UP)
                    .multiply(new BigDecimal("100"))
                    .doubleValue();
            result.setOrderAmountGrowthRate(orderAmountGrowth);
        }
        
        // 获取会员统计
        Map<String, Object> memberStats = statisticsDao.getMemberStatistics(monthStart, today);
        result.setNewMemberCount(((Number) memberStats.get("newMemberCount")).longValue());
        result.setActiveMemberCount(((Number) memberStats.get("activeMemberCount")).longValue());
        
        // 获取商品浏览量（从商品表的read_count字段统计）
        Long viewCount = statisticsDao.getProductViewCount(todayStart, today);
        result.setProductViewCount(viewCount != null ? viewCount : 0L);
        
        // 获取商品销量（从订单商品表统计）
        Long saleCount = statisticsDao.getProductSaleCount(todayStart, today);
        result.setProductSaleCount(saleCount != null ? saleCount : 0L);
        
        return result;
    }
    
    @Override
    public StatisticsTrendResult getTrend(Date startDate, Date endDate, String type) {
        StatisticsTrendResult result = new StatisticsTrendResult();
        List<String> timeLabels = new ArrayList<>();
        List<Long> orderCountList = new ArrayList<>();
        List<BigDecimal> orderAmountList = new ArrayList<>();
        List<Long> paidOrderCountList = new ArrayList<>();
        List<BigDecimal> paidOrderAmountList = new ArrayList<>();
        
        List<Map<String, Object>> trendData;
        if ("hour".equals(type)) {
            trendData = statisticsDao.getOrderTrendByHour(startDate, endDate);
        } else {
            trendData = statisticsDao.getOrderTrendByDay(startDate, endDate);
        }
        
        for (Map<String, Object> data : trendData) {
            Object label = data.get("dateLabel");
            if (label != null) {
                timeLabels.add(label.toString());
            } else if (data.get("hourLabel") != null) {
                timeLabels.add(data.get("hourLabel").toString() + ":00");
            }
            
            orderCountList.add(((Number) data.get("orderCount")).longValue());
            orderAmountList.add(new BigDecimal(data.get("orderAmount").toString()));
            paidOrderCountList.add(((Number) data.get("paidOrderCount")).longValue());
            paidOrderAmountList.add(new BigDecimal(data.get("paidOrderAmount").toString()));
        }
        
        result.setTimeLabels(timeLabels);
        result.setOrderCountList(orderCountList);
        result.setOrderAmountList(orderAmountList);
        result.setPaidOrderCountList(paidOrderCountList);
        result.setPaidOrderAmountList(paidOrderAmountList);
        
        return result;
    }
    
    @Override
    public List<StatisticsProductResult> getProductRanking(Date startDate, Date endDate, Integer limit) {
        if (limit == null || limit <= 0) {
            limit = 10;
        }
        return statisticsDao.getProductRanking(startDate, endDate, limit);
    }
    
    @Override
    public List<StatisticsRegionResult> getRegionDistribution(Date startDate, Date endDate) {
        return statisticsDao.getRegionDistribution(startDate, endDate);
    }
    
    @Override
    public StatisticsOverviewResult getRealtimeData() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date hourStart = calendar.getTime();
        Date hourEnd = new Date();
        
        Map<String, Object> stats = statisticsDao.getOrderStatistics(hourStart, hourEnd);
        StatisticsOverviewResult result = buildOverviewResult(stats);
        
        // 获取实时商品销量
        Long saleCount = statisticsDao.getProductSaleCount(hourStart, hourEnd);
        result.setProductSaleCount(saleCount != null ? saleCount : 0L);
        
        // 获取实时商品浏览量
        Long viewCount = statisticsDao.getProductViewCount(hourStart, hourEnd);
        result.setProductViewCount(viewCount != null ? viewCount : 0L);
        
        return result;
    }
    
    /**
     * 构建概览结果
     */
    private StatisticsOverviewResult buildOverviewResult(Map<String, Object> stats) {
        StatisticsOverviewResult result = new StatisticsOverviewResult();
        result.setOrderCount(((Number) stats.get("orderCount")).longValue());
        result.setOrderAmount(new BigDecimal(stats.get("orderAmount").toString()));
        result.setPaidOrderCount(((Number) stats.get("paidOrderCount")).longValue());
        result.setPaidOrderAmount(new BigDecimal(stats.get("paidOrderAmount").toString()));
        result.setRefundOrderCount(0L); // 可以从退款表查询
        result.setRefundOrderAmount(BigDecimal.ZERO);
        // productSaleCount 在调用处设置
        return result;
    }
}

