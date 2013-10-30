{{ include file="_tpl/_html-head.tpl" }}



{{ include file="_tpl/header.tpl" }}





<section id="content" class="content_text container">

  <section id="home_content_top" class="row">
    <section id="main_news" class="span11 hidden-phone">
      <ul class="elements row">

        {{list_playlist_articles id="2" length="3"}}
        {{ assign var="featured_cond" value="`$featured_cond` number not `$gimme->article->number` " }}
        <li class="span11">
          <a href="{{url options="article"}}">
            {{ image rendition="front_slideshow" }}
            <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"  class="float_left thumbnail" />
            {{/image}}


            <div class="news_content">
              <h3 class="title">{{$gimme->article->name}}</h3>
              <p class="visible-desktop">{{$gimme->article->deck|strip_tags|truncate:300:"...":false}}</p>

            </div>
          </a>
        </li>
        {{/list_playlist_articles}}
      </ul>

      <ul class="navigation hidden-phone">
        <li class="current"><a href="#"></a></li>
        <li><a href="#"></a></li>
        <li ><a href="#"></a></li>
      </ul>

    </section>


    <section class="span11 articles_box visible-phone">
      <ul class="articles_list row">

        {{list_playlist_articles id="2" length="3"}}
        {{ assign var="featured_cond" value="`$featured_cond` number not `$gimme->article->number` " }}
        <li class="span11">
          <a href="{{url options="article"}}">
            {{ image rendition="front_slideshow" }}
            <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"  class="float_left thumbnail margin_right_10" />
            {{/image}}



            <h3 class="title margin">{{$gimme->article->name}}</h3>

          </a>
        </li>
        {{/list_playlist_articles}}
      </ul>

    </section>




    <section id="home_top_news_items" class="span5">

      {{ list_articles ignore_issue="true" ignore_section="true" length="4" constraints="section is 10 $featured_cond"  }}
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




    </section>
    <span class="clear"></span>
  </section>

  <div class="row">
  <div class="span16 hidden-phone">
    <div style="margin:10px auto 10px auto; width:728px; display:block; ">


   <!--/* OpenX Javascript Tag v2.8.8 */-->

   <!--/*
     * The backup image section of this tag has been generated for use on a
     * non-SSL page. If this tag is to be placed on an SSL page, change the
     *   'http://openx.internews.ge/www/delivery/...'
     * to
     *   'https://openx.internews.ge/www/delivery/...'
     *
     * This noscript section of this tag only shows image banners. There
     * is no width or height in these banners, so if you want these tags to
     * allocate space for the ad before it shows, you will need to add this
     * information to the <img> tag.
     *
     * If you do not want to deal with the intricities of the noscript
     * section, delete the tag (from <noscript>... to </noscript>). On
     * average, the noscript tag is called from less than 1% of internet
     * users.
     */-->

   <script type='text/javascript'><!--//<![CDATA[
      var m3_u = (location.protocol=='https:'?'https://openx.internews.ge/www/delivery/ajs.php':'http://openx.internews.ge/www/delivery/ajs.php');
      var m3_r = Math.floor(Math.random()*99999999999);
      if (!document.MAX_used) document.MAX_used = ',';
      document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
      document.write ("?zoneid=10");
      document.write ('&amp;cb=' + m3_r);
      if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
      document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
      document.write ("&amp;loc=" + escape(window.location));
      if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
      if (document.context) document.write ("&context=" + escape(document.context));
      if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
      document.write ("'><\/scr"+"ipt>");
   //]]>--></script><noscript><a href='http://openx.internews.ge/www/delivery/ck.php?n=a613e241&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.internews.ge/www/delivery/avw.php?zoneid=10&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a613e241' border='0' alt='' /></a></noscript>
</div>
  </div>
  </div>

  <section id="home_top_boxes" class="hidden-phone">
    <ul class="box_buttons row">
      <li class="orange span3">
        {{local}}
        {{set_issue number="10"}}
        {{set_section number="1"}}
        <a href="{{url options="section"}}" class="button_content">
          <h3 class="title">
            {{ if $gimme->language->english_name == "Georgian" }}მედია რუკა{{elseif $gimme->language->english_name == "Russian"}}Карта Mедии{{else}}Media Map{{/if}}
          </h3>
        </a>
      </li>
      <li class="green span3">
        {{set_issue number="11"}}
        {{set_section number="1"}}

        <a href="{{url options="section"}}" class="button_content">
          <h3 class="title">
            {{ if $gimme->language->english_name == "Georgian" }}ბიბლიოთეკა{{elseif $gimme->language->english_name == "Russian"}}Библиотека{{else}}Library{{/if}}
          </h3>
        </a>
      </li>
      {{set_section number="2"}}
      <li class="blue span3">
        <a href="{{url options="section"}}?tpid=120" class="button_content">
          <h3 class="title">{{ if $gimme->language->english_name == "Georgian" }}მედია მონიტორინგი{{elseif $gimme->language->english_name == "Russian"}}Медия мониторинг{{else}}Media monitoring{{/if}}</h3>
        </a>
        {{/local}}
      </li>
      <li class="grey span7">
        <div class="button_content">
          <h3 class="title">


            <form action="{{ if $gimme->language->english_name == "Georgian" }}http://media.us6.list-manage.com/subscribe/post?u=2a169aafd71df152c13ea2adb&amp;id=0fbff54d72{{elseif $gimme->language->english_name == "Russian"}}http://media.us6.list-manage.com/subscribe/post?u=2a169aafd71df152c13ea2adb&amp;id=081cebe897{{else}}http://media.us6.list-manage.com/subscribe/post?u=2a169aafd71df152c13ea2adb&amp;id=415b549298{{/if}}" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate float_right" target="_blank" novalidate c>
            <input type="email" value="" name="EMAIL" class="email input_text" id="mce-EMAIL" placeholder="email address" required  />
            <button type="submit" name="subscribe" id="mc-embedded-subscribe" ></button>
          </form>
          <span class="visible-desktop">{{ if $gimme->language->english_name == "Georgian" }}გამოიწერეთ Media.Ge-ს ბიულეტენი{{elseif $gimme->language->english_name == "Russian"}}Подписаться на рассылку{{else}}Subscribe to our newsletter{{/if}}
          </span>
        </h3>
      </div>
    </li>
  </ul>
</section>




{{$flag=0}}
{{assign var="now" value=$smarty.now}}
{{ list_articles ignore_issue="true" ignore_section="true" length="20" constraints="section is 50 topic is 105"  }}

{{if $now|camp_date_format:"%y%m%d"<=$gimme->article->deadline|camp_date_format:"%y%m%d" }}

{{if !$flag}}
<section id="announcement">
  <h4 class="annoucement border_box green_box">
    <span class="date">{{$gimme->article->deadline|camp_date_format:"%d.%m.%Y"}}</span>
    <a href="{{url options="article"}}" class="title">{{$gimme->article->name}}</a>
  </h4>
</section>
{{/if}}
{{$flag=1}}
{{/if}}
{{/list_articles}}

  <div class="row">
  <div class="span16 hidden-phone">
    <div style="margin:10px auto 10px auto; width:728px; display:block; ">


   <script type='text/javascript'><!--//<![CDATA[
      var m3_u = (location.protocol=='https:'?'https://openx.internews.ge/www/delivery/ajs.php':'http://openx.internews.ge/www/delivery/ajs.php');
      var m3_r = Math.floor(Math.random()*99999999999);
      if (!document.MAX_used) document.MAX_used = ',';
      document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
      document.write ("?zoneid=11");
      document.write ('&amp;cb=' + m3_r);
      if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
      document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
      document.write ("&amp;loc=" + escape(window.location));
      if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
      if (document.context) document.write ("&context=" + escape(document.context));
      if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
      document.write ("'><\/scr"+"ipt>");
   //]]>--></script><noscript><a href='http://openx.internews.ge/www/delivery/ck.php?n=aebfe2ae&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.internews.ge/www/delivery/avw.php?zoneid=11&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=aebfe2ae' border='0' alt='' /></a></noscript>

</div>
  </div>
  </div>

<section id="home_top_columns" class="row">

  <div class="video_box span6">

    <h3 class="header section_header">{{ if $gimme->language->english_name == "Georgian" }}ვიდეო{{elseif $gimme->language->english_name == "Russian"}}Видео{{else}}Videos{{/if}}</h3>

    <ul class="news_items_simple">
     {{ list_articles ignore_issue="true" ignore_section="true" length="4" constraints="video is on"  }}

     <li class="news_item">
      <a href="{{url options="article"}}">
        {{if $gimme->current_list->index==1}}
        {{if $gimme->article->youtube_id }}
        <div class="margin_bottom_5">
          <iframe  src="http://www.youtube.com/embed/{{$gimme->article->youtube_id}}"  width="920" height="520" allowfullscreen="true"></iframe>
        </div>
        {{/if}}
        {{/if}}
        <h6 class="date">{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y %H:%i" }}</h6>
        <h4 class="title">{{$gimme->article->name}}</h4>
      </a>
    </li>



    {{/list_articles}}

  </ul>


 <div style="margin:5px auto; ">
      <script type='text/javascript'><!--//<![CDATA[
         var m3_u = (location.protocol=='https:'?'https://openx.internews.ge/www/delivery/ajs.php':'http://openx.internews.ge/www/delivery/ajs.php');
         var m3_r = Math.floor(Math.random()*99999999999);
         if (!document.MAX_used) document.MAX_used = ',';
         document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
         document.write ("?zoneid=13");
         document.write ('&amp;cb=' + m3_r);
         if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
         document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
         document.write ("&amp;loc=" + escape(window.location));
         if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
         if (document.context) document.write ("&context=" + escape(document.context));
         if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
         document.write ("'><\/scr"+"ipt>");
      //]]>--></script><noscript><a href='http://openx.internews.ge/www/delivery/ck.php?n=a827e8d8&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.internews.ge/www/delivery/avw.php?zoneid=13&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a827e8d8' border='0' alt='' /></a></noscript>
 </div>


  {{set_section number="40"}}
  <p class="bottom_nav orange_nav">
    <a href="{{url options="section"}}" class="more">{{ if $gimme->language->english_name == "Georgian" }}მეტი ვიდეო{{elseif $gimme->language->english_name == "Russian"}}еще видео{{else}}more videos{{/if}}</a>
  </p>
  {{unset_section}}
</div>

<div class="blogs_box span4">


 {{ list_articles ignore_issue="true" ignore_section="true" length="2"  constraints="section is 30 type is article"   }}

 {{if $gimme->current_list->at_beginning}}
 <h4 class="section_header header">{{$gimme->section->name}}</h4>

 <ul class="blogs_list one_column">
   {{/if}}


   <li>
     <a href="{{url options="article"}}">
      <div class="blog_icon grey_mask">
        {{list_article_authors length="1"}}
        <img src="{{ $gimme->author->user->image(99, 145) }}" />
        {{/list_article_authors }}
        <div class="mask"></div>
      </div>

      <div class="blog_item_short">
        <h5 class="name">{{list_article_authors length="1"}}
          {{ if $gimme->author->biography }}
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
   <div style="margin:5px auto; ">
      <script type='text/javascript'><!--//<![CDATA[
         var m3_u = (location.protocol=='https:'?'https://openx.internews.ge/www/delivery/ajs.php':'http://openx.internews.ge/www/delivery/ajs.php');
         var m3_r = Math.floor(Math.random()*99999999999);
         if (!document.MAX_used) document.MAX_used = ',';
         document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
         document.write ("?zoneid=12");
         document.write ('&amp;cb=' + m3_r);
         if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
         document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
         document.write ("&amp;loc=" + escape(window.location));
         if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
         if (document.context) document.write ("&context=" + escape(document.context));
         if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
         document.write ("'><\/scr"+"ipt>");
      //]]>--></script><noscript><a href='http://openx.internews.ge/www/delivery/ck.php?n=a2f86783&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.internews.ge/www/delivery/avw.php?zoneid=12&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a2f86783' border='0' alt='' /></a></noscript>
</div>


  <p class="bottom_nav blue_nav">
    <a href="{{url options="section"}}" class="more">{{ if $gimme->language->english_name == "Georgian" }}მეტი ბლოგი{{elseif $gimme->language->english_name == "Russian"}}еще блоги{{else}}more blogs{{/if}}</a>
  </p>


  {{/if}}





  {{/list_articles}}

</div>

<div class="articles_box span6">


  <h3 class="header section_header"> {{ if $gimme->language->english_name == "Georgian" }}სტატიები{{elseif $gimme->language->english_name == "Russian"}}Статьи{{else}}Articles{{/if}}</h3>

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
   <a href="{{url options="section"}}" class="more"> {{ if $gimme->language->english_name == "Georgian" }}მეტი{{elseif $gimme->language->english_name == "Russian"}}еще{{else}}more articles{{/if}}</a>
 </p>


 {{/if}}




 {{/list_articles}}


</div>

</section>

<section id="home_middle_columns" class="row">
  <section id="photostory_box" class="span8">

    <h3 class="green section_header"> {{ if $gimme->language->english_name == "Georgian" }}ფოტორეპორტაჟი{{elseif $gimme->language->english_name == "Russian"}}Фоторепортаж{{else}}Photostory{{/if}}</h3>

    <div class="photostory_box">
      {{ list_articles ignore_issue="true" ignore_section="true" length="1" order="byPublishdate desc" constraints="type is article photostory is on"   }}
      <a href="{{url options="article"}}">
        {{ image rendition="front_photostory" }}
        <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"  class="thumbnail" />
        {{/image}}

        <h4 class="title">{{$gimme->article->name}}</h4>
      </a>
      {{/list_articles}}
    </div>

  </section>


  <section id="most_popular" class="span4">
    <h3 class="orange section_header"> {{ if $gimme->language->english_name == "Georgian" }}ყველაზე პოპულარული{{elseif $gimme->language->english_name == "Russian"}}Самый популярный {{else}}Most Popular{{/if}}</h3>



    {{ list_articles ignore_issue="true" ignore_section="true" length="4"  order="byPopularity desc" constraints="type is article"   }}
    {{if $gimme->current_list->at_beginning}}
    <ul class="news_items_simple">
      {{/if}}

      <li class="news_item">
        <a href="{{url options="article"}}">
         <h6 class="date">{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y %H:%i" }}</h6>
         <h4 class="title">{{$gimme->article->name}}</h4>
       </a>
     </li>

     {{if $gimme->current_list->column==4 OR $gimme->current_list->at_end}}
   </ul>




   {{/if}}





   {{/list_articles}}






 </section>

 <div class="span4 margin_top_5">

   {{ include file="_tpl/sidebar-fbrecomend.tpl" }}

 </div>


</section>

  <div class="row">
  <div class="span16 hidden-phone">
    <div style="margin:10px auto 10px auto; width:728px; display:block; ">

      <script type='text/javascript'><!--//<![CDATA[
         var m3_u = (location.protocol=='https:'?'https://openx.internews.ge/www/delivery/ajs.php':'http://openx.internews.ge/www/delivery/ajs.php');
         var m3_r = Math.floor(Math.random()*99999999999);
         if (!document.MAX_used) document.MAX_used = ',';
         document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
         document.write ("?zoneid=14");
         document.write ('&amp;cb=' + m3_r);
         if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
         document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
         document.write ("&amp;loc=" + escape(window.location));
         if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
         if (document.context) document.write ("&context=" + escape(document.context));
         if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
         document.write ("'><\/scr"+"ipt>");
      //]]>--></script><noscript><a href='http://openx.internews.ge/www/delivery/ck.php?n=a95cc728&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.internews.ge/www/delivery/avw.php?zoneid=14&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a95cc728' border='0' alt='' /></a></noscript>

</div>
  </div>
  </div>

{{ include file="_tpl/event-boxes.tpl" }}


</section>


{{ include file="_tpl/footer.tpl" }}

{{ include file="_tpl/_html-foot.tpl" }}