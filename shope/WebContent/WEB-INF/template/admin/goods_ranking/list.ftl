[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${message("admin.goodsRanking.list")} - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<style type="text/css">
.chart {
	height: ${page.content?size * 30 + 120}px;
	padding: 0px 10px;
	border-top: 1px solid #d7e8f1;
	border-bottom: 1px solid #d7e8f1;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $rankingType = $("#rankingType");
	var $rankingTypeMenu = $("#rankingTypeMenu");
	var $rankingTypeMenuItem = $("#rankingTypeMenu li");
	
	[@flash_message /]
	
	// 排名类型
	$rankingTypeMenu.hover(
		function() {
			$(this).children("ul").show();
		}, function() {
			$(this).children("ul").hide();
		}
	);
	
	// 排名类型
	$rankingTypeMenuItem.click(function() {
		var $this = $(this);
		if ($this.hasClass("checked")) {
			$rankingType.val("");
		} else {
			$rankingType.val($this.attr("val"));
		}
		$listForm.submit();
	});

});
</script>
</head>
<body>
	<div class="breadcrumb">
		<a href="${base}/admin/common/index.jhtml">${message("admin.breadcrumb.home")}</a> &raquo; ${message("admin.goodsRanking.list")}
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="rankingType" name="rankingType" value="${rankingType}" />
		<div class="bar">
			<div class="buttonGroup">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div id="rankingTypeMenu" class="dropdownMenu">
					<a href="javascript:;" class="button">
						${message("admin.goodsRanking.type")}<span class="arrow">&nbsp;</span>
					</a>
					<ul class="check">
						[#list rankingTypes as value]
							<li[#if value == rankingType] class="checked"[/#if] val="${value}">${message("Goods.RankingType." + value)}</li>
						[/#list]
					</ul>
				</div>
				<div id="pageSizeMenu" class="dropdownMenu">
					<a href="javascript:;" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<ul>
						<li[#if page.pageSize == 10] class="current"[/#if] val="10">10</li>
						<li[#if page.pageSize == 20] class="current"[/#if] val="20">20</li>
						<li[#if page.pageSize == 50] class="current"[/#if] val="50">50</li>
						<li[#if page.pageSize == 100] class="current"[/#if] val="100">100</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="chart" class="chart"></div>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
	[#if page.content?has_content]
		<script type="text/javascript" src="${base}/resources/admin/js/echarts.js"></script>
		<script type="text/javascript">
			var chart = echarts.init(document.getElementById("chart"));
			
			chart.setOption({
				tooltip: {
					trigger: "axis",
					formatter: function(params) {
						return params[0][1].name + " [" + params[0][1].sn + "]<br \/>" + params[0][0] + ": " + params[0][2];
					}
				},
				xAxis: [
					{
						type: "value"
					}
				],
				yAxis: [
					{
						type: "category",
						data: [
							[#list page.content?reverse as goods]
								{
									sn: "${goods.sn}",
									name: "[#noescape]${goods.name?js_string}[/#noescape]"
								}
								[#if goods_has_next],[/#if]
							[/#list]
						],
						axisLabel: {
							formatter: function(value) {
								return abbreviate(value.name, 12);
							}
						}
					}
				],
				series: [
					{
						name: "${message("Goods.RankingType." + rankingType)}",
						type: "bar",
						data: [
							[#list page.content?reverse as goods]
								[#if rankingType == "score"]
									${goods.score}
								[#elseif rankingType == "scoreCount"]
									${goods.scoreCount}
								[#elseif rankingType == "weekHits"]
									${goods.weekHits}
								[#elseif rankingType == "monthHits"]
									${goods.monthHits}
								[#elseif rankingType == "hits"]
									${goods.hits}
								[#elseif rankingType == "weekSales"]
									${goods.weekSales}
								[#elseif rankingType == "monthSales"]
									${goods.monthSales}
								[#elseif rankingType == "sales"]
									${goods.sales}
								[/#if]
								[#if goods_has_next],[/#if]
							[/#list]
						]
					}
				]
			});
		</script>
	[/#if]
</body>
</html>
[/#escape]