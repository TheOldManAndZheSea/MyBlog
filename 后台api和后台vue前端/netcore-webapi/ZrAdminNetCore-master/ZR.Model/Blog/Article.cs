using OfficeOpenXml.Attributes;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Text;
using ZR.Model.Blog;
using ZR.Model.System.Blog;

namespace ZR.Model.System
{
    /// <summary>
    /// 文章表
    /// </summary>
    [SqlSugar.SugarTable("article")]
    [Tenant("0")]
    public class Article
    {
        [SqlSugar.SugarColumn(IsIdentity = true, IsPrimaryKey = true)]
        public int Cid { get; set; }
        public string Title { get; set; }
        public DateTime? CreateTime { get; set; }
        [SqlSugar.SugarColumn(IsOnlyIgnoreInsert = true)]
        public DateTime UpdateTime { get; set; }
        /// <summary>
        /// 文章内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 作者名
        /// </summary>
        public string AuthorName { get; set; }
        public long UserId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        //public string Type { get; set; }
        /// <summary>
        /// 文章状态 1、发布 2、草稿
        /// </summary>
        public string Status { get; set; }
        /// <summary>
        /// 编辑器类型 markdown,html
        /// </summary>
        public string Fmt_type { get; set; }
        
        public int Hits { get; set; }
        public int Category_id { get; set; }
        /// <summary>
        /// 封面图
        /// </summary>
        public string first_picture { get; set; }
        /// <summary>
        /// 是否置顶
        /// </summary>
        public bool istop { get; set; }
        #region 非数据库字段
        /// <summary>
        /// 文章标签eg：Net5,java
        /// </summary>
        [SugarColumn(IsIgnore = true)]
        [EpplusIgnore]
        public List<ArticleTags> Tags { get; set; }
        /// <summary>
        /// 作者
        /// </summary>
        [SugarColumn(IsIgnore = true)]
        [EpplusIgnore]
        public SysUser Author { get; set; }
        /// <summary>
        /// 类别
        /// </summary>
        [SugarColumn(IsIgnore = true)]
        [EpplusIgnore]
        public ArticleCategory Category { get; set; }
        #endregion

    }
}
