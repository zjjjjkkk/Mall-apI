package com.macro.mall.controller;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient; // 重要：使用 OSSClient 而不是 OSSClientBuilder
import com.aliyun.oss.common.auth.Credentials;
import com.aliyun.oss.common.auth.DefaultCredentialProvider;
import com.aliyun.oss.model.PutObjectResult;
import com.macro.mall.common.api.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

@Api(tags = "FileUploadController")
@RestController
@RequestMapping("/upload")
public class FileUploadController {

    @Value("${aliyun.oss.endpoint}")
    private String endpoint;

    @Value("${aliyun.oss.bucketName}")
    private String bucketName;

    @Value("${aliyun.oss.accessKeyId}")
    private String accessKeyId;

    @Value("${aliyun.oss.accessKeySecret}")
    private String accessKeySecret;

    @Value("${aliyun.oss.dirPrefix:images/}")
    private String dirPrefix;

    @ApiOperation("上传文件到OSS")
    @PostMapping("/oss")
    public CommonResult<String> uploadToOss(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return CommonResult.failed("文件为空");
        }

        // 生成唯一文件名
        String originalFilename = file.getOriginalFilename();
        String ext = "";
        if (originalFilename != null && originalFilename.contains(".")) {
            ext = originalFilename.substring(originalFilename.lastIndexOf("."));
        }
        String fileName = dirPrefix + UUID.randomUUID().toString().replace("-", "") + ext;

        try {
            // ✅ 2.5.0 版本正确写法：使用 OSSClient 构造
            OSS ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);

            // 上传文件
            PutObjectResult result = ossClient.putObject(bucketName, fileName, file.getInputStream());

            // 关闭 client（2.5.0 有 shutdown 方法）
            ossClient.shutdown();

            // 构造可访问的 URL
            String url = "https://" + bucketName + "." + endpoint + "/" + fileName;
            return CommonResult.success(url);

        } catch (IOException e) {
            e.printStackTrace();
            return CommonResult.failed("上传失败: " + e.getMessage());
        }
    }
}