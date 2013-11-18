{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
<div class="bloger_news_items">
  <div class="space_left_content">
    <ul>
      {{ list_articles ignore_issue="true" ignore_section="false" order="byPublishDate desc" length="10"  }}


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
          {{if $gimme->current_list->at_end}}
          &nbsp;-&nbsp;{{/if}}{{/list_article_authors}}{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
          <h3 class="title"><a href="{{url options="article"}}">{{$gimme->article->name}}</a></h3>

          <p>{{$gimme->article->deck|strip_tags}}</p>
        </div>
      </li>

      {{if $gimme->current_list->at_end}}



    </ul>
  </div>
</div>

{{ include file="_tpl/pagination.tpl" }}
{{/if}}

{{/list_articles}}