<!-- Titlebar -->
<header id="titlebar">


  <div class="search_area" >
    <span class="icon_link icon_search">{{ #search# }}:</span>

    {{ search_form template="search.tpl" submit_button="" }}
    {{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"{{ #keywords# }}\"" }}
    {{ /search_form }}



  </div>
  {{dynamic}}
  {{ if !$gimme->user->logged_in }}
  <a href="{{ $view->url(['controller' => 'register', 'action' => 'index'], 'default') }}" class="icon_link icon_padlock " id="registerButtonFront">{{ #Register# }}</a>

  <a href="#" class="icon_link icon_key open_login_popup">{{ #Login# }}</a>
  {{/if}}
  {{/dynamic}}
</header>
<!-- End Titlebar -->

<!-- Top -->
<header id="top">
  <div class="top_content">
    <a href="http://{{ $gimme->publication->site }}" id="logo" title="{{ $gimme->publication->name }}"></a>
    <div class="add">
     here goes the ad
     </div>
   </div>

   <div class="logo_bottom"><div class="text"></div></div>
 </header>
 <!-- End Top -->

 <!-- Top Menu -->
 <nav id="top_menu" >
  <ul class="menu">
    <li {{ if  $gimme->template->name|strstr:"front.tpl"  }} class="current" {{ /if }}><a href="http://{{ $gimme->publication->site }}/">{{ #home# }}</a></li>



    {{ local }}
    {{ set_current_issue }}
    {{ list_sections }}
    <li{{ if ($gimme->section->number == $gimme->default_section->number) }} class="current"{{ /if }}><a href="{{ url options="section" }}" title="{{ #viewAllPosts# }} {{ $gimme->section->name }}">{{ $gimme->section->name }}</a></li>
    {{ /list_sections }}





  </ul>
</nav>
<!-- End Top Menu -->

<!-- Outer Side Menu -->
<nav id="outer_side_menu">
  <ul class="menu" >

   {{ list_sections }}
   <li{{ if ($gimme->section->number == $gimme->default_section->number) }} class="current"{{ /if }}><a href="{{ url options="section" }}" title="{{ #viewAllPosts# }} {{ $gimme->section->name }}">{{ $gimme->section->name }}</a></li>
   {{ /list_sections }}
 </ul>
</nav>
<!-- End Outer Side Menu -->

{{/local}}

