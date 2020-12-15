<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>${siteName!""}用户管理-${title!""}</title>
    <#include "../common/header.ftl"/>
    <style>
        td{
            vertical-align:middle;
        }
    </style>

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
                            <div class="card-toolbar clearfix">
                                <form class="pull-right search-bar" method="get" action="list" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                                用户名 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">用户名</a> </li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="${username!""}" name="username" placeholder="请输入用户名">
                                        <span class="input-group-btn">
                                             <button class="btn btn-primary" type="submit">搜索</button>
                                         </span>
                                    </div>
                                </form>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-primary m-r-5" href="/user/add"><i class="mdi mdi-plus"></i> 新增</a>
                                    <a class="btn btn-primary m-r-5" href="javascript:edit()"><i class="mdi mdi-grease-pencil"></i> 编辑</a>
                                    <a class="btn btn-primary m-r-5" href="javascript:del()"><i class="mdi mdi-delete"></i> 删除</a>
                                </div>

                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th>头像</th>
                                            <th>用户名</th>
                                            <th>角色</th>
                                            <th>状态</th>
                                            <th>性别</th>
                                            <th>手机号</th>
                                            <th>邮箱</th>
                                            <th>添加时间</th>
<#--                                            <th>操作</th>-->
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#if pageBean.content ??>
                                            <#list pageBean.content as user>
                                                <tr>
                                                    <td style="vertical-align:middle;">
                                                        <label class="lyear-checkbox checkbox-primary">
                                                            <input type="checkbox" name="ids[]" value="${user.id}"><span></span>
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;"><b>${user.headPic}</b></td>
                                                    <td style="vertical-align:middle;"><b>${user.username}</b></td>
                                                    <td style="vertical-align:middle;"><b>${user.role.name}</b></td>
                                                    <td style="vertical-align:middle;">
                                                        <#if user.status == 1>
                                                            <font class="text-success">正常</font>
                                                        <#else>
                                                            <font class="text-warning">冻结</font>
                                                        </#if>
                                                    </td>

                                                    <td style="vertical-align:middle;">
                                                        <#if user.sex == 1>
                                                            <font class="text-success">男</font>
                                                        <#elseif user.sex == 2>
                                                            <font class="text-success">女</font>
                                                        <#else>
                                                            <font class="text-warning">未知</font>
                                                        </#if>
                                                    </td>

                                                    <td style="vertical-align:middle;">${user.mobile}</td>
                                                    <td style="vertical-align:middle;">${user.email}</td>
                                                    <td><font class="text-success">${user.createTime}</font></td>
                                                    <#--                                                    <td>-->
                                                    <#--                                                        <div class="btn-group">-->
                                                    <#--                                                            <a class="btn btn-xs btn-default" href="javascript:edit(${topMenu.id})" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>-->
                                                    <#--                                                            <a class="btn btn-xs btn-default" href="javascript:del(${topMenu.id})" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>-->
                                                    <#--                                                        </div>-->
                                                    <#--                                                    </td>-->
                                                </tr>

                                            </#list>
                                        </#if>
                                        </tbody>
                                    </table>
                                </div>
                                <#if pageBean.total gt 0>
                                    <ul class="pagination">
                                        <#if pageBean.currentPage == 1>
                                            <li class="disabled"><span>«</span></li>
                                        <#else>
                                            <li><a href="list?name=${username!""}&currentPage=1">«</a></li>
                                        </#if>
                                        <#list pageBean.currentShowPage as showPage>
                                            <#if pageBean.currentPage == showPage>
                                                <li class="active"><span>${showPage}</span></li>
                                            <#else>
                                                <li><a href="list?name=${username!""}&currentPage=${showPage}">${showPage}</a></li>
                                            </#if>
                                        </#list>

                                        <#if pageBean.currentPage == pageBean.totalPage>
                                            <li class="disabled"><span>»</span></li>
                                        <#else>
                                            <li><a href="list?name=${username!""}&currentPage=${pageBean.totalPage}">»</a></li>
                                        </#if>
                                        <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                                    </ul>
                                </#if>

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
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<!--图表插件-->
<script type="text/javascript" src="/admin/js/Chart.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#submit-btn").click(function(){
            if(!checkForm("login-form")){
                return;
            }
            var username = $("#username").val();
            var password = $("#password").val();
            var cpacha = $("#cpacha").val();
            $.ajax({
                url:'/system/login',
                type:'POST',
                data:{username:username,password:password,cpacha:cpacha},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        // window.location.href = 'system/index';
                        alert(data.msg);
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

    function del(){
        if($("input[type='checkbox']:checked").length != 1){
            showWarningMsg("请选择一条数据进行删除！");
            return;
        }
        var id =$("input[type='checkbox']:checked").val();
        $.confirm({
            title: '确定删除？',
            content: '删除后数据不可恢复，请慎重！',
            buttons: {
                confirm: {
                    text: '确认',
                    action: function(){
                        deleteReq(id);
                    }
                },
                cancel: {
                    text: '关闭',
                    action: function(){

                    }
                }
            }
        });

    }

    //方法
    function deleteReq(id){
        $.ajax({
            url:"/role/delete",
            type:'POST',
            data:{id:id},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    showSuccessMsg('用户删除成功!',function(){
                        $("input[type='checkbox']:checked").parents("tr").remove();
                    })
                }else{
                    showErrorMsg(data.msg);
                }
            },
            error:function(data){
                alert('网络错误!');
            }
        });
    }

    function edit(){
        if($("input[type='checkbox']:checked").length != 1){
            showWarningMsg("请选择一条数据进行编辑！");
            return;
        }
        window.location.href = "edit?id="+$("input[type='checkbox']:checked").val();
    }

    $(document).ready(function(e) {
        var $dashChartBarsCnt  = jQuery( '.js-chartjs-bars' )[0].getContext( '2d' ),
            $dashChartLinesCnt = jQuery( '.js-chartjs-lines' )[0].getContext( '2d' );

        var $dashChartBarsData = {
            labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
            datasets: [
                {
                    label: '注册用户',
                    borderWidth: 1,
                    borderColor: 'rgba(0,0,0,0)',
                    backgroundColor: 'rgba(51,202,185,0.5)',
                    hoverBackgroundColor: "rgba(51,202,185,0.7)",
                    hoverBorderColor: "rgba(0,0,0,0)",
                    data: [2500, 1500, 1200, 3200, 4800, 3500, 1500]
                }
            ]
        };
        var $dashChartLinesData = {
            labels: ['2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014'],
            datasets: [
                {
                    label: '交易资金',
                    data: [20, 25, 40, 30, 45, 40, 55, 40, 48, 40, 42, 50],
                    borderColor: '#358ed7',
                    backgroundColor: 'rgba(53, 142, 215, 0.175)',
                    borderWidth: 1,
                    fill: false,
                    lineTension: 0.5
                }
            ]
        };

        new Chart($dashChartBarsCnt, {
            type: 'bar',
            data: $dashChartBarsData
        });

        var myLineChart = new Chart($dashChartLinesCnt, {
            type: 'line',
            data: $dashChartLinesData,
        });
    });
</script>
</body>
</html>