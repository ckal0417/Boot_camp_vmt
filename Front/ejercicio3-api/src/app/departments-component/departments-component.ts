import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Observable, of, catchError } from 'rxjs';
import { DepartmentsService } from '../services/departments';
import { Department } from '../interfaces/departments.interface';

@Component({
  selector: 'app-departments-component',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './departments-component.html',
  styleUrls: ['./departments-component.scss']
})
export class DepartmentsComponent {

  departments$: Observable<Department[]>;
  departmentBuscado$: Observable<Department | null> = of(null);

  busqueda: string = '';

  constructor(private service: DepartmentsService) {
    this.departments$ = this.service.getAll();
  }

  buscar(): void {
    const id = this.busqueda.trim();

    if (id === '') {
      this.departmentBuscado$ = of(null);
      return;
    }

    this.departmentBuscado$ = this.service.getById(id).pipe(
      catchError(() => of(null))
    );
}
}