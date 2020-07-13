<!-- 设置项目根路径全局变量 -->
<#assign ctx=request.contextPath/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师</title>
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/layer/skin/layer.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css" type="text/css">
    <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${ctx}/layer/layer-min.js"></script>
    <script type="text/javascript" src="${ctx}/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/js/excel.js"></script>

    <script src="${ctx}/js/index.js"></script>
    <script src="${ctx}/js/xlsx.full.min.js"></script>

</head>
<body>
<!-- 布局容器 start-->
<div class="container">
    <!-- 面板 start -->
    <div class="panel panel-primary">
        <!-- 面板头 start -->
        <div class="panel-heading" style="text-align: center;">
            <h2>教师端</h2>
        </div>
        <!-- 面板头 end -->

        <!-- 面板体 start -->
        <div class="panel-body" style="height: 500px;">
            <form class="form-horizontal">
                <div class="box-body">
                    <div class="form-group">
                        <label0 class="control-label col-sm-2">专业:</label0>
                        <div class="col-sm-3">
                            <select id="next1" class="small form-control"  onchange="getCategory(this.value);">
                                <option value="0">请选择专业:</option>
                                <#list major as t>
                                    <option value="${t}">${t}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label0 class="control-label col-sm-2">请选择班级:</label0>
                        <div class="col-sm-3">
                            <select class="small form-control" id="next3" >
                                    <option value="0">请选择班级:</option>
                                    <#if grades?? && (grades?size > 0) >
                                        <#list grades as grade>
                                            <option value="${grade}">${grade}</option>
                                        </#list>
                                    <#else>
                                    </#if>



                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label0 class="control-label col-sm-2">老师:</label0>
                        <div class="col-sm-3">
                            <select class="small form-control"  id="next2">
                                <option value="0">请选择老师:</option>
                                <#list global.teachers as teacher>
                                    <option value="${teacher}">${teacher}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="box-footer">
                    <button type="button" onclick="SubAjax()"  class="layui-btn"  style="margin-left: 150px;" id="start">
                        开始评测</button>
                </div>
                <div class="box-footer">
                    <button type="button" onclick="endAjax()"  class="layui-btn layui-btn-disabled" style="margin-left: 150px;" id="end">
                        结束评测</button>
                </div>
                <div class="box-footer">
                    <button type="button" onclick="exportExtendDemo('${ctx}/tree')"  class="layui-btn layui-btn-disabled" style="margin-left: 150px;" id="upex">
                        生成表格</button>
                </div>
            </form>
        </div>
        <!-- 面板体 end -->
    </div>
    <!-- 面板 end -->
</div>
<script type="text/javascript">

        // $(function(){
        //     $('#start').removeClass("layui-btn-disabled").attr("disabled",false);
        // });

        function getCategory(major) {
            <#--location.href = "${ctx}/linkage?major="+major;-->
            $.ajax({
                type:"post",
                url:"${ctx}/linkage",
                data:{
                    major:major,
                },
                success:function (result) {
                    console.log(result.list);
                    $("#next3 option").each(function(){
                        var id = $(this).attr("value");
                        if(id !=-1){
                            this.remove();
                        }
                    });

                    for(var i=0;i<result.list.length;i++){
                        var rep = "<option value="+result.list[i]+">"+result.list[i]+"</option>";
                        $("#next3").append(rep);
                    }
                }
            })
    }

    /**
     * 开始评测
     * @constructor
     */
    function SubAjax() {
        var major=$("#next1 option:selected").val();
        var name=$("#next2 option:selected").val();
        var grade=$("#next3 option:selected").val();
        console.log(major+" "+name+" "+grade);
        if(0==grade){
         alert("请选择班级！！")
         return;
     }
        $.ajax({
            type:"post",
            url:"${ctx}/start",
            data:{
                name:name,
                major:major,
                grade:grade
            },
            success:function (result) {
                if(200==result.code){
                    alert("评测中");
                    $('#start').addClass("layui-btn-disabled").attr("disabled",true);
                    $('#end').removeClass("layui-btn-disabled").attr("disabled",false);

                }else{
                    alert("错误!!请重新选择")
                }
            }
        })
    }
    function endAjax() {
        $.ajax({
            type:"post",
            url:"${ctx}/end",
            data:{},
            success:function (result) {
                if(200==result.code){

                    alert("评价完毕");
                    $('#end').addClass("layui-btn-disabled").attr("disabled",true);
                    $('#upex').removeClass("layui-btn-disabled").attr("disabled",false);

                }else{
                    alert("异常");
                }
            }
        })
    }


</script>
</body>
</html>
