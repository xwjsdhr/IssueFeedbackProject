<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问题详情</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/issue_detail.css" rel="stylesheet">
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
      rel="stylesheet"/>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/Index">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.request.contextPath }/Index">
						<i class="ion-home"></i>
						首页 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="ion-help-circled"></i> 问题管理 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="nav-link" href="${pageContext.request.contextPath }/NewIssue">
							<i class="ion-plus"></i>
							添加问题</a>
							<c:if test="${user_session.dept.id == 4 }">
								<a class="nav-link" href="${pageContext.request.contextPath }/TrashBin">
								<i class="ion-trash-a"></i>
								回收站</a>
							</c:if>
						</div></li>

					<c:if test="${user_session.dept.id == 4 }">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/DeptManagement">
							<i class="ion-ios-people"></i>
							部门管理</a></li>
					</c:if>

				</ul>
				<div class="btn-group " role="group">
					<a class="btn btn-link" href="${pageContext.request.contextPath }/UserInfo">
					<i class="ion-person"></i>
					${user_session.realName}</a>
					<a class="nav-link" href="${pageContext.request.contextPath }/Logout">退出
					<i class="ion-log-out"></i>
					</a>
				</div>
			</div>
		</nav>

		<div class="card" style="margin-top: 20px">
			<div class="card-header">${issue_detail.title }
				<c:choose>
					<c:when test="${issue_detail.status.id == 1 }">
						<span class="badge badge-pill badge-danger">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 2 }">
						<span class="badge badge-pill badge-warning">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 3 }">
						<span class="badge badge-pill badge-success">${issue_detail.status.statusName }</span>
					</c:when>
				</c:choose>
			</div>
			<div class="card-body">

				<p class="card-text">${issue_detail.content }</p>
			</div>
			<div class="list-group list-group-flush">

				<c:forEach items="${comments }" var="comment">

					<div class="media list-group-item">
						<p class="pull-right">
							<small>${comment.createTime }</small>
						</p>
						<c:if test="${comment.isResovleIssue == 1 }">
							<span class="badge badge-pill badge-success">已解决</span>
						</c:if>
						
						<div class="media-body">
							<p class=" user_name">${comment.user.realName }</p>
							${comment.content }
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="${pageContext.request.contextPath }/AddComment" method="get">
						<input type="hidden" name="issue_id" value="${issue_detail.id }" />
						<input type="hidden" name="user_id" value="${user_session.id }" />
						<label style="margin-top: 20px" for="textareaIssueContent">回复描述</label>
						<textarea name="comment" class="form-control"
							id="textareaIssueContent" rows="3"></textarea>
						<div class="form-check">
							<label style="margin-top: 20px" class="form-check-label"
								for="checkboxResovled"> <input type="checkbox"
								class="form-check-input" id="checkboxResovled" name="is_resovled" />
								 标记为已解决
							</label>
						</div>


						<input style="margin-top: 20px" class="btn btn-primary"
							type="submit" value="回复">
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>