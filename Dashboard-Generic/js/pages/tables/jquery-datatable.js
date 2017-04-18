$(function () {
    $('.js-basic-example').DataTable({
        responsive: true
    });

    //Exportable table
    $('.js-exportable').DataTable({
        "bAutoWidth": false,
        //"sScrollY": "100%",
        //"sScrollX": "100%",
        "bScrollCollapse": true,
        "bProcessing": true,
        deferRender: true,
        dom: 'Bfrtlip',
        "responsive": true,
        buttons: [
            'csv', 'excel', 'pdf'
        ]
    });

    $('.js-exportable').wrap('<div class="dataTables_scroll" />');

});

