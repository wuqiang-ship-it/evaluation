<!-- 设置项目根路径全局变量 -->
<#assign ctx=request.contextPath/>
<!DOCTYPE html>
 <html>
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
        <title>教师端登录</title>
        <style>
                body {
                        background-color: #eee;
                     }
            </style>
    </head>
 <body>
 <div>
         <div>
                 <div class="col-md-4 col-md-offset-5" style="margin-top: 150px">
                         <h1 class="page-header col-md-offset-2">请登录</h1>
                         <form role="form">
                                <div class="form-group">
                                      <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
                                       <div>
                                                 <input type="password" id="password" placeholder="Password">
                                            </div>
                                   </div>
                                <div class="form-group">
                                         <div class="col-sm-offset-2 col-sm-4">
                                <button type="button"  onclick="btn()" class="btn btn-primary btn-block">登录</button>
                                             </div>
                                     </div>
                            </form>
                   </div>
            </div>
     </div>
</body>

<script type="text/javascript">
    function btn() {
        console.log(1)
        var password=$("#password").val();
        if(password.length<0 || password.trim()==""){
            alert("密码错误")
        }
        $.ajax({
            type:"post",
            url:"${ctx}/login1",
            data:{
                password:password
            },
            success:function (result) {
                console.log(result);
                if(200==result.code){
                    location.href = "${ctx}/admin";
                }else{
                    alert("密码错误!!")
                }
            }
        })
    }
</script>
 </html>

