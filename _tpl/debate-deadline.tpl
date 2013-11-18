{{ $timestamp = sprintf('@%d', $gimme->debate->date_end) }}
{{ $closingdate=date_create($timestamp) }}
{{ $deadline=$closingdate->setTime(12, 0) }}
{{ $diff=date_diff($deadline, date_create('now')) }}
{{ if $deadline->getTimestamp() > time() }}
    <small>{{ $diff->days }} {{ #days# }}, {{ $diff->h }} {{ #hours# }}, {{ $diff->i }} {{ #minutes# }} {{#votingEnd#}}</small>
{{ else }}
    <p>Discussion closed on {{ $deadline->format('j.n.Y') }} at noon {{ if $gimme->article->comment_count }}<a href="{{ url}}#comments"><span class="comm">{{ $gimme->article->comment_count }}</span></a>{{ /if }}</p>
{{ /if }}