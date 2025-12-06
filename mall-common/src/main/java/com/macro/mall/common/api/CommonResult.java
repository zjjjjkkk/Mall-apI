package com.macro.mall.common.api;

/**
 * 通用返回结果封装类
 * Created by zjjjjkkk on 2019/4/19.
 */
public class CommonResult<T> {
    /**
     * 状态码
     */
    private long code;
    /**
     * 提示信息
     */
    private String message;
    /**
     * 数据封装
     */
    private T data;

    protected CommonResult() {
    }

    protected CommonResult(long code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /**
     * 成功返回结果
     *
     * @param data 获取的数据
     */
    public static <T> CommonResult<T> success(T data) {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), data);
    }

    /**
     * 成功返回结果
     *
     * @param data 获取的数据
     * @param  message 提示信息
     */
    public static <T> CommonResult<T> success(T data, String message) {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), message, data);
    }

    /**
     * 失败返回结果
     * @param errorCode 错误码
     */
    public static <T> CommonResult<T> failed(IErrorCode errorCode) {
        return new CommonResult<T>(errorCode.getCode(), errorCode.getMessage(), null);
    }

    /**
     * 失败返回结果
     * @param errorCode 错误码
     * @param message 错误信息
     */
    public static <T> CommonResult<T> failed(IErrorCode errorCode,String message) {
        return new CommonResult<T>(errorCode.getCode(), message, null);
    }

    /**
     * 失败返回结果
     * @param message 提示信息
     */
    public static <T> CommonResult<T> failed(String message) {
        return new CommonResult<T>(ResultCode.FAILED.getCode(), message, null);
    }

    /**
     * 失败返回结果
     */
    public static <T> CommonResult<T> failed() {
        return failed(ResultCode.FAILED);
    }

    /**
     * 参数验证失败返回结果
     */
    public static <T> CommonResult<T> validateFailed() {
        return failed(ResultCode.VALIDATE_FAILED);
    }

    /**
     * 参数验证失败返回结果
     * @param message 提示信息
     */
    public static <T> CommonResult<T> validateFailed(String message) {
        return new CommonResult<T>(ResultCode.VALIDATE_FAILED.getCode(), message, null);
    }

    /**
     * 未登录返回结果
     */
    public static <T> CommonResult<T> unauthorized(T data) {
        return new CommonResult<T>(ResultCode.UNAUTHORIZED.getCode(), ResultCode.UNAUTHORIZED.getMessage(), data);
    }

    /**
     * 未授权返回结果
     */
    public static <T> CommonResult<T> forbidden(T data) {
        return new CommonResult<T>(ResultCode.FORBIDDEN.getCode(), ResultCode.FORBIDDEN.getMessage(), data);
    }

    // ======================== 新增退款专用返回方法 ========================
    /**
     * 退款申请提交成功
     */
    public static <T> CommonResult<T> refundApplySuccess() {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), "退款申请提交成功", null);
    }

    /**
     * 退款申请提交成功（带数据）
     */
    public static <T> CommonResult<T> refundApplySuccess(T data) {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), "退款申请提交成功", data);
    }

    /**
     * 退款申请提交失败
     */
    public static <T> CommonResult<T> refundApplyFailed(String message) {
        return new CommonResult<T>(ResultCode.FAILED.getCode(), message, null);
    }

    /**
     * 退款审核成功
     */
    public static <T> CommonResult<T> refundAuditSuccess() {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), "退款审核成功", null);
    }

    /**
     * 退款审核失败
     */
    public static <T> CommonResult<T> refundAuditFailed(String message) {
        return new CommonResult<T>(ResultCode.FAILED.getCode(), message, null);
    }

    /**
     * 退款操作成功（如退款到账）
     */
    public static <T> CommonResult<T> refundSuccess(T data) {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), "退款成功", data);
    }

    /**
     * 退款操作失败（如支付渠道退款失败）
     */
    public static <T> CommonResult<T> refundFailed(String message) {
        return new CommonResult<T>(ResultCode.FAILED.getCode(), message, null);
    }

    // ======================== 原有getter/setter ========================
    public long getCode() {
        return code;
    }

    public void setCode(long code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}