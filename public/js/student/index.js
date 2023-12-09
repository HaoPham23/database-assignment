$("#TAB-student").DataTable({
    responsive: true,
    lengthChange: false,
    autoWidth: false,
    language: {
        url: "//cdn.datatables.net/plug-ins/1.10.25/i18n/Vietnamese.json",
    },
    initComplete: function () {
        this.api().columns().every(function () {
            var column = this;
            $('<input type="text" placeholder="Tìm kiếm"/>')
                .css({'width': '120px', 'margin-bottom': '10px', 'margin-top': '10px', 'text-align': 'center'})
                .appendTo($(column.header()))
                .on('keyup change click', function (e) {
                    e.stopPropagation();
                    column.search($(this).val(), false, false, true).draw();
                });
        });
    },
	lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
    pageLength: 5
});

$(".btn-edit").click(function (e) {
    var id = $(this).data("id");

    var description = $(this).data("description");
    var content = $(this).data("content");
    var title = $(this).data("title");
    // console.log(title);
    $("#EditStudentModal input[name='id']").val(id);
    $("#EditStudentModal textarea[name='description']").val(description);
    $("#EditStudentModal textarea[name='content']").val(content);
    $("#EditStudentModal input[name='title']").val(title);
    $('#EditStudentModal').modal('show');
});

$(".btn-delete").click(function (e) {
	var id = $(this).data("id");
	$("#DeleteStudentModal input[name='CCCD_number']").val(id);
	$('#DeleteStudentModal').modal('show');
})