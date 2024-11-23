<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor List</title>
<link href="<c:url value="/styles/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/styles/main.css" />" rel="stylesheet">
</head>
<body>

	<div class="container" style="max-width: 800px">
		<h1>Doctor List</h1>

		<!-- Nút Add để mở form đăng ký bác sĩ -->
		<button onclick="window.location.href='<c:url value="/doctors/register"/>'" class="btn btn-primary">Add Doctor</button>

		<!-- Bảng hiển thị danh sách bác sĩ -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Full Name</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Date of Birth</th>
					<th>Experience Years</th>
					<th>Note</th>
					<th>Registration Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="doctor" items="${doctors}">
					<tr>
						<td>${doctor.id}</td>
						<td>${doctor.fullName}</td>
						<td>${doctor.emailAddress}</td>
						<td>${doctor.gender}</td>
						<td>${doctor.dob}</td>
						<td>${doctor.experienceYears}</td>
						<td>${doctor.note}</td>
						<td>${doctor.regDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
