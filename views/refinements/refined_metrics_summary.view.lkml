include: "/views/raw/metrics_summary.view.lkml"

view: +metrics_summary {

  dimension_group: data_refresh{
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
    #datatype: datetime
    sql: PARSE_DATETIME('%Y-%m-%d %H:%M',${TABLE}.data_refresh);;
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

  ###### Measures ########

  measure: max_data_refresh_time  {
    type: date_time
    sql: MAX(${data_refresh_raw}) ;;
    html: <p style="font-size:15px"> <b>Max Data Refresh Time :  </b>{{value}} </p> ;;
  }

  measure: sdd_slo_score_base {
    type: number
    sql:  ROUND((1.0 - SAFE_DIVIDE(SUM(${sdd_hwops_violations}), SUM(${sdd_processed_count})))*100,2) ;;
    label: "Data Security (Target: 100%)"
  }

  measure: mmt1_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt1_slo_sum}), SUM(${mmt1_slo_count}))) * 100,2) ;;
    label: "MM Tier1 SLO Avg Score (Target: 99%)"
  }

  measure: mmt23_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt23_slo_sum}), SUM(${mmt23_slo_count}))) * 100,2) ;;
    label: "MM Tier2&3 SLO Avg Score (Target: 99%)"
  }


  measure: count {
    type: count
  }

  drill_fields: [sdd_slo_score_base, mmt1_slo_average_score_base, mmt23_slo_average_score_base]

}
