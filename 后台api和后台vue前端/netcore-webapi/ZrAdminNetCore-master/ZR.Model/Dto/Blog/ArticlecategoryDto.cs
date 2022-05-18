using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 文章类型输入对象
    /// </summary>
    public class ArticlecategoryDto
    {
        [Required(ErrorMessage = "目录id不能为空")]
        public int CategoryId { get; set; }
        [Required(ErrorMessage = "目录名不能为空")]
        public string Name { get; set; }
        public DateTime? CreateTime { get; set; }
        public int? ParentId { get; set; }
        public string PicUrl { get; set; }
        public string Color { get; set; }
    }

    /// <summary>
    /// 文章类型查询对象
    /// </summary>
    public class ArticlecategoryQueryDto : PagerInfo 
    {
    }
}
