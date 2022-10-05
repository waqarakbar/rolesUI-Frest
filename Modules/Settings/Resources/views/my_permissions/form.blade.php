@extends('layouts.'.config('settings.active_layout'))
@php $app_id = config('settings.app_id') @endphp

@push('scripts')

    <script src="{{ asset('assets/js/plugins/forms/styling/uniform.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/forms/styling/switchery.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/forms/styling/switch.min.js') }}"></script>
    <script src="{{ asset('assets/js/demo_pages/form_checkboxes_radios.js') }}"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#app_id").change(function (){
                var app_id = $(this).val()
                $.ajax({
                    type: 'post',
                    url: '{{ route('settings.menus.menus-by-app-id') }}',
                    data: {
                        app_id: app_id,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(res){
                        var options = "<option value>Select a Menu</option>"
                        $.each(res, function(i, k){
                            options += "<option value='"+i+"'>"+k+"</option>"
                        })
                        $("#menu_id").html(options)
                    }
                })
            })

            $(".new_route").click(function(e){
                e.preventDefault()
                var new_route_html = $(".rgr_cont").children('.row').html()

                @if($item->exists)
                    var new_route_html_rem = "<div class='row new_route_form'>" +
                        ""+new_route_html+"" +
                    "</div>";
                @else
                    var new_route_html_rem = "<div class='row new_route_form'>" +
                        ""+new_route_html+"" +
                        "<div class='col-1'><a class='btn btn-sm btn-danger remove_route'><i class='icon-trash text-white'></i></a></div>" +
                        "</div>";
                @endif

                $(".rgr_cont").after(new_route_html_rem)
            })

            $(".rgr_configs").on('click', '.remove_route', function(){
                $(this).closest('.new_route_form').remove()
            })

            $(document).on("change", ".is_default_dd", function(){
                $('.is_default_dd').not(this).children('option:first-child').prop('selected',true);
            })
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
                                'route' => $item->exists ? ['settings.my-permissions.update', \Illuminate\Support\Facades\Crypt::encrypt($item->id)] : ['settings.my-permissions.store']
                                ])
                            !!}



                            <div class="row">

                                <div class="col-6">
                                    <div class="form-group">
                                        {!! Form::label('name', 'Permission Name ', ['class' => 'form-label req']) !!}
                                        <span
                                            class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('name') !!}@endif</span>
                                        {!! Form::text('name', null, ['class' => 'form-control', 'id' => 'name', 'required' => 'required']) !!}
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                {!! Form::label('slug', 'Permission Slug ', ['class' => 'form-label req']) !!}
                                                <span
                                                    class="help">@if(session()->has('errors')) {!! session()->get('errors')->first('slug') !!}@endif</span>
                                                {!! Form::text('slug', null, ['class' => 'form-control', 'id' => 'slug', 'required' => 'required']) !!}
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                {!! Form::label('model', 'Select Model ', ['class' => 'control-label']) !!}

                                                <span
                                                    class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('model') !!} @endif</span>
                                                {!! Form::select('model', ['Permission'=>'Permission Model'], NULL, ['class' => 'form-control', 'id' => 'model']) !!}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



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
                                        {!! Form::label('menu_id', 'Select a Menu ', ['class' => 'control-label']) !!}

                                        <span
                                            class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('menu_id') !!} @endif</span>
                                        {!! Form::select('menu_id', [null=>'Select a a Menu']+$menus->toArray(), NULL, ['class' => 'form-control', 'id' => 'menu_id']) !!}
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
                                <div class="col-12 mb-3 mt-2">
                                    <div class="form-check form-check-switchery">
                                        <span class="help">@if(Session::has('errors')) {!! Session::get('errors')->first('show_in_menu') !!} @endif</span>
                                        <label class="form-check-label">
                                            <input type="checkbox" name="show_in_menu" value="yes" class="form-check-input-switchery" data-fouc @if($item->exists and $item->show_in_menu == "yes") checked @endif>
                                            <strong>Show in Menu</strong>
                                        </label>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-12">
                                    <div class="alert alert-info border-0 rgr_configs">
                                        <h6><strong><u>Permission Routes Group</u></strong></h6>
                                        <p class="mb-3">Each permission must have at least one default route, please configure the route group for this permission.</p>


                                        @if($item->exists and $item->routes->count() > 0)
                                            <div class="rgr_cont">
                                            @foreach($item->routes as $proute)

                                                <div class="row @if($loop->index > 0) new_route_form @endif">

                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <input type="text" name="title[]" value="{{ $proute->title }}" class="form-control" placeholder="Title of the route">
                                                        </div>
                                                    </div>

                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <input type="text" name="route[]" value="{{ $proute->route }}" class="form-control" placeholder="Name of the route">
                                                        </div>
                                                    </div>


                                                    <div class="col-1 text-right" style="padding-top: 8px;">
                                                        <strong>Is Default?</strong>
                                                    </div>


                                                    <div class="col-1">
                                                        <div class="form-group">
                                                            {!! Form::select('is_default[]', ['no'=>'No', 'yes' => 'Yes'], $proute->is_default, ['class' => 'form-control is_default_dd', 'style' => 'width: 110%;']) !!}
                                                        </div>
                                                    </div>

                                                    <div class='col-1'><a class='btn btn-sm btn-danger remove_route'><i class='icon-trash text-white'></i></a></div>

                                                </div>

                                            @endforeach
                                            </div>

                                        @else
                                            <div class="rgr_cont">
                                            <div class="row">

                                                <div class="col-4">
                                                    <div class="form-group">
                                                        <input type="text" name="title[]" class="form-control" placeholder="Title of the route">
                                                    </div>
                                                </div>

                                                <div class="col-4">
                                                    <div class="form-group">
                                                        <input type="text" name="route[]" class="form-control" placeholder="Name of the route">
                                                    </div>
                                                </div>


                                                <div class="col-1 text-right" style="padding-top: 8px;">
                                                    <strong>Is Default?</strong>
                                                </div>


                                                <div class="col-1">
                                                    <div class="form-group">
                                                        {!! Form::select('is_default[]', ['no'=>'No', 'yes' => 'Yes'], NULL, ['class' => 'form-control is_default_dd', 'style' => 'width: 110%;']) !!}
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        @endif


                                        <div class="row">
                                            <div class="col-12">
                                                <a href="#" class="btn btn-sm btn-primary new_route">
                                                    <i class="icon-new-tab2 mr-1"></i> New route
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-12">

                                    <a href="{{ route('settings.my-permissions.list') }}" class="btn btn-warning btn-sm">
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
