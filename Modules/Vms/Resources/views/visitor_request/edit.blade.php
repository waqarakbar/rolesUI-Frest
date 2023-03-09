@extends('layouts.' . config('vms.active_layout'))
@php $app_id = config('vms.app_id') @endphp

@section('title', 'Edit Branch')


@section('content')
    <livewire:branch.form :model=$model type='update' />

@endsection
