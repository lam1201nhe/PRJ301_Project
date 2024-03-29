<%-- 
    Document   : inde
    Created on : Oct 30, 2022, 11:35:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="lam" uri="/WEB-INF/tlds/CustomTag.tld" %>
<!DOCTYPE html>
<!-- Font Awesome -->
<link
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
rel="stylesheet"
/>
<!-- Google Fonts -->
<link
href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
rel="stylesheet"
/>
<!-- MDB -->
<link
href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
rel="stylesheet"
/>
<style>
.btn-login {
  margin-top: 10px;
}

body {
    background-image: url(img/background.png);
}

.card {
    background-color: #379237;
}

.form-control{
    background-color: black;
}
.dangnhap {
    color: white;
    font-weight: bold;
}
</style>
<body>
<section class="vh-100 gradient-custom">
<div class="container py-5 h-100">
  <div class="row d-flex justify-content-center align-items-center h-100">
    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
      <div class="card " style="border-radius: 1rem">
        <div class="card-body p-5 text-center">
          <div class="mb-md-5 mt-md-4 pb-5">
              <form action="login" method="POST">
              <h2 class="fw-bold mb-2 dangnhap text-uppercase">Đăng nhập</h2>
              <p class="text-50 dangnhap mb-5">
                Vui lòng nhập thông tin tài khoản
              </p>

              <div class="form-outline form-white mb-4">
                <input
                  type="text"
                  id="typeEmailX"
                  class="form-control form-control-lg"
                  name="username"
                />
                <label class="form-label  dangnhap" for="typeEmailX"
                  >Tên đăng nhập</label
                >
              </div>

              <div class="form-outline form-white mb-4">
                <input
                  type="password"
                  id="typePasswordX"
                  class="form-control form-control-lg"
                  name="password"
                />
                <label class="form-label dangnhap" for="typePasswordX"
                  >Mật khẩu</label
                >
              </div>

                  
              <button
                class="btn btn-outline-light btn-lg px-5 btn-login"
                type="submit"
                id="btn-login"
              >
                Login
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</section>

<!-- MDB -->
<script
type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
></script>
<script>
  
</script>

</body>
</html>
