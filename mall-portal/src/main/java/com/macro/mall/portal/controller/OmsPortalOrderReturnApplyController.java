package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.OmsOrderReturnApply;
import com.macro.mall.portal.domain.OmsOrderReturnApplyParam;
import com.macro.mall.portal.service.OmsPortalOrderReturnApplyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

/**
 * 退货申请管理Controller
 * Created by zjjjjkkk on 2018/10/17.
 */
@Controller
@Api(tags = "OmsPortalOrderReturnApplyController")
@Tag(name = "OmsPortalOrderReturnApplyController", description = "退货申请管理")
@RequestMapping("/order/returnApply")
public class OmsPortalOrderReturnApplyController {
    @Autowired
    private OmsPortalOrderReturnApplyService returnApplyService;

    @ApiOperation("创建退款申请")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody OmsOrderReturnApplyParam returnApply, Principal principal) {
        // 从Principal获取当前用户信息
        Long memberId = Long.parseLong(principal.getName().split(",")[0]);
        String username = principal.getName().split(",")[1];

        int count = returnApplyService.create(returnApply, memberId, username);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("获取退款列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<OmsOrderReturnApply>> list(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
            Principal principal) {
        // 从Principal获取当前用户信息
        Long memberId = Long.parseLong(principal.getName().split(",")[0]);

        List<OmsOrderReturnApply> returnApplyList = returnApplyService.list(memberId, pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(returnApplyList));
    }

    @ApiOperation("获取退款详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<OmsOrderReturnApply> detail(
            @ApiParam("退款申请ID") @PathVariable Long id,
            Principal principal) {
        // 从Principal获取当前用户信息
        Long memberId = Long.parseLong(principal.getName().split(",")[0]);

        OmsOrderReturnApply returnApply = returnApplyService.detail(id, memberId);
        if (returnApply != null) {
            return CommonResult.success(returnApply);
        }
        return CommonResult.failed("退款申请不存在或无权查看");
    }

    @ApiOperation("取消退款申请")
    @RequestMapping(value = "/cancel/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult cancel(
            @ApiParam("退款申请ID") @PathVariable Long id,
            Principal principal) {
        // 从Principal获取当前用户信息
        Long memberId = Long.parseLong(principal.getName().split(",")[0]);

        int count = returnApplyService.cancel(id, memberId);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed("取消退款申请失败");
    }
}
