@extends('layouts.' . config('vms.active_layout'))
@php $app_id = config('vms.app_id') @endphp

@section('title', 'Visitor')

@section('content')
    <!--  Navbar Starts / Breadcrumb Area  -->
    <div class="sub-header-container">
        <header class="header navbar navbar-expand-sm">
            <a href="javascript:void(0);" class="sidebarCollapse" data-placement="bottom">
                <i class="las la-bars"></i>
            </a>
            <ul class="navbar-nav flex-row">
                <li>
                    <div class="page-header">
                        <nav class="breadcrumb-one" aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">{{ __('Visitors') }}</a></li>
                            </ol>
                        </nav>
                    </div>
                </li>
            </ul>
        </header>
    </div>
    <!--  Navbar Ends / Breadcrumb Area  -->
    <!-- Main Body Starts -->
    <div class="layout-px-spacing">
        <div class="layout-top-spacing mb-2">
            <div class="col-md-12">
                <div class="row">
                    <div class="container p-0">
                        <div class="row layout-top-spacing date-table-container">

                            <!-- Datatable go to last page -->
                            <div class="col-xl-12 col-lg-12 col-sm-12 card">
                                <div class="widget-content widget-content-area br-6">
                                    <div class="row">
                                        <div class="col-sm-10">
                                            <h4 class="table-header">{{ __('Visitor Managment') }}</h4>
                                        </div>
                                        <div class="col-sm-2 text-right">
                                            @can('visitor-create')
                                                <a href="{{ route('visitors.create') }}" class="btn btn-primary">Create</a>
                                            @endcan
                                        </div>
                                    </div>



                                    <div class="table-responsive mb-4">
                                        <table id="last-page-dt" class="table table-hover" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
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
        </div>
    </div>
    <!-- Main Body Ends -->
    <!-- Button trigger modal -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ __('Modal title') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="modal-text">
                        {{ __('Mauris mi tellus, pharetra vel mattis sed, tempus ultrices eros. Phasellus egestas sit amet velit sed luctus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Vivamus ultrices sed urna ac pulvinar. Ut sit amet ullamcorper mi.') }}
                    </p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i>
                        {{ __('Discard') }}</button>
                    <button type="button" class="btn btn-primary">{{ __('Save') }}</button>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('plugin-scripts')
    {!! Html::script('assets/js/loader.js') !!}
    {!! Html::script('plugins/table/datatable/datatables.js') !!}
    {!! Html::script('plugins/sweetalerts/sweetalert2.min.js') !!}
    {!! Html::script('assets/js/basicui/sweet_alerts.js') !!}
@endpush

@push('custom-scripts')
    <script>
        $(document).ready(function() {

            var params = '';
            var i = 0;
            window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) {
                if (i == 0) {
                    params += [key] + '=' + value;
                } else {
                    params += '&' + [key] + '=' + value;
                }
                i++;
            });


            if (params != '') {
                var url = "{{ route('visit.index') }}?" + params;
            } else {
                var url = "{{ route('visit.index') }}";
            }

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
                "ajax": url,
                "processing": true,
                "serverSide": true,
                "columns": [{
                        data: 'id',
                    },
                    {
                        data: 'user.name',
                        name: 'user.name',
                        orderable: false,
                    },

                    {
                        data: 'department.title',
                        orderable: false,
                    },


                    {
                        data: null,
                        orderable: false,

                        render: function(data, type, row) {
                            var editUrl = "{{ route('visit.print', ':id') }}";
                            editUrl = editUrl.replace(':id', data.id);

                            return "<a class=\"btn btn-primary btn-sm\"  href=\"" + editUrl +
                                "\"><i class=\"las la-print la-2x\"></i></a>";

                        }

                    },



                    {
                        data: "action",
                        orderable: false,
                        searchable: false,
                    }

                ],



            });






            $(document).on('click', '.modalAction', function() {
                // Swal.fire({
                //     title: "Are you sure ?",
                //     text: "Deleted Data Cannot Be Recovered!",
                //     icon: "warning",
                //     showCancelButton: true,
                //     confirmButtonText: "Yes, Delete!"
                // });
            });
        });

        $(document).on('click', '.modalAction', function() {
            Swal.fire({
                title: "Are you sure ?",
                text: "Deleted Data Cannot Be Recovered!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Yes, Delete!",
                allowOutsideClick: false,
            });
        });
    </script>
@endpush
