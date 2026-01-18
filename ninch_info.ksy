meta:
  id: ninch_soft
  file-extension:
    - info
  endian: be
seq:
  - id: unknown
    type: u2
  - id: version
    type: u1
  - id: unknown_region
    type: u1
    doc: 0 for v3, 0x39 for v4 JP
  - id: filesize
    type: u4
  - id: crc32
    type: u4
  - id: dllistid
    type: u4
  - id: country_code
    type: u4
  - id: language_code
    type: u4
  - id: recommendation_data_table_offset
    type: u4
  - id: times_played_table_offset
    type: u4
  - id: people_who_liked_this_also_liked_entry_number
    type: u4
  - id: people_who_liked_this_also_liked_table_offset
    type: u4
  - id: related_titles_entry_number
    type: u4
  - id: related_titles_table_offset
    type: u4
  - id: videos_entry_number
    type: u4
  - id: videos_table_offset
    type: u4
  - id: demos_entry_number
    type: u4
  - id: demos_table_offset
    type: u4
  - id: number_of_related_web_pages
    type: u4
  - id: related_web_pages_offset
    type: u4
  - id: picture_offset
    type: u4
  - id: picture_size
    type: u4
  - id: unknown_3
    type: u4
  - id: rating_picture_offset
    type: u4
  - id: rating_picture_size
    type: u4
  - id: rating_detail_picture
    type: rating_detail_picture
    repeat: expr
    repeat-expr: 7
  - id: bottom_right_corner_pic_offset
    type: u4
  - id: bottom_right_corner_pic_size
    type: u4
  - id: soft_id
    type: u4
  - id: game_id
    type: str
    size: 4
    encoding: utf-8
  - id: platform_flag
    type: u1
  - id: company_id
    type: u4
  - id: unknown_5
    type: u2
  - id: unknown_6
    type: u2
  - id: unknown_7
    type: u1
  - id: wii_shop_channel_button_flag
    type: u1
  - id: purchase_button_flag
    type: u1
  - id: release_year
    type: u2
  - id: release_month
    type: u1
  - id: release_day
    type: u1
  - id: shop_points
    type: u4
    doc: Null if none. 
  - id: unknown_8
    type: u1
    repeat: expr
    repeat-expr: 3
  - id: max_players
    type: u1
  - id: wii_remote_flag
    type: u1
  - id: nunchuk_flag
    type: u1
  - id: classic_controller_flag
    type: u1
  - id: gamecube_controller_flag
    type: u1
  - id: mii_flag
    type: u1
  - id: online_flag
    type: u1
    doc: 1 is has internet connectivity, 2 is requires the internet.
  - id: wiiconnect24_flag
    type: u1
  - id: nintendo_wifi_connection_flag
    type: u1
  - id: downloadable_content_flag
    type: u1
  - id: wireless_play_flag
    type: u1
  - id: download_play_flag
    type: u1
  - id: touch_generations_flag
    type: u1
  - id: language_chinese_flag
    type: u1
  - id: language_korean_flag
    type: u1
  - id: language_japanese_flag
    type: u1
  - id: language_english_flag
    type: u1
  - id: language_french_flag
    type: u1
  - id: language_spanish_flag
    type: u1
  - id: language_german_flag
    type: u1
  - id: language_italian_flag
    type: u1
  - id: language_dutch_flag
    type: u1
  - id: unknown_9
    type: u1
    repeat: expr
    repeat-expr: 10
  - id: title
    type: str
    encoding: utf-16be
    size: 62
  - id: subtitle
    type: str
    encoding: utf-16be
    size: 62
  - id: short_title
    type: str
    encoding: utf-16be
    size: 62
  - id: description_text
    type: str
    size: 82
    encoding: utf-16be
    repeat: expr
    repeat-expr: 3
  - id: genre_text
    type: str
    size: 58
    encoding: utf-16be
  - id: players_text
    type: str
    size: 86
    encoding: utf-16be
  - id: peripherals_1_text
    type: str
    size: 82
    encoding: utf-16be
  - id: peripherals_2_text
    type: str
    size: 82
    encoding: utf-16be
  - id: disclaimer_text
    type: str
    size: 4800
    encoding: utf-16be
  - id: unknown_11
    type: u1
  - id: distribution_date_text
    type: str
    size: 82
    encoding: utf-16be
  - id: wii_points_text
    type: str
    size: 82
    encoding: utf-16be
  - id: custom_field_text
    type: str
    size: 82
    encoding: utf-16be
    repeat: expr
    repeat-expr: 10
instances:
  people_who_liked_this_also_liked_table:
    pos: people_who_liked_this_also_liked_table_offset
    type: people_who_liked_this_also_liked_table
    repeat: expr
    repeat-expr: people_who_liked_this_also_liked_entry_number
  related_titles_table:
    pos: related_titles_table_offset
    type: related_titles_table
    repeat: expr
    repeat-expr: related_titles_entry_number
  videos_table:
    pos: videos_table_offset
    type: videos_table
    repeat: expr
    repeat-expr: videos_entry_number
  demos_table:
    pos: demos_table_offset
    type: demos_table
    repeat: expr
    repeat-expr: demos_entry_number
  times_played_table:
    pos: times_played_table_offset
    type: times_played_table
  recommendation_data_table:
    pos: recommendation_data_table_offset
    type: recommendation_data
types:
  times_played_table:
    seq:
      - id: time_spent_playing_total
        type: u4
        doc: In hours.
      - id: time_spent_playing_per_person
        type: u4
        doc: In minutes.
      - id: times_played_total
        type: u4
      - id: times_played_per_person
        type: u4
        doc: Will be multiplied by 0.01.
  videos_table:
    seq:
      - id: soft_id
        type: u4
      - id: platform_type
        type: u1
      - id: unknown
        type: u1
        repeat: expr
        repeat-expr: 18
      - id: title
        type: str
        encoding: utf-16be
        size: 102
  people_who_liked_this_also_liked_table:
    seq:
      - id: soft_id
        type: u4
      - id: platform_type
        type: u1
      - id: title
        type: str
        encoding: utf-16be
        size: 62
      - id: subtitle
        type: str
        encoding: utf-16be
        size: 62
  related_titles_table:
    seq:
      - id: soft_id
        type: u4
      - id: platform_type
        type: u1
      - id: title
        type: str
        encoding: utf-16be
        size: 62
      - id: subtitle
        type: str
        encoding: utf-16be
        size: 62
  demos_table:
    seq:
      - id: demo_id
        type: u4
      - id: title
        type: str
        encoding: utf-16be
        size: 62
      - id: subtitle
        type: str
        encoding: utf-16be
        size: 62
  rating_detail_picture:
    seq:
      - id: rating_detail_picture_offset
        type: u4
      - id: rating_detail_picture_size
        type: u4
  ages:
    seq:
      - id: all_gender_all_ages
        type: u1
      - id: all_gender_12_under
        type: u1
      - id: all_gender_13_18
        type: u1
      - id: all_gender_19_24
        type: u1
      - id: all_gender_25_34
        type: u1
      - id: all_gender_35_44
        type: u1
      - id: all_gender_45_54
        type: u1
      - id: all_gender_55_plus
        type: u1
  rec_type:
    seq:
      - id: both_genders
        type: ages
      - id: male
        type: ages
      - id: female
        type: ages
  recommendation_data:
    doc: Takes only these stats. Channel calculates the difference for the other categories.
    seq:
      - id: everyone
        type: rec_type
      - id: casual
        type: rec_type
      - id: alone
        type: rec_type
      - id: medals
        type: rec_type

enums:
  platforms:
    0: none
    1: wii
    2: wii_channels
    3: nes
    4: snes
    5: n64
    6: tg16
    7: genesis
    8: neogeo
    10: ds
    11: wiiware
    12: master
    13: c64
    14: arcade
    16: dsi
    17: dsiware
    18: threeds
    19: threeds_download
    20: threeds_gameboy
