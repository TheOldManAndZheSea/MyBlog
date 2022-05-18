import request from '@/utils/request'

/**
* 博客个人技能分页查询
* @param {查询条件} data
*/
export function listTBlogskill(query) {
  return request({
    url: 'Blog/TBlogpersonalinfo/skill/list',
    method: 'get',
    params: query,
  })
}


/**
* 新增博客个人技能
* @param data
*/
export function addTBlogskill(data) {
  return request({
    url: 'Blog/TBlogpersonalinfo/skill/add',
    method: 'post',
    data: data,
  })
}

/**
* 修改博客个人技能
* @param data
*/
export function updateTBlogskill(data) {
  return request({
    url: 'Blog/TBlogpersonalinfo/skill/edit',
    method: 'PUT',
    data: data,
  })
}

/**
* 获取博客个人技能详情
* @param {Id}
*/
export function getTBlogskill(id) {
  return request({
    url: 'Blog/TBlogpersonalinfo/skill/' + id,
    method: 'get'
  })
}

/**
* 删除博客个人技能
* @param {主键} pid
*/
export function delTBlogskill(pid) {
  return request({
    url: 'Blog/TBlogpersonalinfo/skill/del/' + pid,
    method: 'delete'
  })
}
