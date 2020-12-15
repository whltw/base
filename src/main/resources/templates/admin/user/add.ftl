<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>${siteName!""}用户管理-用户添加</title>
    <#include "../common/header.ftl"/>


</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="/system/index"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <#include "../common/left-menu.ftl"/>
            </div>

        </aside>
        <!--End 左侧导航-->

        <#include "../common/header-menu.ftl"/>

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header"><h4>添加用户</h4></div>
                            <div class="card-body">

                                <form action="add" id="role-add-form" method="post" class="row">

                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">用户名</span>
                                        <input type="text" class="form-control required" id="username" name="username" placeholder="请输入用户名" tips="请填写用户名称" aria-describedby="sizing-addon3">
                                    </div>

                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">密码</span>
                                        <input type="password" class="form-control required" id="password" name="password" placeholder="请输入密码" tips="请填写用户密码" aria-describedby="sizing-addon3">
                                    </div>

                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">所属角色</span>
                                        <select name="parent.id" class="form-control" id="type">
                                            <#list roles as role>
                                                <option value="${role.id}">${role.name}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>

                                            <tr>
                                                <th>
                                                    <label class="">
                                                        <span> 权限选择</span>
                                                    </label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th>
                                                    <label class="lyear-checkbox checkbox-primary">
                                                        <input name="checkbox" type="checkbox" id="check-all">
                                                        <span> 全选</span>
                                                    </label>
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <#if topMenus??>
                                                    <#list topMenus as topMenu>
                                                        <tr>
                                                            <td>
                                                                <label class="lyear-checkbox checkbox-primary">
                                                                    <input name="authorities" type="checkbox" class="checkbox-parent" dataid="id-${topMenu.id}" value="${topMenu.id}">
                                                                    <span> ${topMenu.name}</span>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <#if secondMenus??>
                                                            <#list secondMenus as secondMenu>
                                                                <#if secondMenu.parent.id == topMenu.id>
                                                                    <tr>
                                                                        <td class="p-l-20">
                                                                            <label class="lyear-checkbox checkbox-primary">
                                                                                <input name="authorities" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-${topMenu.id}-${secondMenu.id}" value="${secondMenu.id}">
                                                                                <span> ${secondMenu.name}</span>
                                                                            </label>
                                                                        </td>
                                                                    </tr>
                                                                    <#if thirdMenus??>
                                                                        <tr>
                                                                            <td class="p-l-40">
                                                                                <#list thirdMenus as thirdMenu>
                                                                                    <#if thirdMenu.parent.id == secondMenu.id>
                                                                                        <label class="lyear-checkbox checkbox-primary checkbox-inline">
                                                                                            <input name="authorities" type="checkbox" class="checkbox-child" dataid="id-${topMenu.id}-${secondMenu.id}-${thirdMenu.id}" value="${thirdMenu.id}">
                                                                                            <span> ${thirdMenu.name}</span>
                                                                                        </label>
                                                                                    </#if>
                                                                                </#list>
                                                                            </td>
                                                                        </tr>
                                                                    </#if>
                                                                </#if>
                                                            </#list>
                                                        </#if>
                                                    </#list>
                                                </#if>
                                            </tbody>
                                        </table>
                                    </div>



                                    <div class="input-group input-group m-b-10">
                                        状态&nbsp;&nbsp;
                                        <label class="lyear-radio radio-inline radio-primary">
                                            <input type="radio" name="status" value="1" checked="">
                                            <span>启用</span>
                                        </label>

                                        <label class="lyear-radio radio-inline radio-primary"/>
                                            <input type="radio" name="status"value="0">
                                            <span>不启用</span>
                                        </label>
                                    </div>

                                    <div class="input-group input-group m-b-10">
                                            <span class="input-group-addon">备注</span>
                                        <input type="text" class="form-control" id="remark" name="remark" placeholder="" aria-describedby="sizing-addon3"/>
                                    </div>


                                    <div class="form-group col-md-12">
                                        <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                                        <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>
<#include "../common/foot.ftl"/>
<#--<#include "../common/icons.ftl"/>-->
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<!--图表插件-->
<script type="text/javascript" src="/admin/js/Chart.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        //图标选择后的确认按钮事件
        $("#confirm-icon-btn").click(function () {
            getSelectedIcon();
        });

        //提交按钮监听事件
        $("#add-form-submit-btn").click(function () {
            if(!checkForm("role-add-form"))
                return;
            var data = $("#role-add-form").serialize();
            $.ajax({
                url:'/role/add',
                type:'POST',
                data:data,
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        showSuccessMsg('用户添加成功',function () {
                            window.location.href = 'list';
                        });

                    }else{
                        showErrorMsg(data.msg);
                    }
                },
                error:function(data){
                    alert('网络错误!');
                }
            });

        });

        //动态选择框，上下级选中状态变化
        $('input.checkbox-parent').on('change', function(){
            var dataid = $(this).attr("dataid");
            $('input[dataid^=' + dataid + '-]').prop('checked', $(this).is(':checked'));
        });
        $('input.checkbox-child').on('change', function(){
            var dataid = $(this).attr("dataid");
            dataid = dataid.substring(0, dataid.lastIndexOf("-"));
            var parent = $('input[dataid=' + dataid + ']');
            if($(this).is(':checked')){
                parent.prop('checked', true);
                //循环到顶级
                while(dataid.lastIndexOf("-") != 2){
                    dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                    parent = $('input[dataid=' + dataid + ']');
                    parent.prop('checked', true);
                }
            }else{
                //父级
                if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                    parent.prop('checked', false);
                    //循环到顶级
                    while(dataid.lastIndexOf("-") != 2){
                        dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                        parent = $('input[dataid=' + dataid + ']');
                        if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                            parent.prop('checked', false);
                        }
                    }
                }
            }
        });
    });


</script>
</body>
</html>