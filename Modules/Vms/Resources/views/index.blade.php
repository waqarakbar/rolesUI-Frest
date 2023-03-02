@extends('layouts.' . config('vms.active_layout'))
@php $app_id = config('vms.app_id') @endphp
{{-- <style>
    @media only screen and (max-width: 1400px) {
        html {
            zoom:75%
        }
    }
</style> --}}
@section('content')
    <div class="layout-px-spacing">


        <div class="row mt-5">
            <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing " height="50px">
                @if (auth()->user()->hasRole('Department'))
                    <a href="{{ route('visitors.index') }}?status=2" class="widget quick-category">
                    @elseif (auth()->user()->hasRole('visitor'))
                        <a href="{{ route('visit.create') }}" class="widget quick-category">
                        @else
                            <a href="{{ route('visit.index') }}" class="widget quick-category">
                @endif

                <div class="quick-category-head">
                    <span class="quick-category-icon qc-success-teal rounded-circle">
                        <i class="las la-user-plus"></i>
                    </span>
                </div>
                <div class="quick-category-content">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="row">
                                <p class="font-17 text-success-teal mb-0"> New Visit Request</p>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <h4 class="text-success-teal"> <strong>{{ $requested }}</strong></h4>


                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                <a href="{{ route('visitors.index') }}?status=3,1" class="widget quick-category" height="50px">
                    <div class="quick-category-head">
                        <span class="quick-category-icon qc-success-teal rounded-circle">
                            <i class="las la-handshake"></i> </span>
                    </div>
                    <div class="quick-category-content">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="row">
                                    <p class="font-17 text-success-teal mb-0"> Accepted Request</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <h4 class="text-success-teal"> <strong>{{ $accept }}</strong>
                                </h4>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                <a href="{{ route('visitors.index') }}?status=1" class="widget quick-category" height="50px">
                    <div class="quick-category-head">
                        <span class="quick-category-icon qc-primary rounded-circle">
                            <i class="las la-history"></i> </span>
                    </div>
                    <div class="quick-category-content">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="row">
                                    <p class="font-17 text-primary mb-0"> last visit</p>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <h4 class="text-primary"> <strong>{{ $visited }}</strong>
                                </h4>
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                <a href="{{ route('visitors.index') }}?status=4" class="widget quick-category" height="50px">
                    <div class="quick-category-head">
                        <span class="quick-category-icon qc-warning rounded-circle">
                            <i class="las la-trash"></i> </span>
                    </div>
                    <div class="quick-category-content">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="row">
                                    <p class="font-17 text-warning mb-0"> Rejected Request</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <h4 class="text-warning"> <strong>{{ $reject }}</strong>
                                </h4>
                            </div>
                        </div>
                    </div>
                </a>
            </div>

        </div>


        {{-- </div>
<div class="layout-top-spacing "> --}}
        <div class="col-md-12">
            <div class="row">
                <div class="container p-0">
                    <div class="row layout-top-spacing date-table-container">

                        <!-- Datatable go to last page -->
                        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                            <div class="widget-content widget-content-area br-6">
                                <div class="row">
                                    <div class="col-sm-10">
                                        {{-- <h4 class="table-header">{{ __('Visitor Managment') }}</h4> --}}
                                    </div>
                                    {{-- <div class="col-sm-2 text-right">
                                    @can('visitor-create')
                                        <a href="{{ route('visitors.create') }}" class="btn btn-primary">Create</a>
                                    @endcan
                                </div> --}}
                                </div>



                                <div class="table-responsive mb-4">
                                    <table id="last-page-dt" class="table table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                                {{-- <th>ID</th> --}}
                                                <th>Name</th>
                                                <th>Cnic</th>
                                                <th>purpose</th>

                                                <th>Department</th>
                                                <th>print</th>

                                                <th></th>
                                            </tr>
                                        </thead>


                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->


        <div class="modal" tabindex="-1" id="myModal" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Visitor Details</h5>

                    </div>
                    <div class="modal-body">
                        <form id="modalSubmit">
                            <input type="hidden" name="id" id="visitor_id" />

                            <div class="form-group">
                                <select class="form-control" id="status" name="status">
                                    <option selected>Open this select </option>
                                    <option value="3">Accept</option>
                                    <option value="4">Reject</option>
                                </select>
                            </div>

                            <div class="form-group" id="rejected_reason" style="display:none;">
                                <input type="text" class="form-control mt-2" placeholder="Enter Rejecting Reason"
                                    name="rejected_reason">
                            </div>


                            <div class="row m-0 p-0 mt-2 ">
                                <input type="time" class="form-control col-md-6" id="Mtime" name="visiting_time">
                                <input type="date" id="start" class="form-control col-md-6 px-1 " id="Mdate"
                                    name="visiting_date" min="2023-01-01">
                            </div>

                            <div class="form-group float-right pt-2">
                                <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                                <button type="button" class="btn btn-danger btn-sm" id="Modelcancel">Cancel</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>



    </div>
    <!-- Main Body Ends -->
    <p>
        This view is loaded from module: {!! config('vms.name') !!}
    </p>
@endsection
