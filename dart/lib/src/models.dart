/// Response models for the Jobs Report API.

/// API Response wrapper.
class JobsreportResponse {
  final String status;
  final dynamic error;
  final JobsreportData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  JobsreportResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory JobsreportResponse.fromJson(Map<String, dynamic> json) => JobsreportResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? JobsreportData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Jobs Report API.

class JobsreportData {
  String? yearMonth;
  num? year;
  num? month;
  String? jobsChangeDirection;
  JobsreportDataSummary? summary;
  JobsreportDataNonfarmpayrolls? nonfarmPayrolls;
  JobsreportDataBysector? bySector;
  String? topSector;
  JobsreportDataFormatted? formatted;

  JobsreportData({
    this.yearMonth,
    this.year,
    this.month,
    this.jobsChangeDirection,
    this.summary,
    this.nonfarmPayrolls,
    this.bySector,
    this.topSector,
    this.formatted,
  });

  factory JobsreportData.fromJson(Map<String, dynamic> json) => JobsreportData(
      yearMonth: json['yearMonth'],
      year: json['year'],
      month: json['month'],
      jobsChangeDirection: json['jobsChangeDirection'],
      summary: json['summary'] != null ? JobsreportDataSummary.fromJson(json['summary']) : null,
      nonfarmPayrolls: json['nonfarmPayrolls'] != null ? JobsreportDataNonfarmpayrolls.fromJson(json['nonfarmPayrolls']) : null,
      bySector: json['bySector'] != null ? JobsreportDataBysector.fromJson(json['bySector']) : null,
      topSector: json['topSector'],
      formatted: json['formatted'] != null ? JobsreportDataFormatted.fromJson(json['formatted']) : null,
    );
}

class JobsreportDataSummary {
  num? unemploymentRate;
  num? laborForceParticipation;
  num? totalEmployed;
  num? totalUnemployed;
  num? laborForce;
  num? jobsChange;

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
  num? total;
  num? private;

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
  num? mining;
  num? construction;
  num? manufacturing;
  num? tradeTransportUtilities;
  num? information;
  num? financialActivities;
  num? professionalBusiness;
  num? educationHealth;
  num? leisureHospitality;
  num? otherServices;
  num? government;

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

class JobsreportDataFormatted {
  String? totalEmployed;
  String? totalUnemployed;
  String? laborForce;
  String? jobsChange;
  String? nonfarmPayrolls;

  JobsreportDataFormatted({
    this.totalEmployed,
    this.totalUnemployed,
    this.laborForce,
    this.jobsChange,
    this.nonfarmPayrolls,
  });

  factory JobsreportDataFormatted.fromJson(Map<String, dynamic> json) => JobsreportDataFormatted(
      totalEmployed: json['totalEmployed'],
      totalUnemployed: json['totalUnemployed'],
      laborForce: json['laborForce'],
      jobsChange: json['jobsChange'],
      nonfarmPayrolls: json['nonfarmPayrolls'],
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
