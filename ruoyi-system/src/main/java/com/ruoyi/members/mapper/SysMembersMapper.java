package com.ruoyi.members.mapper;

import com.ruoyi.members.domain.SysMembers;

import java.util.List;

/**
 * 会员表 数据层
 *
 * @author ruoyi
 */
public interface SysMembersMapper
{
    /**
     * 查询会员信息
     *
     * @param membersId 会员主键
     * @return 会员信息
     */
    public SysMembers selectSysMembersById(Long membersId);

    /**
     * 查询会员列表
     *
     * @param sysMembers 会员信息
     * @return 会员集合
     */
    public List<SysMembers> selectSysMembersList(SysMembers sysMembers);

    /**
     * 新增会员
     *
     * @param sysMembers 会员信息
     * @return 结果
     */
    public int insertSysMembers(SysMembers sysMembers);

    /**
     * 修改会员
     *
     * @param sysMembers 会员信息
     * @return 结果
     */
    public int updateSysMembers(SysMembers sysMembers);

    /**
     * 删除会员
     *
     * @param membersId 会员主键
     * @return 结果
     */
    public int deleteSysMembersById(Long membersId);

    /**
     * 批量删除会员
     *
     * @param membersIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysMembersByIds(Long[] membersIds);

    /**
     * 根据用户ID查询会员
     *
     * @param userId 用户ID
     * @return 会员信息
     */
    public SysMembers selectSysMembersByUserId(Long userId);

    /**
     * 根据部门ID查询会员列表
     *
     * @param deptId 部门ID
     * @return 会员集合
     */
    public List<SysMembers> selectSysMembersByDeptId(Long deptId);
}
