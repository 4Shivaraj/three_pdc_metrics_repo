include: "/views/raw/three_pdc_metrics_summary.view.lkml"

view: +metrics_summary {

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

  dimension_group: data_refresh {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: timestamp
    sql:${TABLE}.data_refresh;;
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
    sql: ROUND((1.0 - IFNULL(SAFE_DIVIDE(CAST(IFNULL(SUM(${sdd_hwops_violations}),0) AS FLOAT64), CAST(IFNULL(SUM(${sdd_processed_count}), 0) AS FLOAT64)), 0)), 2) ;;
    hidden: no
    value_format_name: percent_2
  }

  ###### Measures ########
  measure: max_data_refresh_time  {
    type: date_time
    sql: MAX(${data_refresh_raw}) ;;
    html: <p style="font-size:15px"> <b>Max Data Refresh Time :  </b>{{value}} </p> ;;
    hidden: no
  }

  measure: sdd_slo_score_base {
    type: number
    sql:  ROUND((1.0 - SAFE_DIVIDE(SUM(${sdd_hwops_violations}), SUM(${sdd_processed_count})))*100,2) ;;
    label: "Data Security (Target: 100%)"
    link: {
      label: "3PDC Data Security"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/17?Metro={{ _filters['metrics_summary.metro']| url_encode }}&Region={{ _filters['metrics_summary.region']| url_encode }}&Duration%20Type={{ _filters['metrics_summary.duration_type']| url_encode }}"
    }
    hidden: no
  }

  measure: mmt1_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt1_slo_sum}), SUM(${mmt1_slo_count}))) * 100,2) ;;
    label: "MM Tier1 SLO Avg Score (Target: 99%)"
    link: {
      label: "3PDC Machine Maintenance"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/18?Metro%20Tier=&Region={{ _filters['metrics_summary.region']| url_encode }}&Duration%20Type={{ _filters['metrics_summary.duration_type']| url_encode }}&Metro={{ _filters['metrics_summary.metro']| url_encode }}"
    }
    hidden: no
  }

  measure: mmt23_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt23_slo_sum}), SUM(${mmt23_slo_count}))) * 100,2) ;;
    label: "MM Tier2&3 SLO Avg Score (Target: 99%)"
    link: {
      label: "3PDC Machine Maintenance"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/18?Metro%20Tier=&Region={{ _filters['metrics_summary.region']| url_encode }}&Duration%20Type={{ _filters['metrics_summary.duration_type']| url_encode }}&Metro={{ _filters['metrics_summary.metro']| url_encode }}"
    }
    hidden: no
  }

  measure: ooslo_metric_size {
    type: number
    sql: LOG(100 + ${map_metric}) ;;
    value_format_name: decimal_4
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

  measure: target_average {
    type: average
    sql: ${target} ;;
    hidden: no
  }
}
