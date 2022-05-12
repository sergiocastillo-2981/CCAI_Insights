connection: "ee-power-bot"

# include all the views
include: "/views/**/*.view"

datagroup: ee_power_bot_block_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ee_power_bot_block_default_datagroup

explore: looker_dataset {
  hidden: yes
  join: looker_dataset__words {
    view_label: "Looker Dataset: Words"
    sql: LEFT JOIN UNNEST(${looker_dataset.words}) as looker_dataset__words ;;
    relationship: one_to_many
  }

  join: looker_dataset__issues {
    view_label: "Looker Dataset: Issues"
    sql: LEFT JOIN UNNEST(${looker_dataset.issues}) as looker_dataset__issues ;;
    relationship: one_to_many
  }

  join: looker_dataset__labels {
    view_label: "Looker Dataset: Labels"
    sql: LEFT JOIN UNNEST(${looker_dataset.labels}) as looker_dataset__labels ;;
    relationship: one_to_many
  }

  join: looker_dataset__entities {
    view_label: "Looker Dataset: Entities"
    sql: LEFT JOIN UNNEST(${looker_dataset.entities}) as looker_dataset__entities ;;
    relationship: one_to_many
  }

  join: looker_dataset__sentences {
    view_label: "Looker Dataset: Sentences"
    sql: LEFT JOIN UNNEST(${looker_dataset.sentences}) as looker_dataset__sentences ;;
    relationship: one_to_many
  }

  join: looker_dataset__sentences__annotations {
    view_label: "Looker Dataset: Sentences Annotations"
    sql: LEFT JOIN UNNEST(${looker_dataset__sentences.annotations}) as looker_dataset__sentences__annotations ;;
    relationship: one_to_many
  }

  join: looker_dataset__sentences__highlight_data {
    view_label: "Looker Dataset: Sentences Highlightdata"
    sql: LEFT JOIN UNNEST(${looker_dataset__sentences.highlight_data}) as looker_dataset__sentences__highlight_data ;;
    relationship: one_to_many
  }

  join: looker_dataset__sentences__intent_match_data {
    view_label: "Looker Dataset: Sentences Intentmatchdata"
    sql: LEFT JOIN UNNEST(${looker_dataset__sentences.intent_match_data}) as looker_dataset__sentences__intent_match_data ;;
    relationship: one_to_many
  }

  join: looker_dataset__sentences__phrase_match_data {
    view_label: "Looker Dataset: Sentences Phrasematchdata"
    sql: LEFT JOIN UNNEST(${looker_dataset__sentences.phrase_match_data}) as looker_dataset__sentences__phrase_match_data ;;
    relationship: one_to_many
  }

  join: looker_dataset__sentences__dialogflow_intent_match_data {
    view_label: "Looker Dataset: Sentences Dialogflowintentmatchdata"
    sql: LEFT JOIN UNNEST(${looker_dataset__sentences.dialogflow_intent_match_data}) as looker_dataset__sentences__dialogflow_intent_match_data ;;
    relationship: one_to_many
  }
}
