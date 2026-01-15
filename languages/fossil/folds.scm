; Fold function bodies
(function_expression
  body: (_) @fold)

; Fold blocks
(block_expression) @fold

; Fold records
(record_expression) @fold
(record_type) @fold

; Fold lists
(list_expression) @fold

; Fold type definitions with bodies
(type_statement
  definition: [
    (record_type)
    (type_provider)
  ] @fold)

; Fold function argument lists (when multi-line)
(argument_list) @fold
(parameter_list) @fold
