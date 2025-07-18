@props(['name'])

@php
    // Generar las iniciales del nombre
    $initials = collect(explode(' ', $name))
                ->map(function ($segment) {
                    return mb_strtoupper(mb_substr($segment, 0, 1));
                })
                ->join('');
@endphp

<div class="flex items-center justify-center h-10 w-10 rounded-full bg-gray-800 text-white">
    <span class="text-sm font-semibold">{{ $initials }}</span>
</div>
