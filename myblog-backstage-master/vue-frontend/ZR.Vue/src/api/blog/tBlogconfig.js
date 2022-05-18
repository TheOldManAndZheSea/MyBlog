import request from '@/utils/request'

/**
* 博客前台配置表信息修改分页查询
* @param {查询条件} data
*/
export function listTBlogconfig(query) {
  return request({
    url: 'Blog/TBlogconfig/list',
    method: 'get',
    params: query,
  })
}


/**
* 新增博客前台配置表信息修改
* @param data
*/
export function addTBlogconfig(data) {
  return request({
    url: 'Blog/TBlogconfig',
    method: 'post',
    data: data,
  })
}

/**
* 修改博客前台配置表信息修改
* @param data
*/
export function updateTBlogconfig(data) {
  return request({
    url: 'Blog/TBlogconfig/edit',
    method: 'PUT',
    data: data,
  })
}

/**
* 获取博客前台配置表信息修改详情
*/
export function getTBlogconfig() {
  return request({
    url: 'Blog/TBlogconfig/getQuery',
    method: 'get'
  })
}

/**
* 删除博客前台配置表信息修改
* @param {主键} pid
*/
export function delTBlogconfig(pid) {
  return request({
    url: 'Blog/TBlogconfig/' + pid,
    method: 'delete'
  })
}

// 导出博客前台配置表信息修改
export function exportTBlogconfig(query) {
  return request({
    url: 'Blog/TBlogconfig/export',
    method: 'get',
    params: query
  })
}

