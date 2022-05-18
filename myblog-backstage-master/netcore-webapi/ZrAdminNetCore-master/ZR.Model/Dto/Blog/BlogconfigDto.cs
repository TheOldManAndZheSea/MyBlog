using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 博客前台配置表信息修改输入对象
    /// </summary>
    public class BlogconfigDto
    {
        [Required(ErrorMessage = "博客标题不能为空")]
        public string Title { get; set; }
        [Required(ErrorMessage = "版权所有不能为空")]
        public string Copyright { get; set; }
        public string AuthorQQ { get; set; }
        public string AuthorWechart { get; set; }
        [Required(ErrorMessage = "作者邮箱不能为空")]
        public string AuthorEmail { get; set; }
        public bool IsOpenLogin { get; set; }
        public bool IsOpenRegister { get; set; }
        public string Content { get; set; }
        public string BottomImage { get; set; }
        [Required(ErrorMessage = "博客背景图不能为空")]
        public string BlogBackGroundImage { get; set; }
        public string FundedAlipayImg { get; set; }
        public string FundedWechartImg { get; set; }
    }

    /// <summary>
    /// 博客前台配置表信息修改查询对象
    /// </summary>
    public class BlogconfigQueryDto : PagerInfo 
    {
    }
}
