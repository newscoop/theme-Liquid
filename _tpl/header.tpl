<!-- Titlebar -->
<header id="titlebar">


    <div class="search_area" style="display:none;">
        <span class="icon_link icon_search">Haber Ara:</span>

        {{ search_form template="search.tpl" submit_button="" }}
                            {{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"{{ #keywords# }}\"" }}
                            {{ /search_form }}



    </div>
    {{dynamic}}
    {{ if !$gimme->user->logged_in }}
    <a href="{{ $view->url(['controller' => 'register', 'action' => 'index'], 'default') }}" class="icon_link icon_padlock " id="registerButtonFront">Üye OL</a>
    {{/if}}
    <a href="#" class="icon_link icon_key open_login_popup">Giriş</a>
    {{/dynamic}}
</header>
<!-- End Titlebar -->

<!-- Top -->
<header id="top">
    <div class="top_content">
        <a href="http://{{ $gimme->publication->site }}" id="logo"></a>
        <div class="add">
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
          document.write ("?zoneid=195");
          document.write ('&amp;cb=' + m3_r);
          if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
          document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
          document.write ("&amp;loc=" + escape(window.location));
          if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
          if (document.context) document.write ("&context=" + escape(document.context));
          if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
          document.write ("'><\/scr"+"ipt>");
       //]]>--></script><noscript><a href='http://openx.sourcefabric.net/delivery/ck.php?n=ac43551b&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://openx.sourcefabric.net/delivery/avw.php?zoneid=195&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=ac43551b' border='0' alt='' /></a></noscript>
        </div>
    </div>

    <div class="logo_bottom"><div class="text"></div></div>
</header>
<!-- End Top -->

<!-- Top Menu -->
<nav id="top_menu" {{if $gimme->default_section->number>39 AND $gimme->default_section->number<50}} class="open_submenu" {{/if}} >
    <ul class="menu">
        <li {{ if  $gimme->template->name|strstr:"front.tpl"  }} class="current" {{ /if }}><a href="http://{{ $gimme->publication->site }}/">Anasayfa</a></li>
{{local}}

{{set_current_issue}}
        {{ assign var="secno" value=10 }}

        {{ while $secno < 90 }}
        {{ assign var="nextsecno" value=$secno+10 }}
        {{ set_section number=$secno }}
        <li {{ if $gimme->default_issue->number!="1" && ($gimme->section->number==$gimme->default_section->number OR ($gimme->default_section->number%10!=0 && $gimme->section->number==40)) }} class="current" {{ /if }} ><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a>

        {{ list_sections constraints="number greater $secno number smaller $nextsecno" }}
            {{if $gimme->current_list->at_beginning}}
            <ul>

            {{/if}}
           <li {{if $gimme->section->number==$gimme->default_section->number}} class="current" {{/if}}><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
         {{if $gimme->current_list->at_end}}
         </ul>

         {{/if}}
        {{ /list_sections }}
    </li>

        {{ $secno = $secno+10 }}
        {{ /while }}





    </ul>
</nav>
<!-- End Top Menu -->

<!-- Outer Side Menu -->
<nav id="outer_side_menu">
    <ul class="menu" >
     {{ assign var="secno" value=10 }}

        {{ while $secno < 90 }}
        {{ assign var="nextsecno" value=$secno+10 }}
        {{ set_section number=$secno }}

        <li {{ if  $gimme->section->number==$gimme->default_section->number  }} class="current" {{ /if }} ><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>

        {{ $secno = $secno+10 }}
        {{ /while }}
    </ul>
</nav>
<!-- End Outer Side Menu -->

{{/local}}

