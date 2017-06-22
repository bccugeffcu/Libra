[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${message("admin.promotion.add")} - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/webuploader.js"></script>
<script type="text/javascript" src="${base}/resources/admin/ueditor/ueditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<style type="text/css">
.memberRank label, .coupon label {
	min-width: 120px;
	_width: 120px;
	display: block;
	float: left;
	padding-right: 4px;
	_white-space: nowrap;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $filePicker = $("#filePicker");
	var $giftSelect = $("#giftSelect");
	var $giftTable = $("#giftTable");
	var $giftTitle = $("#giftTable tr:first");
	var $introduction = $("#introduction");
	
	[@flash_message /]
	
	$filePicker.uploader();
	
	$introduction.editor();
	
	// 赠品选择
	$giftSelect.autocomplete("gift_select.jhtml", {
		dataType: "json",
		extraParams: {
			excludeIds: function() {
				return $giftTable.find("input:hidden").map(function() {
					return $(this).val();
				}).get();
			}
		},
		cacheLength: 0,
		max: 20,
		width: 218,
		scrollHeight: 300,
		parse: function(data) {
			return $.map(data, function(item) {
				return {
					data: item,
					value: item.name
				}
			});
		},
		formatItem: function(item) {
			return '<span title="' + escapeHtml(item.name) + '">' + escapeHtml(abbreviate(item.name, 50, "...")) + '<\/span>' + (item.specifications.length > 0 ? ' <span class="silver">[' + escapeHtml(item.specifications.join(", ")) + ']<\/span>' : '');
		}
	}).result(function(event, item) {
		var $giftTr = (
			[@compress single_line = true]
				'<tr>
					<td>
						<input type="hidden" name="giftIds" value="' + item.id + '" \/>
						' + item.sn + '
					<\/td>
					<td>
						<span title="' + escapeHtml(item.name) + '">' + escapeHtml(abbreviate(item.name, 50, "...")) + '<\/span>' + (item.specifications.length > 0 ? ' <span class="silver">[' + escapeHtml(item.specifications.join(", ")) + ']<\/span>' : '') + '
					<\/td>
					<td>
						<a href="' + escapeHtml(item.url) + '" target="_blank">[${message("admin.common.view")}]<\/a>
						<a href="javascript:;" class="remove">[${message("admin.common.remove")}]<\/a>
					<\/td>
				<\/tr>'
			[/@compress]
		);
		$giftTitle.show();
		$giftTable.append($giftTr);
	});
	
	// 删除赠品
	$giftTable.on("click", "a.remove", function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.dialog.deleteConfirm")}",
			onOk: function() {
				$this.closest("tr").remove();
				if ($giftTable.find("tr").size() <= 1) {
					$giftTitle.hide();
				}
				$giftSelect.val("");
			}
		});
	});
	
	$.validator.addMethod("compare", 
		function(value, element, param) {
			var parameterValue = $(param).val();
			if ($.trim(parameterValue) == "" || $.trim(value) == "") {
				return true;
			}
			try {
				return parseFloat(parameterValue) <= parseFloat(value);
			} catch(e) {
				return false;
			}
		},
		"${message("admin.promotion.compare")}"
	);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			title: "required",
			image: {
				pattern: /^(http:\/\/|https:\/\/|\/).*$/i
			},
			minimumPrice: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				}
			},
			maximumPrice: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				},
				compare: "#minimumPrice"
			},
			minimumQuantity: "digits",
			maximumQuantity: {
				digits: true,
				compare: "#minimumQuantity"
			},
			priceExpression: {
				remote: {
					url: "check_price_expression.jhtml",
					cache: false
				}
			},
			pointExpression: {
				remote: {
					url: "check_point_expression.jhtml",
					cache: false
				}
			},
			order: "digits"
		}
	});

});
</script>
</head>
<body>
	<div class="breadcrumb">
		<a href="${base}/admin/common/index.jhtml">${message("admin.breadcrumb.home")}</a> &raquo; ${message("admin.promotion.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.promotion.base")}" />
			</li>
			<li>
				<input type="button" value="${message("Promotion.introduction")}" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Promotion.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Promotion.title")}:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.image")}:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" name="image" class="text" maxlength="200" />
						<a href="javascript:;" id="filePicker" class="button">${message("admin.upload.filePicker")}</a>
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.beginDate")}:
				</th>
				<td>
					<input type="text" id="beginDate" name="beginDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.endDate")}:
				</th>
				<td>
					<input type="text" id="endDate" name="endDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.minimumPrice")}:
				</th>
				<td>
					<input type="text" id="minimumPrice" name="minimumPrice" class="text" maxlength="16" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.maximumPrice")}:
				</th>
				<td>
					<input type="text" name="maximumPrice" class="text" maxlength="16" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.minimumQuantity")}:
				</th>
				<td>
					<input type="text" id="minimumQuantity" name="minimumQuantity" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.maximumQuantity")}:
				</th>
				<td>
					<input type="text" name="maximumQuantity" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.priceExpression")}:
				</th>
				<td>
					<input type="text" name="priceExpression" class="text" maxlength="255" title="${message("admin.promotion.priceExpressionTitle")}" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.pointExpression")}:
				</th>
				<td>
					<input type="text" name="pointExpression" class="text" maxlength="255" title="${message("admin.promotion.pointExpressionTitle")}" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="order" class="text" maxlength="9" />
				</td>
			</tr>
			<tr class="memberRank">
				<th>
					${message("Promotion.memberRanks")}
				</th>
				<td>
					[#list memberRanks as memberRank]
						<label>
							<input type="checkbox" name="memberRankIds" value="${memberRank.id}" />${memberRank.name}
						</label>
					[/#list]
				</td>
			</tr>
			<tr class="coupon">
				<th>
					${message("Promotion.coupons")}
				</th>
				<td>
					[#list coupons as coupon]
						<label>
							<input type="checkbox" name="couponIds" value="${coupon.id}" />${coupon.name}
						</label>
					[/#list]
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isFreeShipping" value="true" />${message("Promotion.isFreeShipping")}
						<input type="hidden" name="_isFreeShipping" value="false" />
					</label>
					<label>
						<input type="checkbox" name="isCouponAllowed" value="true" checked="checked" />${message("Promotion.isCouponAllowed")}
						<input type="hidden" name="_isCouponAllowed" value="false" />
					</label>
				</td>
			</tr>
			<tr>
				<th>
					${message("Promotion.gifts")}:
				</th>
				<td>
					<input type="text" id="giftSelect" name="giftSelect" class="text" maxlength="200" title="${message("admin.promotion.giftSelectTitle")}" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<table id="giftTable" class="item">
						<tr class="hidden">
							<th>
								${message("Product.sn")}
							</th>
							<th>
								${message("Product.name")}
							</th>
							<th>
								${message("admin.common.action")}
							</th>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<td>
					<textarea id="introduction" name="introduction" class="editor" style="width: 100%;"></textarea>
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="history.back(); return false;" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
[/#escape]