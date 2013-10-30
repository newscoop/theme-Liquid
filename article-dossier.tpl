{{ include file="_tpl/_html-head.tpl" }}



<div id="page" class="container">





  {{ include file="_tpl/header.tpl" }}




  <!-- Content -->
  <section id="content">



        <div class="article_content section content_text">

            <h2 class="page_title">{{$gimme->article->name}}</h2>

            <div class="space_left_content">

             {{ image rendition="dossier" }}


                              <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"  class="thumbnail" />

                            {{/image}}

                <div class="text">
                   {{$gimme->article->full_text}}
                </div>
                <span class="clear"></span>
            </div>
        </div>

      <div class="bloger_news_items">
        <div class="space_left_content">
          <ul>
            {{ list_related_articles }}
            <li class="news_item">
              <div class="content content_text">

                {{ image rendition="section" }}
                <a href="{{url options="article"}}" class="thumbnail">

                 <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"   />
                 {{ include file="_tpl/article_icons.tpl" }}
               </a>
               {{/image}}



               <h6 class="info">{{list_article_authors}}
                {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}

                {{ if $gimme->author->biography->first_name }}
                {{ $gimme->author->biography->first_name }} {{
                $gimme->author->biography->last_name }}
                {{ else }}
                {{ $gimme->author->name }}
                {{ /if }}

                {{/list_article_authors}} - {{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
                <h3 class="title"><a href="{{url options="article"}}">{{$gimme->article->name}}</a></h3>

                <p>{{$gimme->article->deck|strip_tags}}</p>
              </div>
            </li>

            {{if $gimme->current_list->at_end}}



          </ul>
        </div>
      </div>


      {{/if}}

      {{/list_related_articles}}

    </section>
    <!-- End Content -->













  </div>


  {{ include file="_tpl/footer.tpl" }}
  {{ include file="_tpl/_html-foot.tpl" }}
