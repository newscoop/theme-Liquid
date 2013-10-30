<div class="side_box hidden-phone">

    {{ list_articles ignore_issue="true" ignore_section="true" length="3"  constraints="section is 30 type is article"   }}

    {{if $gimme->current_list->at_beginning}}
    <h4 class="section_header grey">{{$gimme->section->name}}</h4>

      <ul class="blogs_list one_column">
    {{/if}}


        <li>
            <a href="{{url options="article"}}">
                       <div class="blog_icon grey_mask">
                         {{list_article_authors length="1"}}
                         {{ if $gimme->author->user->defined }}
                          <img src="{{ $gimme->author->user->image(99, 145) }}" />
                         {{ /if }}

                         {{/list_article_authors }}
                         <div class="mask"></div>
                       </div>

                       <div class="blog_item_short">
                         <h5 class="name">{{list_article_authors length="1"}}
                           {{ if $gimme->author->exists }}
                           {{ $gimme->author->biography->first_name }} {{
                           $gimme->author->biography->last_name }}
                           {{else}}
                           {{ $gimme->author->name }}
                           {{ /if }}
                           {{/list_article_authors}}</h5>
                           <h3 class="title">{{$gimme->article->name}}</h3>
                           <h6 class="date">{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y %H:%i" }}</h6>
                         </div>


                       </a>
        </li>


       {{if $gimme->current_list->at_end}}
         </ul>

         <p class="bottom_nav blue_nav">
             <a href="{{url options="section"}}" class="more">{{ if $gimme->language->english_name == "Georgian" }}მეტი ბლოგი{{elseif $gimme->language->english_name == "Russian"}}еще блоги{{else}}more blogs{{/if}}
</a>
         </p>


       {{/if}}





       {{/list_articles}}


</div>

