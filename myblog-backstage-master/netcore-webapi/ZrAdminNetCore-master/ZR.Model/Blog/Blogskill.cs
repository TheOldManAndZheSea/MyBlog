using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 博客个人技能，数据实体对象
    ///
    /// @author ztc
    /// @date 2022-03-31
    /// </summary>
    [SugarTable("t_blogskill")]
    [Tenant("0")]
    public class Blogskill
    {
        /// <summary>
        /// 描述 : 
        /// 空值 : false  
        /// </summary>
        [SqlSugar.SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 描述 : 技能名称
        /// 空值 : true  
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 描述 : 技能icon
        /// 空值 : true  
        /// </summary>
        public string PicIcon { get; set; }

        /// <summary>
        /// 描述 : 节能描述
        /// 空值 : true  
        /// </summary>
        public string Des { get; set; }

    }
}