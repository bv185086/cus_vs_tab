view: attendance1 {
  sql_table_name: `Likhitha_demo.attendance1`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: attendance {
    type: number
    sql: ${TABLE}.attendance ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
