# Jobs Report API - PHP Package

Jobs Report provides monthly US employment data including unemployment rate, total employment, labor force participation, and employment by industry sector. The same data released in the monthly BLS jobs report.

## Installation

Install via Composer:

```bash
composer require apiverve/jobsreport
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Jobsreport\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['date' => '2023-06']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Jobsreport\Client;
use APIVerve\Jobsreport\Exceptions\APIException;
use APIVerve\Jobsreport\Exceptions\ValidationException;

try {
    $response = $client->execute(['date' => '2023-06']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jobsreport?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/jobsreport?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/jobsreport?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
