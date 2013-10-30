{{ strip }}
{{ if $user->is_active }}
    {{ $user->uname|escape }}
{{ else }}
    Inaktiver Nutzer
{{ /if }}
{{ /strip }}
