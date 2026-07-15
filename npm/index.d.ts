declare module '@apiverve/jobsreport' {
  export interface jobsreportOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface jobsreportResponse {
    status: string;
    error: string | null;
    data: JobsReportData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface JobsReportData {
      yearMonth:           null | string;
      year:                number | null;
      month:               number | null;
      jobsChangeDirection: null | string;
      summary:             Summary;
      nonfarmPayrolls:     NonfarmPayrolls;
      bySector:            BySector;
      topSector:           null | string;
      formatted:           Formatted;
  }
  
  interface BySector {
      mining:                  number | null;
      construction:            number | null;
      manufacturing:           number | null;
      tradeTransportUtilities: number | null;
      information:             number | null;
      financialActivities:     number | null;
      professionalBusiness:    number | null;
      educationHealth:         number | null;
      leisureHospitality:      number | null;
      otherServices:           number | null;
      government:              number | null;
  }
  
  interface Formatted {
      totalEmployed:   null | string;
      totalUnemployed: null | string;
      laborForce:      null | string;
      jobsChange:      null | string;
      nonfarmPayrolls: null | string;
  }
  
  interface NonfarmPayrolls {
      total:   number | null;
      private: number | null;
  }
  
  interface Summary {
      unemploymentRate:        number | null;
      laborForceParticipation: number | null;
      totalEmployed:           number | null;
      totalUnemployed:         number | null;
      laborForce:              number | null;
      jobsChange:              number | null;
  }

  export default class jobsreportWrapper {
    constructor(options: jobsreportOptions);

    execute(callback: (error: any, data: jobsreportResponse | null) => void): Promise<jobsreportResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jobsreportResponse | null) => void): Promise<jobsreportResponse>;
    execute(query?: Record<string, any>): Promise<jobsreportResponse>;
  }
}
