view: looker_dataset {
  sql_table_name: `block_ccai_insights_us1.looker_dataset`
    ;;

  dimension: agent_id {
    type: string
    description: "The user-provided identifier for the agent who handled the conversation."
    sql: ${TABLE}.agentId ;;
  }

  dimension: agent_sentiment_magnitude {
    type: number
    description: "A non-negative number from zero to infinity that represents the abolute magnitude of the agent sentiment regardless of score."
    sql: ${TABLE}.agentSentimentMagnitude ;;
  }

  dimension: agent_sentiment_score {
    type: number
    description: "Agent sentiment score between -1.0 (negative) and 1.0 (positive)."
    sql: ${TABLE}.agentSentimentScore ;;
  }

  dimension: agent_speaking_percentage {
    type: number
    description: "Percentage of the conversation with the agent speaking."
    sql: ${TABLE}.agentSpeakingPercentage ;;
  }

  dimension: audio_file_uri {
    type: string
    description: "Location of the audio file on GCS."
    sql: ${TABLE}.audioFileUri ;;
  }

  dimension: client_sentiment_magnitude {
    type: number
    description: "A non-negative number from zero to infinity that represents the abolute magnitude of client sentiment regardless of score."
    sql: ${TABLE}.clientSentimentMagnitude ;;
  }

  dimension: client_sentiment_score {
    type: number
    description: "Client sentiment score between -1.0 (negative) and 1.0 (positive)."
    sql: ${TABLE}.clientSentimentScore ;;
  }

  dimension: client_speaking_percentage {
    type: number
    description: "Percentage of the conversation with the client speaking."
    sql: ${TABLE}.clientSpeakingPercentage ;;
  }

  dimension: conversation_name {
    type: string
    description: "Name of the conversation resource."
    sql: ${TABLE}.conversationName ;;
  }

  dimension: day {
    type: number
    description: "Day date part of `load_timestamp_utc`."
    sql: ${TABLE}.day ;;
  }

  dimension: duration_nanos {
    type: number
    description: "Conversation duration in nanoseconds."
    sql: ${TABLE}.durationNanos ;;
  }

  dimension: entities {
    hidden: yes
    sql: ${TABLE}.entities ;;
  }

  dimension: issues {
    hidden: yes
    sql: ${TABLE}.issues ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: language_code {
    type: string
    description: "Language code."
    sql: ${TABLE}.languageCode ;;
  }

  dimension: load_timestamp_utc {
    type: number
    description: "The time in seconds at which the conversation was loaded into Insights."
    sql: ${TABLE}.loadTimestampUtc ;;
  }

  dimension: medium {
    type: string
    description: "Medium of the conversation."
    sql: ${TABLE}.medium ;;
  }

  dimension: month {
    type: number
    description: "Month date part of `load_timestamp_utc`."
    sql: ${TABLE}.month ;;
  }

  dimension: sentences {
    hidden: yes
    sql: ${TABLE}.sentences ;;
  }

  dimension: silence_nanos {
    type: number
    description: "Number of nanoseconds calculated to be in silence."
    sql: ${TABLE}.silenceNanos ;;
  }

  dimension: silence_percentage {
    type: number
    description: "Percentage of the total conversation spent in silence."
    sql: ${TABLE}.silencePercentage ;;
  }

  dimension: start_timestamp_utc {
    type: number
    description: "The time in seconds at which the conversation started."
    sql: ${TABLE}.startTimestampUtc ;;
  }

  dimension: transcript {
    type: string
    description: "The complete text transcript of the conversation."
    sql: ${TABLE}.transcript ;;
  }

  dimension: turn_count {
    type: number
    description: "The number of turns taken in the conversation."
    sql: ${TABLE}.turnCount ;;
  }

  dimension: words {
    hidden: yes
    sql: ${TABLE}.words ;;
  }

  dimension: year {
    type: number
    description: "Year date part of `load_timestamp_utc`."
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [conversation_name]
  }
}

view: looker_dataset__words {
  dimension: end_offset_nanos {
    type: number
    description: "Time offset in nanoseconds of the end of this word relative to the beginning of the conversation."
    sql: endOffsetNanos ;;
  }

  dimension: language_code {
    type: string
    description: "Language code."
    sql: languageCode ;;
  }

  dimension: looker_dataset__words {
    type: string
    description: "The list of all spoken words."
    hidden: yes
    sql: looker_dataset__words ;;
  }

  dimension: speaker_tag {
    type: number
    description: "The speaker that the word originated from."
    sql: speakerTag ;;
  }

  dimension: start_offset_nanos {
    type: number
    description: "Time offset in nanoseconds of the start of this word relative to the beginning of the conversation."
    sql: startOffsetNanos ;;
  }

  dimension: word {
    type: string
    description: "The transcribed word."
    sql: word ;;
  }
}

view: looker_dataset__issues {
  dimension: looker_dataset__issues {
    type: string
    description: "The list of all issues of the conversation."
    hidden: yes
    sql: looker_dataset__issues ;;
  }

  dimension: name {
    type: string
    description: "Name of the issue."
    sql: name ;;
  }

  dimension: score {
    type: number
    description: "Score indicating the likelihood of the issue assignment, between 0 and 1.0."
    sql: score ;;
  }
}

view: looker_dataset__labels {
  dimension: key {
    type: string
    description: "User-provided label key."
    sql: key ;;
  }

  dimension: looker_dataset__labels {
    type: string
    description: "The list of all user-provided labels."
    hidden: yes
    sql: looker_dataset__labels ;;
  }

  dimension: value {
    type: string
    description: "User-provided label value."
    sql: value ;;
  }
}

view: looker_dataset__entities {
  dimension: looker_dataset__entities {
    type: string
    description: "The list of all spoken entities."
    hidden: yes
    sql: looker_dataset__entities ;;
  }

  dimension: name {
    type: string
    description: "Name of the entity."
    sql: name ;;
  }

  dimension: salience {
    type: number
    description: "Salience score of the entity."
    sql: salience ;;
  }

  dimension: sentiment_magnitude {
    type: number
    description: "A non-negative number from zero to infinity that represents the abolute magnitude of the entity sentiment regardless of score."
    sql: sentimentMagnitude ;;
  }

  dimension: sentiment_score {
    type: number
    description: "The entity sentiment score between -1.0 (negative) and 1.0 (positive)."
    sql: sentimentScore ;;
  }

  dimension: speaker_tag {
    type: number
    description: "The speaker that the entity mention originated from."
    sql: speakerTag ;;
  }

  dimension: type {
    type: string
    description: "Type of the entity."
    sql: type ;;
  }
}

view: looker_dataset__sentences {
  dimension: annotations {
    hidden: yes
    sql: annotations ;;
  }

  dimension: create_time_nanos {
    type: number
    description: "Time in nanoseconds that the conversation message took place, if provided."
    sql: createTimeNanos ;;
  }

  dimension: dialogflow_intent_match_data {
    hidden: yes
    sql: dialogflowIntentMatchData ;;
  }

  dimension: end_offset_nanos {
    type: number
    description: "Time offset in nanoseconds of the end of this sentence relative to the beginning of the conversation."
    sql: endOffsetNanos ;;
  }

  dimension: highlight_data {
    hidden: yes
    sql: highlightData ;;
  }

  dimension: intent_match_data {
    hidden: yes
    sql: intentMatchData ;;
  }

  dimension: is_covered_by_smart_reply_allowlist {
    type: yesno
    description: "Whether this message is covered by a configured allowlist in Agent Assist."
    sql: isCoveredBySmartReplyAllowlist ;;
  }

  dimension: language_code {
    type: string
    description: "Language code."
    sql: languageCode ;;
  }

  dimension: looker_dataset__sentences {
    type: string
    description: "The list of conversation sentences."
    hidden: yes
    sql: looker_dataset__sentences ;;
  }

  dimension: obfuscated_external_user_id {
    type: string
    description: "Customer provided obfuscated external user ID for billing purposes."
    sql: obfuscatedExternalUserId ;;
  }

  dimension: participant_id {
    type: string
    description: "Participant ID, if provided."
    sql: participantId ;;
  }

  dimension: participant_role {
    type: string
    description: "Participant role, if provided."
    sql: participantRole ;;
  }

  dimension: phrase_match_data {
    hidden: yes
    sql: phraseMatchData ;;
  }

  dimension: sentence {
    type: string
    description: "The transcribed sentence."
    sql: sentence ;;
  }

  dimension: sentiment_magnitude {
    type: number
    description: "A non-negative number from zero to infinity that represents the abolute magnitude of the sentence sentiment regardless of score."
    sql: sentimentMagnitude ;;
  }

  dimension: sentiment_score {
    type: number
    description: "The sentence sentiment score between -1.0 (negative) and 1.0 (positive)."
    sql: sentimentScore ;;
  }

  dimension: speaker_tag {
    type: number
    description: "The speaker that the sentence originated from."
    sql: speakerTag ;;
  }

  dimension: start_offset_nanos {
    type: number
    description: "Time offset in nanoseconds of the start of this sentence relative to the beginning of the conversation."
    sql: startOffsetNanos ;;
  }
}

view: looker_dataset__sentences__annotations {
  dimension: clicked {
    type: yesno
    description: "Customer feedback on whether the suggestion was clicked."
    sql: ${TABLE}.clicked ;;
  }

  dimension: correctness_level {
    type: string
    description: "Customer feedback on the correctness level of the suggestion."
    sql: ${TABLE}.correctnessLevel ;;
  }

  dimension: create_time_nanos {
    type: number
    description: "The timestamp when the suggestion was generated."
    sql: ${TABLE}.createTimeNanos ;;
  }

  dimension: displayed {
    type: yesno
    description: "Customer feedback on whether the suggestion was displayed."
    sql: ${TABLE}.displayed ;;
  }

  dimension: record {
    type: string
    description: "The suggestion content returned from CCAI, serialised as JSON."
    sql: ${TABLE}.record ;;
  }

  dimension: type {
    type: string
    description: "The type of suggestion."
    sql: ${TABLE}.type ;;
  }
}

view: looker_dataset__sentences__highlight_data {
  dimension: display_name {
    type: string
    description: "The human-readable name of the highlighter."
    sql: ${TABLE}.displayName ;;
  }

  dimension: highlighter_name {
    type: string
    description: "The unique id of the highlighter."
    sql: ${TABLE}.highlighterName ;;
  }

  dimension: type {
    type: string
    description: "The type of the highlighter."
    sql: ${TABLE}.type ;;
  }
}

view: looker_dataset__sentences__intent_match_data {
  dimension: display_name {
    type: string
    description: "The human readable name of the matched intent."
    sql: ${TABLE}.displayName ;;
  }

  dimension: intent_id {
    type: string
    description: "The unique ID of the matched intent."
    sql: ${TABLE}.intentId ;;
  }
}

view: looker_dataset__sentences__phrase_match_data {
  dimension: display_name {
    type: string
    description: "The human readable name of the phrase matcher."
    sql: ${TABLE}.displayName ;;
  }

  dimension: phrase_matcher_id {
    type: string
    description: "The unique ID of the phrase matcher."
    sql: ${TABLE}.phraseMatcherId ;;
  }

  dimension: revision_id {
    type: string
    description: "Indicating the revision of the phrase matcher."
    sql: ${TABLE}.revisionId ;;
  }
}

view: looker_dataset__sentences__dialogflow_intent_match_data {
  dimension: display_name {
    type: string
    description: "The human readable name of the matched intent."
    sql: ${TABLE}.displayName ;;
  }

  dimension: intent_name {
    type: string
    description: "The resource name of the matched intent."
    sql: ${TABLE}.intentName ;;
  }

  dimension: max_confidence {
    type: number
    description: "The maximum confidence seen for the intent in the current transcript chunk."
    sql: ${TABLE}.maxConfidence ;;
  }
}
