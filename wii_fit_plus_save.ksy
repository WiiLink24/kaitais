meta:
  id: fitplus
  file-extension: dat
  application: Wii Fit Plus
  endian: be
seq:
  - id: magic
    contents: "RPHE0000"
  - id: profiles
    type: profile
    repeat: expr
    repeat-expr: 8
    
types:
  profile:
    seq:
      - id: name
        type: str
        size: 20
        encoding: UTF-16BE
      - id: padding
        size: 3
      - id: height
        type: u1
        doc: Height in centimeters
      - id: dob_year
        type: u2
        doc: In base16
      - id: dob_month
        type: u1
      - id: dob_day
        type: u1
      - id: password
        type: s2
        doc: if == 10_000, there is no password.
      - id: not_figured_out_yet
        size: 37475
        
