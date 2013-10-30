{{dynamic}}
{{ if $gimme->user->logged_in }}
    {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1 }}
        {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
            <p><br /><em>Yorumunuz onaylanmadı.</em></p>
        {{ /if }}

        {{ if $gimme->submit_comment_action->is_error }}
            <p><br /><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
        {{ else }}
            {{ if $gimme->submit_comment_action->defined }}
                {{ if $gimme->publication->moderated_comments }}
                    <p><br /><em>Yorumunuz onaylanmak üzere değerlendirmeye alınmıştır.</em></p>
                {{ /if }}
            {{ /if }}
        {{ /if }}

                            <ul class="form comment-form">

        {{ comment_form submit_button="Onayla" button_html_code="class=\"button red center\"" }}
                                <li>
                                    <label>Başlık</label>
                                    {{ camp_edit object="comment" attribute="subject" }}
                                </li>
                                <li class="margin_bottom_10">
                                    <label>Mesaj</label>
                                   {{ camp_edit object="comment" attribute="content" }}
                                </li>
                                <li class="margin_bottom_10">
                                {{ recaptcha }}
                            </li>
        {{ /comment_form }}
                            </ul>

    {{ else }}
        <p>Yorumlar kapatılmıştır.</p>
    {{ /if }}
{{ else }}
    <p><br />Yorum yapmak için lütfen giriş yapınız</p>
{{ /if }}
{{/dynamic}}
