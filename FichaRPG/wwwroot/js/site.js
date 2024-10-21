function apagarRitual(RitualId, PersonagemId) {
    new swal({
        title: "Você tem certeza?",
        text: "Uma vez deletado, você não conseguirá recuperar este registro",
        icon: "warning",
        buttons: {
            cancel: {
                text: "Cancelar",
                value:null,
                visible: true,
                closeModal: true,
            },
            confirm: {
                text: "Apagar",
                value: true,
                visible: true,
                closeModal:true
            }
        }
    })
        .then((value) => {
            if (value) {
                new swal({
                    text: "Deletado com sucesso",
                    icon: "success",
                    buttons: {

                        confirm: {
                            text: "OK",
                            value: true,
                            visible: true,
                            closeModal: true
                        }
                    }
                }).then((value) => {
                    if (value) {
                        location.href = `/RelacaoRitual/Deletar?personagemId=${PersonagemId}&ritualId=${RitualId}`

                    }

                })
            
            }
        });
}

function apagarPersonagem(id) {
    new swal({
        title: "Você tem certeza?",
        text: "Uma vez deletado, você não conseguirá recuperar este registro",
        icon: "warning",
        buttons: {
            cancel: {
                text: "Cancelar",
                value: null,
                visible: true,
                closeModal: true,
            },
            confirm: {
                text: "Apagar",
                value: true,
                visible: true,
                closeModal: true
            }
        }
    })
        .then((value) => {
            if (value) {
                new swal({
                    text: "Deletado com sucesso",
                    icon: "success",
                    buttons: {

                        confirm: {
                            text: "OK",
                            value: true,
                            visible: true,
                            closeModal: true
                        }
                    }
                }).then((value) => {
                    if (value) {
                        location.href = `Personagem/Delete?Id=${id}`
                    }
                })

            }
        });
}

function apagarItem(id) {
    new swal({
        title: "Você tem certeza?",
        text: "Uma vez deletado, você não conseguirá recuperar este registro",
        icon: "warning",
        buttons: {
            cancel: {
                text: "Cancelar",
                value: null,
                visible: true,
                closeModal: true,
            },
            confirm: {
                text: "Apagar",
                value: true,
                visible: true,
                closeModal: true
            }
        }
    })
        .then((value) => {
            if (value) {
                new swal({
                    text: "Deletado com sucesso",
                    icon: "success",
                    buttons: {

                        confirm: {
                            text: "OK",
                            value: true,
                            visible: true,
                            closeModal: true
                        }
                    }
                }).then((value) => {
                    if (value) {
                        location.href = `/Item/Delete?Id=${id}`
                    }
                })

            }
        });
}

function apagarArma(id) {
    new swal({
        title: "Você tem certeza?",
        text: "Uma vez deletado, você não conseguirá recuperar este registro",
        icon: "warning",
        buttons: {
            cancel: {
                text: "Cancelar",
                value: null,
                visible: true,
                closeModal: true,
            },
            confirm: {
                text: "Apagar",
                value: true,
                visible: true,
                closeModal: true
            }
        }
    })
        .then((value) => {
            if (value) {
                new swal({
                    text: "Deletado com sucesso",
                    icon: "success",
                    buttons: {

                        confirm: {
                            text: "OK",
                            value: true,
                            visible: true,
                            closeModal: true
                        }
                    }
                }).then((value) => {
                    if (value) {
                        location.href = `/Arma/Delete?Id=${id}`
                    }
                })

            }
        });
}