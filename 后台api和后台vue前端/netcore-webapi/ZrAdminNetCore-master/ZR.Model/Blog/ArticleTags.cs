using OfficeOpenXml.Attributes;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZR.Model.System.Blog
{
    /// <summary>
    /// 文章标签关联表
    /// </summary>
    [SqlSugar.SugarTable("t_article_tags")]
    [Tenant("0")]
    public class ArticleTags
    {
        [SqlSugar.SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int id { get; set; }
        public int article_id { get; set; }

        public int tag_id { get; set; }

        [SugarColumn(IsIgnore = true)]
        [EpplusIgnore]
        public string TagName { get; set; }
    }
}
