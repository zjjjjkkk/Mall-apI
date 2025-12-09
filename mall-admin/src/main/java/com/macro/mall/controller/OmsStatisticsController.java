package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.*;
import com.macro.mall.service.OmsStatisticsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 数据统计Controller
 */
@RestController
@Api(tags = "OmsStatisticsController")
@Tag(name = "OmsStatisticsController", description = "数据统计")
@RequestMapping("/statistics")
public class OmsStatisticsController {
    
    @Autowired
    private OmsStatisticsService statisticsService;
    
    @ApiOperation("获取数据概览")
    @GetMapping("/overview")
    public CommonResult<StatisticsOverviewResult> getOverview() {
        StatisticsOverviewResult result = statisticsService.getOverview();
        return CommonResult.success(result);
    }
    
    @ApiOperation("获取趋势数据")
    @GetMapping("/trend")
    public CommonResult<StatisticsTrendResult> getTrend(
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
            @RequestParam(defaultValue = "day") String type) {
        
        // 如果没有指定日期，默认查询最近7天
        if (startDate == null || endDate == null) {
            Date now = new Date();
            endDate = now;
            long time = now.getTime() - 6 * 24 * 60 * 60 * 1000L;
            startDate = new Date(time);
        }
        
        StatisticsTrendResult result = statisticsService.getTrend(startDate, endDate, type);
        return CommonResult.success(result);
    }
    
    @ApiOperation("获取商品销售排行")
    @GetMapping("/product/ranking")
    public CommonResult<List<StatisticsProductResult>> getProductRanking(
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
            @RequestParam(defaultValue = "10") Integer limit) {
        
        // 如果没有指定日期，默认查询最近30天
        if (startDate == null || endDate == null) {
            Date now = new Date();
            endDate = now;
            long time = now.getTime() - 29 * 24 * 60 * 60 * 1000L;
            startDate = new Date(time);
        }
        
        List<StatisticsProductResult> result = statisticsService.getProductRanking(startDate, endDate, limit);
        return CommonResult.success(result);
    }
    
    @ApiOperation("获取地区销售分布")
    @GetMapping("/region/distribution")
    public CommonResult<List<StatisticsRegionResult>> getRegionDistribution(
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
        
        // 如果没有指定日期，默认查询最近30天
        if (startDate == null || endDate == null) {
            Date now = new Date();
            endDate = now;
            long time = now.getTime() - 29 * 24 * 60 * 60 * 1000L;
            startDate = new Date(time);
        }
        
        List<StatisticsRegionResult> result = statisticsService.getRegionDistribution(startDate, endDate);
        return CommonResult.success(result);
    }
    
    @ApiOperation("获取实时数据")
    @GetMapping("/realtime")
    public CommonResult<StatisticsOverviewResult> getRealtimeData() {
        StatisticsOverviewResult result = statisticsService.getRealtimeData();
        return CommonResult.success(result);
    }

    // 用户行为统计接口已移至UmsStatisticsController（portal模块）
    // 如需在admin模块使用，可通过HTTP调用portal模块的接口
}

