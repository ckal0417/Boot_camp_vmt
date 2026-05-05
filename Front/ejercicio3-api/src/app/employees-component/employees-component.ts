import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Observable, of, catchError } from 'rxjs';
import { EmployeesService } from '../services/employees';
import { Employee } from '../interfaces/employee.interface';

@Component({
  selector: 'app-employees-component',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './employees-component.html',
  styleUrls: ['./employees-component.scss']
})
export class EmployeesComponent {

  employees$: Observable<Employee[]>;
  employeeBuscado$: Observable<Employee | null> = of(null);

  busqueda: string = '';

  constructor(private service: EmployeesService) {
    this.employees$ = this.service.getAll();
  }

  buscar(): void {
    const id = this.busqueda.trim();

    if (id === '') {
      this.employeeBuscado$ = of(null);
      return;
    }

    this.employeeBuscado$ = this.service.getById(id).pipe(
      catchError(() => of(null))
    );
  }
}