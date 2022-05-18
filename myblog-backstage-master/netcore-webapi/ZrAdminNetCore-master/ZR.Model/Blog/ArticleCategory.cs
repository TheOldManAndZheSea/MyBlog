using Newtonsoft.Json;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZR.Model.Blog
{
    /// <summary>
    /// 文章目录
    /// </summary>
    [SugarTable("articlecategory")]
    [Tenant("0")]
    public class ArticleCategory
    {
        [SqlSugar.SugarColumn(IsIdentity = true, IsPrimaryKey = true)]
        public int Category_Id { get; set; }
        public string Name { get; set; }
        public int ParentId { get; set; }
        /// <summary>
        /// 图片地址
        /// </summary>
        public string pic_url { get; set; }
        /// <summary>
        /// 颜色
        /// </summary>
        public string color { get; set; }
        [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
        [SugarColumn(IsIgnore = true)]
        public List<ArticleCategory> Children { get; set; }
    }
}
