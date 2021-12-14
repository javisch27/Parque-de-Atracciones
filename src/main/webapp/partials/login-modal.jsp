<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/assets/css/login-modal.css"
	rel="stylesheet" />

	
<div class="modal fade" id="guestModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="login" method="post">
                	 
                    <div class="mb-3">
                        <label class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Usuario" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" />
                    </div>
<!--                     <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe" />
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div> -->
                    <div class="modal-footer d-block">
                     <!--    <p class="float-start">Not yet account <a href="#">Sign Up</a></p> -->
                        <button type="submit" class="btn btn-secondary float-end">Ingresar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>