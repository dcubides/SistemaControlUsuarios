import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InformeusuariosComponent } from './informeusuarios.component';

describe('InformeusuariosComponent', () => {
  let component: InformeusuariosComponent;
  let fixture: ComponentFixture<InformeusuariosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InformeusuariosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InformeusuariosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
