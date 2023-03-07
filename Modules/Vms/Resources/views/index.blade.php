@extends('layouts.' . config('vms.active_layout'))
@php $app_id = config('vms.app_id') @endphp


@push('stylesheets')
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/apex-charts/apex-charts.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
@endpush




@section('content')
    <div class="row">
        <!-- Gamification Card -->
        <div class="col-lg-4 col-md-6 col-12 mb-4">
            <div class="card h-100">
                <div class="card-header">
                    <h3 class="card-title mb-2">Total Visitors!</h3>
                    <!-- <span class="d-block mb-4 text-nowrap">Best seller of the month</span> -->
                </div>
                <div class="card-body">
                    <div class="row align-items-end">
                        <div class="col-6">
                            <h1 class="display-6 text-primary mb-2 pt-4 pb-1">{{ $total }}</h1>
                            <!-- <small class="d-block mb-3">You have done 57.6% <br>more sales today.</small>

                                                                                                                                                                                                                                                    <a href="javascript:;" class="btn btn-sm btn-primary">APP</a> -->
                        </div>
                        <!-- <div class="col-6">
                                                                                                                                                                                                                                                    <img src="" width="140" height="150" class="rounded-start" alt="View Sales" data-app-light-img="illustrations/prize-light.png" data-app-dark-img="illustrations/prize-dark.png">
                                                                                                                                                                                                                                                </div> -->
                    </div>
                </div>
            </div>
        </div>
        <!--/ Gamification Card -->

        <!-- Multi Radial Chart -->
        <div class="col-lg-4 col-md-6 col-12 mb-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">Visits of {{ \Carbon\Carbon::now()->format('Y') }}</h5>

                </div>
                <div class="card-body">
                    <div id="visitsRadialChart"></div>
                </div>
            </div>
        </div>
        <!--/ Multi Radial Chart -->

        <!-- Statistics cards & Revenue Growth Chart -->
        <div class="col-lg-4 col-12">
            <div class="row">
                <!-- Statistics Cards -->
                <div class="col-6 col-md-3 col-lg-6 mb-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="avatar mx-auto mb-2">
                                <span class="avatar-initial rounded-circle bg-label-success"><i
                                        class="bx bx-user-check fs-4"></i></span>
                            </div>
                            <span class="d-block text-nowrap">Approved</span>
                            <h2 class="mb-0">{{ $accept + $visited }}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3 col-lg-6 mb-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="avatar mx-auto mb-2">
                                <span class="avatar-initial rounded-circle bg-label-danger"><i
                                        class="bx bx-x-circle fs-4"></i></span>
                            </div>
                            <span class="d-block text-nowrap">Rejected</span>
                            <h2 class="mb-0">{{ $reject }}</h2>
                        </div>
                    </div>
                </div>
                <!--/ Statistics Cards -->
                <!-- Revenue Growth Chart -->
                <div class="col-12 col-md-6 col-lg-12 mb-4">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center pb-0">
                            <h5 class="card-title mb-1">Visitor Requests </h5>
                            <span class="avatar-initial"><i class="fa-brands fa-stack-overflow fa-3x"></i></span>
                        </div>
                        <div class="card-body pb-0">
                            <div id="revenueGrowthChart">
                            </div>
                            <h4 class="text-center">{{ $requested }}</h4>

                        </div>
                    </div>
                </div>
                <!--/ Revenue Growth Chart -->
            </div>
        </div>
        <!--/ Statistics cards & Revenue Growth Chart -->

        <!-- Weekly Order Summary -->
        {{-- <div class="col-xl-8 col-12 mb-4">
        <div class="card">
            <div class="row row-bordered m-0">
                <!-- Order Summary -->
                <div class="col-md-8 col-12 px-0">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0">Weekly Order Summary</h5>
                        <div class="dropdown">
                            <button class="btn p-0" type="button" id="orderSummaryOptions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orderSummaryOptions">
                                <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                <a class="dropdown-item" href="javascript:void(0);">Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div id="orderSummaryChart"></div>
                    </div>
                </div>
                <!-- Sales History -->
                <div class="col-md-4 col-12 px-0">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0">Sales Overview</h5>
                        <div class="dropdown">
                            <button class="btn p-0" type="button" id="salesOverviewOptions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="salesOverviewOptions">
                                <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                <a class="dropdown-item" href="javascript:void(0);">Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <h6 class="mt-1">Last Week</h6>
                        <p class="mb-4">Performance 45% 🤩 better compare to last month</p>
                        <ul class="list-unstyled m-0 pt-0">
                            <li class="mb-4">
                                <div class="d-flex align-items-center mb-2">
                                    <div class="avatar avatar-sm flex-shrink-0 me-2">
                                        <span class="avatar-initial rounded bg-label-primary"><i class="bx bx-trending-up"></i></span>
                                    </div>
                                    <div>
                                        <p class="mb-0 lh-1 text-muted text-nowrap">Earnings This Month</p>
                                        <small class="fw-semibold text-nowrap">$84,789</small>
                                    </div>
                                </div>
                                <div class="progress" style="height:6px;">
                                    <div class="progress-bar bg-primary" style="width: 75%" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex align-items-center mb-2">
                                    <div class="avatar avatar-sm flex-shrink-0 me-2">
                                        <span class="avatar-initial rounded bg-label-success"><i class="bx bx-dollar"></i></span>
                                    </div>
                                    <div>
                                        <p class="mb-0 lh-1 text-muted text-nowrap">Average Daily Sales</p>
                                        <small class="fw-semibold text-nowrap">$12,398</small>
                                    </div>
                                </div>
                                <div class="progress" style="height:6px;">
                                    <div class="progress-bar bg-success" style="width: 75%" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}
        <!--/ Weekly Order Summary -->

        <!-- Latest Update -->
        {{-- <div class="col-md-6 col-lg-6 col-xl-4 col-xl-4 mb-4">
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between mb-3">
                    <h5 class="card-title mb-0">Latest Update</h5>
                    <div class="dropdown">
                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button"
                            id="orederStatistics" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            2021
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                            <a class="dropdown-item" href="javascript:void(0);">2020</a>
                            <a class="dropdown-item" href="javascript:void(0);">2021</a>
                            <a class="dropdown-item" href="javascript:void(0);">2022</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <ul class="p-0 m-0">
                        <li class="d-flex mb-4">
                            <div class="avatar avatar-sm flex-shrink-0 me-3">
                                <span class="avatar-initial rounded-circle bg-label-primary"><i
                                        class='bx bx-cube'></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <p class="mb-0 lh-1">Total Products</p>
                                    <small class="text-muted">2k New Products</small>
                                </div>
                                <div class="item-progress">10k</div>
                            </div>
                        </li>
                        <li class="d-flex mb-4">
                            <div class="avatar avatar-sm flex-shrink-0 me-3">
                                <span class="avatar-initial rounded-circle bg-label-info"><i
                                        class='bx bx-pie-chart-alt'></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <p class="mb-0 lh-1">Total Sales</p>
                                    <small class="text-muted">39k New Sales</small>
                                </div>
                                <div class="item-progress">26M</div>
                            </div>
                        </li>
                        <li class="d-flex mb-4">
                            <div class="avatar avatar-sm flex-shrink-0 me-3">
                                <span class="avatar-initial rounded-circle bg-label-danger"><i
                                        class='bx bx-credit-card'></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <p class="mb-0 lh-1">Total Revenue</p>
                                    <small class="text-muted">43k New Revenue</small>
                                </div>
                                <div class="item-progress">15M</div>
                            </div>
                        </li>
                        <li class="d-flex">
                            <div class="avatar avatar-sm flex-shrink-0 me-3">
                                <span class="avatar-initial rounded-circle bg-label-success"><i
                                        class='bx bx-dollar'></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <p class="mb-0 lh-1">Total Cost</p>
                                    <small class="text-muted">Total Expenses</small>
                                </div>
                                <div class="item-progress">2B</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div> --}}
        <!--/ Latest Update -->

        <!-- All Users -->
        {{-- <div class="col-md-6 col-lg-6 col-xl-4 mb-4 mb-xl-0">
            <div class="card h-100">
                <div class="card-header">
                    <h5 class="card-title mb-2">All Users</h5>
                    <h1 class="display-6 fw-normal mb-0">8,634,820</h1>
                </div>
                <div class="card-body">
                    <span class="d-block mb-2">Current Activity</span>
                    <div class="progress progress-stacked mb-3 mb-xl-5" style="height:8px;">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 30%" aria-valuenow="30"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 15%" aria-valuenow="15"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-info" role="progressbar" style="width: 10%" aria-valuenow="10"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 15%" aria-valuenow="15"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <ul class="p-0 m-0">
                        <li class="mb-3 d-flex justify-content-between">
                            <div class="d-flex align-items-center lh-1 me-3">
                                <span class="badge badge-dot bg-success me-2"></span> USA
                            </div>
                            <div class="d-flex gap-3">
                                <span>29.5k</span>
                                <span class="fw-semibold">56%</span>
                            </div>
                        </li>
                        <li class="mb-3 d-flex justify-content-between">
                            <div class="d-flex align-items-center lh-1 me-3">
                                <span class="badge badge-dot bg-danger me-2"></span> France
                            </div>
                            <div class="d-flex gap-3">
                                <span>25.7k</span>
                                <span class="fw-semibold">26%</span>
                            </div>
                        </li>
                        <li class="mb-3 d-flex justify-content-between">
                            <div class="d-flex align-items-center lh-1 me-3">
                                <span class="badge badge-dot bg-info me-2"></span> Italy
                            </div>
                            <div class="d-flex gap-3">
                                <span>11.5k</span>
                                <span class="fw-semibold">34%</span>
                            </div>
                        </li>
                        <li class="mb-3 d-flex justify-content-between">
                            <div class="d-flex align-items-center lh-1 me-3">
                                <span class="badge badge-dot bg-primary me-2"></span> China
                            </div>
                            <div class="d-flex gap-3">
                                <span>48.5k</span>
                                <span class="fw-semibold">45%</span>
                            </div>
                        </li>
                        <li class="mb-1 d-flex justify-content-between">
                            <div class="d-flex align-items-center lh-1 me-3">
                                <span class="badge badge-dot bg-warning me-2"></span> India
                            </div>
                            <div class="d-flex gap-3">
                                <span>22.1k</span>
                                <span class="fw-semibold">7%</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div> --}}
        <!--/ All Users -->

        <!-- Marketing Campaigns -->
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">Visitor List</h5>
                    <div class="dropdown">
                        <button class="btn p-0" type="button" id="marketingOptions" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="marketingOptions">
                            <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                            <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                            <a class="dropdown-item" href="javascript:void(0);">Share</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <!-- <div class="d-flex align-items-center justify-content-between flex-wrap gap-3">
                                                                                                                                                                                                                                                <div class="d-flex justify-content-between align-content-center flex-wrap gap-4">
                                                                                                                                                                                                                                                    <div class="d-flex align-items-center gap-2">
                                                                                                                                                                                                                                                        <div id="marketingCampaignChart1"></div>
                                                                                                                                                                                                                                                        <div>
                                                                                                                                                                                                                                                            <div class="d-flex align-items-center">
                                                                                                                                                                                                                                                                <h6 class="mb-0 me-2">25,768</h6>
                                                                                                                                                                                                                                                                <span class="text-success">(+16.2%)</span>
                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                            <div class="d-flex align-items-center">
                                                                                                                                                                                                                                                                <span class="badge badge-dot bg-success me-2"></span> Jan 12,2022
                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                    <div class="d-flex align-items-center gap-2">
                                                                                                                                                                                                                                                        <div id="marketingCampaignChart2"></div>
                                                                                                                                                                                                                                                        <div>
                                                                                                                                                                                                                                                            <div class="d-flex align-items-center">
                                                                                                                                                                                                                                                                <h6 class="mb-0 me-2">5,352</h6>
                                                                                                                                                                                                                                                                <span class="text-danger">(-4.9%)</span>
                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                            <div class="d-flex align-items-center">
                                                                                                                                                                                                                                                                <span class="badge badge-dot bg-danger me-2"></span> Jan 12,2022
                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                <a href="javascript:;" class="btn btn-sm btn-primary" type="button">View Report</a>
                                                                                                                                                                                                                                            </div> -->
                </div>
                <div class="table-responsive p-2">
                    <table class="table border-top" id="last-page-dt">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>CNIC</th>
                                <th>Visit To</th>
                                <th>Purpose</th>
                                <th width="23%">Action</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--/ Marketing Campaigns -->
    </div>
    <!--/ Marketing Campaigns -->
    </div>

    @extends('vms::visitor/modal');
@endsection

@push('scripts')
    <script src="{{ asset('assets/vendor/libs/apex-charts/apexcharts.js') }}"></script>
    <!-- <script src="{{ asset('assets/js/dashboards-ecommerce.js') }}"></script> -->

    <script src="{{ asset('assets/vendor/libs/datatables/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/datatables-responsive/datatables.responsive.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.js') }}"></script>


    <script>
        $(document).ready(function() {

            $('#last-page-dt').DataTable({
                "pagingType": "full_numbers",
                "language": {
                    "paginate": {
                        "first": "<i class='las la-angle-double-left'></i>",
                        "previous": "<i class='las la-angle-left'></i>",
                        "next": "<i class='las la-angle-right'></i>",
                        "last": "<i class='las la-angle-double-right'></i>"
                    }
                },
                "lengthMenu": [7, 14, 21, 28],
                "pageLength": 7,
                "ajax": "{{ route('visitors.index') }}?status=2,3",
                "processing": true,
                "serverSide": true,
                "columns": [

                    {
                        data: 'user',
                        name: 'user.name',
                        orderable: false,
                        render: function(data, type, row) {
                            let profile = "";
                            if (data?.profile_image_url) {
                                profile = '<img src="' + data?.profile_image_url +
                                    '" class = "me-3 rounded" width = "40"  alt = "' + data?.name +
                                    '" >';
                            }
                            return profile + '' + data?.name;
                        }
                    },

                    {
                        data: 'user.cnic',
                        orderable: false,
                    },


                    {
                        data: 'visit_to_name',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'purpose',
                        orderable: false,
                    },



                    {
                        data: null,
                        orderable: false,
                        searchable: false,
                        render: function(data, type, row) {
                            let viewButton =
                                `<button class ="btn btn-warning btn-sm showDetails"  data-model=` +
                                encodeURIComponent(JSON.stringify(data)) +
                                `><i class="bx bx-user"></i></button>`;
                            let approveButton = data.status != 3 ?
                                `<button class ="btn btn-success btn-sm accept_visitor"  data-id=` +
                                data.id + `><i class="bx bx-check"></i></button>` : '';
                            let rescheduleButton = data.status != 3 ?
                                `<button class ="btn btn-primary btn-sm modalAction"  data-model=` +
                                encodeURIComponent(JSON.stringify(data)) +
                                `><i class="bx bx-stopwatch"></i></button>` : '';
                            return viewButton + approveButton + rescheduleButton;
                        }
                    }

                ],



            });





        });

        // dashboard script 

        /**
         * eCommerce Dashboard
         */

        'use strict';
        (function() {
            let cardColor, headingColor, axisColor, borderColor, shadeColor;

            if (isDarkStyle) {
                cardColor = config.colors_dark.cardColor;
                headingColor = config.colors_dark.headingColor;
                axisColor = config.colors_dark.axisColor;
                borderColor = config.colors_dark.borderColor;
                shadeColor = 'dark';
            } else {
                cardColor = config.colors.white;
                headingColor = config.colors.headingColor;
                axisColor = config.colors.axisColor;
                borderColor = config.colors.borderColor;
                shadeColor = 'light';
            }

            // Visits - Multi Radial Bar Chart
            // --------------------------------------------------------------------

            let visitor_data = JSON.parse('{!! json_encode($current_year_data) !!}');
            const visitsRadialChartEl = document.querySelector('#visitsRadialChart'),
                visitsRadialChartConfig = {
                    chart: {
                        height: 270,
                        type: 'radialBar',

                    },
                    colors: [config.colors.primary, config.colors.danger, config.colors.warning],
                    series: [visitor_data?.source_WEB, visitor_data?.source_API, visitor_data?.source_CallCenter],
                    plotOptions: {
                        radialBar: {
                            offsetY: -10,
                            hollow: {
                                size: '45%'
                            },
                            track: {
                                margin: 10,
                                background: cardColor
                            },
                            dataLabels: {
                                name: {
                                    fontSize: '15px',
                                    colors: [config.colors.secondary],
                                    fontFamily: 'IBM Plex Sans',
                                    offsetY: 25,
                                    formatter: function(value) {
                                        return value.toString();
                                    }
                                },
                                value: {
                                    fontSize: '2rem',
                                    fontFamily: 'Rubik',
                                    fontWeight: 500,
                                    color: headingColor,
                                    offsetY: -15,
                                    formatter: function(value) {
                                        return value.toString();
                                    }
                                },

                                total: {
                                    show: true,
                                    label: 'Total Visits',
                                    fontSize: '15px',
                                    fontWeight: 400,
                                    fontFamily: 'IBM Plex Sans',
                                    color: config.colors.secondary,
                                    formatter: function(value, opt) {
                                        // console.log(value);
                                        return "Visitor";
                                    }
                                }
                            }
                        }
                    },
                    grid: {
                        padding: {
                            top: -10,
                            bottom: -10
                        }
                    },
                    stroke: {
                        lineCap: 'square'
                    },
                    labels: ['On Spot', 'Mobile', 'Call Center'],
                    legend: {
                        show: true,
                        position: 'bottom',
                        horizontalAlign: 'center',
                        labels: {
                            colors: axisColor,
                            useSeriesColors: false,
                        },
                        itemMargin: {
                            horizontal: 15
                        },
                        markers: {
                            width: 10,
                            height: 10,
                            offsetX: -3
                        }
                    }
                };

            if (typeof visitsRadialChartEl !== undefined && visitsRadialChartEl !== null) {
                const visitsRadialChart = new ApexCharts(visitsRadialChartEl, visitsRadialChartConfig);
                visitsRadialChart.render();
            }

        })();
    </script>
@endpush
