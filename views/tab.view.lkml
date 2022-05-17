view: tab {
  sql_table_name: `Likhitha_demo.tab`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: sort_order {
    type: string
    sql: ${TABLE}.sort_order ;;
  }

  dimension: tabs {
    type: string
    sql: ${TABLE}.tabs ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
