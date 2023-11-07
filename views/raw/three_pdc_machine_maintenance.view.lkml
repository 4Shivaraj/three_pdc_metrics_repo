view: three_pdc_machine_maintenance {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.three_pdc_machine_maintenance` ;;

  dimension_group: duration {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.duration_date ;;
  }
  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }
  dimension: metro_tier {
    type: string
    sql: ${TABLE}.metro_tier ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: time_above_buffer {
    type: number
    sql: ${TABLE}.time_above_buffer ;;
  }
  dimension: total_time {
    type: number
    sql: ${TABLE}.total_time ;;
  }
  measure: count {
    type: count
  }
}
