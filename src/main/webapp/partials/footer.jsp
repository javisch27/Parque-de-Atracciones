<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<footer class="text-center  <c:choose><c:when test="${lado=='LADO OSCURO'}"> bg-dark  text-white-50 </c:when>
		<c:otherwise>bg-light  text-black-50 </c:otherwise></c:choose>">

  <div class="container p-4 pb-0">
    <section class="">
      <form action="">
        <!--Grid row-->
        <div class="row d-flex justify-content-center">
          <!--Grid column-->
          <div class="col-auto">
            <p class="pt-2">
              <strong>Inscribite para recibir las últimas noticias</strong>
            </p>
          </div>

          <div class="col-md-3 col-12">

            <div class="form-outline mb-4">
              <input type="email" id="form5Example27" class="form-control" placeholder= 'Email'/>
       
            </div>
          </div>

          <div class="col-auto">
    
            <button type="submit" class="btn btn-primary mb-4">
              Subscribir
            </button>
          </div>
   
        </div>
      
      </form>
    </section>

  </div>

  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2021 Copyright:
    <a class="<c:choose><c:when test="${lado=='LADO OSCURO'}">text-white-50 </c:when>
		<c:otherwise>text-black-50 </c:otherwise></c:choose>">Workbench</a>
  </div>
  
</footer>