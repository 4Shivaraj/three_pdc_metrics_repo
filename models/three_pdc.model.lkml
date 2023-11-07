connection: "@{CONNECTION_NAME}"

include: "/views/refinements/*.view.lkml"
# include: "/dashboards/three_pdc_dashboards/*.dashboard"

explore: metrics_summary{}
