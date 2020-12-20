<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>${siteName!""}用户管理-用户编辑</title>
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

                                    <div class="form-group col-md-12">
                                        <label>图像上传</label>
                                        <div class="form-controls">

                                            <ul class="list-inline clearfix lyear-uploads-pic">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <figure>

                                                        <img src= <#if !user.headPic??>"/admin/images/default-head.jpg"
                                                        <#else>"/photo/view?filename=${user.headPic}"
                                                        </#if>
                                                        id="show-picture-img" alt=默认图像>
                                                    </figure>
                                                </li>
                                                <input type="hidden" name="headPic" id="headPic" value="${user.headPic!""}">

                                                <input type="file" id="select-file" name="select-file" style="display: none;" onchange="upload()">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" id="upload-btn" title="点击上传"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <input type="hidden" class="form-control required" id="username" value="${user.id!""}" name="id" >

                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">登录名称</span>
                                        <input type="text" class="form-control required" id="username" value="${user.username!""}" name="username" placeholder="请输入用户名" tips="请填写用户名称" aria-describedby="sizing-addon3">
                                    </div>

                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">登录密码</span>
                                        <input type="password" class="form-control required" id="password" value="${user.password!""}" name="password" placeholder="请输入密码" tips="请填写用户密码" aria-describedby="sizing-addon3">
                                    </div>

                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">所属角色</span>
                                        <select name="role.id" class="form-control" id="role">
                                            <#list roles as role>
                                                <#if user.role.id == role.id>
                                                    <option value="${role.id}" selected =true>${role.name}</option>
                                                <#else>
                                                    <option value="${role.id}">${role.name}</option>
                                                </#if>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">手机号码</span>
                                        <input type="tel" class="form-control" id="mobile" value="${user.mobile!""}" name="mobile" placeholder="" aria-describedby="sizing-addon3"/>
                                    </div>

                                    <div class="input-group input-group m-b-10">
                                        <span class="input-group-addon">邮箱账号</span>
                                        <input type="email" class="form-control" id="email" value="${user.email!""}" name="email" placeholder="" aria-describedby="sizing-addon3"/>
                                    </div>
                                    <div class="input-group input-group m-b-10" style="margin-left: 30px;">
                                        状&nbsp;&nbsp;&nbsp;&nbsp;态:
                                        <label class="lyear-radio radio-inline radio-primary">
                                            <input type="radio" name="status" value="1" <#if user.status == 1>checked=""</#if>>
                                            <span>正常</span>
                                        </label>

                                        <label class="lyear-radio radio-inline radio-primary"/>
                                            <input type="radio" name="status"value="0" <#if user.status == 0>checked=""</#if>>
                                            <span>冻结</span>
                                        </label>
                                    </div>

                                    <div class="input-group input-group m-b-10" style="margin-left: 30px;">
                                        性&nbsp;&nbsp;&nbsp;&nbsp;别:
                                        <label class="lyear-radio radio-inline radio-primary">
                                            <input type="radio" name="sex" value="1" <#if user.sex == 1>checked=""</#if>>
                                            <span>男</span>
                                        </label>

                                        <label class="lyear-radio radio-inline radio-primary"/>
                                        <input type="radio" name="sex"value="2" <#if user.sex == 2>checked=""</#if>>
                                        <span>女</span>
                                        </label>

                                        <label class="lyear-radio radio-inline radio-primary"/>
                                        <input type="radio" name="sex"value="0" <#if user.status == 0>checked=""</#if>>
                                        <span>未知</span>
                                        </label>
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

        //监听图片上传按钮
        $("#add-pic-btn").click(function () {
            $("#select-file").click();
        });

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
                url:'/user/edit',
                type:'POST',
                data:data,
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        showSuccessMsg('用户编辑成功',function () {
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

    });

    function upload() {
        var formData = new FormData();
        formData.append("photo",document.getElementById("select-file").files[0]);
        $.ajax({
            url:'/upload/upload_photo',
            contentType: false,
            processData: false,
            data:formData,
            type:'POST',
            success:function(data){
                if(data.code == 0){
                    showSuccessMsg('图片上传成功',function () {
                        $("#show-picture-img").attr('src','/photo/view?filename='+data.data);
                        $("#headPic").val(data.data);
                    });

                }else{
                    showErrorMsg(data.msg);
                }
            },
            error:function(data){
                alert('网络错误!');
            }
        });
    }

</script>
</body>
</html>