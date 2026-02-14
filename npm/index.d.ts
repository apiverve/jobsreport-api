declare module '@apiverve/jobsreport' {
  export interface jobsreportOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface jobsreportResponse {
    status: string;
    error: string | null;
    data: JobsReportData;
    code?: number;
  }


  interface JobsReportData {
      yearMonth:       string;
      year:            number;
      month:           number;
      summary:         Summary;
      nonfarmPayrolls: NonfarmPayrolls;
      bySector:        BySector;
  }
  
  interface BySector {
      mining:                  number;
      construction:            number;
      manufacturing:           number;
      tradeTransportUtilities: number;
      information:             number;
      financialActivities:     number;
      professionalBusiness:    number;
      educationHealth:         number;
      leisureHospitality:      number;
      otherServices:           number;
      government:              number;
  }
  
  interface NonfarmPayrolls {
      total:   number;
      private: number;
  }
  
  interface Summary {
      unemploymentRate:        number;
      laborForceParticipation: number;
      totalEmployed:           number;
      totalUnemployed:         number;
      laborForce:              number;
      jobsChange:              number;
  }

  export default class jobsreportWrapper {
    constructor(options: jobsreportOptions);

    execute(callback: (error: any, data: jobsreportResponse | null) => void): Promise<jobsreportResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jobsreportResponse | null) => void): Promise<jobsreportResponse>;
    execute(query?: Record<string, any>): Promise<jobsreportResponse>;
  }
}
