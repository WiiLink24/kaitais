meta:
  id: epg
  file-extension: .bin
  endian: be

seq:
  - id: magic
    contents: "HDPK"
  - id: type
    contents: "001B"
  - id: file_length
    type: u4
  - id: pointer_table_offset
    type: u4
  - id: pointer_table_size
    type: u4
  - id: unknown
    type: u4
  - id: footer_size
    type: u4
  - id: unknown1
    type: u4
  - id: unknown2
    type: u4
  - id: unknown3
    type: u4
  - id: unknown4
    type: u4
  - id: unknown5
    type: u4
  - id: unknown6
    type: u4
  - id: unknown7
    type: u4
  - id: region_code
    type: u2
  - id: unk
    type: u2
  - id: number_of_channels
    type: u4
  - id: channel_table_offset
    type: u4
  - id: number_of_unk
    type: u4
  - id: offset_to_unk
    type: u4
    
instances:
  pointer_table:
    pos: pointer_table_offset + 32
    type: pointer_table
    repeat: expr
    repeat-expr: pointer_table_size
    
  channel_table:
    pos: channel_table_offset + 32
    type: channel_table
    repeat: expr
    repeat-expr: number_of_channels
    
  unk_table:
    pos: offset_to_unk + 32
    type: unknown_table
    repeat: expr
    repeat-expr: number_of_unk
    
types:
  channel_table:
    seq:
      - id: broadcast_type
        type: u2
        enum: broadcast_type
      - id: channel_number
        type: u2
      - id: program_data_count
        type: u4
      - id: offset_to_program_pointer
        type: u4
    
    instances:
      pointer_to_program:
        pos: offset_to_program_pointer + 32
        type: pointer_to_program
        repeat: expr
        repeat-expr: program_data_count

  pointer_to_program:
    seq:
      - id: program_id
        type: u4
      - id: offset_to_program
        type: u4
        
    instances:
      pointer_to_program:
        pos: offset_to_program + 32
        type: program_data_table

  program_data_table:
    seq:
      - id: start_timestamp
        type: u4
      - id: end_timestamp
        type: u4
      - id: text_offset
        type: u4
      - id: genre
        type: u2
      - id: audio_type
        type: u2
      - id: resolution
        type: u4
      - id: position
        type: u4
        
  unknown_table:
    seq:
      - id: start_timestamp
        type: u4
      - id: end_timestamp
        type: u4
      - id: unk1
        type: u4
      - id: unk2
        type: u4
        
    instances:
      unk_table:
        pos: unk2 + 32
        type: another_unknown_table
        repeat: expr
        repeat-expr: unk1
        
  another_unknown_table:
    seq:
      - id: unkw
        type: u4
      - id: unk
        type: u4
      - id: unk1
        type: u4
      - id: unk2
        type: u4
    
  pointer_table:
    seq:
      - id: value
        type: u4
        
    instances:
      target:
        pos: value + 32
        type: u4
        
enums:
  broadcast_type:
    2: satellite_digital
    9: terrestrial_digital
    18: satellite_analog
    25: terrestrial_analog
