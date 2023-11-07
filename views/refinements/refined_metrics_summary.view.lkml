include: "/views/raw/three_pdc_metrics_summary.view.lkml"

view: +metrics_summary {

  dimension_group: data_refresh {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.data_refresh ;;
    hidden: yes
  }

  dimension: data_source {
    type: string
    sql: ${TABLE}.data_source ;;
    hidden: no
  }

  dimension: denominator {
    type: number
    sql: ${TABLE}.denominator ;;
    hidden: yes
  }

  dimension_group: duration {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.duration_date ;;
    hidden: no
  }

  dimension: duration_type {
    type: string
    sql: ${TABLE}.duration_type ;;
    hidden: no
  }

  dimension: map_details {
    type: location
    sql_longitude: ${TABLE}.longitude ;;
    sql_latitude:  ${TABLE}.latitude;;
    hidden: no

  }

  dimension: map_metric {
    type: number
    sql: ${TABLE}.map_metric ;;
    hidden: yes
  }

  dimension: ooslo_metric_size {
    type: number
    sql: LOG(100 + ${map_metric}) ;;
    hidden: no
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
    hidden: no
  }

  dimension: mmt1_slo_count {
    type: number
    sql: ${TABLE}.mmt1_slo_count ;;
    hidden: yes
  }

  dimension: mmt1_slo_sum {
    type: number
    sql: ${TABLE}.mmt1_slo_sum ;;
    hidden: yes
  }

  dimension: mmt23_slo_count {
    type: number
    sql: ${TABLE}.mmt23_slo_count ;;
    hidden: yes
  }

  dimension: mmt23_slo_sum {
    type: number
    sql: ${TABLE}.mmt23_slo_sum ;;
    hidden: yes
  }

  dimension: numerator {
    type: number
    sql: ${TABLE}.numerator ;;
    hidden: yes
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    hidden: no
  }

  dimension: sdd_hwops_violations {
    type: number
    sql: ${TABLE}.sdd_hwops_violations ;;
    hidden: yes
  }

  dimension: sdd_processed_count {
    type: number
    sql: ${TABLE}.sdd_processed_count ;;
    hidden: yes
  }

  dimension: slo_score_base {
    type: number
    sql: ${TABLE}.slo_score_base ;;
    hidden: yes
  }

  dimension: target {
    type: number
    sql: ${TABLE}.target ;;
    hidden: no
  }

  measure: slo_score {
    type: number
    sql: ROUND(1.0 - IFNULL(SAFE_DIVIDE(CAST(IFNULL(SUM(${sdd_hwops_violations}),0) AS FLOAT64), CAST(IFNULL(SUM(${sdd_processed_count}), 0) AS FLOAT64)), 0), 2) ;;
    hidden: no
  }

  measure: sdd_slo_score_base {
    type: number
    sql:  ROUND((1.0 - SAFE_DIVIDE(SUM(${sdd_hwops_violations}), SUM(${sdd_processed_count})))*100,2) ;;
    label: "Data Security (Target: 100%)"
    hidden: no
  }

  measure: mmt1_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt1_slo_sum}), SUM(${mmt1_slo_count}))) * 100,2) ;;
    label: "MM Tier1 SLO Avg Score (Target: 99%)"
    hidden: no
  }

  measure: mmt23_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt23_slo_sum}), SUM(${mmt23_slo_count}))) * 100,2) ;;
    label: "MM Tier2&3 SLO Avg Score (Target: 99%)"
    hidden: no
  }

  measure: slip_count {
    type: sum
    sql: ${sdd_hwops_violations} ;;
    hidden: no
  }

  measure: processed_count {
    type: sum
    sql: ${sdd_processed_count} ;;
    hidden: no
  }

  dimension: last_data_refreshed {
    type: string
    sql: FORMAT_TIMESTAMP('%d-%b-%Y %I:%M %p, %Z', ${data_refresh_raw}, 'America/Los_Angeles') ;;
    hidden: no
  }

  measure: target_average {
    type: average
    sql: ${target} ;;
    hidden: no
  }
}
