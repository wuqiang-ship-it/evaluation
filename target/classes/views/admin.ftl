<!-- 设置项目根路径全局变量 -->
<#assign ctx=request.contextPath/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师</title>
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/layer/skin/layer.css">
    <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${ctx}/layer/layer-min.js"></script>
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
                        <input type="hidden" name="name" id="name" value="" >
                        <input type="hidden" name="major" id="major" value="" >
                        <input type="hidden" name="grade" id="grade" value="" >
                        <label0 class="control-label col-sm-2">班级:</label0>
                        <div class="col-sm-3">
                            <select id="next1" class="small form-control" onchange="getCategory(this.value,'next2','next3');">
                                <option value="0">请选择班级:</option>
                                <#list teacher as t>
                                    <option value="${t}">${t}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label0 class="control-label col-sm-2">专业:</label0>
                        <div class="col-sm-3">
                            <select class="small form-control" id="next3" >
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label0 class="control-label col-sm-2">老师:</label0>
                        <div class="col-sm-3">
                            <select class="small form-control"  id="next2">
                            </select>
                        </div>
                    </div>

                </div>
                <div class="box-footer">
                    <button type="button" onclick="SubAjax()"  class="btn btn-primary" style="margin-left: 150px;">
                        开始评测</button>
                </div>
            </form>
        </div>
        <!-- 面板体 end -->
    </div>
    <!-- 面板 end -->
</div>
<!--
        以下a标签不需要内容
    -->
<a href="" download="测评.xlsx" id="hf"></a>
<script type="text/javascript">
    function getCategory(grade,next2,next3) {
        $("#name").val("");
        $("#major").val("");
        $("#grade").val("");
        if(0==grade){
            $("#next2").html("");
            $("#next3").html("");
            return;
        }
        var html3=null;
        var html2=null;
        console.log(grade)
        $.ajax({
            type: "post",
            url: "${ctx}/linkage",
            data: {
                grade: grade
            },
            success: function (result) {
                if (200 == result.code) {
                    var mess=null;
                    mess= JSON.parse(result.message)
                    $("#name").val(mess.name);
                    $("#major").val(mess.major);
                    $("#grade").val(mess.grade);
                    html3="<option value='" + mess.major + "'>" + mess.major + "</option>";
                    $("#" + next3).html(html3);
                    html2="<option value='" + mess.name + "'>" + mess.name + "</option>";
                    $("#" + next2).html(html2);
                } else {
                    alert(result.message)
                }

            }
        })
    }

    /**
     * 开始评测
     * @constructor
     */
    function SubAjax() {
     var name=$("#name").val();
     var major= $("#major").val();
     var grade=$("#grade").val();
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
                    layer.confirm('正在评测!!!',{
                        btn:['结束测评']
                    },function () {
                        $.ajax({
                            type:"post",
                            url:"${ctx}/end",
                            success:function (result) {
                                if(200==result.code){
                                    window.location.href="${ctx}/upex";
                                    layer.msg('已经结束测评', {icon: 1});
                                }else{
                                    layer.msg('测评失败请重新测评', {icon: 1});
                                }
                            }
                        })

                        }
                        
                    )
                }else{
                    alert("错误!!请重新选择")
                }
            }
        })
    }


</script>
</body>
</html>
