{{--@extends('layouts.'.config('settings.active_layout'))--}}
@extends('layouts.restricted_layout')
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


                            <form action="{{ route('settings.users-mgt.my-profile-save') }}" method="post">


                                <input type="hidden" name="_token" value="{{ csrf_token() }}">


                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            {!! Form::label('name', 'Officer Title ', ['class' => 'form-label req']) !!}
                                            <span
                                                class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('name') !!}@endif</span>
                                            {!! Form::text('name', $user->name, ['class' => 'form-control', 'id' => 'name', 'disabled' => 'disabled']) !!}
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            {!! Form::label('email', 'Email Address ', ['class' => 'form-label req']) !!}
                                            <span
                                                class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('email') !!}@endif</span>
                                            {!! Form::email('email', $user->email, ['class' => 'form-control', 'id' => 'email', 'required' => 'required']) !!}
                                        </div>
                                    </div>

                                </div>


                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            {!! Form::label('username', 'Username ', ['class' => 'form-label req']) !!}
                                            <span
                                                class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('username') !!}@endif</span>
                                            {!! Form::text('username', $user->username, ['class' => 'form-control', 'id' => 'username', 'required' => 'required']) !!}
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="alert alpha-warning border-0">
                                            <div class="form-group">
                                                {!! Form::label('password', 'Current Password ', ['class' => 'form-label req']) !!}
                                                <span
                                                    class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('password') !!}@endif</span>
                                                {{--{!! Form::password('password', null, ['class' => 'form-control', 'id' => 'password', 'required' => 'required']) !!}--}}
                                                <input type="password" id="password" name="password" class="form-control" required>
                                                <span class="-help text-primary">Please provide your current password to save changes</span>
                                            </div>
                                        </div>
                                    </div>

                                </div>




                                <div class="row">
                                    <div class="col-12">

                                        <button class="btn btn-danger btn-sm">
                                            <i class="icon-undo mr-1"></i> Reset
                                        </button>

                                        <button type="submit" class="btn btn-info btn-sm">
                                            <i class="icon-database-check mr-1"></i> Save Profile
                                        </button>

                                    </div>
                                </div>

                            </form>


                        </div>

                    </div>

                </div>


            </div>
            <!-- /traffic sources -->

        </div>
    </div>




@endsection
