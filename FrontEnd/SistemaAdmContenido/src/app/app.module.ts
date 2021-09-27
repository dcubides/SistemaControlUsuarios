import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { UserloginComponent } from './userlogin/userlogin.component';
import { RegisterComponent } from './userlogin/register/register.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserloginService } from './userlogin.service';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './userlogin/login/login.component';
import { HomeComponent } from './home/home.component';
import { NoticiasComponent } from './noticias/noticias.component';
import { InformeusuariosComponent } from './informeusuarios/informeusuarios.component';





@NgModule({
  declarations: [
    AppComponent,
    UserloginComponent,
    RegisterComponent,
    LoginComponent,
    HomeComponent,
    NoticiasComponent,
    InformeusuariosComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [
    UserloginService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
