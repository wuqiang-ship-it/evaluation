<!-- 设置项目根路径全局变量 -->
<#assign ctx=request.contextPath/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生</title>
</head>
<#--<style>-->
<#--*{margin:0;padding:0;outline:0;}-->
<#--html{font-size:62.5%;}-->
<#--body{font-size:1.2rem;color:#666;font-family:"Helvetica";}-->
<#--li{list-style:none;}-->
<#--h2{font-size:1.5rem;font-weight:normal;color:#333;}-->
<#--input[type="radio"], input[type="checkbox"]{-webkit-appearance:none;display:block;float:left;}-->
<#--input[type="radio"]{border:1px solid #999;border-radius:50%;width:1.2rem;height:1.2rem;margin:6px 10px 0 0;}-->
<#--input[type="radio"]:checked{background:url(images/radio_checked.png) no-repeat center top / 1.2rem 1.2rem;}-->
<#--.questionnaire{padding:1rem 1.5rem;}-->
<#--.questionnaire .content{margin-top:.5rem;}-->
<#--.content li{float:left;width:50%;height:2.2rem;line-height:2.2rem;}-->
<#--.content ul{overflow:hidden;margin-top:.5rem;}-->
<#--.content_seven li{width:100%;}-->
<#--.content_other textarea{resize:none;width:98%;padding-left:2%;height:6.4rem;margin-top:1rem;line-height:2rem;}-->
<#--#submit{width:100%;height:3rem;color:#fff;background:#9f9f9f;margin:3rem 0 2.7rem;border:0;}-->
<#--</style>-->
<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx}/layer/skin/layer.css">
<link rel="stylesheet" href="${ctx}/layui/css/layui.css">
<script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${ctx}/layer/layer-min.js"></script>
<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
<body>
<div class="questionnaire">
    <div style="text-align: center;">
        <h1>尚学堂讲师评测表</h1>
    </div>
    <div>
        <ul >

            <li><h3>测评老师:${teacher.name}</h3></li>
            <li><h3>测评时间:${teacher.createTime}</h3></li>
            <li><h3>测评班级:${teacher.grade}</h3></li>
        </ul>
    </div>
    <#list global.questions as question>
    <div class="layui-form-item" id="question${question_index+1}" >
        <li><label  style="width: 330px">${question_index+1}:${question}</label></li>
        <ul>
            <li><input type="radio" name="${question_index+1}" value="1" title="1分">1分</li>
            <li><input type="radio" name="${question_index+1}" value="2" title="2分">2分</li>
            <li><input type="radio" name="${question_index+1}" value="3" title="3分">3分</li>
            <li><input type="radio" name="${question_index+1}" value="4" title="4分">4分</li>
            <li><input type="radio" name="${question_index+1}" value="5" title="5分">5分</li>
        </ul>
     </div>
    </#list>
    <div class="layui-form-item layui-form-text">
        <label style="width: 250px">21.你想对这位老师说的话</label>
        <div class="layui-input-block">
            <textarea name="desc" placeholder="请输入内容" class="layui-textarea" id="text"></textarea>
        </div>
<#--        <textarea maxlength="380" id="text"></textarea>-->
    </div>

    <button id="button" onclick="SaAjax()" class="layui-btn">提交</button>


</div>
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/layer/layer-min.js"></script>
<script>
layui.use('form',function () {
    var form=layui.form;
    form.render();
})

function SaAjax() {
    for (var i=1;i<21;i++){
        var value=$("input[name="+i+"]:checked").val();
        console.log(value+"----");
        if(value==""||value==undefined){
            layer.alert("请检查你的页面,你的第"+i+"个选项框未点击!!!")
            return;
        }
    }
    $.ajax({
        type:"post",
        url:"${ctx}/save",
        success: function (result) {
            if(200==result.code){
                layer.alert("保存成功!!")
                $('#button').addClass("layui-btn-disabled").attr("disabled",true);
            }else{
                layer.alert("保存失败,请重试!!")
            }
        }
    })
}


$(function(){
    for (var i=1; i<=20; i++){
        $("#question"+i+" ul li :radio").bind("click", {index: i}, clickHandler);
    }

    function clickHandler(event) {
        var i= event.data.index;
        var val=$("input[name="+i+"]:checked").val();
        $.ajax({
            type:"post",
            url:"${ctx}/update",
            data:{
                key:i,
                value:val
            },
            success:function (result) {
                if(200==result.code){
                    console.log("ok");
                }else{
                    layer.msg('请重新点击!!!');
                }
            }
        })
    }
});


    $("#text").blur(function(){
        $.ajax({
            type:"post",
            url:"${ctx}/update",
            data:{
                key:"leving",
                value:$("#text").val()
            },
            success:function (result) {
                if(200==result.code){
                    console.log("ok");
                }else{
                    layer.msg('请重新留言!!!');
                }
            }
        })
    })

</script>
</body>
</html>
