import { Injectable } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class UserloginService {

  constructor(private fb: FormBuilder, private http: HttpClient ) { }

  readonly BaseUrl = 'https://localhost:44362/api/'

  formModel = this.fb.group({
    user: ['', Validators.required],
    nameUser: ['', Validators.required],
    password: ['', Validators.required],
    address: ['', Validators.required],
    phone: ['', Validators.required],
    email: ['', Validators.email],
    age: [,Validators.required],
    rol: [,Validators.required]
  });

  register() {
    var body = {
      user: this.formModel.value.user,
      nameUser: this.formModel.value.nameUser,
      password: this.formModel.value.password,
      address: this.formModel.value.address,
      phone: this.formModel.value.phone,
      email: this.formModel.value.email,
      age: this.formModel.value.age,
      rol: this.formModel.value.rol,
    }
    console.log(body);
    return this.http.post(this.BaseUrl+'userlogin', body);
  }

  login(formData) {
    return this.http.post(this.BaseUrl+'userlogin/login', formData);
  }

  userData(){
    return this.http.get(this.BaseUrl+'userlogin');
  }

  userDataNoticias(){
    return this.http.get(this.BaseUrl+'post');
  }



}
