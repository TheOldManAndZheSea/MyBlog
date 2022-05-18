using System;
using System.Collections.Generic;
using System.Text;

namespace ZR.Model.System.Dto
{
    public class TagDto
    {
        public int article_id { get; set; }

        public List<int> TagIds { get; set; }
    }
}
