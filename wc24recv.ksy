meta:
  id: wc24recv
  title: WiiConnect24 Receive List
  file-extension: ctl
  endian: be
doc: |
  The Receive List contains all the messages that were sent to the user.
  It contains metadata for each message to assist in processing.
  
  Why Nintendo did this is unknown as all messages are stored in a mailbox file
  which already contains the metadata in MIME format.
  
seq:
  - id: magic
    type: u4
  - id: version
    type: u4
  - id: number_of_mail
    type: u4
  - id: total_entries
    type: u4
  - id: total_size_of_messages
    type: u4
  - id: filesize
    type: u4
  - id: next_entry_id
    type: u4
  - id: next_entry_offset
    type: u4
  - id: padding
    type: u4
  - id: vff_free_space
    type: u4
  - id: padding_2
    size: 48
  - id: mail_flag
    type: str
    size: 40
    encoding: utf-8
    doc: Never used here. Most likely copied from the Send List as they are almost the same file.
  - id: entries
    type: entry
    repeat: expr
    repeat-expr: 255
    
types:
  multipart_entry:
    seq:
      - id: offset
        type: u4
      - id: size
        type: u4

  entry:
    seq:
      - id: id
        type: u4
      - id: flag
        type: u4
      - id: msg_size
        type: u4
      - id: app_id
        type: str
        size: 4
        encoding: ascii
      - id: header_len
        type: u4
      - id: tag
        type: u4
      - id: wii_cmd
        type: u4
      - id: crc32
        type: u4
      - id: from_friend_code
        type: u8
      - id: minutes_since_1900
        type: u4
      - id: padding
        type: u4
      - id: always_1
        type: u1
      - id: number_of_multipart_entries
        type: u1
      - id: app_group
        type: u2
      - id: packed_from
        type: u4
      - id: packed_to
        type: u4
      - id: packed_subject
        type: u4
      - id: packed_charset
        type: u4
      - id: packed_transfer_encoding
        type: u4
      - id: message_offset
        type: u4
        doc: Offset to the message inside the MIME format.
      - id: encoded_length
        type: u4
        doc: Set to message_length if transfer encoding not base64.
      - id: multipart_entries
        type: multipart_entry
        repeat: expr
        repeat-expr: 2
      - id: multipart_sizes
        type: u4
        repeat: expr
        repeat-expr: 2
      - id: multipart_content_types
        type: u4
        repeat: expr
        repeat-expr: 2
      - id: message_length
        type: u4
      - id: dwc_id
        type: u4
      - id: always_0x8000000
        type: u4
      - id: padding_3
        type: u4
