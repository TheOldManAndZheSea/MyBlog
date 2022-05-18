using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 博客友情链接，数据实体对象
    ///
    /// @author ztc
    /// @date 2022-04-13
    /// </summary>
    [SugarTable("t_bloglinks")]
    [Tenant("0")]
    public class Bloglinks
    {
        /// <summary>
        /// 描述 : 
        /// 空值 : false  
        /// </summary>
        [SqlSugar.SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 描述 : 名称
        /// 空值 : true  
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 描述 : 跳转链接
        /// 空值 : true  
        /// </summary>
        public string Links { get; set; }

    }
}