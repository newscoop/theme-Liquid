{{extends file="layout.tpl"}}

{{block content}}

<script>
  window.location.href = 'http://{{ $gimme->publication->site }}';
</script>

{{ assign var="userindex" value=1 }}




{{ assign var="column" value=1 }}
{{ assign var="index" value=0 }}
{{ foreach $users as $user }}

<div class="article_content bloger content_text">
  <div class="space_left_content">
    <a href="{{ $view->url(['username' => $user->uname], 'user') }}">
    {{if  $user->image(160, 200) }}
    <img src="{{ $user->image(160, 200) }}" class="thumbnail"  />
    {{else}}
    <img src="{{url static_file="_img/user-thumb.jpg" }}" class="thumbnail"  />
    {{/if}}

    <div class="text">
      <h3 class="bigger">{{ if $user->author->defined }}{{ $user->author->biography->first_name }} {{ $user->author->biography->last_name }}{{ else if $user->first_name }}{{ $user->first_name }} {{ $user->last_name }}{{else}}{{$user->uname}}{{ /if }}</h3>

      {{ if $user->author->defined }}<p>{{ $user->author->biography->text|strip_tags }}</p>
      {{else}}
      <p>{{ $user['bio']|escape }}</p>
      {{ /if }}

      {{ if $user['facebook'] }}Facebook: <a target="_blank" href="http://www.facebook.com/{{ $user['facebook']|escape:url }}" rel="nofollow">{{ $user['facebook']|escape }}</a><br />{{ /if }}
      {{ if $user['twitter'] }}Twitter: <a target="_blank" href="http://www.twitter.com/{{ trim($user['twitter'], '@')|escape:url }}" rel="nofollow">@{{ trim($user['twitter'], '@')|escape }}</a><br />{{ /if }}
      {{ if $user['google'] }}Google+: <a target="_blank" href="http://plus.google.com/{{ $user['google']|escape:url }}" rel="nofollow">{{ $user['google']|escape }}</a><br />{{ /if }}
      {{ if $user['website'] }}Website: <a target="_blank" href="http://{{ $user['website']|escape:url }}" rel="nofollow">{{ $user['website']|escape }}</a><br />{{ /if }}



    </div>
  </a>
  </div>
  <span class="clear"></span>
</div>

{{ assign var="index" value=$index+1 }}

{{ /foreach }}



  {{include file='_tpl/paginator-control.tpl'}}



{{/block}}