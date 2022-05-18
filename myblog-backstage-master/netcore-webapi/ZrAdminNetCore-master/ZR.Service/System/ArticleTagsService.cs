using Infrastructure.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZR.Model.System.Blog;
using ZR.Repository.System;
using ZR.Service.System.IService;

namespace ZR.Service.System
{
    [AppService(ServiceType = typeof(IArticleTagsService), ServiceLifetime = LifeTime.Transient)]
    public class ArticleTagsService : BaseService<ArticleTags>, IArticleTagsService
    {
        public readonly ArticleTagsRepository articleTagsRepository;
        public ArticleTagsService(ArticleTagsRepository repository) : base(repository)
        {
            articleTagsRepository = repository;
        }

        public List<ArticleTags> GetArticleTagsForArticleId(int id)
        {
            return articleTagsRepository.GetArticleTagsForArticleId(id);
        }
    }
}
