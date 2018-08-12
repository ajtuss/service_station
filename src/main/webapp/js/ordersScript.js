$(function () {

    var ordersTable = $("#ordersTab");

    function formatDateFromStamp(timeStamp) {
        var result = new moment(timeStamp);
        if (result.isValid()) {
            return result.format("YYYY-MM-DD");
        } else {
            return "";
        }
    }


    ordersTable.DataTable({
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'selectedSingle',
                text: 'Log selected data',
                action: function ( e, dt, button, config ) {
                    console.log( dt.row( { selected: true } ).data() );
                }
            }
        ],
        paging: false,
        select: true,
        ajax: {
            url: "http://localhost:8080/repository/orders",
            type: "get", //typ połączenia
            // contentType: 'application/json', //gdy wysyłamy dane czasami chcemy ustawić ich typ
            // dataType: 'json', //typ danych jakich oczekujemy w odpowiedzi
            dataSrc: ""
            // success: function (res) {
            //     // console.log(res);
            // }
        },
        columns: [
            {"data": "id"},
            {"data": "arrivalDate"},
            {"data": "plannedRepairDate"},
            {"data": "realRepairDate"},
            {"data": "employee"},
            {"data": "status.name"},
            {"data": "totalCost"},
            {"data": "id"},
            {"data": "id"}
        ],
        columnDefs: [
            {
                targets: [1, 2, 3],
                render: function (data) {
                    return formatDateFromStamp(data);
                }
            },
            {
                targets: 4,
                render: function (data) {
                    return data.name + " " + data.surname;
                }
            },
            {
                targets: 6,
                type: "num-fmt"

            },
            {
                targets: 7,
                orderable: false,
                render: function (data) {
                    return "<a href='/orders/edit?id=" + data + "' role='button' class='btn btn-primary btn-sm m-0 btn-block'>Edytuj</a>";
                }
            },
            {
                targets: 8,
                orderable: false,
                render: function (data) {
                    return "<a href='/orders/delete?id=" + data + "' role='button' class='btn btn-primary btn-sm m-0 btn-block'>Usuń</a>";
                }
            }
        ]

    });

});