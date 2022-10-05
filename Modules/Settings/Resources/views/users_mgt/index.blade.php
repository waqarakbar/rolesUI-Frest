@extends('layouts.'.config('settings.active_layout'))
@php $app_id = config('settings.app_id') @endphp

@push('stylesheets')
    <style>
        .table > :not(caption) > * > * {
            padding: 5px;
        }
    </style>
@endpush
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

                                <table class="table table-striped data_mf_table" >

                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Username</th>
                                        <th>Parent User</th>
                                        <th>No. of Children Users</th>
                                        <th>{{ config('settings.company_title') }}</th>
                                        <th>{{ config('settings.section_title') }}</th>
                                        <th>Roles</th>
                                        <th>No. of Permissions</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($items as $item)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td><strong>{{ $item->name }}</strong></td>
                                            <td>{{ $item->email }}</td>
                                            <td><code>{{ $item->username }}</code></td>
                                            <td>{{ $item->parent->name ?? "" }}</td>
                                            <td>{{ $item->children->count() }}</td>
                                            <td>{{ $item->company->title ?? "" }}</td>
                                            <td>{{ $item->section->title ?? "" }}</td>
                                            <td>
                                                @foreach($item->roles as $r) <span class="badge badge-info">{{ $r->name }}</span> @endforeach
                                            </td>
                                            <td>{{ $item->permissions->count() }}</td>

                                            <td style="width: 180px">



                                                <a href="{{ route('settings.users-mgt.edit', ['id' => \Illuminate\Support\Facades\Crypt::encrypt($item->id)]) }}" class="btn btn-warning btn-icon">
                                                    <i class="tf-icons bx bx-pencil"></i>
                                                </a>


                                                <a href="{{ route('settings.users-mgt.show', ['id' => \Illuminate\Support\Facades\Crypt::encrypt($item->id)]) }}" class="btn btn-primary btn-icon">
                                                    <i class="tf-icons bx bx-wrench"></i>
                                                </a>

                                                {!! Form::open(['method' => 'delete', 'route' => ['settings.users-mgt.delete',\Illuminate\Support\Facades\Crypt::encrypt($item->id)], 'class' => 'dropdown-item delete', 'style' => 'display:inline; padding: 0px']) !!}
                                                {!! Form::button('<i class="bx bx-trash tf-icons"></i>', array('class'=>'btn btn-danger btn-icon ', 'type'=>'submit')) !!}
                                                {!! Form::close() !!}







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
