; Increase indent for these nodes
[
  (function_expression)
  (block_expression)
  (record_expression)
  (list_expression)
  (record_type)
  (argument_list)
  (parameter_list)
] @indent

; Decrease indent after closing brackets
[
  "}"
  "]"
  ")"
] @outdent

; Maintain indent for these
[
  (let_statement)
  (import_statement)
  (type_statement)
] @indent.auto
