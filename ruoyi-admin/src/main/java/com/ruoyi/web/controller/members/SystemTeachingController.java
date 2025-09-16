package com.ruoyi.web.controller.members;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.members.domain.SysMembers;
import com.ruoyi.members.service.ISysMembersService;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/members/members")
public class SystemTeachingController extends BaseController {
    @Autowired
    private ISysMembersService membersService;

    /**
     * 获取会员列表
     */
    @PreAuthorize("@ss.hasPermi('members:members:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysMembers members)
    {
        startPage();
        List<SysMembers> list = membersService.selectSysMembersList(members);
        return getDataTable(list);
    }

    /**
     * 导出会员列表
     */
    @Log(title = "会员管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('members:members:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysMembers members)
    {
        List<SysMembers> list = membersService.selectSysMembersList(members);
        ExcelUtil<SysMembers> util = new ExcelUtil<SysMembers>(SysMembers.class);
        util.exportExcel(response, list, "会员数据");
    }

    /**
     * 导入会员数据
     */
    @Log(title = "会员管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('members:members:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<SysMembers> util = new ExcelUtil<SysMembers>(SysMembers.class);
        List<SysMembers> membersList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = membersService.importMembers(membersList, updateSupport, operName);
        return success(message);
    }

    /**
     * 下载会员导入模板
     */
    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<SysMembers> util = new ExcelUtil<SysMembers>(SysMembers.class);
        util.importTemplateExcel(response, "会员数据模板");
    }

    /**
     * 根据会员ID获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('members:members:query')")
    @GetMapping(value = "/{membersId}")
    public AjaxResult getInfo(@PathVariable Long membersId)
    {
        return success(membersService.selectSysMembersById(membersId));
    }

    /**
     * 新增会员
     */
    @PreAuthorize("@ss.hasPermi('members:members:add')")
    @Log(title = "会员管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysMembers members)
    {
        // 验证会员编号唯一性（根据实际业务调整）
        if (!membersService.checkMembersNumUnique(members))
        {
            return error("新增会员'" + members.getMembersName() + "'失败，会员工号已存在");
        }
        members.setCreateBy(getUsername());
        return toAjax(membersService.insertSysMembers(members));
    }

    /**
     * 修改会员
     */
    @PreAuthorize("@ss.hasPermi('members:members:edit')")
    @Log(title = "会员管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysMembers members)
    {
        if (!membersService.checkMembersNumUnique(members))
        {
            return error("修改会员'" + members.getMembersName() + "'失败，会员工号已存在");
        }
        members.setUpdateBy(getUsername());
        return toAjax(membersService.updateSysMembers(members));
    }

    /**
     * 删除会员
     */
    @PreAuthorize("@ss.hasPermi('members:members:remove')")
    @Log(title = "会员管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{membersIds}")
    public AjaxResult remove(@PathVariable Long[] membersIds)
    {
        return toAjax(membersService.deleteSysMembersByIds(membersIds));
    }

    /**
     * 会员状态修改
     */
    @PreAuthorize("@ss.hasPermi('members:members:edit')")
    @Log(title = "会员管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysMembers members)
    {
        members.setUpdateBy(getUsername());
        return toAjax(membersService.updateSysMembersStatus(members));
    }
}
