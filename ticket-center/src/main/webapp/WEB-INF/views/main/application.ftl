<#macro layout>
<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en" ng-app="ticketCenterApp">
    <head>
        <meta charset="UTF-8">
        <title>对外任务公示系统</title>
        <#include "../tpls/css_js.ftl">
        <script type="text/javascript">
            var baseUrl ='${base}';
            $(function() {
                /***左侧菜单***/
                $(document).ready(function () {
                    $(".topnav").accordion({
                        accordion: false,
                        speed: 0,
                        closedSign: '[+]',
                        openedSign: '[-]'
                    });

                    $("#left-panel-link").click(function () {
                        $("#left-panel").toggle();
                    });
                });

            })
        </script>

    </head>
    <body>
        <div id="page_body">
            <#include "../tpls/header.ftl">
            <section class="main_body">
                <#include "../tpls/sidebar.ftl">

                <#-- 在这里嵌入main content -->
                <#nested>
            </section>
            <#include "../tpls/footer.ftl">
        </div>
    </body>
</html>
</#macro>