

<!-- Footer -->
<footer id="footer">
  <div class="container">
      <ul id="footer_menu_first" class="menu">
        {{local}}
        {{set_current_issue}}
          {{ assign var="secno" value=10 }}

                 {{ while $secno < 90 }}
                 {{ assign var="nextsecno" value=$secno+10 }}
                 {{ set_section number=$secno }}

                 <li {{ if  $gimme->section->number==$gimme->default_section->number  }} class="current" {{ /if }} ><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>

                 {{ $secno = $secno+10 }}
                 {{ /while }}





        </ul>

        <ul id="footer_menu_first" class="menu">

            {{ assign var="secno" value=200 }}

                   {{ while $secno < 240 }}

                   {{if $secno==200 or $secno==230}}
                   {{ set_section number=$secno }}

                   <li {{ if  $gimme->section->number==$gimme->default_section->number  }} class="current" {{ /if }} ><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                   {{/if}}
                   {{ $secno = $secno+10 }}
                   {{ /while }}

        </ul>

        <ul id="footer_menu_second" class="menu">

                 {{ list_articles ignore_issue="true" ignore_section="true" order="bySectionOrder asc" constraints="issue is 1 section is 5 type is page"}}
            <li><a href="{{ uri options="article" }}" title="{{ $gimme->article->name }}">{{ $gimme->article->name }}</a></li>
            {{ /list_articles }}

             <li><a href="http://feeds.feedburner.com/Taraf">RSS</a></li>
            {{/local}}
        </ul>


    </div>
</footer>
<!-- End Footer -->