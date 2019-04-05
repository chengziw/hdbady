<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Dear宝贝-幼教云管理平台</title>
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/icon.css">

    <script type="text/javascript" src="js/easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/jquery.easyui.min.js"></script>    
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>

    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
    <title>无标题文档</title>
            <style type="text/css">
            table.gridtable {
                font-family: verdana,arial,sans-serif;
                font-size:11px;
                color:#333333;
                border-width: 1px;
                border-color: #666666;
                border-collapse: collapse;
            }
            table.gridtable th {
                border-width: 1px;
                padding:10px;
                border-style: solid;
                border-color: #666666;
                background-color: #dedede;
            }
            table.gridtable td {
                border-width: 1px;
                padding:10px;
                border-style: solid;
                border-color: #666666;
                background-color: #ffffff;
            }
        </style>
    </head>
<body>
<table class="gridtable">
            <tr>
            <td></td>
            <td>任课老师</td>
                            <td>语言</td>
                            <td>社会</td>
                            <td>健康</td>
                            <td>计算</td>
                            <td>科学</td>
                            <td>音乐</td>
                            <td>美术</td>
                        <td>总计</td>
        </tr>
                            <tr>
                <td>1</td>
                <td>曾文尝</td>
                                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                <td>2</td>
                            </tr>
                    <tr>
                <td>2</td>
                <td>唐国辉</td>
                                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                <td>3</td>
                            </tr>
                    <tr>
                <td>3</td>
                <td>李德胜</td>
                                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>2</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                <td>4</td>
                            </tr>
                    <tr>
                <td>4</td>
                <td>陈震</td>
                                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>4</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                <td>7</td>
                            </tr>
                    <tr>
                <td>5</td>
                <td>方老师</td>
                                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                <td>2</td>
                            </tr>
                    <tr>
                <td>6</td>
                <td>陈子源</td>
                                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>3</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                <td>6</td>
                            </tr>
                    <tr>
                <td>7</td>
                <td>马燕红</td>
                                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>2</td>
                                                        <td>0</td>
                                                        <td>2</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                <td>4</td>
                            </tr>
                    <tr>
                <td>8</td>
                <td>唐华林</td>
                                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                <td>1</td>
                            </tr>
                    <tr>
                <td>9</td>
                <td>唐勇辉</td>
                                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                <td>1</td>
                            </tr>
                    <tr>
                <td>10</td>
                <td>龙邵华</td>
                                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>1</td>
                                <td>1</td>
                            </tr>
                    <tr>
                <td>11</td>
                <td>马山新</td>
                                                                        <td>0</td>
                                                        <td>1</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                                        <td>0</td>
                                <td>1</td>
                            </tr>
                <tr>
            <td>12</td>
            <td>总计</td>
                                                        <td>2</td>
                                            <td>4</td>
                                            <td>5</td>
                                            <td>4</td>
                                            <td>13</td>
                                            <td>1</td>
                                            <td>3</td>
                        <td>32</td>
        </tr>
    </table>
</body>
</html>