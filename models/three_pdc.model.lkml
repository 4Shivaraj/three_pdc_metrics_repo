connection: "@{CONNECTION_NAME}"

include: "/views/refinements/*.view.lkml"
include: "/views/raw/*.view.lkml"
# include: "/dashboards/three_pdc_dashboards/*.dashboard"

explore: metrics_summary{
  join: three_pdc_machine_maintenance{
  type:  left_outer
  relationship: many_to_many
  sql_on: ${metrics_summary.region} = ${three_pdc_machine_maintenance.region}
          and ${metrics_summary.metro} = ${three_pdc_machine_maintenance.metro} ;;
  }
  query: region_by_data_security{
    dimensions: [metrics_summary.region]
    measures: [metrics_summary.sdd_slo_score_base]
    label: "Region By Data Security"
    description: "Region By Data Security"
    limit: 100
  }

}

explore: slips {}

# explore: three_pdc_machine_maintenance {}
