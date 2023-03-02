@extends('layouts.'.config('vms.active_layout'))
@php $app_id = config('vms.app_id') @endphp
<style>
    @media only screen and (max-width: 1400px) {
        html {
            zoom:75%
        }
    }
</style>
@section('content')
    <h1>Hello World</h1>

    <p>
        This view is loaded from module: {!! config('vms.name') !!}
    </p>
@endsection
