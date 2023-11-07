view: metrics_summary {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.three_pdc_metrics_summary` ;;

  fields_hidden_by_default: yes

  dimension_group: data_refresh {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.data_refresh ;;
  }
  dimension: data_source {
    type: string
    sql: ${TABLE}.data_source ;;
  }
  dimension: denominator {
    type: number
    sql: ${TABLE}.denominator ;;
  }
  dimension_group: duration {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.duration_date ;;
  }
  dimension: duration_type {
    type: string
    sql: ${TABLE}.duration_type ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: map_metric {
    type: number
    sql: ${TABLE}.map_metric ;;
  }
  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }
  dimension: mmt1_slo_count {
    type: number
    sql: ${TABLE}.mmt1_slo_count ;;
  }
  dimension: mmt1_slo_sum {
    type: number
    sql: ${TABLE}.mmt1_slo_sum ;;
  }
  dimension: mmt23_slo_count {
    type: number
    sql: ${TABLE}.mmt23_slo_count ;;
  }
  dimension: mmt23_slo_sum {
    type: number
    sql: ${TABLE}.mmt23_slo_sum ;;
  }
  dimension: numerator {
    type: number
    sql: ${TABLE}.numerator ;;
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
  dimension: slo_score_base {
    type: number
    sql: ${TABLE}.slo_score_base ;;
  }
  dimension: target {
    type: number
    sql: ${TABLE}.target ;;
  }
  measure: count {
    type: count
  }
}
