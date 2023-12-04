$("#tab-student").DataTable({
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
	var name = $(this).data("name");
	var address = $(this).data("address");
	// console.log(id, name, address);
	$("#EditStudentModal input[name='id']").val(id);
	$("#EditStudentModal input[name='name']").val(name);
	$("#EditStudentModal input[name='address']").val(address);
	$('#EditStudentModal').modal('show');
})

$(".btn-delete").click(function (e) {
	var id = $(this).data("id");
	$("#DeleteStudentModal input[name='id']").val(id);
	$('#DeleteStudentModal').modal('show');
})