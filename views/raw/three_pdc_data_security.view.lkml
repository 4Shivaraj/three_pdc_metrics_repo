view: three_pdc_data_security {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.three_pdc_data_security` ;;

  fields_hidden_by_default: yes

  dimension_group: calendar {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_date ;;
  }
  dimension_group: last_refresh {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_refresh_date ;;
  }
  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }
  dimension_group: month_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month_start_date ;;
  }
  dimension_group: quarter_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.quarter_start_date ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: sdd_hwops_violations {
    type: number
    sql: ${TABLE}.sdd_hwops_violations ;;
  }
  dimension: sdd_processed_count {
    type: number
    sql: ${TABLE}.sdd_processed_count ;;
  }
  dimension: target {
    type: number
    sql: ${TABLE}.target ;;
  }
  dimension_group: week_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.week_start_date ;;
  }
  dimension_group: year_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.year_start_date ;;
  }
  measure: count {
    type: count
  }
}
