import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './auth/auth.guard';
import { HomeComponent } from './home/home.component';
import { InformeusuariosComponent } from './informeusuarios/informeusuarios.component';
import { NoticiasComponent } from './noticias/noticias.component';
import { LoginComponent } from './userlogin/login/login.component';
import { RegisterComponent } from './userlogin/register/register.component';
import { UserloginComponent } from './userlogin/userlogin.component';


const routes: Routes = [
  {path: '', redirectTo: '/user/login', pathMatch: 'full'},
  {path:'user', component: UserloginComponent, 
    children: [
      {path:'registro', component: RegisterComponent,  canActivate: [AuthGuard]},
      {path:'login', component: LoginComponent}
  ]
},
  {path: 'home', component: HomeComponent, canActivate: [AuthGuard]},
  {path: 'noticias', component: NoticiasComponent, canActivate: [AuthGuard]},
  {path: 'usuariosInforme', component: InformeusuariosComponent, canActivate: [AuthGuard]}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
