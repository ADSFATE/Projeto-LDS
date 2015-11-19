<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Painel Principal</title>

<script src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
<script src="http://static.fusioncharts.com/code/latest/fusioncharts.charts.js"></script>

<script type="text/javascript">

FusionCharts.ready(function () {
	var d = new Date();
	var n = d.getFullYear();
    var revenueChart = new FusionCharts({
        type: 'column3d',
        renderAt: 'chart-container',
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "Total de Materiais Atribuidos",
                "subCaption": n,
                "xAxisName": "Materiais",
                "yAxisName": "Quantidade",
                "paletteColors": "#0075c2",
                "valueFontColor": "#ffffff",
                "baseFont": "Helvetica Neue,Arial",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "subcaptionFontBold": "0",
                "placeValuesInside": "1",
                "rotateValues": "1",
                "showShadow": "0",
                "divlineColor": "#999999",               
                "divLineIsDashed": "1",
                "divlineThickness": "1",
                "divLineDashLen": "1",
                "divLineGapLen": "1",
                "canvasBgColor": "#ffffff"
            },

            "data":<%out.print(request.getSession().getAttribute("total_mat_atr"));%>
        }
    });
    
    var revenueChart2 = new FusionCharts({
        type: 'column3d',
        renderAt: 'chart-container2',
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "Materiais Com Status (Atribuido)",
                "subCaption": n,
                "xAxisName": "Materiais",
                "yAxisName": "Quantidade",
                "paletteColors": "#0075c2",
                "valueFontColor": "#ffffff",
                "baseFont": "Helvetica Neue,Arial",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "subcaptionFontBold": "0",
                "placeValuesInside": "1",
                "rotateValues": "1",
                "showShadow": "0",
                "divlineColor": "#999999",               
                "divLineIsDashed": "1",
                "divlineThickness": "1",
                "divLineDashLen": "1",
                "divLineGapLen": "1",
                "canvasBgColor": "#ffffff"
            },

            "data":<%out.print(request.getSession().getAttribute("teste"));%>
        }
    });
    
    var revenueChart3 = new FusionCharts({
        type: 'column3d',
        renderAt: 'chart-container3',
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "Materiais Atribuidos",
                "subCaption": n,
                "xAxisName": "Materiais",
                "yAxisName": "Quantidade",
                "paletteColors": "#0075c2",
                "valueFontColor": "#ffffff",
                "baseFont": "Helvetica Neue,Arial",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "subcaptionFontBold": "0",
                "placeValuesInside": "1",
                "rotateValues": "1",
                "showShadow": "0",
                "divlineColor": "#999999",               
                "divLineIsDashed": "1",
                "divlineThickness": "1",
                "divLineDashLen": "1",
                "divLineGapLen": "1",
                "canvasBgColor": "#ffffff"
            },

            "data":<%out.print(request.getSession().getAttribute("teste"));%>
        }
    });
    
    var revenueChart4 = new FusionCharts({
        type: 'column3d',
        renderAt: 'chart-container4',
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "Materiais Atribuidos",
                "subCaption": n,
                "xAxisName": "Materiais",
                "yAxisName": "Quantidade",
                "paletteColors": "#0075c2",
                "valueFontColor": "#ffffff",
                "baseFont": "Helvetica Neue,Arial",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "subcaptionFontBold": "0",
                "placeValuesInside": "1",
                "rotateValues": "1",
                "showShadow": "0",
                "divlineColor": "#999999",               
                "divLineIsDashed": "1",
                "divlineThickness": "1",
                "divLineDashLen": "1",
                "divLineGapLen": "1",
                "canvasBgColor": "#ffffff"
            },

            "data":<%out.print(request.getSession().getAttribute("teste"));%>
        }
    });
    
    revenueChart.render();
    revenueChart2.render();
    revenueChart3.render();
    revenueChart4.render();
    
});

</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

</head>
<body>

<form name="formPainel">

<%@include file="supMenu.jsp"%>

		<div align="center" class="container">
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading"></div>
					<div class="panel-body"></div>

<table>

<tr align="center">
<td><div id="chart-container">Chart</div></td>
<td><div id="chart-container2">Chart</div></td>
</tr>

<tr align="center">
<td><div id="chart-container3">Chart</div></td>
<td><div id="chart-container4">Chart</div></td>
</tr>

</table>

</div>
</div>
</div>

<%@include file="footer.jsp"%>

</form>

</body>
</html>