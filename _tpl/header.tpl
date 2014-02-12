<div class="header_wrap">
  <div class="container">
<!-- Titlebar -->
<nav id="mobilemenu" class="visible-phone">
  <ul class="menu">
    <li {{ if  $gimme->template->name|strstr:"front.tpl"  }} class="current" {{ /if }}><a href="http://{{ $gimme->publication->site }}/">{{ #home# }}</a></li>



    {{ local }}
    {{ set_current_issue }}
    {{ list_sections }}
    <li{{ if ($gimme->section->number == $gimme->default_section->number) }} class="current"{{ /if }}><a href="{{ url options="section" }}" title="{{ #viewAllPosts# }} {{ $gimme->section->name }}">{{ $gimme->section->name }}</a></li>
    {{ /list_sections }}

    <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default') }}" title="Community index">{{ #community# }}</a></li>



  </ul>

<div class="mobile-search">

    {{ search_form template="search.tpl" submit_button="" }}
    {{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"{{ #search# }}\"" }}
    {{ /search_form }}

</div>



  </nav>
<header id="titlebar">


  <div class="search_area hidden-phone" >

    {{ search_form template="search.tpl" submit_button="" }}
    {{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"{{ #Search# }}\"" }}
    {{ /search_form }}



  </div>
  {{dynamic}}
  {{ if !$gimme->user->logged_in }}
  <a href="{{ $view->url(['controller' => 'register', 'action' => 'index'], 'default') }}" class="icon_link icon_padlock hidden-phone" id="registerButtonFront">{{ #Register# }}</a>

  <a href="#" class="icon_link icon_key open_login_popup hidden-phone">{{ #Login# }}</a>

<div class="logininfo" style="display:none">
  <a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}" class="icon_link hidden-phone">{{ #myprofile# }}</a>

    <a href="{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}?t={{ time() }}" class="icon_link icon_key hidden-phone">{{ #logout# }}</a>
</div>
  {{else}}
  <a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}" class="icon_link hidden-phone">{{ #myprofile# }}</a>

    <a href="{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}?t={{ time() }}" class="icon_link icon_key hidden-phone">{{ #logout# }}</a>
  {{/if}}
  {{/dynamic}}



  <button class="navbar-toggle visible-phone" type="button" id="mobilemenuopen" >
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

</header>
<!-- End Titlebar -->

<!-- Top -->
<header id="top" class="padding_bottom_10">
  <div class="top_content">
    <a href="http://{{ $gimme->publication->site }}" id="logo" title="{{ $gimme->publication->name }}"></a>
    <a target="_blank" href="https://www.sourcefabric.org/en/about/jobs/" class="add">
                  <img src="{{ url static_file='_img/ads/top.png' }}" alt="" />
                </a>
   </div>

 </header>
 <!-- End Top -->
   </div>
 </div>




 <div class="menu_wrap">
   <div class="container">
 <!-- Top Menu -->
 <nav id="top_menu" class="hidden-phone" >
  <ul class="menu">
    <li {{ if  $gimme->template->name|strstr:"front.tpl"  }} class="current" {{ /if }}><a href="http://{{ $gimme->publication->site }}/">{{ #home# }}</a></li>





    {{ list_sections }}
    <li{{ if ($gimme->section->number == $gimme->default_section->number) }} class="current"{{ /if }}><a href="{{ url options="section" }}" title="{{ #viewAllPosts# }} {{ $gimme->section->name }}">{{ $gimme->section->name }}</a></li>
    {{ /list_sections }}

    <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default') }}" title="Community index">{{ #community# }}</a></li>



  </ul>
</nav>
<!-- End Top Menu -->



{{/local}}

  </div>
</div>