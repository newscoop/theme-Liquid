
<!doctype html>
<html lang="tr">
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

  <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
  Remove this if you use the .htaccess -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
  <meta name="author" content="Tomasz Rondio" >
  {{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
  {{* if an article is active, meta-description of web page will be article's intro, otherwise it will pull site's description from System Preferences (/Configure/System Preferences) *}}
  <meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">
  {{* if an article is active, meta-keywords will be generated of article keywords (defined on article edit screen), otherwise it will use site-wide keywords from System Preferences (/Configure/System Preferences) *}}
  <meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{$siteinfo.keywords}}{{ /if }}" />


  <!-- RSS & Pingback -->
  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://{{ $gimme->publication->site }}/en/static/rss/">

  {{ if $gimme->article->defined }}{{* Open Graph protocol metatags for Facebook sharing *}}
  <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|strip|escape:'html':'utf-8'|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
  <meta property="og:type" content="article" />
  <meta property="og:url" content="http://{{ $gimme->publication->site }}{{ uri }}" />
  <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
  <meta property="og:description" content="{{$gimme->article->deck|strip_tags:false|trim|escape:'html':'utf-8' }}{{if !$gimme->article->deck}}{{$gimme->article->full_text|strip_tags:false|trim|escape:'html':'utf-8' }}{{/if}}" />
  {{ list_article_images }}
  <meta property="og:image" content="{{ $gimme->article->image->imageurl }}" />
  {{ /list_article_images }}
  {{ /if }}

  <!-- Mobile viewport optimized: j.mp/bplateviewport -->


  <!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
  <link rel="shortcut icon" href="{{ url static_file='_img/favicon.ico' }}">



  <!-- CSS: implied media="all" -->

  <link rel="stylesheet" href="{{ url static_file='_css/style.css' }}">



        <!--[if lt IE 9]>
            <script src="{{ url static_file='_js/html5.js' }}" type="text/javascript"></script>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
            <![endif]-->


            <script src="{{ url static_file='_js/jquery.js' }}" type="text/javascript"></script>


            <!-- Video.js -->
            <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
            <script src="http://vjs.zencdn.net/c/video.js"></script>





          </head>
          <body>
            <div id="cover">

            </div>

            <div class="container">
              <div id="login_popup" class="popup span6 offset3">
                <a href="#" class="close"></a>
                <div class="content content_text">
                  {{dynamic}}
                  <h3 class="popup_title bigger">{{ if $gimme->user->logged_in }}Giriş yapıldı{{else}}Taraf'a giriş{{/if}}</h3>
                  <div class="styled_form login_form">
                    {{ if $gimme->user->logged_in }}
                    <ul>
                      <li><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">Benim sayfam</a></li>
                      <li><a href="{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}">Cıkış</a></li>
                    </ul>
                    {{ else }}

                    <ul id="logininfo" style="display:none">
                      <li><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">Benim sayfam</a></li>
                      <li><a href="{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}">Cıkış</a></li>
                    </ul>

                    <form name="login" action="/auth" method="post" id="loginform">



                     <div class="field_row row">
                       <label for="l_field_login" class="span2">Email</label>
                       <div class="span3">
                        <input type="email" name="email" >
                      </div>
                    </div>


                    <div class="field_row row">
                     <label for="l_field_password" class="span2">Parola</label>
                     <div class="span3">
                       <input type="password" name="password">
                     </div>
                   </div>

                   <div class="field_row row">
                     <div class="span3 offset2">
                       <ul class="login_menu float_left">
                         <li><a href="/auth/password-restore">Parolamı unuttum</a></li>
                         <li><a href="/register">Yeni kullanıcı</a></li>
                       </ul>
                       <input type="submit"  value="Giriş" class="float_right">


                     </div>
                   </div></form>



                   {{/if}}
                   {{/dynamic}}
                 </div>
               </div>
             </div>
           </div>






