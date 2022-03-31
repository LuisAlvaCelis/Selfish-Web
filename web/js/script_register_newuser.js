var inputs = document.getElementsByClassName('form_input');
for (var i = 0; i < inputs.length; i++) {
    inputs[i].addEventListener('keyup', function(){
        if(this.value.length>=1) {
            this.nextElementSibling.classList.add('fijar');
        } else {
            this.nextElementSibling.classList.remove('fijar');
        }
    });
}

function seePassword(){
    var txt1=document.getElementById("txtPass1");
    var txt2=document.getElementById("txtPass2");
    if(txt1.type==="password" && txt2.type==="password"){
        txt1.type="text";
        txt2.type="text";
    }else{
        txt1.type="password";
        txt2.type="password";
    }
}
function verifyDataUser(e){
    var user=document.getElementById("txtUser").value;
    
    var espacios = false;
    var cont = 0;

    while (!espacios && (cont < user.length)) {
    if (user.charAt(cont) == " ")
        espacios = true;
        cont++;
    }
   
    if (espacios) {
        document.getElementById('consoleuser').innerHTML = 'Error: Usuario no puede contener espacios en blanco!';
    }else{
        if(user.length>=6){
            document.getElementById('consoleuser').innerHTML = ' ';
        }else{
            document.getElementById('consoleuser').innerHTML = 'Error: Usuario debe contener como mínimo 6 dígitos.';
        }
    }
}

function verifyDataMail(e){
    var mail=document.getElementById("txtMail").value;
    
    var espacios = false;
    var cont = 0;

    while (!espacios && (cont < mail.length)) {
    if (mail.charAt(cont) == " ")
        espacios = true;
        cont++;
    }
   
    if (espacios) {
        document.getElementById('consolemail').innerHTML = 'Error: Email no puede contener espacios en blanco!';
    }else{
        if(mail.includes("@gmail.com") || mail.includes("@hotmail.com")){
            document.getElementById('consolemail').innerHTML = ' ';
        }else{
            document.getElementById('consolemail').innerHTML = 'Error: Email debe contener @gmail.com o @hotmail.com';
        }
    }
}
function verifyDataDNI(e){
    
    var dni=document.getElementById("txtDNI").value;
    
    var espacios = false;
    var cont = 0;

    while (!espacios && (cont < dni.length)) {
    if (dni.charAt(cont) == " ")
        espacios = true;
        cont++;
    }
    if (espacios) {
        document.getElementById('consoledni').innerHTML = 'Error: DNI no puede contener espacios en blanco.';
    }else{
        if(isNaN(dni)){
            document.getElementById('consoledni').innerHTML='Error: Debe ingresar solo números.';
        }else{
            if(dni.length==8){
                document.getElementById('consoledni').innerHTML = ' ';
            }else{
                document.getElementById('consoledni').innerHTML = 'Error: DNI debe contener 8 dígitos';
            }
        }
    }
}
function equalsPassword(e) {
    var pass1=document.getElementById("txtPass1").value;
    var pass2=document.getElementById("txtPass2").value;

    if(pass1 == pass2){
        document.getElementById('console2').innerHTML = ' ';
    }else{
        document.getElementById('console2').innerHTML = 'Error: Las contraseñas no coinciden!';
    }
    spaceWhite2(e);
}

function spaceWhite1(e){
    var pass1=document.getElementById("txtPass1").value;
    
    var espacios = false;
    var cont = 0;

    while (!espacios && (cont < pass1.length)) {
    if (pass1.charAt(cont) == " ")
        espacios = true;
        cont++;
    }
   
    if (espacios) {
        document.getElementById('console1').innerHTML = 'Error: La contraseña no puede contener espacios en blanco!';
    }else{
        document.getElementById('console1').innerHTML = ' ';
    }
}

function spaceWhite2(e){
    var pass1=document.getElementById("txtPass2").value;
    
    var espacios = false;
    var cont = 0;

    while (!espacios && (cont < pass1.length)) {
    if (pass1.charAt(cont) == " ")
        espacios = true;
        cont++;
    }
   
    if (espacios) {
        document.getElementById('console3').innerHTML = 'Error: La contraseña no puede contener espacios en blanco!';
    }else{
        document.getElementById('console3').innerHTML = ' ';
    }
}
