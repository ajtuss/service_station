$(function () {

    var ordersTable = $("#ordersTab");
    var employeeSelect = $("#employee");


    function formatDateFromStamp(timeStamp) {
        var result = new moment(timeStamp);
        if (result.isValid()) {
            return result.format("YYYY-MM-DD");
        } else {
            return "";
        }
    }


    function setEmployeesToSelect() {
        $.get('/repository/employees')
            .done(function (res) {
                $(res).each(function (index, employee) {
                    var select = $("<option>").val(employee.name + " " + employee.surname).text(employee.name + " " + employee.surname);
                    employeeSelect.append(select);
                });
            });
    }

    ordersTable.DataTable({
        initComplete: function () {
            var column = this.api().columns(4);
            setEmployeesToSelect();
            employeeSelect.on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                column.search(val ? '^' + val + '$' : '', true, false).draw();
            });
        },

        dom: 'Bfrtip',
        buttons: [
            {
                text: 'Dodaj',
                action: function (e, dt, button, config) {
                    window.location.href = '/orders/add';
                }
            },
            {
                extend: 'selectedSingle',
                text: 'Edytuj',
                action: function (e, dt, button, config) {
                    window.location.href = '/orders/edit?id='+dt.row({selected: true}).data().id;
                }
            },
            {
                extend: 'selectedSingle',
                text: 'Usuń',
                action: function (e, dt, button, config) {
                    window.location.href = '/orders/delete?id='+dt.row({selected: true}).data().id;
                }
            }
        ],
        paging: false,
        select: true,
        ajax: {
            url: '/repository/orders',
            type: 'get', //typ połączenia
            // contentType: 'application/json', //gdy wysyłamy dane czasami chcemy ustawić ich typ
            // dataType: 'json', //typ danych jakich oczekujemy w odpowiedzi
            dataSrc: ""
            // success: function (res) {
            //     // console.log(res);
            // }
        },
        columns: [
            {'data': 'id'},
            {'data': 'arrivalDate'},
            {'data': 'plannedRepairDate'},
            {'data': 'realRepairDate'},
            {'data': 'employee'},
            {'data': 'status.name'},
            {'data': 'totalCost'},
            {'data': 'id'}
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

            }
        ]

    });

});