
<%--
  User: Lexel PRO
  Date: 1/27/2015
  Time: 9:52 PM
  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Main Page</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    
    <!-- datatable -->
    <link href="<c:url value="/resources/css/datatable.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/datatable.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/datatable-bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/datatable-bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery.dataTables.min.css" />" rel="stylesheet">
    
    <style type="text/css">
      
 /*Generic*/
 .wrapper{
  margin: 60px auto;
  text-align: center;
}
h1{
  margin-bottom: 1.25em;
}

.panel-success{
	padding: 5px;
	margin: 10px;
}

	/* table {
	  display: inline-block;
	  border: 1px solid #373737;
	  margin-bottom: 20px;
	  text-align: center;
	 } */
	
	th {
	  font-family: 'Lucida Grande', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	  padding: 10px;
	  background: #a09a9c;
	  color: #fff;
	 }
	
	td {
	  padding: 10px;
	  border: 1px solid #373737;
	 }
	
	form {
	  background: #f2f2f2;
	  padding: 20px;
	}
	
	/* for hide search... */
	/* .datatable-filter-line{
		display:none;
	}
 */

div.container {
        width: 80%;
    }
    
    .pagination li.active a{
    	color: #fff;
    }
    </style>
    
</head>
<body>
	<div class="container">
	    <div class="panel panel-success">
	        <div class="panel-heading">
	            <h3 class="panel-title">
	                <div align="left"><b>Welcome to My Bullentin Board</b> </div>
	            </h3>
	        </div>
	    </div>
    
  		<div id="styleInTable">
	  		<div class="row">
	  			<div align="right"><a href="newContent" class="btn btn-primary" style="margin-right:10px;margin-bottom:-15px; " >Add New</a></div>
	  		</div>
	  		
	  		

	    	<c:if test="${empty listContent}">
	                There are no Content
	            </c:if>
	            <c:if test="${not empty listContent}">     	
	            	            	
	            	            	
	            	
						<strong>
						    <div id="total">Total</div>
						</strong>
			            	 <!-- test datatable -->
	            	 
	            	 <table class="display" cellspacing="0" width="100%"  id="contentTable">
	                    <thead style="background-color: #bce8f1;">
	                    <tr>
	                        <th>No</th>
	                        <th>Title</th>
	                        <th>Writer</th>
	                        <th>Create date</th>
	                    </tr>
	                    </thead>
	                    <tbody>
	                    <c:forEach items="${listContent}" var="content">
	                        <tr>
	                        	<th id="id"><c:out value="${content.id}"/></th>
	                        	<th><a href="showContent?id=<c:out value='${content.id}'/>"><c:out value="${content.title}"/></a></th>
	                        	<th><c:out value="${content.writer}"/></th>
	                        	<th id="txtDate"><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${content.create_dt}" /></th>
	                        	<%-- <th><a href="deleteContent?id=<c:out value='${content.id}'/>">Delete</a></th>  --%>                        	
	                        </tr>
	                    </c:forEach>
	                    </tbody>
	                </table>
	                <div class="row">
	                	<div class="col-md-2"><strong>Pages <span id="currentPage"></span >/<span id="totalPage"></span></strong></div>
	                	<div class="paging col-md-6" ></div>
	                </div>
	                
	            	 
	            </c:if>
    	</div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>    
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/datatable.jquery.min.js"/>"></script> 
	<script src="<c:url value="/resources/js/datatable.min.js"/>"></script>
	<script src="<c:url value="/resources/js/datatable.js"/>"></script>
	
	<script type="text/javascript">
	$( document ).ready(function() {
		
	   // get total records
	   var rowCount = $('#contentTable >tbody >tr').length;
	   $('div#total').text("Total: " + rowCount);
	   
	   // get current page / total pages
	   var currentPage = 1;
	   var totalItems = rowCount;
       var itemsPerPage = 10;
	   var totalPages = Math.ceil(totalItems / itemsPerPage);
	   
	   $('div span#currentPage').text(currentPage);
	   $('div span#totalPage').text(totalPages);
	  
	   var oTable = $('#contentTable').datatable({
			"sPaginationType": "extStyleLF",
			"bAutoWidth": false,
			"fnDrawCallback": function () {
				var length =  this.fnGetData().length;
				if (length <= recordsPerPage) {
					$(this).parent().children(".dataTables_paginate").hide();
				}
				$(this).parent().find(".dataTables_paginate .navigationLabel .pageIndex")
						.text(" " + this.fnPagingInfo().iPage + " ");  
				$(this).parent().find(".dataTables_paginate .navigationLabel .totalPages")
						.text(this.fnPagingInfo().iTotalPages);
			},
			"sDom" : '<"clear">ilprtp'
		});
	  
	  $('#contentTable').datatable({
		    onChange: function(old_page, new_page){
		    		  $('div span#currentPage').text(new_page);
		    },
		    
	 });
	 
	});   
	
	</script>
    
</body>
</html>