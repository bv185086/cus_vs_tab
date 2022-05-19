- dashboard: sales_dashboard__regional_manager_copy
  title: Sales Dashboard - Regional Manager (copy)
  layout: newspaper
  refresh: 10 minutes
  elements:
  - name: Sales by Store
    title: Sales by Store
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: looker_map
    fields: [dim_stores.store_location, dim_stores.store_name, sales_by_store_dashboard.previous_period,
      sales_by_store_dashboard.total_net_sales]
    filters: {}
    sorts: [dim_stores.store_name, sales_by_store_dashboard.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "if\n\
          (${dim_stores.store_name}=offset(${dim_stores.store_name},1)\n  ,(${sales_by_store_dashboard.total_net_sales}\
          \ - \noffset(${sales_by_store_dashboard.total_net_sales}, 1))\n/offset(${sales_by_store_dashboard.total_net_sales},1)\n\
          \  ,null\n  )\n\n", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}, {table_calculation: previous_period,
        label: Previous Period, expression: "if\n(${dim_stores.store_name}=offset(${dim_stores.store_name},1)\n\
          ,offset(${sales_by_store_dashboard.total_net_sales},1)\n,null)", value_format: !!null '',
        value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: streets
    map_position: fit_data
    map_scale_indicator: metric_imperial
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle_and_icon
    map_marker_icon_name: shopping_cart
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map_latitude: 32.759562025650126
    map_longitude: -111.46728515625
    map_zoom: 6
    map_marker_radius_fixed: 10
    map_marker_radius_min: 30000
    map_marker_radius_max: 90000
    map_marker_color: []
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Period: sales_by_store_dashboard.previous_period_filter
      Stores: dim_stores.store_name
    row: 0
    col: 16
    width: 8
    height: 11
  - name: Sales Trend
    title: Sales Trend
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: looker_line
    fields: [sales_by_store_dashboard.total_net_sales, sales_by_store_dashboard.business_month]
    fill_fields: [sales_by_store_dashboard.business_month]
    filters:
      sales_by_store_dashboard.business_date: 12 months
    sorts: [sales_by_store_dashboard.business_month desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_by_store_dashboard.total_net_sales,
            id: sales_by_store_dashboard.total_net_sales, name: Net Sales}], showLabels: true,
        showValues: true, valueFormat: '0.00,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    font_size: 10px
    label_value_format: 0.000,," M"
    series_types: {}
    series_colors: {}
    series_point_styles:
      fact_store_hourly_sales.total_net_sales: square
    label_color: [blue]
    trend_lines: []
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    hidden_fields: []
    defaults_version: 1
    listen:
      Stores: dim_stores.store_name
    row: 12
    col: 0
    width: 8
    height: 6
  - name: Sales by Store - comparison
    title: Sales by Store - comparison
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: looker_column
    fields: [dim_stores.store_name, sales_by_store_dashboard.total_net_sales, sales_by_store_dashboard.previous_period,
      sales_by_store_dashboard.period_range]
    pivots: [sales_by_store_dashboard.previous_period]
    filters: {}
    sorts: [dim_stores.store_name, sales_by_store_dashboard.previous_period]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${sales_by_store_dashboard.total_net_sales}\
          \ \n  -\n  pivot_offset(${sales_by_store_dashboard.total_net_sales},-1)\n\
          ) \n/ pivot_offset(${sales_by_store_dashboard.total_net_sales},-1)\n\n",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_by_store_dashboard.total_net_sales,
            id: Previous Period - sales_by_store_dashboard.total_net_sales, name: Previous
              Period}, {axisId: sales_by_store_dashboard.total_net_sales, id: This
              Period - sales_by_store_dashboard.total_net_sales, name: This Period}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 71, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: ''
    hidden_series: [Previous Period - change]
    hide_legend: false
    label_value_format: "#,###"
    series_types:
      This Period - change: scatter
      Previous Period - change: scatter
    series_colors:
      This Period - sales_by_store_dashboard.total_net_sales: "#4A80BC"
      Previous Period - sales_by_store_dashboard.total_net_sales: "#69d6de"
      Previous Period - 2020-06-07 to 2020-06-08 - sales_by_store_dashboard.total_net_sales: "#69d6de"
      This Period - 2020-06-08 to 2020-06-09 - sales_by_store_dashboard.total_net_sales: "#4A80BC"
      Previous Period - 2020-06-08 to 2020-06-09 - sales_by_store_dashboard.total_net_sales: "#69d6de"
      This Period - 2020-06-09 to 2020-06-10 - sales_by_store_dashboard.total_net_sales: "#4A80BC"
    series_labels:
      Previous Period - 2020-06-07 to 2020-06-08 - sales_by_store_dashboard.total_net_sales: Previous
        Period
      This Period - 2020-06-08 to 2020-06-09 - sales_by_store_dashboard.total_net_sales: This
        Period
      Previous Period - 2020-06-08 to 2020-06-09 - sales_by_store_dashboard.total_net_sales: Previous
        Period
      This Period - 2020-06-09 to 2020-06-10 - sales_by_store_dashboard.total_net_sales: This
        Period
    series_point_styles:
      This Period - change: square
      Previous Period - change: square
    label_color: [black]
    reference_lines: []
    trend_lines: []
    show_dropoff: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: streets
    map_position: fit_data
    map_scale_indicator: metric_imperial
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle_and_icon
    map_marker_icon_name: shopping_cart
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map_latitude: 36.582206603309146
    map_longitude: -103.4423840045929
    map_zoom: 5
    map_marker_radius_fixed: 10
    map_marker_radius_min: 30000
    map_marker_radius_max: 90000
    map_marker_color: []
    hidden_fields: [previous_period, sales_by_store_dashboard.period_range]
    defaults_version: 1
    listen:
      Period: sales_by_store_dashboard.previous_period_filter
      Stores: dim_stores.store_name
    row: 11
    col: 16
    width: 8
    height: 7
  - name: Sales
    title: Sales
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: single_value
    fields: [sales_by_store_dashboard.previous_period, sales_by_store_dashboard.total_net_sales]
    filters: {}
    sorts: [sales_by_store_dashboard.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${sales_by_store_dashboard.total_net_sales}\
          \ - \noffset(${sales_by_store_dashboard.total_net_sales}, 1))\n/offset(${sales_by_store_dashboard.total_net_sales},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: previous, label: Previous, expression: 'offset(${sales_by_store_dashboard.total_net_sales},1)',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color: ''
    single_value_title: ''
    comparison_label: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    hidden_fields: []
    y_axes: []
    defaults_version: 1
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
    show_value_labels: true
    font_size: 12
    listen:
      Period: sales_by_store_dashboard.previous_period_filter
      Stores: dim_stores.store_name
    row: 0
    col: 0
    width: 4
    height: 4
  - name: Returns
    title: Returns
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: single_value
    fields: [sales_by_store_dashboard.previous_period, sales_by_store_dashboard.total_net_returns]
    filters: {}
    sorts: [sales_by_store_dashboard.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${sales_by_store_dashboard.total_net_returns}\
          \ - \noffset(${sales_by_store_dashboard.total_net_returns}, 1))\n/offset(${sales_by_store_dashboard.total_net_returns},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: previous, label: Previous, expression: 'offset(${sales_by_store_dashboard.total_net_returns},1)',
        value_format: !!null '', value_format_name: usd_0, is_disabled: false, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color: ''
    single_value_title: ''
    comparison_label: ''
    series_types: {}
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Period: sales_by_store_dashboard.previous_period_filter
      Stores: dim_stores.store_name
    row: 0
    col: 4
    width: 4
    height: 4
  - name: Daily Ticket Count
    title: Daily Ticket Count
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: single_value
    fields: [sales_by_store_dashboard.total_Tickets, sales_by_store_dashboard.previous_period,
      sales_by_store_dashboard.count_distinct_dates, sales_by_store_dashboard.average_Tickets_Per_Day]
    filters: {}
    sorts: [sales_by_store_dashboard.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${sales_by_store_dashboard.average_Tickets_Per_Day}\
          \ - \noffset(${sales_by_store_dashboard.average_Tickets_Per_Day}, 1))\n\
          /offset(${sales_by_store_dashboard.average_Tickets_Per_Day},1)", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}, {
        table_calculation: previous, label: Previous, expression: 'offset(${sales_by_store_dashboard.average_Tickets_Per_Day},1)',
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    series_types: {}
    hidden_fields: [sales_by_store_dashboard.total_Tickets, sales_by_store_dashboard.count_distinct_dates]
    y_axes: []
    defaults_version: 1
    listen:
      Period: sales_by_store_dashboard.previous_period_filter
      Stores: dim_stores.store_name
    row: 0
    col: 12
    width: 4
    height: 4
  - name: Avg Basket Amount
    title: Avg Basket Amount
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: single_value
    fields: [sales_by_store_dashboard.previous_period, sales_by_store_dashboard.average_Basket_Amount]
    filters: {}
    sorts: [sales_by_store_dashboard.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${sales_by_store_dashboard.average_Basket_Amount}\
          \ - \noffset(${sales_by_store_dashboard.average_Basket_Amount}, 1))\n/offset(${sales_by_store_dashboard.average_Basket_Amount},1)",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}, {table_calculation: previous, label: Previous, expression: 'offset(${sales_by_store_dashboard.average_Basket_Amount},1)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Period: sales_by_store_dashboard.previous_period_filter
      Stores: dim_stores.store_name
    row: 0
    col: 8
    width: 4
    height: 4
  - name: Sales by Touchpoint Group
    title: Sales by Touchpoint Group
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    type: looker_pie
    fields: [dim_touchpointgroups.touchpointgroup_name, sales_by_store_dashboard.total_net_sales]
    filters: {}
    sorts: [sales_by_store_dashboard.total_net_sales desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Period: sales_by_store_dashboard.business_date
      Stores: dim_stores.store_name
    row: 12
    col: 8
    width: 8
    height: 6
  - name: Sales by Department
    title: Sales by Department
    model: Retail_Central_Reports
    explore: sales_by_department_dashboard
    type: looker_column
    fields: [dim_items.department, sales_by_department_dashboard.rank_limit, sales_by_department_dashboard.total_net_sales,
      sales_by_department_dashboard.period_range, sales_by_department_dashboard.previous_period]
    pivots: [sales_by_department_dashboard.previous_period]
    filters:
      sales_by_department_dashboard.max_rank: '35'
      sales_by_department_dashboard.total_net_sales: ">0"
    sorts: [sales_by_department_dashboard.previous_period 0, change 1]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "round((coalesce(${sales_by_department_dashboard.total_net_sales},0)\
          \ - \npivot_offset(${sales_by_department_dashboard.total_net_sales}, -1))\n\
          /pivot_offset(${sales_by_department_dashboard.total_net_sales}, -1)*100,2)",
        value_format: 0.0\%, value_format_name: !!null '', is_disabled: false, _kind_hint: measure,
        _type_hint: number}, {table_calculation: rank, label: Rank, expression: 'rank(${sales_by_department_dashboard.total_net_sales},${sales_by_department_dashboard.total_net_sales})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: show_in_visualization, label: Show
          in Visualization, expression: "${sales_by_department_dashboard.rank_limit}>=${rank}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: yesno, is_disabled: false}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_by_department_dashboard.total_net_sales,
            id: Previous Period - sales_by_department_dashboard.total_net_sales, name: Previous
              Period - Net Sales}, {axisId: sales_by_department_dashboard.total_net_sales,
            id: This Period - sales_by_department_dashboard.total_net_sales, name: This
              Period - Net Sales}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: log}, {label: '', orientation: right, series: [
          {axisId: change, id: Previous Period - change, name: Previous Period - Change},
          {axisId: change, id: This Period - change, name: This Period - Change}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    size_by_field: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hidden_series: [Previous Period - change, Previous Period - 2020-06-08 to 2020-06-09
        - change]
    hide_legend: false
    font_size: 10px
    label_value_format: ''
    series_types:
      This Period - change: area
      Previous Period - change: scatter
      Previous Period - 2020-06-08 to 2020-06-09 - change: scatter
      This Period - 2020-06-09 to 2020-06-10 - change: area
    series_colors:
      Previous Period - change: "#FFFFFF"
      This Period - change: "#D13452"
      Previous Period - sales_by_department_dashboard.total_net_sales: "#69d6de"
      This Period - sales_by_department_dashboard.total_net_sales: "#4A80BC"
      Previous Period - 2020-06-08 to 2020-06-09 - sales_by_department_dashboard.total_net_sales: "#69d6de"
      Previous Period - 2020-06-08 to 2020-06-09 - change: "#ffffff"
      This Period - 2020-06-09 to 2020-06-10 - sales_by_department_dashboard.total_net_sales: "#4A80BC"
    series_labels:
      This Period - sales_by_department_dashboard.total_net_sales: This Period - Net
        Sales
      Previous Period - sales_by_department_dashboard.total_net_sales: Previous Period
        - Net Sales
      Previous Period - 2020-06-08 to 2020-06-09 - sales_by_department_dashboard.total_net_sales: Previous
        Period
      Previous Period - 2020-06-08 to 2020-06-09 - change: Previous Period - Change
      This Period - 2020-06-09 to 2020-06-10 - sales_by_department_dashboard.total_net_sales: This
        Period
      This Period - 2020-06-09 to 2020-06-10 - change: Change
    series_point_styles:
      Previous Period - change: auto
      This Period - change: auto
      This Period - 2020-06-09 to 2020-06-10 - change: diamond
    label_color: [gray, gray, gray, black]
    reference_lines: []
    column_spacing_ratio: 0.2
    column_group_spacing_ratio: 0.3
    show_dropoff: false
    hidden_fields: [rank, sales_by_department_dashboard.rank_limit, show_in_visualization,
      sales_by_department_dashboard.period_range]
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    hidden_points_if_no: [show_in_visualization]
    listen:
      Period: sales_by_department_dashboard.previous_period_filter
      Stores: dim_stores.store_name
    row: 4
    col: 0
    width: 16
    height: 8
  filters:
  - name: Period
    title: Period
    type: date_filter
    default_value: 1 days ago for 1 days
    allow_multiple_values: true
    required: true
  - name: Stores
    title: Stores
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: Retail_Central_Reports
    explore: sales_by_store_dashboard
    listens_to_filters: []
    field: dim_stores.store_name
