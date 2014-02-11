<div class="bloger_news_items">
  <div class="space_left_content">
    <ul>
      {{ list_articles ignore_issue="true" ignore_section="false" order="byPublishDate desc" length="10" constraints="type not poll" }}
      <li class="news_item">
        <div class="content content_text">



          {{list_article_authors length="1"}}

          {{ if $gimme->author->user->defined }}

          <a href="{{url options="article"}}" class="thumbnail">
           <img alt="{{ $gimme->author->user->uname|escape }}" src="{{ $gimme->author->user->image(100, 150) }}"  />
         </a>
         {{ elseif $gimme->author->picture->imageurl }}
         <a href="{{url options="article"}}" class="thumbnail">
          <img src="{{ $gimme->author->picture->imageurl }}" alt="{{ $gimme->author->name }}" width="100" />
        </a>
        {{ /if }}


        {{/list_article_authors}}





        <h6 class="info">{{list_article_authors}}
          {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}

          {{ if $gimme->author->biography->first_name }}
          {{ $gimme->author->biography->first_name }} {{
          $gimme->author->biography->last_name }}
          {{ else }}
          {{ $gimme->author->name }}
          {{ /if }}
          {{if $gimme->current_list->at_end}}
          &nbsp;-&nbsp;
          {{/if}}
          {{/list_article_authors}}{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
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