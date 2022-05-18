using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 博客项目表输入对象
    /// </summary>
    public class BlogprojectDto
    {
        [Required(ErrorMessage = "不能为空")]
        public int Id { get; set; }
        public string Content { get; set; }
        public string Title { get; set; }
        public string TypeName { get; set; }
        public string PicUrl { get; set; }
        public string Techs { get; set; }
        public string Url { get; set; }
    }

    /// <summary>
    /// 博客项目表查询对象
    /// </summary>
    public class BlogprojectQueryDto : PagerInfo 
    {
        public string Title { get; set; }
        public string TypeName { get; set; }
    }
}
