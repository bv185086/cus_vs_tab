connection: "bv185086_report"

# include all the views
include: "/views/**/*.view"
include: "/**/*.dashboard"

datagroup: custom_tab_vs_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: custom_tab_vs_default_datagroup

explore: mark_list {}

explore: tab {}

explore: attendance1 {}

explore: attendance {}
