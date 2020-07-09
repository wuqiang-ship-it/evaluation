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
    <div class="content">
        <h2>1.讲课老师是否有激情,能否传递正能量?</h2>
        <ul>
            <input type="text"  id="key1" value="">
            <input type="text" id="value1" value="">
            <li><input type="radio" name="radio0" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio0" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio0" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio0" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio0" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>2.你是否充分掌握授课目标?</h2>
        <ul>
            <li><input type="radio" name="radio1" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio1" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio1" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio1" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio1" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>3.讲师讲解重点问题是否突出?</h2>
        <ul>
            <li><input type="radio" name="radio2" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio2" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio2" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio2" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio2" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>4.讲师是否能用简单易懂的语言讲解知识点?</h2>
        <ul>
            <li><input type="radio" name="radio3" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio3" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio3" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio3" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio3" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>5.讲师授课逻辑是否清晰?</h2>
        <ul>
            <li><input type="radio" name="radio4" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio4" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio4" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio4" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio4" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>6.讲师是否具有案例分析能力,引导学生参与?</h2>
        <ul>
            <li><input type="radio" name="radio5" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio5" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio5" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio5" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio5" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>7.讲师授课速度是否得当?</h2>
        <ul>
            <li><input type="radio" name="radio6" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio6" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio6" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio6" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio6" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>8.教师内容是否准备充分?</h2>
        <ul>
            <li><input type="radio" name="radio7" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio7" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio7" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio7" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio7" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>9.课上是否有充分的练习时间?</h2>
        <ul>
            <li><input type="radio" name="radio8" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio8" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio8" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio8" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio8" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>10.课下是否有充足的时间联系?</h2>
        <ul>
            <li><input type="radio" name="radio9" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio9" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio9" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio9" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio9" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>11.讲师对待学员是否礼貌,有亲和力?</h2>
        <ul>
            <li><input type="radio" name="radio10" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio10" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio10" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio10" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio10" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>12.讲师能否对学员做到有效监督?</h2>
        <ul>
            <li><input type="radio" name="radio11" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio11" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio11" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio11" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio11" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>13.请教老师问题是否能得到耐心,有效解答?</h2>
        <ul>
            <li><input type="radio" name="radio12" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio12" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio12" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio12" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio12" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>14.讲师解决问题是否举一反三,做到有效拓展?</h2>
        <ul>
            <li><input type="radio" name="radio13" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio13" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio13" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio13" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio13" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>15.讲师能否做到针对一些共性问题统一讲解?</h2>
        <ul>
            <li><input type="radio" name="radio14" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio14" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio14" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio14" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio14" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>16.讲师能否做到认真负责,关注学生?</h2>
        <ul>
            <li><input type="radio" name="radio15" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio15" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio15" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio15" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio15" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>17.课堂笔记是否及时整理并发送给你?</h2>
        <ul>
            <li><input type="radio" name="radio16" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio16" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio16" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio16" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio16" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>18.讲师是否仪容端庄,举止大方?</h2>
        <ul>
            <li><input type="radio" name="radio17" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio17" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio17" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio17" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio17" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>19.讲师能否做到不经常串课旷课?</h2>
        <ul>
            <li><input type="radio" name="radio18" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio18" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio18" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio18" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio18" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content">
        <h2>20.你是否喜欢这位老师?</h2>
        <ul>
            <li><input type="radio" name="radio19" value="1"><span>1分</span></li>
            <li><input type="radio" name="radio19" value="2"><span>2分</span></li>
            <li><input type="radio" name="radio19" value="3"><span>3分</span></li>
            <li><input type="radio" name="radio19" value="4"><span>4分</span></li>
            <li><input type="radio" name="radio19" value="5"><span>5分</span></li>
        </ul>
    </div>
    <div class="content_other">
        <h2>21.你想对这位老师说的话!!!（选填）</h2>
        <textarea maxlength="180" id="text"></textarea>
    </div>

    <button id="button" onclick="SutAjax()" >提交</button>
</div>
<script src="${ctx}/js/jquery.min.js"></script>
<script>


function SutAjax() {


}


</script>
</body>
</html>
