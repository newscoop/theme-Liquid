{{ strip }}
{{ if $user->is_active }}
    {{ $user->uname|escape }}
{{ else }}
    {{#inactiveUser#}}
{{ /if }}
{{ /strip }}
