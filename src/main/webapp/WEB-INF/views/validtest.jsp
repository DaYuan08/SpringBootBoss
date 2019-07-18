<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" isELIgnored="false" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加</title>
</head>
<body>
<form:form modelAttribute="account" enctype="multipart/form-data" method="POST" action="/valid/test">
    <div>
        <input type="file" name="headerImg" accept="image/jpeg, image/jpg, image/png" />
    </div>
    <div>
        <form:input path="name" placeholder="用户名"/>
        <form:errors path="name" />
    </div>
    <div>
        <form:select path="nativePlace">
            <form:option value="0" >请选择户籍所在地</form:option>
            <form:option value="1" >北京市</form:option>
            <form:option value="2" >上海市</form:option>
            <form:option value="3" >重庆市</form:option>
            <form:option value="4" >天津市</form:option>
            <form:option value="5" >香港</form:option>
            <form:option value="6" >澳门</form:option>
            <form:option value="7" >河北省</form:option>
            <form:option value="8" >山西省</form:option>
            <form:option value="9" >辽宁省</form:option>
            <form:option value="10" >吉林省</form:option>
            <form:option value="11" >黑龙江省</form:option>
            <form:option value="12" >江苏省</form:option>
            <form:option value="13" >浙江省</form:option>
            <form:option value="14" >安徽省</form:option>
            <form:option value="15" >福建省</form:option>
            <form:option value="16" >江西省</form:option>
            <form:option value="17" >山东省</form:option>
            <form:option value="18" >河南省</form:option>
            <form:option value="19" >湖北省</form:option>
            <form:option value="20" >湖南省</form:option>
            <form:option value="21" >广东省</form:option>
            <form:option value="22" >海南省</form:option>
            <form:option value="23" >四川省</form:option>
            <form:option value="24" >贵州省</form:option>
            <form:option value="25" >云南省</form:option>
            <form:option value="26" >陕西省</form:option>
            <form:option value="27" >甘肃省</form:option>
            <form:option value="28" >青海省</form:option>
            <form:option value="29" >台湾省</form:option>
            <form:option value="30" >广西壮族自治区</form:option>
            <form:option value="31" >宁夏回族自治区</form:option>
            <form:option value="32" >内蒙古自治区</form:option>
            <form:option value="33" >新疆维吾尔自治区</form:option>
            <form:option value="34" >西藏自治区</form:option>
        </form:select>
    </div>
    <div>
        <form:input path="age" type="number" placeholder="年龄"/>
        <form:errors path="age" />
    </div>
    <div>
        <form:select path="sex">
            <form:option value="1">男</form:option>
            <form:option value="2">女</form:option>
        </form:select>
    </div>
    <div>
        <form:input path="birthDay" placeholder="生日"/>
        <form:errors path="birthDay" />
    </div>
    <div class="row">
        <input type="checkbox" name="hobby" value="篮球">篮球
        <input type="checkbox" name="hobby" value="足球">足球
        <input type="checkbox" name="hobby" value="羽毛球">羽毛球
        <input type="checkbox" name="hobby" value="乒乓球">乒乓球
    </div>
    <input type="submit">
    <input type="reset">
</form:form>
</body>
</html>