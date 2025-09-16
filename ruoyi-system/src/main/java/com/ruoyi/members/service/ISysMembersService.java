package com.ruoyi.members.service;

import com.ruoyi.members.domain.SysMembers;

import java.util.List;

/**
 * 会员管理Service接口
 *
 * @author ruoyi
 * @date 2025-09-15
 */
public interface ISysMembersService
{
    /**
     * 查询会员
     *
     * @param membersId 会员主键
     * @return 会员
     */
    public SysMembers selectSysMembersById(Long membersId);

    /**
     * 查询会员列表
     *
     * @param sysMembers 会员
     * @return 会员集合
     */
    public List<SysMembers> selectSysMembersList(SysMembers sysMembers);

    /**
     * 新增会员
     *
     * @param sysMembers 会员
     * @return 结果
     */
    public int insertSysMembers(SysMembers sysMembers);

    /**
     * 修改会员
     *
     * @param sysMembers 会员
     * @return 结果
     */
    public int updateSysMembers(SysMembers sysMembers);

    /**
     * 批量删除会员
     *
     * @param membersIds 需要删除的会员主键集合
     * @return 结果
     */
    public int deleteSysMembersByIds(Long[] membersIds);

    /**
     * 删除会员信息
     *
     * @param membersId 会员主键
     * @return 结果
     */
    public int deleteSysMembersById(Long membersId);
}
