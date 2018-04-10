connection: "big_query_db"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: leticia_thesis_air_quality_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}


explore: all_particulates {
  join: wind_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_particulates.state_code} = ${wind_hourly_summary.state_code}
        AND ${all_particulates.county_code} = ${wind_hourly_summary.county_code}
        AND ${all_particulates.site_num} = ${wind_hourly_summary.site_num}
        AND ${all_particulates.date_gmt_raw} = ${wind_hourly_summary.date_gmt_raw}
        AND ${all_particulates.time_gmt} = ${wind_hourly_summary.time_gmt}
        AND ${wind_hourly_summary.units_of_measure} = "Knots"
    ;;
  }
  join: temperature_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_particulates.state_code} = ${temperature_hourly_summary.state_code}
        AND ${all_particulates.county_code} = ${temperature_hourly_summary.county_code}
        AND ${all_particulates.site_num} = ${temperature_hourly_summary.site_num}
        AND ${all_particulates.date_gmt_raw} = ${temperature_hourly_summary.date_gmt_raw}
        AND ${all_particulates.time_gmt} = ${temperature_hourly_summary.time_gmt}
    ;;
  }
  join: pressure_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_particulates.state_code} = ${pressure_hourly_summary.state_code}
        AND ${all_particulates.county_code} = ${pressure_hourly_summary.county_code}
        AND ${all_particulates.site_num} = ${pressure_hourly_summary.site_num}
        AND ${all_particulates.date_gmt_raw} = ${pressure_hourly_summary.date_gmt_raw}
        AND ${all_particulates.time_gmt} = ${pressure_hourly_summary.time_gmt}
    ;;
  }
  join: rh_and_dp_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_particulates.state_code} = ${rh_and_dp_hourly_summary.state_code}
        AND ${all_particulates.county_code} = ${rh_and_dp_hourly_summary.county_code}
        AND ${all_particulates.site_num} = ${rh_and_dp_hourly_summary.site_num}
        AND ${all_particulates.date_gmt_raw} = ${rh_and_dp_hourly_summary.date_gmt_raw}
        AND ${all_particulates.time_gmt} = ${rh_and_dp_hourly_summary.time_gmt}
    ;;
  }
#   join: pm10_daily_summary {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${all_particulates.state_code} = ${pm10_daily_summary.state_code}
#           AND ${all_particulates.county_code} = ${pm10_daily_summary.county_code}
#           AND ${all_particulates.site_num} = ${pm10_daily_summary.site_num}
#           AND ${all_particulates.date_local_raw} = ${pm10_daily_summary.date_local_raw}
#           ;;
#   }
#   join: pm25_frm_daily_summary {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${all_particulates.state_code} = ${pm25_frm_daily_summary.state_code}
#           AND ${all_particulates.county_code} = ${pm25_frm_daily_summary.county_code}
#           AND ${all_particulates.site_num} = ${pm25_frm_daily_summary.site_num}
#           AND ${all_particulates.date_local_raw} = ${pm25_frm_daily_summary.date_local_raw}
#           ;;
#   }


}

explore: all_gases {
  join: wind_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_gases.state_code} = ${wind_hourly_summary.state_code}
        AND ${all_gases.county_code} = ${wind_hourly_summary.county_code}
        AND ${all_gases.site_num} = ${wind_hourly_summary.site_num}
        AND ${all_gases.date_gmt_raw} = ${wind_hourly_summary.date_gmt_raw}
        AND ${all_gases.time_gmt} = ${wind_hourly_summary.time_gmt}
        AND ${wind_hourly_summary.units_of_measure} = "Knots"
    ;;
  }
  join: temperature_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_gases.state_code} = ${temperature_hourly_summary.state_code}
        AND ${all_gases.county_code} = ${temperature_hourly_summary.county_code}
        AND ${all_gases.site_num} = ${temperature_hourly_summary.site_num}
        AND ${all_gases.date_gmt_raw} = ${temperature_hourly_summary.date_gmt_raw}
        AND ${all_gases.time_gmt} = ${temperature_hourly_summary.time_gmt}
    ;;
  }
  join: pressure_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_gases.state_code} = ${pressure_hourly_summary.state_code}
        AND ${all_gases.county_code} = ${pressure_hourly_summary.county_code}
        AND ${all_gases.site_num} = ${pressure_hourly_summary.site_num}
        AND ${all_gases.date_gmt_raw} = ${pressure_hourly_summary.date_gmt_raw}
        AND ${all_gases.time_gmt} = ${pressure_hourly_summary.time_gmt}
    ;;
  }
  join: rh_and_dp_hourly_summary {
    type: inner
    relationship: one_to_one
    sql_on: ${all_gases.state_code} = ${rh_and_dp_hourly_summary.state_code}
        AND ${all_gases.county_code} = ${rh_and_dp_hourly_summary.county_code}
        AND ${all_gases.site_num} = ${rh_and_dp_hourly_summary.site_num}
        AND ${all_gases.date_gmt_raw} = ${rh_and_dp_hourly_summary.date_gmt_raw}
        AND ${all_gases.time_gmt} = ${rh_and_dp_hourly_summary.time_gmt}
    ;;
  }
}

# persist_with: leticia_thesis_air_quality_default_datagroup
#
# explore: air_quality_annual_summary {}
#
# explore: co_daily_summary {}
#
# explore: co_hourly_summary {}
#
# explore: hap_daily_summary {}
#
# explore: hap_hourly_summary {}
#
# explore: lead_daily_summary {}
#
# explore: no2_daily_summary {}
#
# explore: no2_hourly_summary {}
#
# explore: nonoxnoy_daily_summary {}
#
# explore: nonoxnoy_hourly_summary {}
#
# explore: o3_daily_summary {}
#
# explore: o3_hourly_summary {}
#
# explore: pm10_daily_summary {}
#
# explore: pm10_hourly_summary {}
#
# explore: pm25_frm_daily_summary {}
#
# explore: pm25_frm_hourly_summary {}
#
# explore: pm25_nonfrm_daily_summary {}
#
# explore: pm25_nonfrm_hourly_summary {}
#
# explore: pm25_speciation_daily_summary {}
#
# explore: pm25_speciation_hourly_summary {}
#
# explore: pressure_daily_summary {}
#
# explore: pressure_hourly_summary {}
#
# explore: rh_and_dp_daily_summary {}
#
# explore: rh_and_dp_hourly_summary {}
#
# explore: so2_daily_summary {}
#
# explore: so2_hourly_summary {}
#
# explore: temperature_daily_summary {}
#
# explore: temperature_hourly_summary {}
#
# explore: voc_daily_summary {}
#
# explore: voc_hourly_summary {}
#
# explore: wind_daily_summary {}
#
# explore: wind_hourly_summary {}
