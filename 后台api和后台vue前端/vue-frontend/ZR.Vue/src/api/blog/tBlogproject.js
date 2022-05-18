import request from '@/utils/request'

/**
* 博客项目表分页查询
* @param {查询条件} data
*/
export function listTBlogproject(query) {
  return request({
    url: 'Blog/TBlogproject/list',
    method: 'get',
    params: query,
  })
}


/**
* 新增博客项目表
* @param data
*/
export function addTBlogproject(data) {
  return request({
    url: 'Blog/TBlogproject',
    method: 'post',
    data: data,
  })
}

/**
* 修改博客项目表
* @param data
*/
export function updateTBlogproject(data) {
  return request({
    url: 'Blog/TBlogproject',
    method: 'PUT',
    data: data,
  })
}

/**
* 获取博客项目表详情
* @param {Id}
*/
export function getTBlogproject(id) {
  return request({
    url: 'Blog/TBlogproject/' + id,
    method: 'get'
  })
}

/**
* 删除博客项目表
* @param {主键} pid
*/
export function delTBlogproject(pid) {
  return request({
    url: 'Blog/TBlogproject/' + pid,
    method: 'delete'
  })
}

// 导出博客项目表
export function exportTBlogproject(query) {
  return request({
    url: 'Blog/TBlogproject/export',
    method: 'get',
    params: query
  })
}

