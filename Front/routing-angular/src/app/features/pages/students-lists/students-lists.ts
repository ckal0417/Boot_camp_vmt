import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { Observable } from 'rxjs';
import { StudentsService } from '../../services/students.service';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

@Component({
  selector: 'app-students-lists',
  standalone: true,
  imports: [
    CommonModule,
    RouterLink,
    MatCardModule,
    MatButtonModule,
    MatProgressSpinnerModule
  ],
  templateUrl: './students-lists.html',
  styleUrls: ['./students-lists.scss'],
})
export class StudentsLists {

  students$: Observable<any[]>;

  constructor(private studentsService: StudentsService) {
    this.students$ = this.studentsService.getStudents() as Observable<any[]>;
  }
}