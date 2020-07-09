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
<body>
<div class="questionnaire">
    <div style="text-align: center;">
        <h1>尚学堂讲师评测表</h1>
    </div>



    <div>
        <ul >
            <li><h2>学生IP:</h2></li>
            <li><h2>测评老师:</h2></li>
            <li><h2>测评时间:</h2></li>
            <li><h2>测评班级:</h2></li>
        </ul>
    </div>
    <div class="content" id="r1">
        <h2>1.讲课老师是否有激情,能否传递正能量?</h2>
        <ul>
            <input type="hidden"  id="key1" value="1">
            <input type="hidden"  id="val1" value="">
            <li><input type="radio" name="radio1" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio1" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio1" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio1" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio1" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r2">
        <h2>2.你是否充分掌握授课目标?</h2>
        <ul>
            <input type="hidden"  id="key2" value="2">
            <input type="hidden"  id="val2" value="">
            <li><input type="radio" name="radio2" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio2" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio2" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio2" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio2" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r3">
        <h2>3.讲师讲解重点问题是否突出?</h2>
        <ul>
            <input type="hidden"  id="key3" value="3">
            <input type="hidden"  id="val13" value="">
            <li><input type="radio" name="radio3" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio3" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio3" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio3" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio3" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r4">
        <h2>4.讲师是否能用简单易懂的语言讲解知识点?</h2>
        <ul>
            <input type="hidden"  id="key4" value="4">
            <input type="hidden"  id="val4" value="">
            <li><input type="radio" name="radio4" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio4" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio4" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio4" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio4" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r5">
        <h2>5.讲师授课逻辑是否清晰?</h2>
        <ul>
            <input type="hidden"  id="key5" value="5">
            <input type="hidden"  id="val5" value="">
            <li><input type="radio" name="radio5" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio5" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio5" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio5" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio5" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r6">
        <h2>6.讲师是否具有案例分析能力,引导学生参与?</h2>
        <ul>
            <input type="hidden"  id="key6" value="6">
            <input type="hidden"  id="val6" value="">
            <li><input type="radio" name="radio6" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio6" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio6" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio6" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio6" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r7">
        <h2>7.讲师授课速度是否得当?</h2>
        <ul>
            <input type="hidden"  id="key7" value="7">
            <input type="hidden"  id="val7" value="">
            <li><input type="radio" name="radio7" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio7" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio7" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio7" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio7" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r8">
        <h2>8.教师内容是否准备充分?</h2>
        <ul>
            <input type="hidden"  id="key8" value="8">
            <input type="hidden"  id="val8" value="">
            <li><input type="radio" name="radio8" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio8" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio8" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio8" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio8" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r9">
        <h2>9.课上是否有充分的练习时间?</h2>
        <ul>
            <input type="hidden"  id="key9" value="9">
            <input type="hidden"  id="val9" value="">
            <li><input type="radio" name="radio9" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio9" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio9" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio9" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio9" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r10">
        <h2>10.课下是否有充足的时间联系?</h2>
        <ul>
            <input type="hidden"  id="key10" value="10">
            <input type="hidden"  id="val10" value="">
            <li><input type="radio" name="radio10" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio10" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio10" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio10" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio10" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r11">
        <h2>11.讲师对待学员是否礼貌,有亲和力?</h2>
        <ul>
            <input type="hidden"  id="key11" value="11">
            <input type="hidden"  id="val11" value="">
            <li><input type="radio" name="radio11" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio11" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio11" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio11" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio11" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r12">
        <h2>12.讲师能否对学员做到有效监督?</h2>
        <ul>
            <input type="hidden"  id="key12" value="12">
            <input type="hidden"  id="val12" value="">
            <li><input type="radio" name="radio12" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio12" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio12" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio12" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio12" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r13">
        <h2>13.请教老师问题是否能得到耐心,有效解答?</h2>
        <ul>
            <input type="hidden"  id="key13" value="13">
            <input type="hidden"  id="val13" value="">
            <li><input type="radio" name="radio13" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio13" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio13" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio13" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio13" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r14">
        <h2>14.讲师解决问题是否举一反三,做到有效拓展?</h2>
        <ul>
            <input type="hidden"  id="key14" value="14">
            <input type="hidden"  id="val14" value="">
            <li><input type="radio" name="radio14" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio14" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio14" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio14" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio14" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r15">
        <h2>15.讲师能否做到针对一些共性问题统一讲解?</h2>
        <ul>
            <input type="hidden"  id="key15" value="15">
            <input type="hidden"  id="val15" value="">
            <li><input type="radio" name="radio15" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio15" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio15" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio15" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio15" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r16">
        <h2>16.讲师能否做到认真负责,关注学生?</h2>
        <ul>
            <input type="hidden"  id="key16" value="16">
            <input type="hidden"  id="val16" value="">
            <li><input type="radio" name="radio16" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio16" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio16" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio16" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio16" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r17">
        <h2>17.课堂笔记是否及时整理并发送给你?</h2>
        <ul>
            <input type="hidden"  id="key17" value="17">
            <input type="hidden"  id="val17" value="">
            <li><input type="radio" name="radio17" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio17" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio17" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio17" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio17" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r18">
        <h2>18.讲师是否仪容端庄,举止大方?</h2>
        <ul>
            <input type="hidden"  id="key18" value="18">
            <input type="hidden"  id="val18" value="">
            <li><input type="radio" name="radio18" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio18" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio18" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio18" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio18" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r19">
        <h2>19.讲师能否做到不经常串课旷课?</h2>
        <ul>
            <input type="hidden"  id="key19" value="19">
            <input type="hidden"  id="val19" value="">
            <li><input type="radio" name="radio19" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio19" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio19" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio19" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio19" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content" id="r20">
        <h2>20.你是否喜欢这位老师?</h2>
        <ul>
            <input type="hidden"  id="key20" value="20">
            <input type="hidden"  id="val20" value="">
            <li><input type="radio" name="radio20" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio20" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio20" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio20" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio20" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content_other">
        <h2>21.你想对这位老师说的话!!!（选填）</h2>
        <textarea maxlength="180" id="text"></textarea>
    </div>

    <button id="button" onclick="SaAjax()" >提交</button>


</div>
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/layer/layer-min.js"></script>
<script>


function SaAjax() {
    for (var i=1;i<21;i++){
        var value=$("#val"+i).val()
        if(value==""){
            layer.alert("请检查你的页面,有未点击的选择框!!!")
            return;
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

}




/*****************************给每个radio绑定点击事件并且提交红后台需要维护性***************************************/
/*****************************给每个radio绑定点击事件并且提交红后台需要维护性***************************************/
$("#r1"+" :radio").click(function () {
    var val=$('input:radio[name="radio1"]:checked').val()
    var key=$("#key1").val();
    $("#val1").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r2"+" :radio").click(function () {
    var val=$('input:radio[name="radio2"]:checked').val()
    var key=$("#key2").val();
    $("#val2").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r3"+" :radio").click(function () {
    var val=$('input:radio[name="radio3"]:checked').val()
    var key=$("#key3").val();
    $("#val3").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r4"+" :radio").click(function () {
    var val=$('input:radio[name="radio4"]:checked').val()
    var key=$("#key4").val();
    $("#val4").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r5"+" :radio").click(function () {
    var val=$('input:radio[name="radio5"]:checked').val()
    var key=$("#key5").val();
    $("#val5").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r6"+" :radio").click(function () {
    var val=$('input:radio[name="radio6"]:checked').val()
    var key=$("#key6").val();
    $("#val6").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r7"+" :radio").click(function () {
    var val=$('input:radio[name="radio7"]:checked').val()
    var key=$("#key7").val();
    $("#val7").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r8"+" :radio").click(function () {
    var val=$('input:radio[name="radio8"]:checked').val()
    var key=$("#key8").val();
    $("#val8").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r9"+" :radio").click(function () {
    var val=$('input:radio[name="radio9"]:checked').val()
    var key=$("#key9").val();
    $("#val9").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r10"+" :radio").click(function () {
    var val=$('input:radio[name="radio10"]:checked').val()
    var key=$("#key10").val();
    $("#val10").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r11"+" :radio").click(function () {
    var val=$('input:radio[name="radio11"]:checked').val()
    var key=$("#key11").val();
    $("#val11").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r12"+" :radio").click(function () {
    var val=$('input:radio[name="radio12"]:checked').val()
    var key=$("#key12").val();
    $("#val12").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r13"+" :radio").click(function () {
    var val=$('input:radio[name="radio13"]:checked').val()
    var key=$("#key13").val();
    $("#val13").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r14"+" :radio").click(function () {
    var val=$('input:radio[name="radio14"]:checked').val()
    var key=$("#key14").val();
    $("#val14").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r15"+" :radio").click(function () {
    var val=$('input:radio[name="radio15"]:checked').val()
    var key=$("#key15").val();
    $("#val15").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r16"+" :radio").click(function () {
    var val=$('input:radio[name="radio16"]:checked').val()
    var key=$("#key16").val();
    $("#val16").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r17"+" :radio").click(function () {
    var val=$('input:radio[name="radio17"]:checked').val()
    var key=$("#key17").val();
    $("#val17").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r18"+" :radio").click(function () {
    var val=$('input:radio[name="radio18"]:checked').val()
    var key=$("#key18").val();
    $("#val18").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r19"+" :radio").click(function () {
    var val=$('input:radio[name="radio19"]:checked').val()
    var key=$("#key19").val();
    $("#val19").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});

$("#r20"+" :radio").click(function () {
    var val=$('input:radio[name="radio20"]:checked').val()
    var key=$("#key20").val();
    $("#val20").val(val)
    $.ajax({
        type:"post",
        url:"${ctx}/update",
        data:{
            key:key,
            value:val
        },
        success:function (result) {
            if(200==result.code){
                console.log("suess")
            }else{
                layer.msg('请重新点击!!!');
            }
        }
    })
});
/*****************************给每个radio绑定点击事件并且提交红后台需要维护性***************************************/
/*****************************给每个radio绑定点击事件并且提交红后台需要维护性***************************************/
</script>
</body>
</html>
