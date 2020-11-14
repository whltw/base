<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>${siteName!""}菜单管理-${title!""}</title>
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
                                <form class="pull-right search-bar" method="get" action="#!" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="hidden" name="search_field" id="search-field" value="title">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                                名称 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">名称</a> </li>
                                                <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">栏目</a> </li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="" name="keyword" placeholder="请输入名称">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default btn-primary" type="button">搜索</button>
                                         </span>
                                    </div>
                                </form>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-primary m-r-5" href="/menu/add"><i class="mdi mdi-plus"></i> 新增</a>
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
                                            <th>菜单名称</th>
                                            <th>菜单url</th>
                                            <th>菜单icon </th>
                                            <th>菜单排序</th>
                                            <th>添加时间</th>
<#--                                            <th>操作</th>-->
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#if topMenus ??>
                                            <#list topMenus as topMenu>
                                                <tr>
                                                    <td style="vertical-align:middle;">
                                                        <label class="lyear-checkbox checkbox-primary">
                                                            <input type="checkbox" name="ids[]" value="${topMenu.id}"><span></span>
                                                        </label>
                                                    </td>
                                                    <td style="vertical-align:middle;"><b>${topMenu.name}</b></td>
                                                    <td style="vertical-align:middle;">${topMenu.url}</td>
                                                    <td style="vertical-align:middle;"><i style="font-size:22px;" class="mdi ${topMenu.icon}" title="${topMenu.icon}"></i></td>
                                                    <td style="vertical-align:middle;">${topMenu.sort}</td>
                                                    <td><font class="text-success">${topMenu.createTime}</font></td>
<#--                                                    <td>-->
<#--                                                        <div class="btn-group">-->
<#--                                                            <a class="btn btn-xs btn-default" href="javascript:edit(${topMenu.id})" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>-->
<#--                                                            <a class="btn btn-xs btn-default" href="javascript:del(${topMenu.id})" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>-->
<#--                                                        </div>-->
<#--                                                    </td>-->
                                                </tr>
                                                <#-- 二级菜单-->
                                                <#if secondMenus ??>
                                                    <#list secondMenus as secondMenu>
                                                        <#if secondMenu.parent.id == topMenu.id>
                                                            <tr>
                                                                <td style="vertical-align:middle;">
                                                                    <label class="lyear-checkbox checkbox-primary">
                                                                        <input type="checkbox" name="ids[]" value="${secondMenu.id}"><span></span>
                                                                    </label>
                                                                </td>
                                                                <td style="padding-left:25px;"><b>${secondMenu.name}</b></td>
                                                                <td>${secondMenu.url}</td>
                                                                <td><i style="font-size:22px;" class="mdi ${secondMenu.icon}" title="${secondMenu.icon}"></i></td>
                                                                <td>${secondMenu.sort}</td>
                                                                <td><font class="text-success">${secondMenu.createTime}</font></td>
<#--                                                                <td>-->
<#--                                                                    <div class="btn-group">-->
<#--                                                                        <a class="btn btn-xs btn-default" href="edit?id=${secondMenu.id}" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>-->
<#--                                                                        <a class="btn btn-xs btn-default" href="javascript:del(${secondMenu.id})" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>-->
<#--                                                                    </div>-->
<#--                                                                </td>-->
                                                            </tr>
                                                            <#--三级菜单-->
                                                            <#if thirdMenus ??>
                                                                <#list thirdMenus as thirdMenu>
                                                                    <#if thirdMenu.parent.id == secondMenu.id>
                                                                        <tr>
                                                                            <td style="vertical-align:middle;">
                                                                                <label class="lyear-checkbox checkbox-primary">
                                                                                    <input type="checkbox" name="ids[]" value="${thirdMenu.id}"><span></span>
                                                                                </label>
                                                                            </td>
                                                                            <td style="padding-left:45px;"><b>${thirdMenu. name}</b></td>
                                                                            <td>${thirdMenu.url}</td>
                                                                            <td><i style="font-size:22px;" class="mdi ${thirdMenu.icon}" title="${thirdMenu.icon}"></i></td>
                                                                            <td>${thirdMenu.sort}</td>
                                                                            <td><font class="text-success">${thirdMenu.createTime}</font></td>
<#--                                                                            <td>-->
<#--                                                                                <div class="btn-group">-->
<#--                                                                                    <a class="btn btn-xs btn-default" href="edit?id=${thirdMenu.id}" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>-->
<#--                                                                                    <a class="btn btn-xs btn-default" href="javascript:del(${thirdMenu.id})" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>-->
<#--                                                                                </div>-->
<#--                                                                            </td>-->
                                                                        </tr>
                                                                    </#if>
                                                                </#list>
                                                            </#if>

                                                        </#if>
                                                    </#list>
                                                </#if>

                                            </#list>
                                        </#if>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="pagination">
                                    <li class="disabled"><span>«</span></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#1">2</a></li>
                                    <li><a href="#1">3</a></li>
                                    <li><a href="#1">4</a></li>
                                    <li><a href="#1">5</a></li>
                                </ul>

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
            url:"/menu/delete",
            type:'POST',
            data:{id:id},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    showSuccessMsg('菜单删除成功!',function(){
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