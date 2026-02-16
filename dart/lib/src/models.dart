/// Response models for the Jobs Report API.

/// API Response wrapper.
class JobsreportResponse {
  final String status;
  final dynamic error;
  final JobsreportData? data;

  JobsreportResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory JobsreportResponse.fromJson(Map<String, dynamic> json) => JobsreportResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? JobsreportData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Jobs Report API.

class JobsreportData {
  String? yearMonth;
  int? year;
  int? month;
  JobsreportDataSummary? summary;
  JobsreportDataNonfarmpayrolls? nonfarmPayrolls;
  JobsreportDataBysector? bySector;

  JobsreportData({
    this.yearMonth,
    this.year,
    this.month,
    this.summary,
    this.nonfarmPayrolls,
    this.bySector,
  });

  factory JobsreportData.fromJson(Map<String, dynamic> json) => JobsreportData(
      yearMonth: json['yearMonth'],
      year: json['year'],
      month: json['month'],
      summary: json['summary'] != null ? JobsreportDataSummary.fromJson(json['summary']) : null,
      nonfarmPayrolls: json['nonfarmPayrolls'] != null ? JobsreportDataNonfarmpayrolls.fromJson(json['nonfarmPayrolls']) : null,
      bySector: json['bySector'] != null ? JobsreportDataBysector.fromJson(json['bySector']) : null,
    );
}

class JobsreportDataSummary {
  double? unemploymentRate;
  double? laborForceParticipation;
  int? totalEmployed;
  int? totalUnemployed;
  int? laborForce;
  int? jobsChange;

  JobsreportDataSummary({
    this.unemploymentRate,
    this.laborForceParticipation,
    this.totalEmployed,
    this.totalUnemployed,
    this.laborForce,
    this.jobsChange,
  });

  factory JobsreportDataSummary.fromJson(Map<String, dynamic> json) => JobsreportDataSummary(
      unemploymentRate: json['unemploymentRate'],
      laborForceParticipation: json['laborForceParticipation'],
      totalEmployed: json['totalEmployed'],
      totalUnemployed: json['totalUnemployed'],
      laborForce: json['laborForce'],
      jobsChange: json['jobsChange'],
    );
}

class JobsreportDataNonfarmpayrolls {
  int? total;
  int? private;

  JobsreportDataNonfarmpayrolls({
    this.total,
    this.private,
  });

  factory JobsreportDataNonfarmpayrolls.fromJson(Map<String, dynamic> json) => JobsreportDataNonfarmpayrolls(
      total: json['total'],
      private: json['private'],
    );
}

class JobsreportDataBysector {
  int? mining;
  int? construction;
  int? manufacturing;
  int? tradeTransportUtilities;
  int? information;
  int? financialActivities;
  int? professionalBusiness;
  int? educationHealth;
  int? leisureHospitality;
  int? otherServices;
  int? government;

  JobsreportDataBysector({
    this.mining,
    this.construction,
    this.manufacturing,
    this.tradeTransportUtilities,
    this.information,
    this.financialActivities,
    this.professionalBusiness,
    this.educationHealth,
    this.leisureHospitality,
    this.otherServices,
    this.government,
  });

  factory JobsreportDataBysector.fromJson(Map<String, dynamic> json) => JobsreportDataBysector(
      mining: json['mining'],
      construction: json['construction'],
      manufacturing: json['manufacturing'],
      tradeTransportUtilities: json['tradeTransportUtilities'],
      information: json['information'],
      financialActivities: json['financialActivities'],
      professionalBusiness: json['professionalBusiness'],
      educationHealth: json['educationHealth'],
      leisureHospitality: json['leisureHospitality'],
      otherServices: json['otherServices'],
      government: json['government'],
    );
}

class JobsreportRequest {
  String? date;

  JobsreportRequest({
    this.date,
  });

  Map<String, dynamic> toJson() => {
      if (date != null) 'date': date,
    };
}
