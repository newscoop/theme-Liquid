<div class="side_box hidden-phone">

    {{ list_articles ignore_issue="true" ignore_section="true" length="4" constraints="section is 10"  }}
    {{if $gimme->current_list->index==1}}
    <h4 class="section_header orange">{{$gimme->section->name}}</h4>

    <ul class="news_items_simple">
        {{/if}}
        <li class="news_item">
            <a href="{{url options="article"}}">
                <h6 class="date">{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y %H:%i" }}</h6>
                <h4 class="title">{{$gimme->article->name}}</h4>
            </a>
        </li>


        {{if $gimme->current_list->at_end}}
    </ul>
    {{/if}}

    {{/list_articles}}









</div>