{{ config_load file="{{ $gimme->language->english_name }}.conf" }}



{{ if $gimme->article->type_name=="page"}}

  {{ include file="page.tpl" }}

{{ elseif $gimme->article->type_name=="Columnist"}}

  {{ include file="article-columnist.tpl" }}

{{ elseif $gimme->article->type_name == "debate" }}

  {{ include file="article-debate.tpl" }}

{{else}}

  {{ include file="_tpl/article-cont.tpl" }}

{{/if}}