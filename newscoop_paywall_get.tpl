



{{ include file="_tpl/_html-head.tpl" }}



<div id="page" class="container">





 {{ include file="_tpl/header.tpl" }}





 <!-- Content -->
 <section id="content">

  <div class="contact content_text">
    <h2 class="page_title">{{$gimme->article->name}}</h2>

   {{ paypal_payment_form submit_button="Ödeme yap" subscriptionId=$subscriptionId }} {{ /paypal_payment_form }}
</div>







</section>
<!-- End Content -->













</div>


{{ include file="_tpl/footer.tpl" }}
{{ include file="_tpl/_html-foot.tpl" }}




