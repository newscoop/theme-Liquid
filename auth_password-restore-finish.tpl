{{extends file="layout.tpl"}}

{{block content}}
<div class="article_content bloger content_text white-box">
  <div class="clearfix">

 <h3 class="normal_header">
 {{ #setNewPassword# }}
</h3>

<div class="register_form">
<form action="{{ $form->getAction() }}" method="{{ $form->getMethod() }}">
	<fieldset>
        {{ if $form->isErrors() }}
        <div class="alert alert-error">
         <p>{{ #couldNotChange# }}</p>



        </div>
        {{ /if }}
    </fieldset>
    <fieldset class="fixBackground background-block login">
        <dl>
                {{ $form->password->setLabel("{{ #newPassword# }}")->removeDecorator('Errors') }}
                {{ if $form->password->hasErrors() }}
                <dt class="info-block">&nbsp;</dt>
                <dd class="info-block">
                  <span class="error-info">{{ #enterNewPassword# }}</span>


                </dd>
                {{ /if }}
        </dl>
        <dl>
                {{ $form->password_confirm->setLabel("{{ #retypePassword# }}")->removeDecorator('Errors') }}
                {{ if $form->password_confirm->hasErrors() && !$form->password->hasErrors() }}
                <dt class="info-block">&nbsp;</dt>
                <dd class="info-block">
                	<span class="error-info">{{ #doesNotMatch# }}</span>
                </dd>
                {{ /if }}
         </dl>


             <p class="overflow_hidden"><button type="submit" id="submit" class="purple_button ">
                {{ #savePassword# }}
             </button></p>


    </fieldset>
    </form>
</div>
</div>
</div>
{{/block}}
