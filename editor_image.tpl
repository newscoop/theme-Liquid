{{ dynamic }}
<figure class="cms-image {{ $imageDetails['align']  }}" {{ if $imageDetails['percentage'] }}style="max-width:{{ $imageDetails['percentage'] }};"{{ /if }} {{ if !$imageDetails['percentage'] && $imageDetails['width']}}style="max-width:{{ $imageDetails['width'] }}px;"{{ /if }}>

<img src="{{ $uri->uri }}" style="max-width: 100%" rel="resizable" alt="{{ $imageDetails['alt'] }}" />


{{ if $gimme->image->photographer|strip !== "" OR $gimme->image->description|strip !== "" OR isset($imageDetails['sub']) }}
  <figcaption>{{ if isset($imageDetails['sub']) }}
    {{$imageDetails['sub']}}
    {{else}}
      {{$gimme->image->description}}
    {{/if}}
    {{ if $gimme->image->photographer|strip !== "" }}
    <span class="photographer">
   &copy; {{ if $gimme->image->photographer_url }}<a style="display: inline" href="{{ $gimme->image->photographer_url }}">{{ $gimme->image->photographer }}</a>{{ else }}{{ $gimme->image->photographer }}{{ /if }}
 </span>
   {{ /if }}
  </figcaption>
{{/if}}
</figure>
{{ /dynamic }}