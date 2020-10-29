<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>${siteName!""}后台管理系统主页</title>
    <#include "../common/header.ftl"/>


</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="/system/index"><img src="/admin/images/logo-sidebar.png" title="LightYear" alt="LightYear" /></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"> <a href="/system/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-palette"></i> UI 元素</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="lyear_ui_buttons.html">按钮</a> </li>
                                <li> <a href="lyear_ui_cards.html">卡片</a> </li>
                                <li> <a href="lyear_ui_grid.html">格栅</a> </li>
                                <li> <a href="lyear_ui_icons.html">图标</a> </li>
                                <li> <a href="lyear_ui_tables.html">表格</a> </li>
                                <li> <a href="lyear_ui_modals.html">模态框</a> </li>
                                <li> <a href="lyear_ui_tooltips_popover.html">提示 / 弹出框</a> </li>
                                <li> <a href="lyear_ui_alerts.html">警告框</a> </li>
                                <li> <a href="lyear_ui_pagination.html">分页</a> </li>
                                <li> <a href="lyear_ui_progress.html">进度条</a> </li>
                                <li> <a href="lyear_ui_tabs.html">标签页</a> </li>
                                <li> <a href="lyear_ui_typography.html">排版</a> </li>
                                <li> <a href="lyear_ui_step.html">步骤</a> </li>
                                <li> <a href="lyear_ui_other.html">其他</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-format-align-justify"></i> 表单</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="lyear_forms_elements.html">基本元素</a> </li>
                                <li> <a href="lyear_forms_radio.html">单选框</a> </li>
                                <li> <a href="lyear_forms_checkbox.html">复选框</a> </li>
                                <li> <a href="lyear_forms_switch.html">开关</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 示例页面</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="lyear_pages_doc.html">文档列表</a> </li>
                                <li> <a href="lyear_pages_gallery.html">图库列表</a> </li>
                                <li> <a href="lyear_pages_config.html">网站配置</a> </li>
                                <li> <a href="lyear_pages_rabc.html">设置权限</a> </li>
                                <li> <a href="lyear_pages_add_doc.html">新增文档</a> </li>
                                <li> <a href="lyear_pages_guide.html">表单向导</a> </li>
                                <li> <a href="lyear_pages_login.html">登录页面</a> </li>
                                <li> <a href="lyear_pages_error.html">错误页面</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-language-javascript"></i> JS 插件</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="lyear_js_datepicker.html">日期选取器</a> </li>
                                <li> <a href="lyear_js_sliders.html">滑块</a> </li>
                                <li> <a href="lyear_js_colorpicker.html">选色器</a> </li>
                                <li> <a href="lyear_js_chartjs.html">Chart.js</a> </li>
                                <li> <a href="lyear_js_jconfirm.html">对话框</a> </li>
                                <li> <a href="lyear_js_tags_input.html">标签插件</a> </li>
                                <li> <a href="lyear_js_notify.html">通知消息</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-menu"></i> 多级菜单</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="#!">一级菜单</a> </li>
                                <li class="nav-item nav-item-has-subnav">
                                    <a href="#!">一级菜单</a>
                                    <ul class="nav nav-subnav">
                                        <li> <a href="#!">二级菜单</a> </li>
                                        <li class="nav-item nav-item-has-subnav">
                                            <a href="#!">二级菜单</a>
                                            <ul class="nav nav-subnav">
                                                <li> <a href="#!">三级菜单</a> </li>
                                                <li> <a href="#!">三级菜单</a> </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li> <a href="#!">一级菜单</a> </li>
                            </ul>
                        </li>
                    </ul>
                </nav>

                <div class="sidebar-footer">
                    <p class="copyright">Copyright &copy; 2019. All rights reserved. More Templates 更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
                </div>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title"> 后台首页 </span>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <img class="img-avatar img-avatar-48 m-r-10" src="/admin/images/users/avatar.jpg" alt="笔下光年" />
                                <span>笔下光年 <span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li> <a href="lyear_pages_profile.html"><i class="mdi mdi-account"></i> 个人信息</a> </li>
                                <li> <a href="lyear_pages_edit_pwd.html"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                                <li> <a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li>
                                <li class="divider"></li>
                                <li> <a href="lyear_pages_login.html"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                            </ul>
                        </li>
                        <!--切换主题配色-->
                        <li class="dropdown dropdown-skin">
                            <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
                            <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                                <li class="drop-title"><p>主题</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>LOGO</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>头部</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>侧边栏</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
                                </li>
                            </ul>
                        </li>
                        <!--切换主题配色-->
                    </ul>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-sm-6 col-lg-3">
                        <div class="card bg-primary">
                            <div class="card-body clearfix">
                                <div class="pull-right">
                                    <p class="h6 text-white m-t-0">今日收入</p>
                                    <p class="h3 text-white m-b-0">102,125.00</p>
                                </div>
                                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-currency-cny fa-1-5x"></i></span> </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3">
                        <div class="card bg-danger">
                            <div class="card-body clearfix">
                                <div class="pull-right">
                                    <p class="h6 text-white m-t-0">用户总数</p>
                                    <p class="h3 text-white m-b-0">920,000</p>
                                </div>
                                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3">
                        <div class="card bg-success">
                            <div class="card-body clearfix">
                                <div class="pull-right">
                                    <p class="h6 text-white m-t-0">下载总量</p>
                                    <p class="h3 text-white m-b-0">34,005,000</p>
                                </div>
                                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-arrow-down-bold fa-1-5x"></i></span> </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3">
                        <div class="card bg-purple">
                            <div class="card-body clearfix">
                                <div class="pull-right">
                                    <p class="h6 text-white m-t-0">新增留言</p>
                                    <p class="h3 text-white m-b-0">153 条</p>
                                </div>
                                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-comment-outline fa-1-5x"></i></span> </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>每周用户</h4>
                            </div>
                            <div class="card-body">
                                <canvas class="js-chartjs-bars"></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h4>交易历史记录</h4>
                            </div>
                            <div class="card-body">
                                <canvas class="js-chartjs-lines"></canvas>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>项目信息</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>项目名称</th>
                                            <th>开始日期</th>
                                            <th>截止日期</th>
                                            <th>状态</th>
                                            <th>进度</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>设计新主题</td>
                                            <td>10/02/2019</td>
                                            <td>12/05/2019</td>
                                            <td><span class="label label-warning">待定</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-warning" style="width: 45%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>网站重新设计</td>
                                            <td>01/03/2019</td>
                                            <td>12/04/2019</td>
                                            <td><span class="label label-success">进行中</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-success" style="width: 30%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>模型设计</td>
                                            <td>10/10/2019</td>
                                            <td>12/11/2019</td>
                                            <td><span class="label label-warning">待定</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-warning" style="width: 25%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>后台管理系统模板设计</td>
                                            <td>25/01/2019</td>
                                            <td>09/05/2019</td>
                                            <td><span class="label label-success">进行中</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-success" style="width: 55%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>前端设计</td>
                                            <td>10/10/2019</td>
                                            <td>12/12/2019</td>
                                            <td><span class="label label-danger">未开始</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-danger" style="width: 0%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>桌面软件测试</td>
                                            <td>10/01/2019</td>
                                            <td>29/03/2019</td>
                                            <td><span class="label label-success">进行中</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-success" style="width: 75%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>APP改版开发</td>
                                            <td>25/02/2019</td>
                                            <td>12/05/2019</td>
                                            <td><span class="label label-danger">暂停</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-danger" style="width: 15%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>Logo设计</td>
                                            <td>10/02/2019</td>
                                            <td>01/03/2019</td>
                                            <td><span class="label label-warning">完成</span></td>
                                            <td>
                                                <div class="progress progress-striped progress-sm">
                                                    <div class="progress-bar progress-bar-success" style="width: 100%;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
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

</script>
</body>
</html>