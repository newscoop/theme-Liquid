<div class="side_box hidden-phone">
  <h4 class="section_header green">{{ if $gimme->language->english_name == "Georgian" }}ფოტორეპორტაჟი{{elseif $gimme->language->english_name == "Russian"}}Фоторепортаж{{else}}Photostories{{/if}}
</h4>

    <ul class="photostories_list grey_bg">
        {{ list_articles ignore_issue="true" ignore_section="true" length="6" order="byPublishdate desc" constraints="type is article photostory is on"   }}


          <li><a href="{{url options="article"}}">{{ image rendition="event" }}
          <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"  />
          {{/image}}</a></li>

          {{/list_articles}}


    </ul>
</div>