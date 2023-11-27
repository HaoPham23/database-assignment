<?php
  include_once('views/main/navbar.php');
?>
  <main id="main">
    <!-- Modal here -->
    <!-- Modal 1-->
    <?php
    foreach ($recent as $news)
    {
      echo '
      <div class="modal fade" id="modal-' . $news->id . '" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-xl">
          <div class="modal-content">
            <div class="modal-body">
              <!-- ======= Blog Single Section ======= -->
              <section id="blog" class="blog">
                <div class="container" data-aos="fade-up">
  
                  <div class="row">
  
                    <div class="col-lg-12 entries">
  
                        <!-- Blog entry -->
                        <article class="entry entry-single">
  
                          <h2 class="entry-title">
                            ' . $news->title . '
                          </h2>
  
                          <div class="entry-meta">
                            <ul>
                              <li class="d-flex align-items-center"><i class="bi bi-clock"></i><time>' . date("F j, Y, g:i a", strtotime($news->date)) . '</time></li>
                              <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i>' . count($news->comments) . ' Comments</li>
                            </ul>
                          </div>
  
                          <div class="entry-content">
                            <p>
                              ' . $news->content . '
                            </p>
                          </div>
  
                        </article><!-- End blog entry -->
                      
  
                        <div class="blog-comments">
  
                          <h4 class="comments-count">' . count($news->comments) . ' Comments</h4>';
                        
                          foreach ($news->comments as $comment)
                          {
                            echo '
                            <div id="comment-' . $comment->id . '" class="comment">
                              <div class="d-flex">
                                <div>
                                  <h5><a href="">' . $comment->user_name . '</a> <a href="#" style="color: rgb(230, 91, 40)" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                  <time>' . date("F j, Y, g:i a", strtotime($comment->date)) . '</time>
                                  <p style="font-weight: 600">
                                  ' . $comment->content . '
                                  </p>
                                </div>
                              </div>
                            </div>';
                              
                            foreach ($comment->replies as $reply)
                            {
                              echo '
                              <div id="comment-' . $comment->id . '-reply-' . $reply->id . '" class="comment comment-reply">
                                <div class="d-flex">
                                  <div>
                                    <h5><a href="">' . $reply->user_name . '</a> <a style="color: rgb(230, 91, 40)" href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                    <time>' . date("F j, Y, g:i a", strtotime($reply->date)) . '</time>
                                    <p style="font-weight: 600">
                                    ' . $reply->content . '
                                    </p>
                                  </div>
                                </div>
  
                              </div><!-- End comment reply #1-->
                            ';
                            }
                            echo '
                            <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="reply-form col-lg-11">
                              <div class="row">
                                <div class="col form-group">
                                  <textarea name="comment" class="form-control" placeholder="Viết bình luận tại đây"></textarea>
                                </div>
                              </div>
                              <div style="display: flex; align-items: center; justify-content: end;">
                                <button style="background-color: rgb(230, 91, 40); color: white; font-weight: 700" class="btn btn-primary btn-reply" data-news=' . $news->id . ' data-parent=' . $comment->id .' data-user="' . @$_SESSION["guest"] . '">Gửi bình luận</button>
                              </div>
                            </form>
                          </div></div>';
                          }
                            
  
                          echo '
                          <div class="reply-form">
                            <h4 style="color: rgb(230, 91, 40)">Bình luận</h4>
                              <div class="row">
                                <div class="col form-group">
                                  <textarea name="comment" class="form-control" placeholder="Viết bình luận tại đây"></textarea>
                                </div>
                              </div>
                              <div style="display: flex; align-items: center; justify-content: end;"><button style="background-color: rgb(230, 91, 40); color: white; font-weight: 700" class="btn btn-primary btn-comment" data-news=' . $news->id . ' data-parent="" data-user="' . @$_SESSION["guest"] . '">Gửi bình luận</button></div>
                            </form>
                          </div>
  
                        </div><!-- End blog comments -->
                    </div><!-- End blog entries list -->
                    
  
                  </div>
  
                </div>
              </section><!-- End Blog Single Section -->
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
            </div>
          </div>
        </div>
      </div>
      ';
      }
    ?>

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-8 entries">
            <!-- Entry -->
            <?php

              foreach ($newses as $news) {
                echo '
                  <article class="entry">

                    <h2 class="entry-title" data-bs-toggle="modal" data-bs-target="#modal-' . $news->id . '">
                      <a href="#" style="hover: ">' . $news->title . '</a>
                    </h2>

                    <div class="entry-meta">
                      <ul>
                        <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <time>' . date("F j, Y, g:i a", strtotime($news->date)) . '</time></li>
                        <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i>' . count($news->comments) . ' Bình luận</li>
                      </ul>
                    </div>

                    <div class="entry-content">
                      <p>
                        ' . $news->description . '
                      </p>
                      <div class="read-more">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn  btn-entry" data-bs-toggle="modal" data-bs-target="#modal-' . $news->id . '" id=more' . $news->id . '>
                          Đọc thêm
                        </button>
                      </div>
                    </div>
                  </article><!-- End blog entry -->
                ';
              }
            ?>
            
            <div style="display: flex; align-items: center; justify-content: end;">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="index.php?page=main&controller=blog&action=index&pg=1" aria-label="Previous">
                    <span aria-hidden="true" style="color: rgb(230, 91, 40);">&laquo;</span>
                    <span class="sr-only" style="color: rgb(230, 91, 40);">Previous</span>
                  </a>
                </li>
                <li class="page-item" ><a class="page-link" href="index.php?page=main&controller=blog&action=index&pg=1" style="color: rgb(230, 91, 40);">1</a></li>
                <li class="page-item"><a class="page-link" href="index.php?page=main&controller=blog&action=index&pg=2" style="color: rgb(230, 91, 40);">2</a></li>
                <li class="page-item"><a class="page-link" href="index.php?page=main&controller=blog&action=index&pg=3" style="color: rgb(230, 91, 40);">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="index.php?page=main&controller=blog&action=index&pg=2" aria-label="Next">
                    <span aria-hidden="true" style="color: rgb(230, 91, 40);">&raquo;</span>
                    <span class="sr-only" style="color: rgb(230, 91, 40);">Next</span>
                  </a>
                </li>
              </ul>
            </nav>
            </div>

          </div>
          <div class="col-lg-4">

            <div class="sidebar">

              <h3 class="sidebar-title" style="color: #141A46;">Bài viết gần đây</h3>
              <div class="sidebar-item recent-posts">
              <?php
                foreach ($recent as $news)
                {
                  echo '
                  <div class="post-item clearfix">
                    <h4><a style="color: rgb(230, 91, 40);" href="blog-single.html" data-bs-toggle="modal" data-bs-target="#modal-' . $news->id . '" id=more' . $news->id . '>' . $news->title . '</a></h4>
                    <time>' . date("F j, Y, g:i a", strtotime($news->date)) . '</time>
                  </div>
                  ';
                }
              ?>

              </div><!-- End sidebar recent posts-->

            </div><!-- End sidebar -->

          </div><!-- End blog sidebar -->

        </div>

      </div>
    </section><!-- End Blog Section -->

  </main><!-- End #main -->
<?php
include_once('views/main/footer.php');
?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="public/plugins/jquery/jquery.min.js"></script>
<script src="public/js/blog/index.js"></script>