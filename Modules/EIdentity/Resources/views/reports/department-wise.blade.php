@extends('layouts.'.config('eidentity.active_layout'))
@php $app_id = config('eidentity.app_id') @endphp
<style>
    @media only screen and (max-width: 1400px) {
        html {
            zoom:75%
        }
    }
</style>
@section('content')
    <div class="row">
        <div class="col-12">
            <!-- Traffic sources -->
            <div class="card">
                <div class="card-header header-elements-inline">
                    <h6 class="card-title">{{ $title }}</h6>
                    <div class="header-elements">
                    </div>
                    <div class="text-right" style="text-align: right">
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
                                        <th>Department</th>
                                        <th>Total Employees</th>
                                        <th>Mobile (Pending)</th>
                                        <th>Picture (Pending)</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($departments as $item)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $item->title }}</td>
                                            <td>{{ $item->employees_count }}</td>
                                            <td>{{ $item->pending_mobile }}</td>
                                            <td>{{ $item->pending_profile_pic }}</td>
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
