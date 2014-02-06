{{extends file="layout.tpl"}}

{{block content}}

<div class="article_content bloger bloger_profile content_text">
  <div>
    {{if  $user->image(160, 200) }}
    <img src="{{ $user->image(160, 200) }}" class="thumbnail"  />
    {{else}}
    <img src="{{url static_file="_img/user-thumb.jpg" }}" class="thumbnail"  />
    {{/if}}

    <div class="text">
      <h3 class="bigger">{{ if $user->author->defined }}{{ $user->author->biography->first_name }} {{ $user->author->biography->last_name }}{{ else }}{{ $user->first_name }} {{ $user->last_name }}{{ /if }}</h3>

      {{ if $user->author->defined }}<p>{{ $user->author->biography->text|strip_tags }}</p>
      {{else}}
      <p>{{ $user['bio']|escape }}</p>
      {{ /if }}

      <p>
        {{ if $user['facebook'] }}Facebook: <a target="_blank" href="http://www.facebook.com/{{ $user['facebook']|escape:url }}" rel="nofollow">{{ $user['facebook']|escape }}</a><br />{{ /if }}
        {{ if $user['twitter'] }}Twitter: <a target="_blank" href="http://www.twitter.com/{{ trim($user['twitter'], '@')|escape:url }}" rel="nofollow">@{{ trim($user['twitter'], '@')|escape }}</a><br />{{ /if }}
        {{ if $user['google'] }}Google+: <a target="_blank" href="http://plus.google.com/{{ $user['google']|escape:url }}" rel="nofollow">{{ $user['google']|escape }}</a><br />{{ /if }}
        {{ if $user['website'] }}{{#Website#}}: <a target="_blank" href="http://{{ $user['website']|escape:url }}" rel="nofollow">{{ $user['website']|escape }}</a><br />{{ /if }}
      </p>

      {{ if $user->logged_in }}
      <a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">{{#editProfile#}}</a>
      {{/if}}

    </div>
  </div>
  <span class="clear"></span>
</div>




{{ include file="_tpl/user-content.tpl"  user=$user}}






{{/block}}


