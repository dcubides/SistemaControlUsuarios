import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserloginService } from 'src/app/userlogin.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styles: []
})
export class RegisterComponent implements OnInit {

  constructor(public service: UserloginService, private router: Router) { }

  userid = localStorage.getItem('userid');
  nombre =  localStorage.getItem('nombre');
  rol =  localStorage.getItem('rol');
  telefono =  localStorage.getItem('telefono');
  direccion =  localStorage.getItem('direccion');
  email =  localStorage.getItem('email');

  ngOnInit() {
    this.service.formModel.reset();
  }

  OnSubmit() {
    this.service.register().subscribe(
      res => {
        console.log(res);
        alert('Usuario registrado correctamente')
        this.service.formModel.reset();
      },
      err => {
       alert("Error al crear usuario")
        console.log(err);
      }
    );
  }

  onLogout(){
    localStorage.removeItem('userid');
    localStorage.removeItem('nombre');
    localStorage.removeItem('rol');
    localStorage.removeItem('telefono');
    localStorage.removeItem('direccion');
    localStorage.removeItem('email');
    this.router.navigate(["/user/login"]);
  }

}
