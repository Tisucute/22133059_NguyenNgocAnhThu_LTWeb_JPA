<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.javaweb.controllers.LoginController"%>
<%
String username = "";
Cookie[] cookies = request.getCookies();
Boolean remember = (Boolean) request.getAttribute("remember");
if ((remember != null && remember == false)) {
	return;
} else if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("username")) {
	username = cookie.getValue();
	break;
		}
	}
}
%>
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            <h1>Login</h1>
            <div class="content-form-page">
              <div class="row">
                <div class="col-md-7 col-sm-7">
                  <form class="form-horizontal form-without-legend" role="form" action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group">
                    	<c:if test="${alert != null}">
						<h6 class="alert alert-danger">${alert}</h6>
					</c:if>
                      <label for="username" class="col-lg-4 control-label" >Username <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="text" class="form-control" id="username" name = "username" value="<%=username%>">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="password" class="col-lg-4 control-label" >Password <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="password" class="form-control" id="password" name = "password">
                      </div>
                    </div>
                    <div class="row">
							<!-- Checkbox -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="on"
									id="remember" name="remember"
									<%=(username != null && !username.isEmpty()) ? "checked" : ""%> />
								<label class="form-check-label" for="remember"> Remember
									me </label>
							</div>
						<div class="col">
							<!-- Simple link -->
							<a href="${pageContext.request.contextPath}/forgot-password">Forgot
								password?</a>
						</div>
					</div>
                    </div>
                    <div class="row">
                      <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
                        <button type="submit" class="btn btn-primary">Login</button>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-10 padding-right-30">
                        <hr>
                        <div class="login-socio">
                            <p class="text-muted">or login using:</p>
                            <ul class="social-icons">
                                <li><a href="#" data-original-title="facebook" class="facebook" title="facebook"></a></li>
                                <li><a href="#" data-original-title="Twitter" class="twitter" title="Twitter"></a></li>
                                <li><a href="#" data-original-title="Google Plus" class="googleplus" title="Google Plus"></a></li>
                                <li><a href="#" data-original-title="Linkedin" class="linkedin" title="LinkedIn"></a></li>
                            </ul>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="col-md-4 col-sm-4 pull-right">
                  <div class="form-info">
                    <h2><em>Important</em> Information</h2>
                    <p>Duis autem vel eum iriure at dolor vulputate velit esse vel molestie at dolore.</p>

                    <button type="button" class="btn btn-default">More details</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
 </html>