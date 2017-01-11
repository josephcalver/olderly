<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="assignments">
		<tr>
			<td>Date</td>
			<td>Time</td>
			<td>Duration</td>
			<td>Description</td>
			<td></td>
		</tr>

		<c:forEach var="assignment" items="${myAssignments}">
			<tr>
				<td><c:out value="${assignment.date}"></c:out></td>
				<td><c:out value="${assignment.time}"></c:out></td>
				<td><c:out value="${assignment.duration}"></c:out></td>
				<td><c:out value="${assignment.description}"></c:out></td>
				<td><sec:authorize access="hasRole('ROLE_USER')">
						<c:url var="cancelUrl" value="/cancel" />
						<sf:form action="${cancelUrl}" method="post">
							<input type="submit" value="Cancel Assignment" />
							<input type="hidden" name="id" value="${assignment.id}" />
						</sf:form>
					</sec:authorize></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>