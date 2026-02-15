// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     JobsReportData data = Converter.fromJsonString(jsonString);

package com.apiverve.jobsreport.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static JobsReportData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(JobsReportData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(JobsReportData.class);
        writer = mapper.writerFor(JobsReportData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// JobsReportData.java

package com.apiverve.jobsreport.data;

import com.fasterxml.jackson.annotation.*;

public class JobsReportData {
    private String yearMonth;
    private long year;
    private long month;
    private Summary summary;
    private NonfarmPayrolls nonfarmPayrolls;
    private BySector bySector;

    @JsonProperty("yearMonth")
    public String getYearMonth() { return yearMonth; }
    @JsonProperty("yearMonth")
    public void setYearMonth(String value) { this.yearMonth = value; }

    @JsonProperty("year")
    public long getYear() { return year; }
    @JsonProperty("year")
    public void setYear(long value) { this.year = value; }

    @JsonProperty("month")
    public long getMonth() { return month; }
    @JsonProperty("month")
    public void setMonth(long value) { this.month = value; }

    @JsonProperty("summary")
    public Summary getSummary() { return summary; }
    @JsonProperty("summary")
    public void setSummary(Summary value) { this.summary = value; }

    @JsonProperty("nonfarmPayrolls")
    public NonfarmPayrolls getNonfarmPayrolls() { return nonfarmPayrolls; }
    @JsonProperty("nonfarmPayrolls")
    public void setNonfarmPayrolls(NonfarmPayrolls value) { this.nonfarmPayrolls = value; }

    @JsonProperty("bySector")
    public BySector getBySector() { return bySector; }
    @JsonProperty("bySector")
    public void setBySector(BySector value) { this.bySector = value; }
}

// BySector.java

package com.apiverve.jobsreport.data;

import com.fasterxml.jackson.annotation.*;

public class BySector {
    private long mining;
    private long construction;
    private long manufacturing;
    private long tradeTransportUtilities;
    private long information;
    private long financialActivities;
    private long professionalBusiness;
    private long educationHealth;
    private long leisureHospitality;
    private long otherServices;
    private long government;

    @JsonProperty("mining")
    public long getMining() { return mining; }
    @JsonProperty("mining")
    public void setMining(long value) { this.mining = value; }

    @JsonProperty("construction")
    public long getConstruction() { return construction; }
    @JsonProperty("construction")
    public void setConstruction(long value) { this.construction = value; }

    @JsonProperty("manufacturing")
    public long getManufacturing() { return manufacturing; }
    @JsonProperty("manufacturing")
    public void setManufacturing(long value) { this.manufacturing = value; }

    @JsonProperty("tradeTransportUtilities")
    public long getTradeTransportUtilities() { return tradeTransportUtilities; }
    @JsonProperty("tradeTransportUtilities")
    public void setTradeTransportUtilities(long value) { this.tradeTransportUtilities = value; }

    @JsonProperty("information")
    public long getInformation() { return information; }
    @JsonProperty("information")
    public void setInformation(long value) { this.information = value; }

    @JsonProperty("financialActivities")
    public long getFinancialActivities() { return financialActivities; }
    @JsonProperty("financialActivities")
    public void setFinancialActivities(long value) { this.financialActivities = value; }

    @JsonProperty("professionalBusiness")
    public long getProfessionalBusiness() { return professionalBusiness; }
    @JsonProperty("professionalBusiness")
    public void setProfessionalBusiness(long value) { this.professionalBusiness = value; }

    @JsonProperty("educationHealth")
    public long getEducationHealth() { return educationHealth; }
    @JsonProperty("educationHealth")
    public void setEducationHealth(long value) { this.educationHealth = value; }

    @JsonProperty("leisureHospitality")
    public long getLeisureHospitality() { return leisureHospitality; }
    @JsonProperty("leisureHospitality")
    public void setLeisureHospitality(long value) { this.leisureHospitality = value; }

    @JsonProperty("otherServices")
    public long getOtherServices() { return otherServices; }
    @JsonProperty("otherServices")
    public void setOtherServices(long value) { this.otherServices = value; }

    @JsonProperty("government")
    public long getGovernment() { return government; }
    @JsonProperty("government")
    public void setGovernment(long value) { this.government = value; }
}

// NonfarmPayrolls.java

package com.apiverve.jobsreport.data;

import com.fasterxml.jackson.annotation.*;

public class NonfarmPayrolls {
    private long total;
    private long nonfarmPayrollsPrivate;

    @JsonProperty("total")
    public long getTotal() { return total; }
    @JsonProperty("total")
    public void setTotal(long value) { this.total = value; }

    @JsonProperty("private")
    public long getNonfarmPayrollsPrivate() { return nonfarmPayrollsPrivate; }
    @JsonProperty("private")
    public void setNonfarmPayrollsPrivate(long value) { this.nonfarmPayrollsPrivate = value; }
}

// Summary.java

package com.apiverve.jobsreport.data;

import com.fasterxml.jackson.annotation.*;

public class Summary {
    private double unemploymentRate;
    private double laborForceParticipation;
    private long totalEmployed;
    private long totalUnemployed;
    private long laborForce;
    private long jobsChange;

    @JsonProperty("unemploymentRate")
    public double getUnemploymentRate() { return unemploymentRate; }
    @JsonProperty("unemploymentRate")
    public void setUnemploymentRate(double value) { this.unemploymentRate = value; }

    @JsonProperty("laborForceParticipation")
    public double getLaborForceParticipation() { return laborForceParticipation; }
    @JsonProperty("laborForceParticipation")
    public void setLaborForceParticipation(double value) { this.laborForceParticipation = value; }

    @JsonProperty("totalEmployed")
    public long getTotalEmployed() { return totalEmployed; }
    @JsonProperty("totalEmployed")
    public void setTotalEmployed(long value) { this.totalEmployed = value; }

    @JsonProperty("totalUnemployed")
    public long getTotalUnemployed() { return totalUnemployed; }
    @JsonProperty("totalUnemployed")
    public void setTotalUnemployed(long value) { this.totalUnemployed = value; }

    @JsonProperty("laborForce")
    public long getLaborForce() { return laborForce; }
    @JsonProperty("laborForce")
    public void setLaborForce(long value) { this.laborForce = value; }

    @JsonProperty("jobsChange")
    public long getJobsChange() { return jobsChange; }
    @JsonProperty("jobsChange")
    public void setJobsChange(long value) { this.jobsChange = value; }
}