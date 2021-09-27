import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { UserloginService } from 'src/app/userlogin.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styles: []
})
export class LoginComponent implements OnInit {
formModel = {
  User : '',
  Password : ''
}
  constructor(private service: UserloginService, private router: Router) { }

  ngOnInit() {
  }

  onSubmit(form: NgForm){
    this.service.login(form.value).subscribe(
      (res:any)=> {
        if (res.data == null)  alert('Informacion incorrecta');
        console.log(res);
        console.log(res.data.securityId)
        localStorage.setItem('userid', res.data.securityId);
        localStorage.setItem('nombre', res.data.nameUser);
        localStorage.setItem('rol', res.data.rol);
        localStorage.setItem('telefono', res.data.phone);
        localStorage.setItem('direccion', res.data.address);
        localStorage.setItem('email', res.data.email);

        this.router.navigateByUrl('/home');
      },
      err => {
        alert('Informacion incorrecta');
      }
    );
  }
}
