<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New</title>

<!-- Bootstrap CSS -->
<%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>

<style>
	.myBtn{
    	background-color: #f4ad42; 
    	color: #fff; margin: 0px; 
    	padding:5px 5px 0px 5px;
    }
    .panel-success{
		padding: 5px;
		margin: 10px;
	}
</style>

</head>
<body>
    <div align="left" class="container">
        <div class="panel panel-success">
	        <div class="panel-heading">
	            <h3 class="panel-title">
	                <div align="left"><b>Register New</b> </div>
	            </h3>
	        </div>
	    </div>
        <form:form action="saveContent" method="post" modelAttribute="content" id="frmRegisterNew">
		  
		  <div class="row ">
	    		<div class="form-group">
				    <label for="title">Title</label>
				    <form:input path="title" class="form-control" id="title" maxlength="250"/>
				</div>
				  
				<div class="form-group">
				    <label for="writer">Writer</label>
				    <form:input path="writer" class="form-control" id="writer" maxlength="250"/>
				</div>
				  
				<div class="form-group">
				    <label for="content">Content</label>
				    <form:textarea path="content" class="form-control" rows="6" id="content"/>
				</div>
	      </div>
		  
		  <div class="row col-md-4 col-md-offset-4">
		  	<div class="form-group" >
		  		<a class="btn btn-info" href="<c:url value="/"/> ">Cancel</a>
			  	<button type="submit" name="submit" class="btn btn-primary">Create</button>
			</div>
		  </div>

        </form:form>
    </div>
    
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script>
    $( document ).ready(function() {
		$(function() {
			$("#frmRegisterNew").on("submit", function(e) {
				var title = $("#title").val();
				if (title != '') {
					if($("#writer").val() != ''){
						if($("#content").val() != ''){
							return true;
						}else {
							alert("Content is empty please input Content");
							$("#content").focus();
							return false;
						}
					} else{
						alert("Writer is empty please input Writer");
						$("#writer").focus();
						return false;
					}
				} else{
						alert("Title is empty please input Title");
						$("#title").focus();
						return false;
					}
				
				if($("#title").attr("maxlength") > 200){
					alert("title can not longer then 200 character");
					return false;
				}
			});
		});
			
	});
    </script>
</body>
</html>
  