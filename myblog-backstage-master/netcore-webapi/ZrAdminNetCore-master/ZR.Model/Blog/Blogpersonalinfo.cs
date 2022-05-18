using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 博客个人信息，数据实体对象
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    [SugarTable("t_blogpersonalinfo")]
    [Tenant("0")]
    public class Blogpersonalinfo
    {
        /// <summary>
        /// 描述 : 
        /// 空值 : false  
        /// </summary>
        [SqlSugar.SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 描述 : 姓名
        /// 空值 : true  
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 描述 : 性别
        /// 空值 : true  
        /// </summary>
        public string Sex { get; set; }

        /// <summary>
        /// 描述 : 年龄
        /// 空值 : true  
        /// </summary>
        public int? Age { get; set; }

        /// <summary>
        /// 描述 : 学历
        /// 空值 : true  
        /// </summary>
        public string Degree { get; set; }

        /// <summary>
        /// 描述 : 身高cm
        /// 空值 : true  
        /// </summary>
        public int? Height { get; set; }

        /// <summary>
        /// 描述 : 体重kg
        /// 空值 : true  
        /// </summary>
        public double Weight { get; set; }

        /// <summary>
        /// 描述 : 出生日期
        /// 空值 : true  
        /// </summary>
        public DateTime? Birthday { get; set; }

        /// <summary>
        /// 描述 : 学校
        /// 空值 : true  
        /// </summary>
        public string School { get; set; }

        /// <summary>
        /// 描述 : 专业
        /// 空值 : true  
        /// </summary>
        public string Specialized { get; set; }

        /// <summary>
        /// 描述 : 血型
        /// 空值 : true  
        /// </summary>
        public string Blood { get; set; }

        /// <summary>
        /// 描述 : 码云地址
        /// 空值 : true  
        /// </summary>
        public string GiteeUrl { get; set; }

        /// <summary>
        /// 描述 : Github地址
        /// 空值 : true  
        /// </summary>
        public string GitHubUrl { get; set; }

        /// <summary>
        /// 描述 : CSDN博客地址
        /// 空值 : true  
        /// </summary>
        public string CSDNUrl { get; set; }

        /// <summary>
        /// 描述 : 邮箱
        /// 空值 : true  
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 描述 : 头像
        /// 空值 : true  
        /// </summary>
        public string Avatar { get; set; }

    }
}