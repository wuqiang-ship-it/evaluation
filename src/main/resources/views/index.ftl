<!-- 设置项目根路径全局变量 -->
<#assign ctx=request.contextPath/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生</title>
</head>
<style>
*{margin:0;padding:0;outline:0;}
html{font-size:62.5%;}
body{font-size:1.2rem;color:#666;font-family:"Helvetica";}
li{list-style:none;}
h2{font-size:1.5rem;font-weight:normal;color:#333;}
input[type="radio"], input[type="checkbox"]{-webkit-appearance:none;display:block;float:left;}
input[type="radio"]{border:1px solid #999;border-radius:50%;width:1.2rem;height:1.2rem;margin:6px 10px 0 0;}
input[type="radio"]:checked{background:url(images/radio_checked.png) no-repeat center top / 1.2rem 1.2rem;}
.questionnaire{padding:1rem 1.5rem;}
.questionnaire .content{margin-top:.5rem;}
.content li{float:left;width:50%;height:2.2rem;line-height:2.2rem;}
.content ul{overflow:hidden;margin-top:.5rem;}
.content_seven li{width:100%;}
.content_other textarea{resize:none;width:98%;padding-left:2%;height:6.4rem;margin-top:1rem;line-height:2rem;}
#submit{width:100%;height:3rem;color:#fff;background:#9f9f9f;margin:3rem 0 2.7rem;border:0;}
</style>
<link rel="stylesheet" href="${ctx}/layui/css/layui.css">
<body>
<div class="questionnaire">
    <div style="text-align: center;">
        <h1>尚学堂讲师评测表</h1>
    </div>



    <div>
        <ul >

            <li><h2>测评老师:${teacher.name}</h2></li>
            <li><h2>测评时间:${teacher.createTime}</h2></li>
            <li><h2>测评班级:${teacher.grade}</h2></li>
        </ul>
    </div>
    <#list global.questions as question>
    <div class="content" id="question${question_index+1}">
        <h2>${question_index+1}:${question}</h2>
        <li><input type="radio" name="${question_index+1}" value="1"><span>1分</span></li>
        <li><input type="radio" name="${question_index+1}" value="2"><span>2分</span></li>
        <li><input type="radio" name="${question_index+1}" value="3"><span>3分</span></li>
        <li><input type="radio" name="${question_index+1}" value="4"><span>4分</span></li>
        <li><input type="radio" name="${question_index+1}" value="5"><span>5分</span></li>
    </div>
    </#list>
    <div class="content_other">
        <h2>21.你想对这位老师说的话!!!（选填）</h2>
        <textarea maxlength="180" id="text"></textarea>
    </div>

    <button id="button" onclick="SaAjax()" class="layui-btn">提交</button>


</div>
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/layer/layer-min.js"></script>
<script>


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
            }else{
                layer.alert("保存失败,请重试!!")
            }
        }
    })
}


$(function(){
    for (var i=1; i<=20; i++){
        $("#question"+i+" :radio").bind("click", {index: i}, clickHandler);
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
