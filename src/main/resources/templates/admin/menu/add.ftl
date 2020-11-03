<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>${siteName!""}菜单管理-菜单添加</title>
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
                            <div class="card-body">

                                <form action="#!" method="post" class="row">
                                    <div class="form-group col-md-12">
                                        <label for="type">父分类</label>
                                        <div class="form-controls">
                                            <select name="type" class="form-control" id="type">
                                                <option value="1">小说</option>
                                                <option value="2">古籍</option>
                                                <option value="3">专辑</option>
                                                <option value="4">自传</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="title">菜单名称</label>
                                        <input type="text" class="form-control required" id="name" name="name" value="" placeholder="请输入菜单名称" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="seo_keywords">菜单url</label>
                                        <input type="text" class="form-control " id="url" name="url" value="" placeholder="请填写菜单url" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="seo_description">菜单icon</label>
                                        <input type="text" class="form-control " id="icon" name="icon" value="" placeholder="请输入菜单icon" />
                                    </div>


                                    <div class="form-group col-md-12">
                                        <label for="sort">排序</label>
                                        <input type="text" class="form-control" id="sort" name="sort" value="0" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="status">状态</label>
                                        <div class="clearfix">
                                            <label class="lyear-radio radio-inline radio-primary">
                                                <input type="radio" name="status" value="0"><span>禁用</span>
                                            </label>
                                            <label class="lyear-radio radio-inline radio-primary">
                                                <input type="radio" name="status" value="1" checked><span>启用</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
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