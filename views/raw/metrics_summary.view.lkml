view: metrics_summary {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.metrics_summary_test` ;;

  dimension: data_refresh {
    type: string
    sql: ${TABLE}.data_refresh ;;
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
  measure: count {
    type: count
  }
}
