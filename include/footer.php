    <footer class="footer bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-4 text-center">
            <h5 class="cap links">links</h5>
          </div>
        </div>
      </div>
    </footer>
    <script src="js/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/all.min.js"></script>
    <script src="js/custom.js"></script>
    <?php if (isset($getSliderScript)):?>
      <script src="js/splide.min.js"></script>
      <script>
        document.addEventListener( 'DOMContentLoaded', function () {
          new Splide( '#image-slider', {
            type: 'fade',
          } ).mount();
        } );
      </script>
    <?php endif;?>
  </body>
</html>