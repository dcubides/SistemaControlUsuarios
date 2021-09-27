import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserloginService } from '../userlogin.service';

@Component({
  selector: 'app-informeusuarios',
  templateUrl: './informeusuarios.component.html',
  styleUrls: ['./informeusuarios.component.css']
})
export class InformeusuariosComponent implements OnInit {

  constructor(private router: Router, private service: UserloginService) { }

  userid = localStorage.getItem('userid');
  nombre =  localStorage.getItem('nombre');
  rol =  localStorage.getItem('rol');
  telefono =  localStorage.getItem('telefono');
  direccion =  localStorage.getItem('direccion');
  email =  localStorage.getItem('email');

  datos: any[];

  ngOnInit() {
    if(localStorage.getItem('rol') == '3'){
      alert("No tiene acceso a esta opcion");
      this.router.navigate(["/home"]);
    } else {
      this.service.userData().subscribe((res:any)=> {
        this.datos = res.data;
        console.log(this.datos);
      });
    }
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
