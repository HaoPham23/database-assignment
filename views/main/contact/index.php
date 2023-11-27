<?php
include_once('views/main/navbar.php');
?>
    <!-- ======= Contact Section ======= -->
    <div class="map-section" style="margin-top: 71px">
      <!-- <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/place/VNG/@10.7577828,106.7454277,15z/data=!4m6!3m5!1s0x31752eeca0d84b33:0xb98f29e0479d526a!8m2!3d10.7575708!4d106.7457165!16s%2Fg%2F1hc4hbnyx?entry=ttu" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> -->
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d26368.351998332837!2d106.75268399714817!3d10.759205638345547!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752eeca0d84b33%3A0xb98f29e0479d526a!2sVNG!5e0!3m2!1svi!2s!4v1700538315617!5m2!1svi!2s" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
    
    <section id="contact" class="contact">
      <div class="container">
        <div class="section-title aos-init aos-animate" data-aos="zoom-out">
          <h2>Liên hệ</h2>
          <p>Liên hệ với chúng tôi</p>
        </div>

  
        <div class="row content" data-aos="fade-up">
        <?php
          foreach ($companies as $company)
          {
            echo '
            <div class="col-lg-6">
              <div class="info">
                <div class="address"> 
                  <i class="bi bi-geo-alt"></i>
                  <h4>Chi nhánh: '. $company->name .'</h4>
                  <p>' . $company->address . '</p>
                </div>

                <div class="email"> 
                  <i class="bi bi-envelope"></i>
                  <h4>Email:</h4>
                  <p>recruitment@vng.com.vn</p>
                </div>

                <div class="phone"> 
                  <i class="bi bi-phone"></i>
                  <h4>Điện thoại:</h4>
                  <p>8428 - 39623888</p>
                </div>
              </div>  
              <hr>
              <br>
            </div>

            ';
          }
        ?>
        </div>

      </div>
    </section>


  </main><!-- End #main -->
<?php
include_once('views/main/footer.php');
?>