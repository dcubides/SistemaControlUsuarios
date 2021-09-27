import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styles: []
})
export class HomeComponent implements OnInit {

  constructor(private router: Router) { }

  userid = localStorage.getItem('userid');
  nombre =  localStorage.getItem('nombre');
  rol =  localStorage.getItem('rol');
  telefono =  localStorage.getItem('telefono');
  direccion =  localStorage.getItem('direccion');
  email =  localStorage.getItem('email');

  ngOnInit() {
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
