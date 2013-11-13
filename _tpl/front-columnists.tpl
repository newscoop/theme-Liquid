<!-- Orange Box -->
<div class="orange_box people_box">

  <div class="people_wrapper row">
    <!-- People / Row (12) -->
    <ul class="people">
      {{list_articles length="8" ignore_issue="true" constraints="section is 30" order="byPublishDate desc"}}
      <li class="span3">
        <div class="person content_text">
          <header class="header">
           {{list_article_authors length="1"}}

           {{ if $gimme->author->user->defined }}

           <div class="thumbnail">
             <img alt="{{ $gimme->author->user->uname|escape }}" src="{{ $gimme->author->user->image(61, 82) }}"  />
           </div>
           {{ elseif $gimme->author->picture->imageurl }}
           <div class="thumbnail">
            <img src="{{ $gimme->author->picture->imageurl }}" alt="{{ $gimme->author->name }}" width="61" />
          </div>
          {{ /if }}



          <h3 class="header_field_1">{{$gimme->author->aim}}</h3>

          <h3 class="header_field_2">{{ if $gimme->author->user->defined }}
            <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
              {{/if}}
              {{$gimme->author->name}}
              {{ if $gimme->author->user->defined }}
            </a>
            {{/if}}
          </h3>
          {{/list_article_authors}}
          <h4 class="header_field_3"><a href="{{url options="article"}}">{{$gimme->article->name}}</a></h4>
        </header>

        <p>{{$gimme->article->deck|strip_tags|truncate:200:"...":false}}</p>
      </div>
    </li>
    {{/list_articles}}

  </ul>
  <!-- End People / Row (12) -->

</div>

<!-- Slider Navigation -->
<ul class="navigation">
  <li class="arrow arrow_left"><a href="#"></a></li>
  <li class="dot"><a href="#"></a></li>
  <li class="dot current"><a href="#"></a></li>
  <li class="arrow arrow_right"><a href="#"></a></li>
</ul>
<!-- End Slider Navigation -->

</div>
<!-- End Orange Box -->