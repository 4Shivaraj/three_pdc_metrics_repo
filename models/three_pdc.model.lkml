connection: "@{CONNECTION_NAME}"

include: "/views/refinements/*.view.lkml"
include: "/views/derived/*.view.lkml"

explore: metrics_summary {}
explore: Navigation_Bar {}
