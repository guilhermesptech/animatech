// sessão
function validarSessao() {
    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME;
    var sobrenome = sessionStorage.SOBRENOME;
    var nome_usuario = sessionStorage.NOME_USUARIO;

    var b_usuario = document.getElementById("b_usuario");
    var n_usuario = document.getElementById("n_usuario");

    if (email != null && nome != null) {
        b_usuario.innerHTML = nome + " " + sobrenome;
        n_usuario.innerHTML = nome_usuario;
    } else {
        window.location = "../login.html";
    }
}

function limparSessao() {
    sessionStorage.clear();
    window.location = "../login.html";
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.style.display = "flex";
        divErrosLogin.innerHTML = texto;
    }
}

