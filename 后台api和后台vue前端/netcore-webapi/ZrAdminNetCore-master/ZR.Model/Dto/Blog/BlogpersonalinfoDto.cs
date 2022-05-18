using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 博客个人信息输入对象
    /// </summary>
    public class BlogpersonalinfoDto
    {
        [Required(ErrorMessage = "不能为空")]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Sex { get; set; }
        public int? Age { get; set; }
        public string Degree { get; set; }
        public int? Height { get; set; }
        public string Weight { get; set; }
        public DateTime? Birthday { get; set; }
        public string School { get; set; }
        public string Specialized { get; set; }
        public string Blood { get; set; }
        public string GiteeUrl { get; set; }
        public string GitHubUrl { get; set; }
        public string CSDNUrl { get; set; }
        public string Email { get; set; }
        public string Avatar { get; set; }
    }

    /// <summary>
    /// 博客个人信息查询对象
    /// </summary>
    public class BlogpersonalinfoQueryDto : PagerInfo 
    {
    }
}
