
<!-- Blue Box / Row -->
<div class="blue_box blue_box_posts tabs_box padding_top_60">

  <!-- Tabs Menu -->
  <ul class="tabs_menu">
    <li class="current"><a href="#tab_important">Gündem</a></li>
    <li><a href="#tab_last_added">En son eklenenler</a></li>
    <li ><a href="#tab_most_clicked">En çok okunanlar</a></li>
    <li><a href="#tab_most_commented">En çok yorum yapılanlar</a></li>


  </ul>
  <!-- End Tabs Menu -->

  <!-- Tabs Contents -->
  <div class="tabs_contents">


    <!-- Tabs Content -->
    <div id="tab_important" class="tabs_content row">


     {{list_playlist_articles id="8" length="4"}}
      <div class="span3">
        <article class="news_item condensed">
          {{ image rendition="front_small" }}
          <a href="{{url options="article"}}" class="thumbnail">
            {{ include file="_tpl/article_icons.tpl" }}
            <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})" alt="" />
          </a>
          {{/image}}
          <div class="content content_text content_text_contrast">
            <h6 class="info">{{list_article_authors}}
              {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}

              {{ if $gimme->author->biography->first_name }}
              {{ $gimme->author->biography->first_name }} {{
              $gimme->author->biography->last_name }}
              {{ else }}
              {{ $gimme->author->name }}
              {{ /if }}
              {{if $gimme->current_list->at_end}}
              &nbsp;-&nbsp;{{/if}}{{/list_article_authors}}{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
              <h3 class="title"><a href="{{url options="article"}}">{{$gimme->article->title}}</a></h3>
              <p>{{$gimme->article->deck|strip_tags|truncate:200:"...":false}}</p>

            </div>
          </article>
        </div>
        {{/list_playlist_articles}}
      </div>
      <!-- End Tabs Content -->


    <!-- Tabs Content -->
    <div id="tab_last_added" class="tabs_content row">


      {{list_articles length="4" ignore_section="true" order="byPublishDate desc" constraints="type is article"}}
      <div class="span3">
        <article class="news_item condensed">
          {{ image rendition="front_small" }}
          <a href="{{url options="article"}}" class="thumbnail">
            {{ include file="_tpl/article_icons.tpl" }}
            <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})" alt="" />
          </a>
          {{/image}}
          <div class="content content_text content_text_contrast">
            <h6 class="info">{{list_article_authors}}
              {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}

              {{ if $gimme->author->biography->first_name }}
              {{ $gimme->author->biography->first_name }} {{
              $gimme->author->biography->last_name }}
              {{ else }}
              {{ $gimme->author->name }}
              {{ /if }}
              {{if $gimme->current_list->at_end}}
              &nbsp;-&nbsp;{{/if}}{{/list_article_authors}}{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
              <h3 class="title"><a href="{{url options="article"}}">{{$gimme->article->title}}</a></h3>
              <p>{{$gimme->article->deck|strip_tags|truncate:200:"...":false}}</p>

            </div>
          </article>
        </div>
        {{/list_articles}}
      </div>
      <!-- End Tabs Content -->

    <!-- Tabs Content -->
    <div id="tab_most_clicked" class="tabs_content row">
      {{$7daysago = "-1 month"|date_format:"%Y-%m-%d"}}

      {{list_articles length="4" ignore_section="true" order="byPopularity desc" constraints="publish_datetime greater `$7daysago`"}}
      <div class="span3">
        <article class="news_item condensed">
          {{ image rendition="front_small" }}
          <a href="{{url options="article"}}" class="thumbnail">
            {{ include file="_tpl/article_icons.tpl" }}
            <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})" alt="" />
          </a>
          {{/image}}
          <div class="content content_text content_text_contrast">
            <h6 class="info">{{list_article_authors}}
              {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}

              {{ if $gimme->author->biography->first_name }}
              {{ $gimme->author->biography->first_name }} {{
              $gimme->author->biography->last_name }}
              {{ else }}
              {{ $gimme->author->name }}
              {{ /if }}
              {{if $gimme->current_list->at_end}}
              &nbsp;-&nbsp;{{/if}}{{/list_article_authors}}{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
              <h3 class="title"><a href="{{url options="article"}}">{{$gimme->article->title}} </a></h3>
              <p>{{$gimme->article->deck|strip_tags|truncate:200:"...":false}}</p>

            </div>
          </article>
        </div>
        {{/list_articles}}
      </div>
      <!-- End Tabs Content -->

      <!-- Tabs Content -->
      <div id="tab_most_commented" class="tabs_content row">

        {{list_articles length="4" ignore_section="true" order="byComments desc" constraints="publish_datetime greater `$7daysago`"}}
        <div class="span3">
          <article class="news_item condensed">
            {{ image rendition="front_small" }}
            <a href="{{url options="article"}}" class="thumbnail">
              {{ include file="_tpl/article_icons.tpl" }}
              <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})" alt="" />
            </a>
            {{/image}}
            <div class="content content_text content_text_contrast">
              <h6 class="info">{{list_article_authors}}
                {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}

                {{ if $gimme->author->biography->first_name }}
                {{ $gimme->author->biography->first_name }} {{
                $gimme->author->biography->last_name }}
                {{ else }}
                {{ $gimme->author->name }}
                {{ /if }}
                {{if $gimme->current_list->at_end}}&nbsp;-&nbsp;{{/if}}{{/list_article_authors}}{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
                <h3 class="title"><a href="{{url options="article"}}">{{$gimme->article->title}} </a></h3>
                <p>{{$gimme->article->deck|strip_tags|truncate:200:"...":false}}</p>

              </div>
            </article>
          </div>
          {{/list_articles}}

        </div>
        <!-- End Tabs Content -->

      </div>
      <!-- End Tabs Contents -->

    </div>
    <!-- End Blue Box / Row -->

