meta:
  id: str
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
  - id: number_of_text_tables
    type: u4
  - id: text_table_offset
    type: u4
    
instances:
  pointer_table:
    pos: pointer_table_offset + 32
    type: pointer_table
    repeat: expr
    repeat-expr: pointer_table_size

  text_table:
    pos: text_table_offset + 32
    type: text_table
    repeat: expr
    repeat-expr: number_of_text_tables
    
types:
  text_table:
    seq:
      - id: text_1_offset
        type: u4
      - id: text_2_offset
        type: u4
  pointer_table:
    seq:
      - id: value
        type: u4
        
    instances:
      target:
        pos: value + 32
        type: u4
