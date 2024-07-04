meta:
  id: xml_conf
  title: Wii Room XML Configuration File
  file-extension: bin
  endian: be
seq:
  - id: magic
    contents: "HDPK"
  - id: type
    contents: "001B"
  - id: filesize
    type: u4
  - id: data_size
    type: u4
    doc: all known HDPK containers have a header of 32 bytes and a pointer table + a footer. These are not included in this size calculation.
  - id: unknown
    size: 16
  - id: unk
    type: u4
    
types:
  data_bounds:
    seq:
      - id: min
        type: u4
      - id: max
        type: u4
      - id: unk
        type: u8
        
  node:
    seq:
      - id: type
        type: u4
      - id: node_name
        type: u4
      - id: child_node
        type: u4
        doc: 0 if the current node doesn't have children
      - id: next_node
        type: u4
      - id: data_bounds
        type: u4
        
    instances:
      name:
        pos: node_name + 32
        type: strz
        encoding: utf8
        
      child:
        pos: child_node + 32
        type: node
      
      next:
        pos: next_node + 32
        type: node
    
      bounds:
        pos: data_bounds + 32
        type: data_bounds



instances:
  nodes:
    pos: 36
    type: node

