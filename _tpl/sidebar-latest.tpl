<div class="side_box hidden-phone">
  <h3 class="section_header blue"> {{ if $gimme->language->english_name == "Georgian" }}ბოლო სტატიები{{elseif $gimme->language->english_name == "Russian"}}Последние статьи{{else}}Latest Articles{{/if}}</h3>





  {{ list_articles ignore_issue="true" ignore_section="true" length="4" columns="2" order="byPublishdate desc" constraints="section is 20 type is article"   }}
  {{if $gimme->current_list->column==1}}
  <ul class="articles_list row">
    {{/if}}

    <li class="span3">
     <a href="{{url options="article"}}">
       <div class="article_thumbnail">
         {{ image rendition="square" }}
         <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"  class="thumbnail" />
         {{/image}}
         {{list_article_topics length="1"}}
         <h5 class="label label_blue">{{$gimme->topic->name}}</h5>
         {{/list_article_topics}}
       </div>

       <h6 class="date">{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y %H:%i" }}</h6>
       <h4 class="title">{{$gimme->article->name}}</h4>
     </a>
   </li>
   {{if $gimme->current_list->column==2 OR $gimme->current_list->at_end}}
 </ul>




 {{/if}}

 {{if $gimme->current_list->index==2}}
 <div class="row">
  <div class="span6 hidden-phone">
   {{ include file="_tpl/banner-right-code.tpl" }}
            </div>
          </div>
          {{/if}}

          {{if $gimme->current_list->at_end}}


          <p class="bottom_nav orange_nav">
           <a href="{{url options="section"}}" class="more">{{ if $gimme->language->english_name == "Georgian" }}მეტი{{elseif $gimme->language->english_name == "Russian"}}еще{{else}}more{{/if}}
           </a>
         </p>


         {{/if}}





         {{/list_articles}}






       </div>