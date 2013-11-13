
{{ if $gimme->current_list->count > $gimme->current_list->length }}

{{ $page=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
{{ $list_id=$gimme->current_list_id() }}
{{$listLength=10}}

<nav class="pagination">
 {{ unset_article }}

 {{ if $gimme->current_list->has_previous_elements }}

 <a href="{{ url options="previous_items" }}" class="arrow arrow_left" title="">{{#previous#}}
</a>


 {{/if}}

 {{assign var="allPages" value=($gimme->current_list->count/$listLength)|ceil  }}
 {{assign var="currentPage" value=$page/$listLength}}




 {{assign var="firstToShow" value=$currentPage-2}}
 {{assign var="lastToShow" value=$currentPage+5}}

 {{if $firstToShow < 1 }}
 {{assign var="firstToShow" value=1}}
 {{assign var="lastToShow" value=$lastToShow+3}}
 {{/if}}

 {{if $lastToShow > $allPages }}
 {{assign var="lastToShow" value=$allPages+1}}
 {{/if}}

 {{if $lastToShow-$firstToShow>0}}
 <div class="numbers">
  <ul>

  {{if $firstToShow>1}}
  <li class="firstlast"><a href="{{ url options="section" }}{{if $gimme->topic->identifier}}?tpid={{$gimme->topic->identifier}}{{/if}}">1</a></li>
  <li class="firstlast">...</li>
  {{/if}}
  {{section name=foo start=$firstToShow loop=$lastToShow}}

    {{if $smarty.section.foo.index-1==$currentPage}}

        <li class="current"><a>{{ $smarty.section.foo.index }}</a></li>

    {{else}}
        <li><a href="{{ url options="section" }}?{{$list_id}}={{ ($smarty.section.foo.index-1)*$listLength }}{{if $gimme->topic->identifier}}&tpid={{$gimme->topic->identifier}}{{/if}}">
        {{ $smarty.section.foo.index }} </a></li>
    {{/if}}
  {{/section}}

  {{if $lastToShow-1<$allPages}}
  <li class="firstlast">...</li>
  <li class="firstlast"><a href="{{ url options="section" }}?{{$list_id}}={{ ($allPages-1)*$listLength }}{{if $gimme->topic->identifier}}&tpid={{$gimme->topic->identifier}}{{/if}}">{{$allPages}}</a></li>
  {{/if}}

    </ul>
  </div>
  {{/if}}


    {{ if $gimme->current_list->has_next_elements }}

    <a href="{{ url options="next_items" }}" class="arrow arrow_right" title="">{{#next#}}</a>

    {{ /if }}
  </nav>

  {{ /if }}










