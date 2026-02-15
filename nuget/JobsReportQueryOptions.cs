using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.JobsReport
{
    /// <summary>
    /// Query options for the Jobs Report API
    /// </summary>
    public class JobsReportQueryOptions
    {
        /// <summary>
        /// Optional date in YYYY-MM format for historical lookup. Omit for current data.
        /// </summary>
        [JsonProperty("date")]
        public string Date { get; set; }
    }
}
