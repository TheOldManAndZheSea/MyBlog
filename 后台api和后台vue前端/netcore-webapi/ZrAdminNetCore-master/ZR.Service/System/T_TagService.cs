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
    [AppService(ServiceType = typeof(ITagService), ServiceLifetime = LifeTime.Transient)]
    public class T_TagService : BaseService<T_Tag>, ITagService
    {
        public T_TagService(TagsRepository repository) : base(repository)
        {
        }
    }
}
