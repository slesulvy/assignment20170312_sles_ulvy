<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>

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
	.row{
		margin-left: 30px;
		margin-right: 10px;
	}
</style>

</head>
<body>
    <div align="left" class="container">
        <div class="panel panel-success">
	        <div class="panel-heading">
	            <h3 class="panel-title">
	                <div align="left"><b>Details</b></div>
	            </h3>
	        </div>
	    </div>
        <form:form action="saveContent" method="post" modelAttribute="content" style="margin-top: 50px;">
		  
		  <div class="row" style="margin-left:30px;">
		  		<div class="row">
		  			<div class="col-md-2">
				    <label>Title</label>
				</div>
				<div class="col-md-10">
					<c:out value="${content.title}"/>
				</div>
		  		</div>
	    		
				<div class="row">
		  			<div class="col-md-2">
				    	<label>Writer</label>
					</div>
					<div class="col-md-10">
						<c:out value="${content.writer}"/>
					</div>
		  		</div>
		  		<div class="row">
		  			<div class="col-md-2">
				    	<label>Content</label>
					</div>
					<div class="col-md-10">
						<c:out value="${content.content}"/>
					</div>
		  		</div>
		  		
		  		<div class="row">
		  			<div class="col-md-2">
					</div>
				 	<div class="col-md-3" style="margin-top:50px;">
				 		<a class="btn btn-info" href="<c:url value="/"/> ">Go Back</a>
					</div>
					<div class="col-md-0" style="margin-top:50px;">
					<input type="hidden" id="contentId" value="<c:out value='${content.id}'/>">
				 		<a style="background-color: red;" id="btnDelete" class="btn btn-primary">Delete</a>
					</div>
			    </div>
		  		
	      </div>
        </form:form>
    </div>
    
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script>
    $( document ).ready(function() {
    	$("#btnDelete").click(function(){
    		var isDelete = confirm("Are you sure you want to delete?");
    		if( isDelete ){
    			window.location.href = 'deleteContent?id='+ $("#contentId").val();	
    		}
    	});
	});
    </script>
</body>
</html>
  