- dashboard: three_pdc_metrics_summary
  title: 3PDC Metrics Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: p77xly4pPHVn87mvZ29WOC
  elements:
    - title: Summary by Region
      name: Summary by Region
      model: three_pdc
      explore: metrics_summary
      type: looker_grid
      fields: [metrics_summary.region, metrics_summary.sdd_slo_score_base, metrics_summary.mmt1_slo_average_score_base,
        metrics_summary.mmt23_slo_average_score_base]
      sorts: [metrics_summary.sdd_slo_score_base desc 0]
      limit: 500
      column_limit: 50
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: true
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
          value_display: true
      conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
          font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
          strikethrough: false, fields: []}]
      series_value_format:
        metrics_summary.sdd_slo_score_base: 0.00\%
        metrics_summary.mmt1_slo_average_score_base: 0.00\%
        metrics_summary.mmt23_slo_average_score_base: 0.00\%
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
      hidden_pivots: {}
      listen:
        Region: metrics_summary.region
        Metro: metrics_summary.metro
      row: 0
      col: 0
      width: 24
      height: 4
    - title: Summary by Metro
      name: Summary by Metro
      model: three_pdc
      explore: metrics_summary
      type: looker_grid
      fields: [metrics_summary.region, metrics_summary.metro, metrics_summary.sdd_slo_score_base,
        metrics_summary.mmt1_slo_average_score_base, metrics_summary.mmt23_slo_average_score_base]
      sorts: [metrics_summary.sdd_slo_score_base desc 0]
      limit: 500
      column_limit: 50
      show_view_names: false
      show_row_numbers: true
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
      row: 4
      col: 0
      width: 24
      height: 5
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
