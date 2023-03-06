@extends('layouts.' . config('vms.active_layout'))
@php $app_id = config('vms.app_id') @endphp

@section('title', 'Visitor Reports')

@section('content')
<!--  Navbar Starts / Breadcrumb Area  -->
<div class="row">
    <div class="col-12">

        <!-- Traffic sources -->
        <div class="card">
            <div class="card-header header-elements-inline">
                <h5 class="card-title">{{ $title}}</h5>
                <div class="header-elements">
                    <div class="form-check form-check-right form-check-switchery form-check-switchery-sm">
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
                        <div class=" widget widget-three widget-best-seller">
                            <form method="GET">
                                <div class="from-group">
                                    <label class="text-black">From Date</label>
                                    <input type="date" name="from_date" class="form-control" value="{{ $from }}" />
                                </div>
                                <div class="from-group">
                                    <label class="text-black">To Date</label>
                                    <input type="date" name="to_date" class="form-control" value="{{ $to }}" />
                                </div>

                                <div class="from-group pt-3 row">
                                    <button class="btn btn-sm btn-primary">Filter</button>
                                    <a href="{{ route('reports.visitors') }}" class="btn btn-sm btn-danger">clear</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
                        <a class=" widget widget-three widget-best-seller">
                            <div class="quick-category-head">
                                <span class="quick-category-icon qc-success-teal rounded-circle">
                                    <i class="las la-user-plus las-3"></i>
                                </span>
                                <div class="ml-auto">

                                </div>
                            </div>
                            <div class="quick-category-content">
                                <h3> {{ $total }}</h3>
                                <p class="font-17 text-success-teal mb-0"> Total Visitor </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
                        <div class="widget widget-three" style="overflow:auto; height:250px">
                            <div class="widget-heading">
                                <h5 class=""> {{ __('Gate Vise Visitor') }}</h5>
                                <span class="w-numeric-title"> {{ $total }}</span>
                            </div>
                            <div class="widget-content">
                                <div class="customer-issues ">
                                    @foreach ($gates as $key => $gate)
                                    <div class="customer-issue-list ">
                                        <div class="customer-issue-details">
                                            <div class="customer-issues-info">
                                                <h6 class="mb-2 font-12 text-secondary"> {{ $gate->name }}
                                                </h6>
                                                <p class="issues-count mb-2 font-12 text-secondary">
                                                    {{ $gate->visitors_count }}
                                                </p>
                                            </div>
                                            <div class="customer-issues-stats">
                                                <div class="progress">
                                                    <div class="progress-bar {{ colorGradient(rand(0, 3)) }} position-relative" role="progressbar" style="width: {{ getPert($total, $gate->visitors_count) }}%" aria-valuenow="{{ getPert($total, $gate->visitors_count) }}" aria-valuemin="0" aria-valuemax="{{ $total }}">
                                                        <span class="secondary"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget-content widget-content-area br-6">
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="table-header">{{ __('Department Vise Report') }}</h4>
                            </div>
                        </div>

                        <div class="table-responsive mb-4">
                            <table id="last-page-dt" class="table table-hover" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Total Visitor</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($departments as $key => $dep)
                                    <tr>
                                        <td>{{ ++$key }}</td>
                                        <td>{{ $dep->title }}</td>
                                        <td>{{ $dep->visitors_count }}</td>
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
<!-- Main Body Ends -->
@endsection

@push('plugin-scripts')
{!! Html::script('assets/js/loader.js') !!}
{!! Html::script('plugins/table/datatable/datatables.js') !!}
{!! Html::script('plugins/apex/apexcharts.min.js') !!}
{!! Html::script('plugins/flatpickr/flatpickr.js') !!}
{!! Html::script('assets/js/dashboard/dashboard_1.js') !!}
@endpush

@push('custom-scripts')
<script>
    $(document).ready(function() {
        $('#last-page-dt').DataTable();
    });
</script>
@endpush