﻿using Aliyun.OSS;
using Aliyun.OSS.Common;
using Infrastructure;
using System;
using System.IO;

namespace ZR.Common
{
    public class AliyunOssHelper
    { 
        static string accessKeyId = AppSettings.GetConfig("ALIYUN_OSS:KEY");
        static string accessKeySecret = AppSettings.GetConfig("ALIYUN_OSS:SECRET");
        static string endpoint = AppSettings.GetConfig("ALIYUN_OSS:REGIONID");
        static string bucketName1 = AppSettings.GetConfig("ALIYUN_OSS:bucketName");
        static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();
        /// <summary>
        /// 上传到阿里云
        /// </summary>
        /// <param name="filestreams"></param>
        /// <param name="dirPath">存储路径 eg： upload/2020/01/01/xxx.png</param>
        /// <param name="bucketName">存储桶 如果为空默认取配置文件</param>
        public static System.Net.HttpStatusCode PutObjectFromFile(Stream filestreams, string dirPath, string bucketName = "")
        {
            OssClient client = new(endpoint, accessKeyId, accessKeySecret);
            if (string.IsNullOrEmpty(bucketName)) { bucketName = bucketName1; }
            try
            {
                dirPath = dirPath.Replace("\\", "/");
                PutObjectResult putObjectResult = client.PutObject(bucketName, dirPath, filestreams);
                logger.Info("PutObjectFromFile：{0}", putObjectResult.HttpStatusCode);

                return putObjectResult.HttpStatusCode;
            }
            catch (OssException ex)
            {
                Console.WriteLine("Failed with error code: {0}; Error info: {1}. \nRequestID:{2}\tHostID:{3}",
                  ex.ErrorCode, ex.Message, ex.RequestId, ex.HostId);
                logger.Error($"Failed with error code: {ex.ErrorCode}; Error info: {ex.Message}. \nRequestID:{ex.RequestId}\tHostID:{ex.HostId}");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed with error info: {0}", ex.Message);
                logger.Error($"Failed with error info: {ex.Message}");
            }
            return System.Net.HttpStatusCode.BadRequest;
        }

    }
}
