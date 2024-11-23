<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Doctor</title>
<link href="<c:url value="/styles/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/styles/main.css" />" rel="stylesheet">
</head>
<body>

	<div class="container" style="max-width: 600px">
		<span>${error}</span>
		<form:form role="form" action="${pageContext.request.contextPath}/doctors/save" method="post" modelAttribute="doctor" class="needs-validation">
			
			<h2>
			<c:if test="${doctor == null}">
				Register Doctor
			</c:if>
			<c:if test="${doctor != null}">
				Update Doctor
			</c:if>
			</h2>

			<div class="mb-3 row align-items-center">
				<form:label path="fullName" cssClass="col-sm-3 control-label">Full Name *</form:label>
				<div class="col-sm-9">
					<form:input path="fullName" placeholder="Full Name" cssClass="form-control" />
					<form:errors path="fullName" cssClass="error"/>
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<form:label path="emailAddress" cssClass="col-sm-3 control-label">Email *</form:label>
				<div class="col-sm-9">
					<form:input type="email" path="emailAddress" placeholder="Email" cssClass="form-control" />
					<form:errors path="emailAddress" cssClass="error"/>
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<form:label path="gender" class="control-label col-sm-3">Gender *</form:label>
				<div class="col-sm-9">
					<div class="form-check form-check-inline">
						<form:radiobutton cssClass="form-check-input" path="gender" id="male" value="Male" label="Male"/> 
						<form:radiobutton cssClass="form-check-input" path="gender" id="female" value="Female" label="Female"/> 
					</div>
					<form:errors path="gender" cssClass="error"/>
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<form:label path="dob" class="col-sm-3 control-label">Date of Birth *</form:label>
				<div class="col-sm-9">
					<form:input type="date" path="dob" cssClass="form-control" />
					<form:errors path="dob" cssClass="error"/>
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<form:label path="experienceYears" cssClass="col-sm-3 control-label">Experience Years *</form:label>
				<div class="col-sm-9">
					<form:input type="number" path="experienceYears" placeholder="Experience Years" cssClass="form-control" />
					<form:errors path="experienceYears" cssClass="error"/>
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<form:label path="note" cssClass="col-sm-3 control-label">Note</form:label>
				<div class="col-sm-9">
					<form:textarea path="note" placeholder="Note" cssClass="form-control" maxlength="255" />
					<form:errors path="note" cssClass="error"/>
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<form:label path="regDate" class="col-sm-3 control-label">Registration Date *</form:label>
				<div class="col-sm-9">
					<form:input type="date" path="regDate" cssClass="form-control" />
					<form:errors path="regDate" cssClass="error"/>
				</div>
			</div>

			<div class="mb-3 row">
				<div class="col-sm-3"></div>
				<div class="col-sm-9">
					<a href="<c:url value="/doctors" /> " class="btn btn-secondary"> Back</a>
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>
