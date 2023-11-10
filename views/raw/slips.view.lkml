
view: slips {
  derived_table: {
    sql: select 'EMEA' as region, 'LBG' as metro,'Not Set' as slip_source,'Uncategorized' as slip_category,'Not Set' as slip_type union all
      select 'EMEA','LBG','Not Set','Unknown','Not Set' union all
      select 'NASA','LBG','Not Set','Unknown','Not Set' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }

  dimension: slip_source {
    type: string
    sql: ${TABLE}.slip_source ;;
  }

  dimension: slip_category {
    type: string
    sql: ${TABLE}.slip_category ;;
  }

  dimension: slip_type {
    type: string
    sql: ${TABLE}.slip_type ;;
  }

  set: detail {
    fields: [
        region,
  metro,
  slip_source,
  slip_category,
  slip_type
    ]
  }
}
