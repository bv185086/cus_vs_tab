view: attendance {
  sql_table_name: `Likhitha_demo.attendance`
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

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
