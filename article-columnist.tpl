




{{ include file="_tpl/_html-head.tpl" }}


<div class="header_wrap">
  <div class="container">
    {{ include file="_tpl/header.tpl" }}
  </div>
</div>


<div id="page" class="container">


 <div id="blueimp_fullscreen" class="blueimp-gallery blueimp-gallery-controls">
     <div class="slides"></div>

     <a class="prev">‹</a>
     <a class="next">›</a>
     <a class="close">×</a>
     <ol class="indicator"></ol>
     <div class="caption"></div>
 </div>


 <!-- Content -->
 <section id="content">

  <div class="row article_content">
    <div class="columnist span10 offset1">

      <div class="content content_text">
        <div class="span2 article_side_element article_side_image thumbnail align_left">
         {{list_article_authors length="1"}}

         {{ if $gimme->author->user->defined }}

         <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}" class="thumbnail">
          <img alt="{{ $gimme->author->user->uname|escape }}" src="{{ $gimme->author->user->image(150, 200) }}"  />
        </a>
        {{ elseif $gimme->author->picture->imageurl }}

        <img src="{{ $gimme->author->picture->imageurl }}" alt="{{ $gimme->author->name }}" width="150" />

        {{ /if }}


        {{/list_article_authors}}
      </div>
      <h2 class="name">{{$gimme->article->name}}</h2>
      <h3 class="role">{{list_article_authors}}
        {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}
        {{ if $gimme->author->user->defined }}
        <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
          {{ /if }}
          {{ if $gimme->author->biography->first_name }}
          {{ $gimme->author->biography->first_name }} {{
          $gimme->author->biography->last_name }}
          {{ else }}
          {{ $gimme->author->name }}

          {{ /if }}
           - {{ $gimme->author->aim }}
          {{ if $gimme->author->user->defined }}
        </a>
        {{ /if }}
        {{/list_article_authors}}</h3>
        {{ $bodyAr=explode("</p>", $gimme->article->full_text, 2) }}


        {{ $bodyAr[0] }}
      </p>

      {{ list_related_articles }}
      {{if $gimme->current_list->at_beginning}}
      <div class="span3 article_side_element related_articles align_right">
        <h3 class="red_title">Related articles</h3>
        <ul>
          {{/if}}
          <li><a href="{{url options="article"}}">{{$gimme->article->name}}</a></li>

          {{if $gimme->current_list->at_end}}
        </ul>
      </div>
      {{/if}}
      {{/list_related_articles }}

      {{ $bodyAr[1] }}

         {{ include file="_tpl/article-slideshow.tpl" }}

         <script src="{{ url static_file='_js/socialite.min.js' }}" type="text/javascript"></script>

         <div class="social_buttons float_right">
          <ul>
           <li class="float_right margin_left_5">
             <a href="http://twitter.com/share" class="socialite twitter-share" data-text="{{$gimme->article->name|strip_tags|escape}}" data-url="{{url options="article"}}" data-count="vertical"  rel="nofollow" target="_blank"><span class="vhidden">Share on Twitter</span></a>
           </li>
           <li class="float_right margin_left_5">
            <a href="https://plus.google.com/share?url={{url options="article"}}" class="socialite googleplus-one" data-size="tall" data-href="{{url options="article"}}" rel="nofollow" target="_blank"><span class="vhidden">Share on Google+</span></a>
          </li>
          <li class="float_right margin_left_5">
            <a href="http://www.facebook.com/sharer.php?u={{url options="article"}}&amp;t={{$gimme->article->name|strip_tags|escape}}" class="socialite facebook-like" data-href="{{url options="article"}}" data-send="false" data-layout="box_count" data-width="60" data-show-faces="false" rel="nofollow" target="_blank"><span class="vhidden">Share on Facebook</span></a>
          </li>
        </ul>

      </div>

      <span class="clear"></span>

      <script>
      jQuery(document).ready(function() {

        Socialite.load(".social_buttons");

      });

      </script>

      {{ include file="_tpl/article-comments.tpl" }}


    </div>

  </div>
</div>



<div class="other_columnists content_text">
  <h3 class="section_title bigger">Diğer haberler</h3>

  <div class="row">



{{list_articles length="4" constraints="section is 80 number not `$gimme->article->number`"}}
    <div class="span3 columnist_member">
      <div class="content">
          {{list_article_authors length="1"}}

          {{ if $gimme->author->user->defined }}

          <a href="{{url options="article"}}" class="thumbnail">
           <img alt="{{ $gimme->author->user->uname|escape }}" src="{{ $gimme->author->user->image(71, 88) }}"  />
         </a>
         {{ elseif $gimme->author->picture->imageurl }}
         <a href="{{url options="article"}}" class="thumbnail">
          <img src="{{ $gimme->author->picture->imageurl }}" alt="{{ $gimme->author->name }}" width="71" />
        </a>
        {{ /if }}


        {{/list_article_authors}}

        <div class="text">
          <h3 class="name"><a href="{{url options="article"}}">{{$gimme->article->name}}</a></h3>

          <p>{{$gimme->article->deck|strip_tags}}</p>
        </div>
      </div>
    </div>

   {{/list_articles}}

  </div>
</div>



</section>
<!-- End Content -->













</div>


{{ include file="_tpl/footer.tpl" }}
{{ include file="_tpl/_html-foot.tpl" }}
