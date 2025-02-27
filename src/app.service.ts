import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class AppService {
  constructor(private configService: ConfigService) {
    // Add this line to debug
    console.log('ENV value:', this.configService.get<string>('S3_REGION'));
  }

  getHello(): string {
    const envText = this.configService.get<string>('S3_REGION') || 'World';
    return `Hello ${envText}!`;
  }
}
