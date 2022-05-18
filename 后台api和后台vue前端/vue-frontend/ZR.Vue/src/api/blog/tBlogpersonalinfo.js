import request from '@/utils/request'

/**
* 博客个人信息分页查询
* @param {查询条件} data
*/
export function listTBlogpersonalinfo(query) {
  return request({
    url: 'Blog/TBlogpersonalinfo/list',
    method: 'get',
    params: query,
  })
}


/**
* 新增博客个人信息
* @param data
*/
export function addTBlogpersonalinfo(data) {
  return request({
    url: 'Blog/TBlogpersonalinfo',
    method: 'post',
    data: data,
  })
}

/**
* 修改博客个人信息
* @param data
*/
export function updateTBlogpersonalinfo(data) {
  return request({
    url: 'Blog/TBlogpersonalinfo/edit',
    method: 'PUT',
    data: data,
  })
}

/**
* 获取博客个人信息详情
* @param {Id}
*/
export function getTBlogpersonalinfo(id) {
  return request({
    url: 'Blog/TBlogpersonalinfo/' + id,
    method: 'get'
  })
}

/**
* 删除博客个人信息
* @param {主键} pid
*/
export function delTBlogpersonalinfo(pid) {
  return request({
    url: 'Blog/TBlogpersonalinfo/' + pid,
    method: 'delete'
  })
}

// 导出博客个人信息
export function exportTBlogpersonalinfo(query) {
  return request({
    url: 'Blog/TBlogpersonalinfo/export',
    method: 'get',
    params: query
  })
}

