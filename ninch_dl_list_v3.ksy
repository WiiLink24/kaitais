meta:
  id: ninch_dllist_v3
  file-extension:
    - bin
    - LZ
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
  - id: list_id
    type: u4
  - id: country_code
    type: u4
  - id: language_code
    type: u4
  - id: supported_languages
    size: 16
  - id: unk
    size: 15
  - id: number_of_platform_info
    type: u4
  - id: platform_info_offset
    type: u4
  - id: number_of_manufacturer_info
    type: u4
  - id: manufacturer_info_offset
    type: u4
  - id: number_of_titles
    type: u4
  - id: title_table_offset
    type: u4
  - id: unk2
    size: 8
  - id: number_of_videos
    type: u4
  - id: video_table_offset
    type: u4
  - id: number_of_demos
    type: u4
  - id: demo_table_offset
    type: u4
  - id: alignment
    type: u2
    
instances:
  platform_table:
    type: platform_table
    pos: platform_info_offset
    repeat: expr
    repeat-expr: number_of_platform_info
    
  company_table:
    type: company_table
    pos: manufacturer_info_offset
    repeat: expr
    repeat-expr: number_of_manufacturer_info
    
  title_table:
    type: title_table
    pos: title_table_offset
    repeat: expr
    repeat-expr: number_of_titles
    
  video_table:
    type: video_table
    pos: video_table_offset
    repeat: expr
    repeat-expr: number_of_videos
    
types:
  platform_table:
    seq:
      - id: type_id
        type: u1
      - id: unk
        type: u1
      - id: platform_name
        size: 58
        doc: UTF16-BE, kaitai doesn't like it though
      - id: group_id
        type: u4
        
  company_table:
    seq:
      - id: company_id
        type: u4
      - id: developer_name
        size: 62
      - id: publisher_name
        size: 62
        
  video_table:
    seq:
      - id: video_id
        type: u4
      - id: video_length
        type: u2
      - id: title_id
        type: u4
      - id: video_type
        type: u1
      - id: unk
        type: u4
      - id: title
        size: 204
        
  title_table:
    seq:
      - id: id
        type: u4
      - id: title_id
        type: u4
      - id: title_type
        type: u1
      - id: genre
        size: 3
      - id: company_offset
        type: u4
      - id: release_year
        type: u2
      - id: release_month
        type: u1
      - id: release_day
        type: u1
      - id: rating_id
        type: u1
      - id: with_friends_female_second_row
        type: u1
      - id: with_friends_female_first_row
        type: u1
      - id: with_friends_male_second_row
        type: u1
      - id: with_friends_male_first_row
        type: u1
      - id: with_friends_all_second_row
        type: u1
      - id: with_friends_all_first_row
        type: u1
      - id: hardcore_female_second_row
        type: u1
      - id: hardcore_female_first_row
        type: u1
      - id: hardcore_male_second_row
        type: u1
      - id: hardcore_male_first_row
        type: u1
      - id: hardcore_all_second_row
        type: u1
      - id: hardcore_all_first_row
        type: u1
      - id: gamers_female_second_row
        type: u1
      - id: gamers_female_first_row
        type: u1
      - id: gamers_male_second_row
        type: u1
      - id: gamers_male_first_row
        type: u1
      - id: gamers_all_second_row
        type: u1
      - id: gamers_all_first_row
        type: u1
      - id: other_flags
        type: u1
      - id: title_name
        size: 62
      - id: subtitle
        size: 62
      - id: short_title
        size: 62
