using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 博客项目表，数据实体对象
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    [SugarTable("t_blogproject")]
    [Tenant("0")]
    public class Blogproject
    {
        /// <summary>
        /// 描述 : 
        /// 空值 : false  
        /// </summary>
        [SqlSugar.SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 描述 : 项目描述
        /// 空值 : true  
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 描述 : 项目名称
        /// 空值 : true  
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 描述 : 项目类型
        /// 空值 : true  
        /// </summary>
        public string TypeName { get; set; }

        /// <summary>
        /// 描述 : 项目图片
        /// 空值 : true  
        /// </summary>
        [SugarColumn(ColumnName = "pic_url")]
        public string PicUrl { get; set; }

        /// <summary>
        /// 描述 : 技术栈
        /// 空值 : true  
        /// </summary>
        public string Techs { get; set; }

        /// <summary>
        /// 描述 : 项目地址
        /// 空值 : true  
        /// </summary>
        public string Url { get; set; }

        /// <summary>
        /// 描述 : 创建时间
        /// 空值 : true  
        /// </summary>
        public DateTime? CreateTime { get; set; }

    }
}