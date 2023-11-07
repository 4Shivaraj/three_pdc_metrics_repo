connection: "@{CONNECTION_NAME}"

include: "/views/refinements/*.view.lkml"
# include: "/dashboards/three_pdc_dashboards/*.dashboard"

explore: metrics_summary{
  join: three_pdc_machine_maintenance{
  type:  left_outer
  relationship: many_to_many
  sql_on: ${metrics_summary.region} = ${three_pdc_machine_maintenance.region}
          and ${metrics_summary.metro} = ${three_pdc_machine_maintenance.metro} ;;
  }
}

# explore: three_pdc_machine_maintenance {}
