- dashboard: three_pdc_machine_maintenance
  title: 3PDC Machine Maintenance
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: oRiShaCKoel8WTrs97ljzs
  elements:
  - title: Metrics Summary
    name: Metrics Summary
    model: three_pdc
    explore: metrics_summary
    type: looker_grid
    fields: [metrics_summary.region, metrics_summary.metro, metrics_summary.sdd_slo_score_base,
      metrics_summary.mmt1_slo_average_score_base, metrics_summary.mmt23_slo_average_score_base]
    sorts: [metrics_summary.sdd_slo_score_base desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      metrics_summary.sdd_slo_score_base:
        is_active: false
    series_value_format:
      metrics_summary.sdd_slo_score_base: 0.00\%
      metrics_summary.mmt1_slo_average_score_base: 0.00\%
      metrics_summary.mmt23_slo_average_score_base: 0.00\%
    defaults_version: 1
    listen:
      Region: metrics_summary.region
      Metro: metrics_summary.metro
    row: 0
    col: 0
    width: 24
    height: 4
  - name: Machine Maintenance
    type: text
    title_text: Machine Maintenance
    subtitle_text: ''
    body_text: ''
    row: 4
    col: 0
    width: 24
    height: 1
  - title: Trend View
    name: Trend View
    model: three_pdc
    explore: metrics_summary
    type: looker_column
    fields: [metrics_summary.region, metrics_summary.mmt1_slo_average_score_base]
    sorts: [metrics_summary.mmt1_slo_average_score_base desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    label_value_format: ''
    column_group_spacing_ratio: 0
    defaults_version: 1
    listen:
      Region: metrics_summary.region
      Metro: metrics_summary.metro
    row: 5
    col: 0
    width: 6
    height: 7
  - title: SlO Score
    name: SlO Score
    model: three_pdc
    explore: metrics_summary
    type: looker_grid
    fields: [metrics_summary.metro, metrics_summary.region, metrics_summary.mmt1_slo_count,
      metrics_summary.mmt1_slo_average_score_base, metrics_summary.mmt23_slo_count,
      metrics_summary.mmt23_slo_average_score_base]
    sorts: [metrics_summary.metro]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      metrics_summary.mmt1_slo_average_score_base:
        is_active: false
    series_value_format:
      metrics_summary.mmt1_slo_average_score_base: 0.00\%
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Region: metrics_summary.region
      Metro: metrics_summary.metro
    row: 5
    col: 6
    width: 18
    height: 7
  filters:
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: three_pdc
    explore: metrics_summary
    listens_to_filters: []
    field: metrics_summary.region
  - name: Metro
    title: Metro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: three_pdc
    explore: metrics_summary
    listens_to_filters: []
    field: metrics_summary.metro
