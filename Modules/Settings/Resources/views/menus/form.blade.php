@extends('layouts.'.config('settings.active_layout'))
@php $app_id = config('settings.app_id') @endphp


@section('content')


    <div class="row">
        <div class="col-12">

            <!-- Traffic sources -->
            <div class="card">
                <div class="card-header header-elements-inline">
                    <h5 class="card-title">{{ $title }}</h5>
                    <div class="header-elements">
                        <div class="form-check form-check-right form-check-switchery form-check-switchery-sm">

                            {{--<label class="form-check-label">
                                Live update:
                                <input type="checkbox" class="form-input-switchery" checked data-fouc>
                            </label>--}}
                        </div>
                    </div>
                </div>

                <div class="card-body">

                    <div class="row">


                        <div class="col-12">


                            {!! Form::model($item, [
                                'enctype' => 'multipart/form-data',
                                'method' => $item->exists ? 'put' : 'post',
                                'route' => $item->exists ? ['settings.menus.update', \Illuminate\Support\Facades\Crypt::encrypt($item->id)] : ['settings.menus.store']
                                ])
                            !!}


                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('title', 'Menu Title ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('title') !!}@endif</span>
                                        {!! Form::text('title', null, ['class' => 'form-control', 'id' => 'title', 'required' => 'required']) !!}
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="row">

                                        <div class="col-6">
                                            <div class="form-group">
                                                {!! Form::label('app_id', 'Select App ', ['class' => 'control-label']) !!}

                                                <span
                                                    class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('app_id') !!} @endif</span>
                                                {!! Form::select('app_id', [null=>'Select a App']+$apps->toArray(), NULL, ['class' => 'form-control', 'id' => 'app_id']) !!}
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-group">
                                                {!! Form::label('parent_id', 'Select parent ', ['class' => 'control-label']) !!}

                                                <span
                                                    class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('parent_id') !!} @endif</span>
                                                {!! Form::select('parent_id', [null=>'This is parent']+$menus_parents->toArray(), NULL, ['class' => 'form-control', 'id' => 'parent_id']) !!}
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        {!! Form::label('description', 'Description ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('description') !!}@endif</span>
                                        {!! Form::textarea('description', null, ['class' => 'form-control', 'id' => 'description']) !!}
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        {!! Form::label('icon', 'Menu Icon ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('icon') !!}@endif</span>
                                        {!! Form::text('icon', null, ['class' => 'form-control', 'id' => 'icon', 'required' => 'required']) !!}
                                    </div>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-12">

                                    <a href="{{ route('settings.menus.list') }}" class="btn btn-warning btn-sm">
                                        <i class="icon-arrow-left16 mr-1"></i> Back
                                    </a>

                                    <button type="submit" class="btn btn-info btn-sm">
                                        <i class="icon-database-check mr-1"></i> Save
                                    </button>

                                </div>
                            </div>

                            {!! Form::close() !!}


                        </div>

                    </div>

                </div>


            </div>
            <!-- /traffic sources -->

        </div>
    </div>




@endsection
