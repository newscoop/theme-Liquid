{{extends file="layout.tpl"}}

{{block content}}

<div class="article_content bloger content_text white-box">
  <div class="clearfix">

 <h3 class="normal_header">{{ #userAccount# }}</h3>

<div class="alert alert-info">

    <h5 class="checkHeading">{{ #weSentEmail# }}</h5>
    <p>{{ #pleaseCheckInbox# }}</p>
</div>
</div>
</div>

{{/block}}
