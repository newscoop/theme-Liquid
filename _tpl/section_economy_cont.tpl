
<div class="bloger_news_items">
  <div class="space_left_content">
    <ul>
      {{ list_articles ignore_issue="true" ignore_section="false" order="byPublishDate desc" length="10" constraints="section greater_equal 40 section smaller 50" }}

      {{if $gimme->current_list->index==4}}
      <li class="news_item">
        <div style="margin:1px auto; width:728px;">
          <!--/* OpenX Javascript Tag v2.8.10 */-->

          <!--/*
            * The backup image section of this tag has been generated for use on a
            * non-SSL page. If this tag is to be placed on an SSL page, change the
            *   'http://openx.sourcefabric.net/delivery/...'
            * to
            *   'https://openx.sourcefabric.net/delivery/...'
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
             var m3_u = (location.protocol=='https:'?'https://openx.sourcefabric.net/delivery/ajs.php':'http://openx.sourcefabric.net/delivery/ajs.php');
             var m3_r = Math.floor(Math.random()*99999999999);
             if (!document.MAX_used) document.MAX_used = ',';
             document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
             document.write ("?zoneid=200");
             document.write ('&amp;cb=' + m3_r);
             if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
             document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
             document.write ("&amp;loc=" + escape(window.location));
             if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
             if (document.context) document.write ("&context=" + escape(document.context));
             if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
             document.write ("'><\/scr"+"ipt>");
          //]]>--></script><noscript><a href='http://openx.sourcefabric.net/delivery/ck.php?n=af2172d9&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.sourcefabric.net/delivery/avw.php?zoneid=200&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=af2172d9' border='0' alt='' /></a></noscript>
        </div>
      </li>
      {{/if}}


      <li class="news_item">
        <div class="content content_text">

          {{ image rendition="section" }}
          <a href="{{url options="article"}}" class="thumbnail">

           <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"   />
           {{ include file="_tpl/article_icons.tpl" }}
         </a>
         {{/image}}



         <h6 class="info">{{list_article_authors}}
          {{if $gimme->current_list->index!=1}},&nbsp;{{/if}}

          {{ if $gimme->author->biography->first_name }}
          {{ $gimme->author->biography->first_name }} {{
          $gimme->author->biography->last_name }}
          {{ else }}
          {{ $gimme->author->name }}
          {{ /if }}
          {{if $gimme->current_list->at_end}}
          &nbsp;-&nbsp;{{/if}}{{/list_article_authors}}{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y, %H:%i" }}</h6>
          <h3 class="title"><a href="{{url options="article"}}">{{$gimme->article->name}}</a></h3>

          <p>{{$gimme->article->deck|strip_tags}}</p>
        </div>
      </li>

      {{if $gimme->current_list->at_end}}



    </ul>
  </div>
</div>

{{ include file="_tpl/pagination.tpl" }}
{{/if}}

{{/list_articles}}