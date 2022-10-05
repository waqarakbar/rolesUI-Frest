@extends('layouts.'.config('settings.active_layout'))
@php $app_id = config('settings.app_id') @endphp

@push('scripts')

    <script src="{{ asset('assets/js/plugins/forms/selects/select2.min.js') }}"></script>

    <script type="text/javascript">

        $(document).ready(function () {

            $(".select2").select2()

            $("#company_id").change(function(){
                var company_id = $(this).val()

                // get the sections/units of this company
                $.ajax({
                    type: 'post',
                    url: '{{ route('noauth.sections-by-company-id') }}',
                    data: {
                        company_id: company_id,
                        _token: '{{ csrf_token() }}'
                        @if($item->exists)
                        ,section_id: '{{ $item->id }}'
                        @endif
                    },
                    success: function(res){
                        // console.log(res)
                        var sections = "<option value>Select {{ config('settings.section_title') }}</option>"
                        $.each(res, function(i,v){
                            sections += "<option value='"+i+"'>"+v+"</option>"
                        })
                        $("#section_id").html(sections)
                    }
                })

                // get the users of this company for parent user
                $.ajax({
                    type: 'post',
                    url: '{{ route('noauth.users-list-by-company-id') }}',
                    data: {
                        company_id: company_id,
                        _token: '{{ csrf_token() }}'
                        @if($item->exists)
                        ,user_id: '{{ $item->id }}'
                        @endif
                    },
                    success: function(res){
                        // console.log(res)
                        var sections = "<option value>This is parent user</option>"
                        $.each(res, function(i,v){
                            sections += "<option value='"+i+"'>"+v+"</option>"
                        })
                        $("#parent_id").html(sections)
                    }
                })

            })




            {{--@if($item->exists)
            setTimeout(function(){
                $("#company_id").val('')
            }, 400);
            setTimeout(function(){
                $("#company_id").val('{{ $item->company_id }}').trigger('change')
            }, 500);
            setTimeout(function(){
                $("#section_id").val('{{ $item->section_id }}').trigger('change')
            }, 600);
            setTimeout(function(){
                $("#parent_id").val('{{ $item->parent_id }}')
            }, 700);
            @endif--}}
        })
    </script>
@endpush

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
                                'route' => $item->exists ? ['settings.users-mgt.update', \Illuminate\Support\Facades\Crypt::encrypt($item->id)] : ['settings.users-mgt.store']
                                ])
                            !!}




                            <div class="row">

                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('name', 'Title / Name ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('name') !!}@endif</span>
                                        {!! Form::text('name', null, ['class' => 'form-control', 'id' => 'name', 'required' => 'required']) !!}
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('email', 'Email Address ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('email') !!}@endif</span>
                                        {!! Form::email('email', null, ['class' => 'form-control', 'id' => 'email', 'required' => 'required']) !!}
                                    </div>
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('username', 'Username ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('username') !!}@endif</span>
                                        {!! Form::text('username', null, ['class' => 'form-control', 'id' => 'username', 'required' => 'required']) !!}
                                    </div>
                                </div>

                                <div class="col-6">

                                    @if($item->exists)
                                        <div class="form-group">
                                            {!! Form::label('password', 'Password ', ['class' => 'form-label req']) !!}
                                            <span class="help">Leave empty if you don't want to change password. @if(session()->has('errors')) {!! session()->get('errors')->first('password') !!}@endif</span>
                                            {!! Form::text('password', "", ['class' => 'form-control', 'id' => 'password']) !!}
                                        </div>
                                    @else
                                        <div class="form-group">
                                            {!! Form::label('password', 'Password ', ['class' => 'form-label req']) !!}
                                            <span
                                                class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('password') !!}@endif</span>
                                            {!! Form::text('password', null, ['class' => 'form-control', 'id' => 'password', 'required' => 'required']) !!}
                                        </div>
                                    @endif

                                </div>
                            </div>




                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('company_id', 'Select '.config('settings.company_title'), ['class' => 'control-label']) !!}

                                        <span
                                            class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('company_id') !!} @endif</span>
                                        {!! Form::select('company_id', [null=>'Select '.config('settings.company_title')]+$companies_dd, NULL, ['class' => 'form-control', 'id' => 'company_id', 'required' => 'required']) !!}
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('section_id', 'Select '.config('settings.section_title'), ['class' => 'control-label']) !!}

                                        <span
                                            class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('section_id') !!} @endif</span>
                                        {!! Form::select('section_id', [null=>'Select '.config('settings.section_title')]+$sections->toArray(), NULL, ['class' => 'form-control', 'id' => 'section_id']) !!}
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('parent_id', 'Select Parent User ', ['class' => 'control-label']) !!}

                                        <span
                                            class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('parent_id') !!} @endif</span>
                                        {!! Form::select('parent_id', [null=>'This is a Parent User']+$parent_users->toArray(), NULL, ['class' => 'form-control', 'id' => 'parent_id']) !!}
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('role_id[]', 'Select Roles ', ['class' => 'control-label']) !!}

                                        <span
                                            class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('role_id[]') !!} @endif</span>
                                        {!! Form::select('role_id[]', $roles->toArray(), ($item->exists & $item->roles->count() > 0) ? $item->roles : null, ['class' => 'form-control select2', 'id' => 'role_id[]', 'multiple' => 'multiple']) !!}
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        {!! Form::label('description', 'Details ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('description') !!}@endif</span>
                                        {!! Form::textarea('description', null, ['class' => 'form-control', 'id' => 'description']) !!}
                                    </div>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-12">

                                    <a href="{{ route('settings.my-apps.list') }}" class="btn btn-warning btn-sm">
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
