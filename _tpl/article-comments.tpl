

{{ if $gimme->article->comments_enabled || $gimme->article->comments_locked  }}

<!-- Blue Box / Row -->
<div class="blue_box blue_box_posts no_bg tabs_box padding_top_60">

  <!-- Tabs Menu -->


        <!-- Tabs Content -->
      <div class="tabs_content row">

        {{ list_article_comments order="bydate desc"  }}
        {{ if $gimme->current_list->at_beginning }}
            <ol>
        {{ /if }}
            {{ include file="_tpl/article-comments-li.tpl" user=$gimme->comment->user }}
        {{ if $gimme->current_list->at_end }}
            </ol>
        {{ /if }}
        {{ /list_article_comments }}


        </div>
        <!-- End Tabs Content -->

    {{ include file="_tpl/article-comments-form.tpl" }}
</div>
<!-- End Blue Box / Row -->
{{ /if }}
