@extends('layouts.'.config('settings.active_layout'))
@php $app_id = config('settings.app_id') @endphp

@section('content')

    <div class="row">
        <div class="col-12">

            <!-- Traffic sources -->
            <div class="card">
                <div class="card-header header-elements-inline">
                    <h6 class="card-title">{{ $title }}</h6>
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

                            <div class="table-responsive" style="min-height: 200px">

                                <table class="table table-striped" >

                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>{{ config('settings.company_title') }}</th>
                                        <th>Parent {{ config('settings.section_title') }}</th>
                                        <th>No. of Sub {{ str_plural(config('settings.section_title')) }}</th>
                                        <th>District</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($items as $item)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td><strong>{{ $item->title }}</strong></td>
                                            <th>{{ $item->company->title ?? "" }}</th>
                                            <td>{{ $item->parent->title ?? "" }}</td>
                                            <td>{{ $item->children->count() ?? 0 }}</td>
                                            <td>{{ $item->district->title ?? "" }}</td>
                                            <td style="width: 150px">

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown"><i class="icon-cog5 mr-2"></i> Options</button>
                                                    <div class="dropdown-menu dropdown-menu-right">



                                                        <a href="{{ route('settings.sections.edit', ['id' => \Illuminate\Support\Facades\Crypt::encrypt($item->id)]) }}" class="dropdown-item text-warning">
                                                            <i class="icon-pencil7"></i> Edit
                                                        </a>

                                                        {!! Form::open(['method' => 'delete', 'route' => ['settings.sections.delete',\Illuminate\Support\Facades\Crypt::encrypt($item->id)], 'class' => 'dropdown-item delete', 'style' => 'display:inline']) !!}
                                                        {!! Form::button('<i class="icon-trash text-danger" style=" margin-right: 12px;color:red;"></i> Delete', array('class'=>'btn btn-link ', 'type'=>'submit', 'style' => 'padding:0px; width:100%; text-align:left')) !!}
                                                        {!! Form::close() !!}



                                                    </div>
                                                </div>




                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>

                                </table>

                            </div>

                        </div>

                    </div>

                </div>


            </div>
            <!-- /traffic sources -->

        </div>
    </div>

@endsection
