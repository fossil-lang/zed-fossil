; Keywords
["let" "type" "open" "as" "fn"] @keyword

; Builtin types
["int" "bool" "string"] @type.builtin

; Boolean literals
["true" "false"] @boolean

; Operators
["|>" "->" "=" ":" "::" "." "#" ":>"] @operator

; Delimiters
["(" ")" "{" "}" "[" "]" "<" ">"] @punctuation.bracket
[","] @punctuation.delimiter

; Literals
(integer_literal) @number
(string_literal) @string

; Comments
(comment) @comment

; Identifiers
(identifier) @variable

; Functions
(function_expression "fn" @keyword.function)
(parameter name: (identifier) @variable.parameter)

; Types
(type_statement name: (identifier) @type)
(named_type (path) @type)
(type_provider provider: (path) @function.builtin)
(type_application constructor: (path) @type)

; Imports
(import_statement "open" @keyword.import)
(import_statement module: (path) @namespace)
(import_statement alias: (identifier) @namespace)

; Let bindings
(let_statement name: (identifier) @variable)

; Field access
(field_access_expression field: (identifier) @property)
(record_field name: (identifier) @property)
(record_type_field name: (identifier) @property)

; Function applications
(application_expression function: (path) @function)
(application_expression function: (identifier) @function)

; Attributes
(attribute name: (identifier) @attribute)

; Paths - namespace segments
(qualified_path (identifier) @namespace)
