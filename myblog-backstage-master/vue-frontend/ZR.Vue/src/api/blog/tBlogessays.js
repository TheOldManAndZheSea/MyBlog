import request from '@/utils/request'

/**
* 随笔管理分页查询
* @param {查询条件} data
*/
export function listTBlogessays(query) {
  return request({
    url: 'blog/TBlogessays/list',
    method: 'get',
    params: query,
  })
}


/**
* 新增随笔管理
* @param data
*/
export function addTBlogessays(data) {
  return request({
    url: 'blog/TBlogessays',
    method: 'post',
    data: data,
  })
}

/**
* 修改随笔管理
* @param data
*/
export function updateTBlogessays(data) {
  return request({
    url: 'blog/TBlogessays',
    method: 'PUT',
    data: data,
  })
}

/**
* 获取随笔管理详情
* @param {Id}
*/
export function getTBlogessays(id) {
  return request({
    url: 'blog/TBlogessays/' + id,
    method: 'get'
  })
}

/**
* 删除随笔管理
* @param {主键} pid
*/
export function delTBlogessays(pid) {
  return request({
    url: 'blog/TBlogessays/' + pid,
    method: 'delete'
  })
}

// 导出随笔管理
export function exportTBlogessays(query) {
  return request({
    url: 'blog/TBlogessays/export',
    method: 'get',
    params: query
  })
}

