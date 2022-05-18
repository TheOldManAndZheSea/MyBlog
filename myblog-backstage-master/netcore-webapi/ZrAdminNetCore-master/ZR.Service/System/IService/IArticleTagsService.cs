using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZR.Model.System.Blog;

namespace ZR.Service.System.IService
{
    public interface IArticleTagsService: IBaseService<ArticleTags>
    {
        public List<ArticleTags> GetArticleTagsForArticleId(int id);
    }
}
