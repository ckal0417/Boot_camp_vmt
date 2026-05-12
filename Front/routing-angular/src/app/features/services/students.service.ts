import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment'; 

@Injectable({
  providedIn: 'root',
})
export class StudentsService {

  private apiUrl = environment.baseUrl;

  constructor(private http: HttpClient) {}

  getStudents() {
    return this.http.get(`${this.apiUrl}/students`);
  }

  getStudentById(id: string) {
    return this.http.get(`${this.apiUrl}/students/${id}`);
  }
}