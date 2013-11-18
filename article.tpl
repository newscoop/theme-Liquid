{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ if $gimme->article->type_name=="page"}}
{{ include file="page.tpl" }}

{{ elseif $gimme->article->type_name=="Columnist"}}

{{ include file="article-columnist.tpl" }}

{{ elseif $gimme->article->type_name == "debate" }}

{{ include file="article-debate.tpl" }}



{{else}}




{{ include file="_tpl/_html-head.tpl" }}



<div id="page" class="container">





 {{ include file="_tpl/header.tpl" }}





 <!-- Content -->
 <section id="content">

   <article class="row article_content">
     <div class="news_item span8 offset2">


      {{* This is to check if article is divided into pages *}}
      {{ assign var="showStuff" value=0 }}
      {{ if !($gimme->article->subtitles_count(full_text) gt 1) || ($gimme->article->subtitles_count(full_text) gt 1 && $gimme->article->current_subtitle_no(full_text) == 0) }}
      {{ assign var="showStuff" value=1 }}
      {{ /if }}

      {{if $showStuff}}
      {{ image rendition="article" }}

      <div class="thumbnail content_text">

       <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})" alt="" />
       <h6 class="caption span2">{{ $image->caption }}</h6>
     </div>
     {{/image}}
     {{/if}}

     <div class="content content_text">
       <h6 class="info">{{list_article_authors}}
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
        {{if $gimme->current_list->at_end}}
        &nbsp;-&nbsp;
        {{/if}}
        {{/list_article_authors}}
        {{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
        <h2 class="title">{{$gimme->article->name}}</h2>
        <h6 class="topics">
          {{ list_article_topics }}<a href="{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>{{ if $gimme->current_list->at_end }}</p>{{ else }}, {{ /if }}
          {{ /list_article_topics }}

        </h6>
        {{ include file="_tpl/_edit-article.tpl" }}


        {{ if $gimme->article->content_accessible }}


        {{ $bodyAr=explode("</p>", $gimme->article->full_text, 2) }}


        {{ $bodyAr[0] }}
      </p>

      {{if $showStuff}}
      {{ if $gimme->article->has_map }}


      <div class="span4 article_side_element article_side_image align_left ">
       {{ map show_original_map="false" show_reset_link="false" show_locations_list="false" width="240" height="214" }}
     </div>
     {{ /if }}
     {{ if $gimme->article->has_attachments }}
     <div class="span4 article_side_element align_left article_side_attachments">


      <h3>{{#attachments#}}</h3>
      {{ list_article_attachments }}



      {{ if ($gimme->attachment->extension == mp3) || ($gimme->attachment->extension == oga) }}




      <audio controls>
        <source src="{{ url options="articleattachment" }}" type="{{ $gimme->attachment->mime_type }}">
        </audio>





        {{ elseif $gimme->attachment->extension == ogv || $gimme->attachment->extension == ogg || $gimme->attachment->extension == mp4 || $gimme->attachment->extension == webm }}

        <video id="video_{{ $gimme->current_list->index }}" class="video-js vjs-default-skin" controls preload="auto" width="100%" data-setup='{ "loop": "false" }'>

          <source src="{{ url options="articleattachment" }}" type='{{ $gimme->attachment->mime_type }}' />
          </video>





          {{ else }}


          <a href="{{ url options="articleattachment" }}" class="attachment"><span>{{ $gimme->attachment->file_name }} ({{ $gimme->attachment->size_kb }}kb)</span></a>

          {{ /if }}
          {{ /list_article_attachments }}
        </div>
        {{ /if }}




        {{ list_related_articles }}
        {{if $gimme->current_list->at_beginning}}
        <div class="span3 article_side_element related_articles align_right">
         <h3 class="red_title">{{#relatedArticles#}}</h3>
         <ul>
           {{/if}}
           <li><a href="{{url options="article"}}">{{$gimme->article->name}}</a></li>

           {{if $gimme->current_list->at_end}}
         </ul>
       </div>
       {{/if}}
       {{/list_related_articles }}
       {{/if}}
       {{ $bodyAr[1] }}


       <div class="span4 article_side_element align_right">
        <!--/* OpenX Javascript Tag v2.8.10 */-->

                          <!--/*
                            * The backup image section of this tag has been generated for use on a
                            * non-SSL page. If this tag is to be placed on an SSL page, change the
                            *   'http://openx.sourcefabric.net/delivery/...'
                            * to
                            *   'https://openx.sourcefabric.net/delivery/...'
                            *
                            * This noscript section of this tag only shows image banners. There
                            * is no width or height in these banners, so if you want these tags to
                            * allocate space for the ad before it shows, you will need to add this
                            * information to the <img> tag.
                            *
                            * If you do not want to deal with the intricities of the noscript
                            * section, delete the tag (from <noscript>... to </noscript>). On
                            * average, the noscript tag is called from less than 1% of internet
                            * users.
                            */-->

                          <script type='text/javascript'><!--//<![CDATA[
                          var m3_u = (location.protocol=='https:'?'https://openx.sourcefabric.net/delivery/ajs.php':'http://openx.sourcefabric.net/delivery/ajs.php');
                          var m3_r = Math.floor(Math.random()*99999999999);
                          if (!document.MAX_used) document.MAX_used = ',';
                          document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
                          document.write ("?zoneid=197");
                          document.write ('&amp;cb=' + m3_r);
                          if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
                          document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
                          document.write ("&amp;loc=" + escape(window.location));
                          if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
                          if (document.context) document.write ("&context=" + escape(document.context));
                          if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
                          document.write ("'><\/scr"+"ipt>");
                          //]]>--></script><noscript><a href='http://openx.sourcefabric.net/delivery/ck.php?n=a6e04d54&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.sourcefabric.net/delivery/avw.php?zoneid=197&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a6e04d54' border='0' alt='' /></a></noscript>
                        </div>

                        {{if $showStuff}}

                        {{ include file="_tpl/article-slideshow.tpl" }}

                        {{/if}}


                        {{* article pagination *}}
                        {{ if $gimme->article->subtitles_count(full_text) gt 1 }}
                        {{ if !($smarty.get['st-full_text'] == "all") }}

                        <div class="bottom_nav pagination">

                          {{ list_subtitles field_name="full_text" }}
                          {{ if $gimme->current_list->at_beginning }}

                          {{ if $gimme->article->full_text->has_previous_subtitles }}
                          <a href="{{ url options="previous_subtitle full_text" }}" class="arrow arrow_left" title="">{{#previous#}}
                          </a>


                          {{ /if }}

                          <div class="numbers">
                           <ul>

                            {{ /if }}

                            <li{{ if ($gimme->article->current_subtitle_no(full_text)+1) == $gimme->current_list->index }} class="current"{{ /if }}><a href="{{ url }}">{{ $gimme->current_list->index }}</a></li>

                            {{ if $gimme->current_list->at_end }}
                          </ul>
                        </div>
                        {{ if $gimme->article->full_text->has_next_subtitles }}
                        <a href="{{ url options="next_subtitle full_text" }}" class="arrow arrow_right" title="">{{#next#}}</a>
                        {{ /if }}
                        {{ /if }}
                        {{ /list_subtitles }}
                      </div>
                      {{ /if }}
                      {{ /if }}
                      {{* /article pagination *}}




                    <script>
                    jQuery(document).ready(function() {

                      Socialite.load(".social_buttons");

                    });

                    </script>
                    <div class="row">
                      <div class="span4">
                        {{ include file="_tpl/article-rating.tpl" }}
                      </div>
                      <div class="span4">
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


                      </div>
                    </div>
                    <span class="clear"></span>

                    {{ include file="_tpl/article-comments.tpl" }}



                    {{ else }}
                    <p>{{ #infoOnLockedArticles# }}</p>
                    {{ /if }}
                  </div>

                </div>
              </article>


              {{ render file="_tpl/box-most_tabs.tpl"  issue=off section=off cache=600 }}


            </section>
            <!-- End Content -->













          </div>


          {{ include file="_tpl/footer.tpl" }}
          {{ include file="_tpl/_html-foot.tpl" }}
          {{/if}}