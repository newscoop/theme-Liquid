
{{ include file="_tpl/_html-head.tpl" }}



<div id="page" class="container">





  {{ include file="_tpl/header.tpl" }}





  <!-- Content -->
  <section id="content">

   {{if $gimme->article->contact}}

   <div class="contact content_text">
       <h2 class="page_title">{{$gimme->article->name}}</h2>

       <div class="contact_boxes row">
        <div class="box box_first span5">
            <div class="content">
                  {{$gimme->article->full_text}}
               </div>
           </div>

           <div class="box box_second span7">
            <div class="content">
                   <div class="styled_form">
                       <form action="#">
                           <div class="field_row row">
                               <label for="c_field_subject" class="span2">Temat</label>
                               <div class="span5">
                                <input type="text" id="c_field_subject" class="" />
                               </div>
                           </div>

                           <div class="field_row row">
                               <label for="c_field_author" class="span2">Autor</label>
                               <div class="span5">
                                <input type="text" id="c_field_author" />
                               </div>
                           </div>


                           <div class="field_row row">
                               <label for="c_field_message" class="span2">Temat</label>
                               <div class="span5">
                                <textarea id="c_field_message"></textarea>
                               </div>
                           </div>

                           <div class="field_row row">
                            <div class="span5 offset2">
                                   <p class="float_left information">Mimo wszystko lubię ciapatych</p>
                                   <button type="submit" class="float_right">Wyślij</button>
                               </div>
                           </div>
                       </form>
                   </div>
               </div>
           </div>
       </div>
   </div>


   {{else}}


   <div class="row article_content">
       <div class="columnist span10 offset1">

           <div class="content content_text">

               <h2 class="name">{{$gimme->article->name}}</h2>
               {{$gimme->article->full_text}}
           </div>

       </div>
   </div>

   {{/if}}
       </section>
       <!-- End Content -->













     </div>


     {{ include file="_tpl/footer.tpl" }}
     {{ include file="_tpl/_html-foot.tpl" }}
