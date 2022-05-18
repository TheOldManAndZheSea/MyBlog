import request from '@/utils/request'

// 查询列表
export function listTags() {
    return request({
      url: '/tag/getList',
      method: 'get'
    })
  }
//根据文章ID查询tag
export function listTagsForArticle(query) {
  return request({
    url: '/tag/GetTagsForArticleId',
    method: 'get',
    params:query
  })
}

// 新增
export function addTag(data) {
    return request({
      url: '/tag/add',
      method: 'post',
      data: data,
    })
  }
  
// 修改
export function updateTag(data) {
  return request({
    url: '/tag/edit',
    method: 'put',
    data: data
  })
}
// 删除
export function delTag(id) {
    return request({
      url: '/tag/' + id,
      method: 'delete'
    })
  }
// 新增连接表
export function addTagCon(data) {
    return request({
      url: '/tag/addCon',
      method: 'post',
      data: data,
    })
  }
  
// 修改或者删除连接表
export function updateTagCon(data) {
  return request({
    url: '/tag/editCon',
    method: 'put',
    data: data
  })
}