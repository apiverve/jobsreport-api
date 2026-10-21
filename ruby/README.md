# Jobs Report API - Ruby Gem

Jobs Report provides monthly US employment data including unemployment rate, total employment, labor force participation, and employment by industry sector. The same data released in the monthly BLS jobs report.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_jobsreport'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_jobsreport
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_jobsreport'

# Initialize the client
client = APIVerve::Jobsreport::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ date: "2023-06" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ date: "2023-06" })
  puts response["data"]
rescue APIVerve::Jobsreport::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Jobsreport::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Jobsreport::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jobsreport?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/jobsreport?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/jobsreport?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
