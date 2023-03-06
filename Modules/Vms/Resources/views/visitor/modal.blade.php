<div class="modal" tabindex="-1" id="DataModal" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Visitor Details</h5>

            </div>
            <div class="modal-body">

            </div>

        </div>
    </div>
</div>

@push('scripts')
<script>
    $(document).ready(function() {

        $("#Modelcancel").on('click', function() {
            $("#DataModal").modal('hide');
        });


        $(document).on('click', '.showDetails', function() {
            // getting current Object 

            let modelData = $(this).attr("data-model");
            modelData = JSON.parse(decodeURIComponent(modelData));

            console.log(modelData);
            $("#Mtime").val(modelData?.visiting_time);
            $("#Mdate").val(modelData?.visiting_date);
            // var today = moment().format('dd/mm/yyyy');
            // $('#Mdate').val(today);
            // $("#visitor_id").val(modelData?.id);

            $("#DataModal").modal("show");

        });
    });
</script>
@endpush