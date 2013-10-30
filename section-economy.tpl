{{ include file="_tpl/_html-head.tpl" }}



<div id="page" class="container">





  {{ include file="_tpl/header.tpl" }}




  <!-- Content -->
  <section id="content">

    {{ dynamic }}
    {{ $params = implode(',', array($gimme->url->get_parameter("ls-art0"), $gimme->url->get_parameter("ls-art1"))) }}
    {{  render file="_tpl/section_economy_cont.tpl" params=$params }}
    {{ /dynamic }}


    </section>
    <!-- End Content -->













  </div>


  {{ include file="_tpl/footer.tpl" }}
  {{ include file="_tpl/_html-foot.tpl" }}
