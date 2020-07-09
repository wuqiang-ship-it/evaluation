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
                                    //生成文件
                                    $.ajax({
                                        type:"post",
                                        url:"${ctx}/ex",
                                        success:function (result) {
                                            console.log(result);
                                            //生成文件
                                            downloadExl(result);
                                        }
                                    })
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

    /**
     * 导入数据
     */
    var tmpDown; //导出的二进制对象
    function downloadExl(json, type) {
        var tmpdata = json[0];
        json.unshift({});
        var keyMap = []; //获取keys
        //keyMap =Object.keys(json[0]);
        for (var k in tmpdata) {
            keyMap.push(k);
            json[0][k] = k;
        }
        var tmpdata = [];//用来保存转换好的json
        json.map((v, i) => keyMap.map((k, j) => Object.assign({}, {
            v: v[k],
            position: (j > 25 ? getCharCol(j) : String.fromCharCode(65 + j)) + (i + 1)
        }))).reduce((prev, next) => prev.concat(next)).forEach((v, i) => tmpdata[v.position] = {
            v: v.v
        });
        var outputPos = Object.keys(tmpdata); //设置区域,比如表格从A1到D10
        var tmpWB = {
            SheetNames: ['mySheet'], //保存的表标题
            Sheets: {
                'mySheet': Object.assign({},
                    tmpdata, //内容
                    {
                        '!ref': outputPos[0] + ':' + outputPos[outputPos.length - 1] //设置填充区域
                    })
            }
        };
        tmpDown = new Blob([s2ab(XLSX.write(tmpWB,
            {bookType: (type == undefined ? 'xlsx':type),bookSST: false, type: 'binary'}//这里的数据是用来定义导出的格式类型
        ))], {
            type: ""
        }); //创建二进制对象写入转换好的字节流
        var href = URL.createObjectURL(tmpDown); //创建对象超链接
        document.getElementById("hf").href = href; //绑定a标签
        document.getElementById("hf").click(); //模拟点击实现下载
        setTimeout(function() { //延时释放
            URL.revokeObjectURL(tmpDown); //用URL.revokeObjectURL()来释放这个object URL
        }, 100);
    }

    function s2ab(s) { //字符串转字符流
        var buf = new ArrayBuffer(s.length);
        var view = new Uint8Array(buf);
        for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
        return buf;
    }
    // 将指定的自然数转换为26进制表示。映射关系：[0-25] -> [A-Z]。
    function getCharCol(n) {
        let temCol = '',
            s = '',
            m = 0
        while (n > 0) {
            m = n % 26 + 1
            s = String.fromCharCode(m + 64) + s
            n = (n - m) / 26
        }
        return s
    }
</script>
</body>
</html>
