



{{ include file="_tpl/_html-head.tpl" }}



<div id="page" class="container">





 {{ include file="_tpl/header.tpl" }}





 <!-- Content -->
 <section id="content">

  <div class="contact content_text">
    <h2 class="page_title">{{$gimme->article->name}}</h2>

    <div class="contact_boxes row">
{{dynamic}}
      {{ if $gimme->user->logged_in }}
      {{ $subscription = $gimme->user->subscriptions->has_section($gimme->section->number) }}

      {{ if !$subscription || !$subscription->is_active }}
      <div class="box box_first span6">
        <div class="content">
          <p><strong>Taraf'ın web sitesine abone olun</strong><br />
            Üye olarak Gazetemizi günlük olarak PDF formatında okuyabilir, haber ve yazılara yorum yapabilirsiniz.
            <br />
            1 aylık üyelik 20 lira<br />
            3 aylık üyelik 50 lira<br />
            6 aylık üyelik 90 lira<br />
            1 yıllık üyelik 160 lira
          </p>
        </div>
      </div>

      <div class="box box_second span6">
        <div class="content">
          <div class="styled_form subscription">

           {{ subscribe_form option_text="Bu %type% - %range% günlük %price% %currency%" submit_button="Abone ol" }}{{ /subscribe_form }}

         </div>
       </div>
     </div>


     {{ else }}
     <div class="span12">
      <div class="content">
        {{$gimme->article->embed}}
      </div>
    </div>
    {{ /if }}
    {{ else }}
    <div class="box box_first span6">
     <div class="content">
       <p><strong>Taraf'ın web sitesine abone olun</strong><br />
                Üye olarak gazetemizi günlük olarak PDF formatında okuyabilir, haber ve yazılara yorum yapabilirsiniz.
                <br />
                1 aylık üyelik 20 lira<br />
                3 aylık üyelik 50 lira<br />
                6 aylık üyelik 90 lira<br />
                1 yıllık üyelik 160 lira
              </p>
     </div>
   </div>

   <div class="box box_second span6">
     <div class="content">
       <div class="styled_form subscription">

         <h3>Abone olmak için önce üye girişi yapın.</h3>

       </div>
     </div>
   </div>

   {{ /if }}

{{/dynamic}}

 </div>
</div>







</section>
<!-- End Content -->













</div>


{{ include file="_tpl/footer.tpl" }}
{{ include file="_tpl/_html-foot.tpl" }}
