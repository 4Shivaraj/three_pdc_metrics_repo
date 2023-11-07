include: "/views/raw/three_pdc_machine_maintenance.view.lkml"

view: +three_pdc_machine_maintenance {

  dimension_group: duration {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.duration_date ;;
    hidden: no
  }
  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: ${TABLE}.metro_tier ;;
    hidden: no
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    hidden: no
  }
  dimension: time_above_buffer {
    type: number
    sql: ${TABLE}.time_above_buffer ;;
    hidden: no
  }
  dimension: total_time {
    type: number
    sql: ${TABLE}.total_time ;;
    hidden: no
  }
  measure: slo_average_score {
    type: number
    sql: 1.0 - (AVG(CAST((${time_above_buffer}) AS FLOAT64) / CAST((${total_time}) AS FLOAT64)));;
    value_format_name: percent_2
    hidden: no
  }
  measure: ooslo_average_score {
    type: number
    sql: AVG(CAST((${time_above_buffer}) AS FLOAT64) / CAST((${total_time}) AS FLOAT64)) ;;
    value_format_name: percent_2
    hidden: no
  }
  measure: target {
    type: number
    sql: 0.99 ;;
    value_format_name: percent_2
    hidden: no
  }
  measure: count {
    type: count
  }
}
