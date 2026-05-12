import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponents } from './shared/header-components/header-components';
import { FooterComponents } from './shared/footer-components/footer-components';

@Component({
  selector: 'app-root',
  imports: [
    RouterOutlet,
    HeaderComponents,
    FooterComponents
  ],

  templateUrl: './app.html',
  styleUrls: ['./app.scss'],
})
export class App {}
