import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'front-docker';
  responseFromBack: any = 'N/A';
  constructor(private httpClient: HttpClient) {
    this.httpClient.get('http://localhost:3000/test').subscribe((res) => {
      this.responseFromBack = res;
    });
  }
}
