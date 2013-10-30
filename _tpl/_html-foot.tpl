



 <script src="{{ url static_file='_js/jquery.scrollTo-min.js' }}" type="text/javascript"></script>
 <script src="{{ url static_file='_js/jquery-scrolltofixed-min.js' }}" type="text/javascript"></script>
 <script src="{{ url static_file='_js/masonry.js' }}" type="text/javascript"></script>

 <script src="{{ url static_file='_js/onload.js' }}" type="text/javascript"></script>

 <script>

 window.onload = function() {
    $('#masonry_container').masonry({
      columnWidth: function( containerWidth ) {
            return containerWidth / 4;
          }
     });


 };
 </script>

</body>
</html>

