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
                                        <th>Route</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($my_apps as $item)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td><i class="{{ $item->icon }}"></i> <strong>{{ $item->title }}</strong></td>
                                            <td><code>{{ $item->route }}/</code></td>
                                            <td style="width: 150px">

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown"><i class="icon-cog5 mr-2"></i> Options</button>
                                                    <div class="dropdown-menu dropdown-menu-right">



                                                        <a href="{{ route('settings.my-apps.edit', ['id' => \Illuminate\Support\Facades\Crypt::encrypt($item->id)]) }}" class="dropdown-item text-warning">
                                                            <i class="icon-pencil7"></i> Edit
                                                        </a>

                                                        {!! Form::open(['method' => 'delete', 'route' => ['settings.my-apps.delete',\Illuminate\Support\Facades\Crypt::encrypt($item->id)], 'class' => 'dropdown-item delete', 'style' => 'display:inline']) !!}
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
