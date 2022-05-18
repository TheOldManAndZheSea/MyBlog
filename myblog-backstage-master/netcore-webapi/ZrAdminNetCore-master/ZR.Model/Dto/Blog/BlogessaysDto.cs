using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 随笔管理输入对象
    /// </summary>
    public class BlogessaysDto
    {
        [Required(ErrorMessage = "不能为空")]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Color { get; set; }
        public string Content { get; set; }
        public DateTime? CreateTime { get; set; }
        public string AuthorName { get; set; }
    }

    /// <summary>
    /// 随笔管理查询对象
    /// </summary>
    public class BlogessaysQueryDto : PagerInfo 
    {
        public string Title { get; set; }
    }
}
