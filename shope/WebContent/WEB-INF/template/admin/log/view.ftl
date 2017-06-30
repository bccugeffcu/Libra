[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${message("admin.log.view")} - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
</head>
<body>
	<div class="breadcrumb">
		<a href="${base}/admin/common/index.jhtml">${message("admin.breadcrumb.home")}</a> &raquo; ${message("admin.log.view")}
	</div>
	<table class="input">
		<tr>
			<th>
				${message("Log.operation")}:
			</th>
			<td>
				${log.operation}
			</td>
		</tr>
		<tr>
			<th>
				${message("Log.operator")}:
			</th>
			<td>
				${log.operator}
			</td>
		</tr>
		<tr>
			<th>
				${message("Log.content")}:
			</th>
			<td>
				${log.content!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("Log.parameter")}:
			</th>
			<td>
				<textarea class="textarea" style="width: 98%; height: 300px;" readonly="readonly">${log.parameter}</textarea>
			</td>
		</tr>
		<tr>
			<th>
				${message("Log.ip")}:
			</th>
			<td>
				${log.ip}
			</td>
		</tr>
		<tr>
			<th>
				${message("admin.common.createDate")}
			</th>
			<td>
				${log.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="history.back(); return false;" />
			</td>
		</tr>
	</table>
</body>
</html>
[/#escape]