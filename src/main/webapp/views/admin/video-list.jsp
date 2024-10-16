<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Video List</title>
</head>
<body>
<h2>Video List</h2>
<a href="${pageContext.request.contextPath}/admin/video/add">Add New Video</a>
<table border="1">
    <tr>
        <th>Video ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Category</th>
        <th>Views</th>
        <th>Poster</th> <!-- Thêm cột Poster -->
        <th>Active</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="video" items="${listVideos}">
        <tr>
            <td>${video.videoId}</td>
            <td>${video.title}</td>
            <td>${video.description}</td>
            <td>${video.category.categoryName}</td>
            <td>${video.views}</td>
            <td>
                <!-- Kiểm tra và hiển thị poster -->
                 <c:choose>
            <c:when test="${not empty video and not empty video.poster and video.poster.substring(0,5) == 'https'}">
                <c:url value="${cate.image}" var="imgUrl"></c:url>
            </c:when>
            <c:when test="${not empty video and not empty video.poster and video.poster.substring(0,5) != 'https'}">
                <c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
            </c:when>
            <c:otherwise>
                <c:url value="/image?fname=default_image.jpg" var="imgUrl"></c:url> <!-- Default image if null -->
            </c:otherwise>
        </c:choose>
             <img height="150" width="200" src="${imgUrl}" />
             </td>
             
             
             <td>
                <c:choose>
                    <c:when test="${video.active == 1}">Hoạt động</c:when>
                    <c:otherwise>Khóa</c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/video/edit?id=${video.videoId}">Edit</a>
                <a href="${pageContext.request.contextPath}/admin/video/delete?id=${video.videoId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>