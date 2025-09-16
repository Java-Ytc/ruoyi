package com.ruoyi.members.service.impl;

import com.ruoyi.members.domain.SysMembers;
import com.ruoyi.members.mapper.SysMembersMapper;
import com.ruoyi.members.service.ISysMembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 会员管理Service实现类
 *
 * @author ruoyi
 * @date 2025-09-15
 */
@Service
public class SysMembersServiceImpl implements ISysMembersService
{
    @Autowired
    private SysMembersMapper sysMembersMapper;

    /**
     * 查询会员
     *
     * @param membersId 会员主键
     * @return 会员
     */
    @Override
    public SysMembers selectSysMembersById(Long membersId)
    {
        return sysMembersMapper.selectSysMembersById(membersId);
    }

    /**
     * 查询会员列表
     *
     * @param sysMembers 会员
     * @return 会员集合
     */
    @Override
    public List<SysMembers> selectSysMembersList(SysMembers sysMembers)
    {
        return sysMembersMapper.selectSysMembersList(sysMembers);
    }

    /**
     * 新增会员
     *
     * @param sysMembers 会员
     * @return 结果
     */
    @Override
    public int insertSysMembers(SysMembers sysMembers)
    {
        // 可添加默认值处理（如创建时间、删除标识等）
        return sysMembersMapper.insertSysMembers(sysMembers);
    }

    /**
     * 修改会员
     *
     * @param sysMembers 会员
     * @return 结果
     */
    @Override
    public int updateSysMembers(SysMembers sysMembers)
    {
        // 可添加修改时间自动填充等逻辑
        return sysMembersMapper.updateSysMembers(sysMembers);
    }

    /**
     * 批量删除会员
     *
     * @param membersIds 需要删除的会员主键集合
     * @return 结果
     */
    @Override
    public int deleteSysMembersByIds(Long[] membersIds)
    {
        return sysMembersMapper.deleteSysMembersByIds(membersIds);
    }

    /**
     * 删除会员信息
     *
     * @param membersId 会员主键
     * @return 结果
     */
    @Override
    public int deleteSysMembersById(Long membersId)
    {
        return sysMembersMapper.deleteSysMembersById(membersId);
    }
}
