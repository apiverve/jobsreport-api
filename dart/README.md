# Jobs Report API - Dart/Flutter Client

Jobs Report provides monthly US employment data including unemployment rate, total employment, labor force participation, and employment by industry sector. The same data released in the monthly BLS jobs report.

[![pub package](https://img.shields.io/pub/v/apiverve_jobsreport.svg)](https://pub.dev/packages/apiverve_jobsreport)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Jobs Report API](https://apiverve.com/marketplace/jobsreport?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_jobsreport: ^1.2.4
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_jobsreport/apiverve_jobsreport.dart';

void main() async {
  final client = JobsreportClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'date': '2023-06'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "yearMonth": "2024-01",
    "year": 2024,
    "month": 1,
    "jobsChangeDirection": "growth",
    "summary": {
      "unemploymentRate": 3.7,
      "laborForceParticipation": 62.5,
      "totalEmployed": 161152000,
      "totalUnemployed": 6124000,
      "laborForce": 167276000,
      "jobsChange": 353000
    },
    "nonfarmPayrolls": {
      "total": 157245000,
      "private": 133567000
    },
    "bySector": {
      "mining": 645000,
      "construction": 8123000,
      "manufacturing": 12987000,
      "tradeTransportUtilities": 29456000,
      "information": 2987000,
      "financialActivities": 9234000,
      "professionalBusiness": 22876000,
      "educationHealth": 25678000,
      "leisureHospitality": 16789000,
      "otherServices": 5892000,
      "government": 23678000
    },
    "topSector": "Trade, Transport & Utilities",
    "formatted": {
      "totalEmployed": "161.15M",
      "totalUnemployed": "6.12M",
      "laborForce": "167.28M",
      "jobsChange": "+353.0K",
      "nonfarmPayrolls": "157.25M"
    }
  }
}
```

## API Reference

- **API Home:** [Jobs Report API](https://apiverve.com/marketplace/jobsreport?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/jobsreport](https://docs.apiverve.com/ref/jobsreport?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
