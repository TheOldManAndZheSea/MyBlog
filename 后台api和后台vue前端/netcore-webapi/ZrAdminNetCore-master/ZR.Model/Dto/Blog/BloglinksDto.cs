using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 博客友情链接输入对象
    /// </summary>
    public class BloglinksDto
    {
        [Required(ErrorMessage = "不能为空")]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Links { get; set; }
    }

    /// <summary>
    /// 博客友情链接查询对象
    /// </summary>
    public class BloglinksQueryDto : PagerInfo 
    {
    }
}
