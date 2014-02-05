{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include file="_tpl/_html-head.tpl" }}

<div class="header_wrap">
  <div class="container">
    {{ include file="_tpl/header.tpl" }}
  </div>
</div>


<div id="page" class="container">

    <!-- Content -->
    <section id="content">
      {{block content}}{{/block}}

    </section>
    <!-- End Content -->




</div>


{{ include file="_tpl/footer.tpl" }}
{{ include file="_tpl/_html-foot.tpl" }}
