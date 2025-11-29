package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.alibaba.fastjson.JSONObject;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/location")
@Api(tags = "LocationController")
public class LocationController {

    private static final String GAODE_KEY = "889850e947bcc15b8297972cc800270c";
    private static final OkHttpClient CLIENT = new OkHttpClient();

    @ApiOperation("根据经纬度获取地址")
    @GetMapping("/reverse")
    public CommonResult<Map<String, Object>> reverse(
            @RequestParam double lat,
            @RequestParam double lng) throws IOException {

        HttpUrl url = HttpUrl.parse("https://restapi.amap.com/v3/geocode/regeo")
                .newBuilder()
                .addQueryParameter("key", GAODE_KEY)
                .addQueryParameter("location", lng + "," + lat)
                .addQueryParameter("extensions", "base")
                .addQueryParameter("radius", "1000")
                .addQueryParameter("output", "json")
                .build();

        Request request = new Request.Builder().url(url).get().build();
        try (Response response = CLIENT.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                return CommonResult.failed("高德返回错误：" + response.code());
            }
            String body = response.body().string();
            JSONObject json = JSONObject.parseObject(body);
            if (!"1".equals(json.getString("status"))) {
                return CommonResult.failed("高德服务失败：" + json.getString("info"));
            }
            JSONObject comp = json.getJSONObject("regeocode").getJSONObject("addressComponent");
            Map<String, Object> result = new HashMap<>();
            result.put("province", comp.getString("province"));
            result.put("city", comp.getString("city"));
            result.put("district", comp.getString("district"));
            result.put("formattedAddress", json.getJSONObject("regeocode").getString("formatted_address"));
            return CommonResult.success(result);
        }
    }
}