import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-footer-component',
  imports: [CommonModule],
  templateUrl: './footer-component.html',
  styleUrl: './footer-component.scss',
})
export class FooterComponent {
  fecha = new Date()
  cboton = "Copyright";
  crmensaje: string | null = "© Cristopher Vera";
  mensajeVisible = false;

  mostrarMensaje() {
    if (this.crmensaje !== null) {
      this.mensajeVisible = true;
      setTimeout(() => {
        this.mensajeVisible = false;
      }, 3000); // ⏱️ 3 segundos

    }
  }
}
