<!-- 设置项目根路径全局变量 -->
<#assign ctx=request.contextPath/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>excel导出</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/layui/css/layui.css">
	<style>
		.layui-container {
			padding-bottom: 50px;
		}
	</style>
	<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/js/excel.js"></script>
	<script type="text/javascript">
	layui.config({
		base: 'layui_exts/'
	}).extend({
		excel: 'excel'
	});
	</script>
	<!-- IE需要把JS放在上边，否则onclick失效 -->
	<script src="${ctx}/js/index.js"></script>
</head>
<body>
<div class="layui-container">
	<div class="layui-row">
		<div class="layui-col-md11 layui-col-md-offset1">
			<fieldset class="layui-elem-field layui-field-title"><legend></legend></fieldset>
			<div class="layui-form">
				<div class="layui-form-item">
					<div class="layui-form-label">导出操作</div>
					<div class="layui-form-block">
						<button type="button" class="layui-btn layui-btn-primary" onclick="exportExtendDemo('${ctx}/tree')">导出表格</button>
						<!--<button type="button" class="layui-btn layui-btn-primary" onclick="exportBorderDemo()">快速设置边框</button>-->
					</div>
				</div>

				<!--<div class="layui-form-item">-->
					<!--<div class="layui-form-label">使用样例</div>-->
					<!--<div class="layui-form-block">-->
						<!--<button type="button" class="layui-btn layui-btn-primary" onclick="demoList()">查看样例列表</button>-->
					<!--</div>-->
				<!--</div>-->

				<div id="LAY-excel-demo-list-dom"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
