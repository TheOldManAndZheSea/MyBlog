using OfficeOpenXml.Attributes;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZR.Model.System.Blog
{
    /// <summary>
    /// 标签表
    /// </summary>
    [SqlSugar.SugarTable("t_tag")]
    [Tenant("0")]
    public class T_Tag
    {
        [SqlSugar.SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }
        public string Name { get; set; }

        #region 非数据库字段
        /// <summary>
        /// 标签下的文章数量
        /// </summary>
        [SugarColumn(IsIgnore = true)]
        [EpplusIgnore]
        public int ArticlesCount { get; set; }
        #endregion
    }
}
