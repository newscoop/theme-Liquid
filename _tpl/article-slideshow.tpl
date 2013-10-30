 {{ foreach $gimme->article->slideshows as $slideshow }}
 	{{assign var="som" value=1 }}
 {{/foreach}}

{{if $som==1}}

<div id="thumbs">



                   {{ foreach $gimme->article->slideshows as $slideshow }}



{{ foreach $slideshow->items as $item }}

    <a href="http://{{ $gimme->publication->site }}/{{ $item->image->original }}"  title="{{ $item->caption }}">
<img src="{{ $item->image->src }}" width="{{ $item->image->width }}" height="{{ $item->image->height }}" alt=""  />
    </a>



{{ /foreach }}


{{ /foreach }}



         <span class="clear"></span>
        </div>

             <link rel="stylesheet" href="{{ url static_file='_js/touchTouch/touchTouch.css' }}">
<script src="{{ url static_file='_js/touchTouch/touchTouch.jquery.js' }}" type="text/javascript"></script>

<script>
$(function(){

  // Initialize the gallery
  $('#thumbs a').touchTouch();

});
</script>

   {{/if}}