     {{ if $gimme->article->type_name=="page"}}
     {{ include file="page.tpl" }}
     {{elseif $gimme->article->video }}
     {{ include file="article-video.tpl" }}
     {{elseif $gimme->article->photostory}}
     {{ include file="article-photostory.tpl" }}
     {{else}}

     {{ include file="_tpl/_html-head.tpl" }}



     {{ include file="_tpl/header.tpl" }}

     {{* This is to check if article is divided into pages *}}
     {{ assign var="showStuff" value=0 }}
     {{ if !($gimme->article->subtitles_count(full_text) gt 1) || ($gimme->article->subtitles_count(full_text) gt 1 && $gimme->article->current_subtitle_no(full_text) == 0) }}
     {{ assign var="showStuff" value=1 }}
     {{ /if }}


     <section id="content" class="content_text container subpage subpage_section">
      <div class="row">
        <header class="article_header span10">
          <h6 class="date">{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y %H:%i" }}</h6>
          <h2 class="title">{{$gimme->article->name}}</h2>
          <h5 class="author">
            {{list_article_authors}}
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

              {{ if $gimme->author->user->defined }}
            </a>
            {{ /if }}

            {{/list_article_authors}}
          </h5>
          {{list_article_topics }}
          <span class="label label_blue">{{$gimme->topic->name}}</span>
          {{/list_article_topics}}


        </header>
      </div>
      <div class="row">

       <section id="left_column" class="span10 article_text">
{{if $showStuff}}
        {{if $gimme->article->youtube_id }}
        <iframe src="http://www.youtube.com/embed/{{$gimme->article->youtube_id}}"  width="920" height="520" allowfullscreen="true"></iframe>
        {{else}}
        {{if !$gimme->article->no_top_picture}}
        {{ image rendition="article" }}
        <img src="{{ $image->src }}" class="article_image" alt="{{ $image->caption }} (photo: {{ $image->photographer }})" />
        {{/image}}
        {{/if}}
        {{/if}}

        <h4>{{$gimme->article->lead}}</h4>

{{/if}}


          {{$gimme->article->full_text}}

    {{* article pagination *}}
          {{ if $gimme->article->subtitles_count(full_text) gt 1 }}
          {{ if !($smarty.get['st-full_text'] == "all") }}

              <div class="bottom_nav pagination">

                      {{ list_subtitles field_name="full_text" }}
          {{ if $gimme->current_list->at_beginning }}

          {{ if $gimme->article->full_text->has_previous_subtitles }}
           <a href="{{ url options="previous_subtitle full_text" }}" class="float_left nav_button prev" title="">&laquo;{{ if $gimme->language->english_name == "Georgian" }}წინა{{elseif $gimme->language->english_name == "Russian"}}предыдущий{{else}}previous{{/if}}
          </a>


          {{ /if }}

          <div class="numbers">
           <ul>

          {{ /if }}

          <li{{ if ($gimme->article->current_subtitle_no(body)+1) == $gimme->current_list->index }} class="current"{{ /if }}><a href="{{ url }}">{{ $gimme->current_list->index }}</a></li>

          {{ if $gimme->current_list->at_end }}
        </ul>
      </div>
          {{ if $gimme->article->full_text->has_next_subtitles }}
          <a href="{{ url options="next_subtitle full_text" }}" class="float_right nav_button next" title="">{{ if $gimme->language->english_name == "Georgian" }}შემდეგი{{elseif $gimme->language->english_name == "Russian"}}следующий{{else}}next{{/if}} &raquo;</a>

          {{ /if }}
          {{ /if }}
                      {{ /list_subtitles }}
               </div>
          {{ /if }}
          {{ /if }}
    {{* /article pagination *}}


                  {{$som=0}}
                  {{list_related_articles }}
                  {{$som=1}}

                  {{/list_related_articles}}


                  {{if $gimme->article->has_map OR $som }}

                  <div class="related_articles related_elements hidden-phone">
                    {{ if $gimme->article->has_map }}
                    <div class="mapa">
                      {{ map show_original_map="false" show_reset_link="false" show_locations_list="false" width="240" height="214" }}
                    </div>
                    {{ /if }}
                    {{ list_related_articles }}

                    {{ if $gimme->current_list->at_beginning }}
                    <h3 class="section_header orange">{{ if $gimme->language->english_name == "Georgian" }}ამავე თემაზე{{elseif $gimme->language->english_name == "Russian"}}На ту же тему{{else}}Related Articles{{/if}}</h3>

                    <ul class="article_list_simple">


                      {{ /if }}

                      <li>
                        <a href="{{ uri }}">
                          <h6 class="date">{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y %H:%i" }}</h6>
                          <h4 class="title">{{ $gimme->article->name }}</h4>
                        </a>
                      </li>



                      {{ if $gimme->current_list->at_end }} </ul>
                      {{ /if }}

                      {{ /list_related_articles }}

                      {{if $gimme->article->has_map OR $som }}

                    </div>
                    {{/if}}
          {{/if}}

          {{ include file="_tpl/article-slideshow.tpl" }}


          {{ if $gimme->article->has_attachments }}
          {{ list_article_attachments }}



          {{ if ($gimme->attachment->extension == mp3) || ($gimme->attachment->extension == oga) }}




          <audio controls>
            <source src="{{ url options="articleattachment" }}" type="{{ $gimme->attachment->mime_type }}">
            </audio>





            {{ elseif $gimme->attachment->extension == ogv || $gimme->attachment->extension == ogg || $gimme->attachment->extension == mp4 || $gimme->attachment->extension == webm }}

            <video id="video_{{ $gimme->current_list->index }}" class="video-js vjs-default-skin" controls preload="auto" width="100%" data-setup="{}">

              <source src="{{ url options="articleattachment" }}" type='{{ $gimme->attachment->mime_type }}' />
              </video>





              {{ else }}


              <a href="{{ url options="articleattachment" }}" class="attachment"><span>{{ $gimme->attachment->file_name }} ({{ $gimme->attachment->size_kb }}kb)</span></a>

              {{ /if }}
              {{ /list_article_attachments }}
              {{ /if }}



          <nav class="section_bottom_nav">
            <div class="container_bottom">


              <div class="rdbWrapper" style="width:100px; float:left; margin-top: 15px;" data-show-read-now="0" data-show-read-later="0" data-show-send-to-kindle="0" data-show-print="1" data-show-email="0" data-orientation="0" data-version="1"></div><script type="text/javascript">(function() {var s = document.getElementsByTagName("script")[0],rdb = document.createElement("script"); rdb.type = "text/javascript"; rdb.async = true; rdb.src = document.location.protocol + "//www.readability.com/embed.js"; s.parentNode.insertBefore(rdb, s); })();</script>


              <div class="social_buttons float_right">
                <ul>
                 <li>
                   <a href="http://twitter.com/share" class="socialite twitter-share" data-text="{{$gimme->article->name|strip_tags|escape}}" data-url="{{url options="article"}}" data-count="vertical"  rel="nofollow" target="_blank"><span class="vhidden">Share on Twitter</span></a>
                 </li>
                 <li>
                  <a href="https://plus.google.com/share?url={{url options="article"}}" class="socialite googleplus-one" data-size="tall" data-href="{{url options="article"}}" rel="nofollow" target="_blank"><span class="vhidden">Share on Google+</span></a>
                </li>
                <li>
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




          </div>
        </nav>

        {{ include file="_tpl/article-comments.tpl" }}

      </section>

      <section id="right_column" class="span6">


       {{ include file="_tpl/sidebar-news.tpl" }}



       {{ include file="_tpl/sidebar-latest.tpl" }}

       {{ include file="_tpl/sidebar-fbrecomend.tpl" }}
     </section>

   </div>

   {{ include file="_tpl/event-boxes.tpl" }}

 </section>
 {{ include file="_tpl/footer.tpl" }}


 {{ include file="_tpl/_html-foot.tpl" }}


 {{/if}}