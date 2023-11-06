connection: "@{CONNECTION_NAME}"

include: "/views/refinements/*.view.lkml"
include: "/dashboards/*.dashboard"

explore: metrics_summary {}
