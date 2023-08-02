var dataTable;
$(document).ready(function () {
    loadDataTable();
});

function loadDataTable() {
    dataTable = $('#tblData').DataTable({
        "ajax": { url: '/admin/product/getall' },
        "columns": [
            { data: 'title', "width": "25%" },
            { data: 'isbn', "width": "15%" },
            { data: 'listPrice', "width": "10%" },
            { data: 'author', "width": "15%" },
            { data: 'category.name', "width": "10%" },
            {
                data: 'id',
                "render": function (data) {
                    return (
                        `<div class="w-100 btn-group text-center" role="group">
                            <a href="/admin/product/upsert?Id=${data}" class="btn btn-primary mx-2">
                                <i class="bi bi-pencil-square"></i>Edit
                            </a>
                            <a href="/admin/product/delete/${data}" class="btn btn-danger mx-2">
                                <i class="bi bi-trash-fill"></i>Delete
                            </a>
                        </div>`
                    )
                },
                "width": "25%"
            }
        ]
    });
}