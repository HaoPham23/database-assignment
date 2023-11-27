<?php
include_once('views/main/navbar.php');
?>
  <main id="main">
    <!-- Modal -->
    <?php
      foreach ($products as $product) {
        echo
        '<div class="modal fade" id="exampleModal'. $product->id .'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel" style="font-size: 30px; color: rgb(230, 91, 40); font-weight: 600">' . $product->name . '</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <img src="' . $product->img . '" class="card-img-top" alt="..." style="width: 70%; height=70%; margin-left: 15%;">
                  <br></br>
                  <h6 class="card-text text-center"><strong style="color: rgb(230, 91, 40);">' . $product->description . '</strong></h6>
                  <p class="text-center">' . $product->content . '</p>
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
              </div>
            </div>
          </div>
        </div>';
      }
    ?>
    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">
        <div class="section-title" data-aos="zoom-out">
          <h2>Chất lượng</h2>
          <p>Tại sao lại chọn VNG?</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="zoom-in-left">
              <div class="icon"><i class="bi bi-briefcase" style="color: #ff689b;"></i></div>
              <h4 class="title"><a href="">Thành tựu được công nhận</a></h4>
              <p class="description">Chúng tôi đã phục vụ hơn 200 khách hàng và phát triển nội bộ các công ty phần mềm của riêng mình, điều này giúp chúng tôi khác biệt với phần còn lại.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mt-5 mt-md-0">
            <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="100">
              <div class="icon"><i class="bi bi-book" style="color: #e9bf06;"></i></div>
              <h4 class="title"><a href="">Phát triển các giải pháp sáng tạo</a></h4>
              <p class="description">Tận dụng các công nghệ mới nổi đã trở thành một phần quan trọng và không thể thiếu trong mọi lĩnh vực của cuộc sống, từ công việc đến giáo dục và giải trí. </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mt-5 mt-lg-0 ">
            <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="200">
              <div class="icon"><i class="bi bi-card-checklist" style="color: #3fcdc7;"></i></div>
              <h4 class="title"><a href="">Đẩy nhanh tốc độ ra thị trường</a></h4>
              <p class="description">Đạt được chu kỳ phân phối liên tục để vượt qua đối thủ cạnh tranh của bạn với tốc độ tiếp cận thị trường nhanh hơn.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mt-5">
            <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="300">
              <div class="icon"><i class="bi bi-binoculars" style="color:#41cf2e;"></i></div>
              <h4 class="title"><a href="">Mở rộng năng lực nhóm</a></h4>
              <p class="description">Lấp đầy khoảng trống về tài năng và nâng cao kỹ năng của nhóm bạn cùng với các nhà phát triển cấp cao.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mt-5">
            <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="400">
              <div class="icon"><i class="bi bi-globe" style="color: #d6ff22;"></i></div>
              <h4 class="title"><a href="">Định hướng toàn cầu</a></h4>
              <p class="description">Không chỉ phục vụ các khách hàng trong nước, chúng tôi đang vươn mình để phát triển ra toàn thế giới</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mt-5">
            <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="500">
              <div class="icon"><i class="bi bi-clock" style="color: #4680ff;"></i></div>
              <h4 class="title"><a href="">Kiểm soát thời gian</a></h4>
              <p class="description">Mang đến cho khách hàng trải nghiệm nhanh, tiện, chính xác. Đảm bảo hoàn thành trong thời gian tối thiểu, tận tụy về khách hàng.</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Services Section -->


    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">
      <div class="section-title" data-aos="zoom-out">
          <h2>Sản phẩm</h2>
          <p>Các sản phẩm nổi bật</p>
        </div>
        <div class="row row-cols-1 row-cols-md-3 g-4">

        <?php
          foreach ($products as $product) {
            echo
              '<!-- Card 1 -->
              <div class="col" style="cursor: pointer;" data-aos="zoom-in" data-aos-delay="100" data-bs-toggle="modal" data-bs-target="#exampleModal'.$product->id.'">
                <div class="card" style="width: 26rem; height: 100%; border: 2px solid rgb(230, 91, 40); border-radius: 10%; overflow: hidden;">
                  <div class="h-100 w-100 card-top" style="display: flex; justify-content: center; overflow: hidden; box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;">
                    <img src="' . $product->img . '" alt="..." style="width: 100%; height: 350px; padding: 40px";  ">
                  </div>
                  <div class="card-body" style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
                    <h4 class="card-title" style="color: rgb(230, 91, 40); font-weight: 600!important"; >' . $product->name .'</h4>
                    <p class="card-text text-center">' . $product->description .'</p>
                  </div>
                </div>
              </div>';
          }
        ?>

        </div>
      </div>

  </main><!-- End #main -->

<?php
include_once('views/main/footer.php');
?>