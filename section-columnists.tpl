{{extends file="layout.tpl"}}

{{block content}}

{{ dynamic }}
{{ $params = implode(',', array($gimme->url->get_parameter("ls-art0"), $gimme->url->get_parameter("ls-art1"))) }}
{{  render file="_tpl/section_columnist_cont.tpl" params=$params }}
{{ /dynamic }}

{{$columnistDate= "-18 months"|date_format:'%Y-%m-%d'}}


  <div class="columnist_list content_text">
    <h2>Yazarlar</h2>
    <br /><br />
{{ list_section_authors order="byfirst_name asc" columns="4" constraints="published greater `$columnistDate`" }}


{{if $gimme->current_list->column == 1}}
  <div class="row">

{{/if}}

<div class="article_content  span3" >
  <div class="">
    {{ if $gimme->author->user->defined }}
    <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
      {{/if}}



      <h3>{{ if $gimme->author->biography->first_name }}{{  $gimme->author->biography->first_name }} {{  $gimme->author->biography->last_name }}{{else}} {{ $gimme->author->name }}{{ /if }}</h3>









    {{ if $gimme->author->user->defined }}
  </a>
  {{/if}}
  </div>
  <span class="clear"></span>
</div>

{{if $gimme->current_list->column == 4 OR $gimme->current_list->at_end}}
 </div>
{{/if}}

{{ /list_section_authors }}


</div>




  <div class="columnist_list content_text">
    <h2>Yazarlar Arşivi</h2>
    <br /><br />
{{ list_section_authors order="byfirst_name asc" columns="4"  }}


{{if $gimme->current_list->column == 1}}
  <div class="row">

{{/if}}

<div class="article_content  span3" >
  <div class="">
    {{ if $gimme->author->user->defined }}
    <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
      {{/if}}



      <h3>{{ if $gimme->author->biography->first_name }}{{  $gimme->author->biography->first_name }} {{  $gimme->author->biography->last_name }}{{else}} {{ $gimme->author->name }}{{ /if }}</h3>









    {{ if $gimme->author->user->defined }}
  </a>
  {{/if}}
  </div>
  <span class="clear"></span>
</div>

{{if $gimme->current_list->column == 4 OR $gimme->current_list->at_end}}
 </div>
{{/if}}

{{ /list_section_authors }}


</div>




{{/block}}