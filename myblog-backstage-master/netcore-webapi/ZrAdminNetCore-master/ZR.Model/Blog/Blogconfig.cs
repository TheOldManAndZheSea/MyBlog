using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 博客前台配置表信息修改，数据实体对象
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [SugarTable("t_blogconfig")]
    [Tenant("0")]
    public class Blogconfig
    {
        [SqlSugar.SugarColumn(IsIdentity = true, IsPrimaryKey = true)]
        public int Id { get; set; }
        /// <summary>
        /// 描述 : 博客标题
        /// 空值 : false  
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 描述 : 版权所有
        /// 空值 : false  
        /// </summary>
        public string Copyright { get; set; }

        /// <summary>
        /// 描述 : 作者qq
        /// 空值 : true  
        /// </summary>
        public string AuthorQQ { get; set; }

        /// <summary>
        /// 描述 : 作者微信
        /// 空值 : true  
        /// </summary>
        public string AuthorWechart { get; set; }

        /// <summary>
        /// 描述 : 作者邮箱
        /// 空值 : false  
        /// </summary>
        public string AuthorEmail { get; set; }

        /// <summary>
        /// 描述 : 是否开放登录
        /// 空值 : true  
        /// </summary>
        public string IsOpenLogin { get; set; }

        /// <summary>
        /// 描述 : 是否开放注册
        /// 空值 : true  
        /// </summary>
        public string IsOpenRegister { get; set; }

        /// <summary>
        /// 描述 : 博客简介
        /// 空值 : true  
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 描述 : 最下方图片链接
        /// 空值 : true  
        /// </summary>
        public string BottomImage { get; set; }

        /// <summary>
        /// 描述 : 博客背景图
        /// 空值 : false  
        /// </summary>
        public string BlogBackGroundImage { get; set; }

        /// <summary>
        /// 描述 : 支付宝赞助图片
        /// 空值 : true  
        /// </summary>
        public string FundedAlipayImg { get; set; }

        /// <summary>
        /// 描述 : 微信赞助图片
        /// 空值 : true  
        /// </summary>
        public string FundedWechartImg { get; set; }

    }
}