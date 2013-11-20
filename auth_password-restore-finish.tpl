{{extends file="layout.tpl"}}

{{block content}}
 <h3 class="normal_header">
 Yeni parola
</h3>

<div class="register_form">
<form action="{{ $form->getAction() }}" method="{{ $form->getMethod() }}">
	<fieldset>
        {{ if $form->isErrors() }}
        <div class="alert alert-error">
         <p>Parola değiştirilmedi, lütfen talimatları takip ederek tekrar deneyin</p>



        </div>
        {{ /if }}
    </fieldset>
    <fieldset class="fixBackground background-block login">
        <dl>
                {{ $form->password->setLabel("Yeni parola")->removeDecorator('Errors') }}
                {{ if $form->password->hasErrors() }}
                <dt class="info-block">&nbsp;</dt>
                <dd class="info-block">
                  <span class="error-info">Lütfen yeni parolanızı yazınız (en az 6 karakter)</span>


                </dd>
                {{ /if }}
        </dl>
        <dl>
                {{ $form->password_confirm->setLabel("Parolayı tekrar giriniz")->removeDecorator('Errors') }}
                {{ if $form->password_confirm->hasErrors() && !$form->password->hasErrors() }}
                <dt class="info-block">&nbsp;</dt>
                <dd class="info-block">
                	<span class="error-info">Parola aynı değil</span>
                </dd>
                {{ /if }}
         </dl>


             <p class="overflow_hidden"><button type="submit" id="submit" class="purple_button ">
                Şifre değiştir
             </button></p>


    </fieldset>
    </form>
</div>
{{/block}}
