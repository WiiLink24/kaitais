meta:
  id: votesch
  file-extension: dat
  application: Everybody Votes Channel
  endian: be
seq:
  - id: magic_number
    type: u2
  - id: language_index
    type: u1
    doc: The index of the language selected in the menu.
  - id: unknown
    size: 29
  - id: country_names
    type: region_name
    repeat: expr
    repeat-expr: 16
    doc: There is space for 16 entries which is interesting.
  - id: province_names
    type: region_name
    repeat: expr
    repeat-expr: 16
    doc: There is space for 16 entries which is interesting.
  - id: miis
    type: mii
    repeat: expr
    repeat-expr: 6
    doc: Mii data. Only 6 can be registered
  - id: national_questions
    type: question
    repeat: expr
    repeat-expr: 6
    doc: There are 6 national questions spaces despite the fact only 3 can be available at a time.
  - id: worldwide_questions
    type: question
    repeat: expr
    repeat-expr: 6
    doc: There are 6 worlwide questions spaces despite the fact only 1 can be available at a time.
  - id: i_havent_looked_into_it
    size: 102080
    doc: I haven't looked into the values in this space. I am jumping to the crc32 checksum for my purpose
  - id: crc32
    type: u4
    doc: This is the crc32 checksum of the file up until this point.
  - id: unknown2
    size: 5852
    
    
types:
  region_name:
    seq:
      - id: name
        type: str
        size: 128
        encoding: utf-16be
        
  mii:
    seq:
      - id: mii_id
        type: mii_id
      - id: mac_address
        type: mac_address
      - id: name
        type: str
        size: 28
        encoding: utf-16be
      - id: unknown
        size: 124
        
  question:
    seq:
      - id: question_id
        type: u4
      - id: start_timestamp
        type: u4
      - id: end_timestamp
        type: u4
      - id: unknown
        type: u8
      - id: question
        type: str
        size: 200
        encoding: utf-16be
        repeat: expr
        repeat-expr: 4
      - id: response_1
        type: str
        size: 80
        encoding: utf-16be
        repeat: expr
        repeat-expr: 4
      - id: response_2
        type: str
        size: 80
        encoding: utf-16be
        repeat: expr
        repeat-expr: 4
      - id: padding
        size: 44
        
  mac_address:
    seq:
      - id: checksum
        type: u1
        doc: The checksum is found by getting the sum of the first 3 bytes of the mac address, then modulo by 256.
      - id: remaining_bytes
        type: u1
        repeat: expr
        repeat-expr: 3
  
  mii_id:
    seq:
      - id: mii_info
        type: u1
        doc: According to HEYimHeroic, the first char is just information about the Mii. The second is apart of the timestamp.
      - id: timestamp
        type: u1
        repeat: expr
        repeat-expr: 3
        doc: According to HEYimHeroic, these bytes are a timestamp of sorts, that can return the date it was created.
