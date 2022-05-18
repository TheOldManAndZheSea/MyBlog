using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 随笔管理，数据实体对象
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [SugarTable("t_blogessays")]
    [Tenant("0")]
    public class Blogessays
    {
        /// <summary>
        /// 描述 : 
        /// 空值 : false  
        /// </summary>
        [SqlSugar.SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 描述 : 标题
        /// 空值 : true  
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 描述 : 边框色彩
        /// 空值 : true  
        /// </summary>
        public string Color { get; set; }

        /// <summary>
        /// 描述 : 内容
        /// 空值 : true  
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 描述 : 创建时间
        /// 空值 : true  
        /// </summary>
        public DateTime? CreateTime { get; set; }

        /// <summary>
        /// 描述 : 作者名
        /// 空值 : true  
        /// </summary>
        public string AuthorName { get; set; }

    }
}