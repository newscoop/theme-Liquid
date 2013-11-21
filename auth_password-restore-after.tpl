{{extends file="layout.tpl"}}

{{block content}}
{{ assign var="userindex" value=1 }}
 <h3 class="normal_header">{{ #userAccount# }}</h3>

<div class="alert alert-info">

    <h5 class="checkHeading">{{ #weSentEmail# }}</h5>
    <p>{{ #pleaseCheckInbox# }}</p>
</div>

{{/block}}
