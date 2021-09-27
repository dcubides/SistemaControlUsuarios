import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserloginService } from '../userlogin.service';

@Component({
  selector: 'app-noticias',
  templateUrl: './noticias.component.html',
  styleUrls: ['./noticias.component.css']
})
export class NoticiasComponent implements OnInit {

  constructor(private router: Router, private service: UserloginService) { }

  userid = localStorage.getItem('userid');
  nombre =  localStorage.getItem('nombre');
  rol =  localStorage.getItem('rol');
  telefono =  localStorage.getItem('telefono');
  direccion =  localStorage.getItem('direccion');
  email =  localStorage.getItem('email');

  datos: any[];

  ngOnInit() {
    this.service.userDataNoticias().subscribe((res:any)=> {
      this.datos = res.data;
      console.log(this.datos);
    });
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
