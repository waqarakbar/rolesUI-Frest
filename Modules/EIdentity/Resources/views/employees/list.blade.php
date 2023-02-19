@extends('layouts.'.config('settings.active_layout'))
@php $app_id = config('eidentity.app_id') @endphp

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
                                        <th>Name</th>
                                        <th>Father Name</th>
                                        <th>CNIC</th>
                                        <th>Mobile</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($employees as $item)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $item->employee_name }}</td>
                                            <td>{{ $item->father_name }}</td>
                                            <td>{{ $item->cnic }}</td>
                                            <td>{{ $item->mobile_no }}</td>
                                            <td style="width: 180px">
                                                <a href="{{ route('eidentity.employee.edit', ['id' => encrypt($item->id)]) }}" class="btn btn-warning btn-icon">
                                                    <i class="tf-icons bx bx-pencil"></i>
                                                </a>

                                            {!! Form::open(['method' => 'delete', 'route' => ['eidentity.employee.delete',encrypt($item->id)], 'class' => 'dropdown-item delete', 'style' => 'display:inline; padding: 0px']) !!}
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
