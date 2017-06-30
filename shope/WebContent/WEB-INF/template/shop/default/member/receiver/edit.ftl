[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${message("shop.member.receiver.edit")}[#if showPowered] - Powered By SHOP++[/#if]</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${base}/resources/shop/${theme}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/${theme}/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/${theme}/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/${theme}/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/shop/${theme}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/${theme}/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	[@flash_message /]
	
	// 地区选择
	$areaId.lSelect({
		url: "${base}/common/area.jhtml"
	});
	
	$.validator.addMethod("requiredOne", 
		function(value, element, param) {
			return $.trim(value) != "" || $.trim($(param).val()) != "";
		},
		"${message("shop.member.receiver.requiredOne")}"
	);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			consignee: "required",
			areaId: "required",
			address: "required",
			zipCode: {
				required: true,
				pattern: /^\d{6}$/
			},
			phone: {
				required: true,
				pattern: /^\d{3,4}-?\d{7,9}$/
			}
		}
	});

});
</script>
</head>
<body>
	[#assign current = "receiverList" /]
	[#include "/shop/${theme}/include/header.ftl" /]
	<div class="container member">
		<div class="row">
			[#include "/shop/${theme}/member/include/navigation.ftl" /]
			<div class="span10">
				<div class="input">
					<div class="title">${message("shop.member.receiver.edit")}</div>
					<form id="inputForm" action="update.jhtml" method="post">
						<input type="hidden" name="id" value="${receiver.id}" />
						<table class="input">
							<tr>
								<th>
									${message("Receiver.consignee")}:
								</th>
								<td>
									<input type="text" name="consignee" class="text" value="${receiver.consignee}" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.area")}:
								</th>
								<td>
									<span class="fieldSet">
										<input type="hidden" id="areaId" name="areaId" value="${(receiver.area.id)!}" treePath="${(receiver.area.treePath)!}" />
									</span>
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.address")}:
								</th>
								<td>
									<input type="text" name="address" class="text" value="${receiver.address}" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.zipCode")}:
								</th>
								<td>
									<input type="text" name="zipCode" class="text" value="${receiver.zipCode}" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.phone")}:
								</th>
								<td>
									<input type="text" name="phone" class="text" value="${receiver.phone}" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.isDefault")}:
								</th>
								<td>
									<input type="checkbox" name="isDefault" value="true"[#if receiver.isDefault] checked="checked"[/#if] />
									<input type="hidden" name="_isDefault" value="false" />
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="button" value="${message("shop.member.submit")}" />
									<input type="button" class="button" value="${message("shop.member.back")}" onclick="history.back(); return false;" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	[#include "/shop/${theme}/include/footer.ftl" /]
</body>
</html>
[/#escape]