//Override the default confirm dialog by rails
$.rails.allowAction = function(link){
    if (link.data("confirm") == undefined){
        return true;
    }
    $.rails.showConfirmationDialog(link);
    return false;
}
//User click confirm button
$.rails.confirmed = function(link){
    link.data("confirm", null);
    link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
    var message = link.data("confirm");
    swal({
        title: "Advertencia",
        text: message,
        icon: "warning",
        buttons: {
            cancel: {
                text: "Cancelar",
                value: false,
                visible: true,
                className: "",
                closeModal: true,
            },
            confirm: {
                text: "Confirmar",
                value: true,
                visible: true,
                className: "",
                closeModal: false
            }
        },
        dangerMode: true
    }).then(function(willDelete){
        if (willDelete) {
            $.rails.confirmed(link);
        }
    });
}