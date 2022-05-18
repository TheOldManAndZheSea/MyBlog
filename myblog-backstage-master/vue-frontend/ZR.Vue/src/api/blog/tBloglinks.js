import request from '@/utils/request'

/**
* 博客友情链接查询
*/
export function listTBloglinks() {
  return request({
    url: 'Blog/TBlogconfig/getLinks',
    method: 'get',
  })
}
/**
* 获取博客友情链接详情
* @param {Id}
*/
export function getTBloglinks(id) {
  return request({
    url: 'Blog/TBlogconfig/getLinksQuery/' + id,
    method: 'get'
  })
}
/**
* 新增博客友情链接
* @param data
*/
export function addTBloglinks(data) {
  return request({
    url: 'Blog/TBlogconfig/addLinks',
    method: 'post',
    data: data,
  })
}

/**
* 修改博客友情链接
* @param data
*/
export function updateTBloglinks(data) {
  return request({
    url: 'Blog/TBlogconfig/editLinks',
    method: 'PUT',
    data: data,
  })
}


/**
* 删除博客友情链接
* @param {主键} pid
*/
export function delTBloglinks(pid) {
  return request({
    url: 'Blog/TBlogconfig/delLinks/' + pid,
    method: 'delete'
  })
}


