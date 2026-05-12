import { Routes } from '@angular/router';
import { StudentsLists } from '../pages/students-lists/students-lists';
import { StudentsDetails } from '../pages/students-details/students-details';

export const STUDENTS_ROUTES: Routes = [
  {
    path: '',
    component: StudentsLists,
  },
  {
    path: ':id',
    component: StudentsDetails,
  },
];