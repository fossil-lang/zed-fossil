# Zed Extension for Fossil

Soporte completo del lenguaje Fossil en Zed editor.

## Features

- ✅ Syntax highlighting (via tree-sitter)
- ✅ Auto-indentation
- ✅ Code folding
- ✅ Document symbols (outline view)
- ✅ Keyword completion
- ⏳ Diagnostics (pending compiler bridge integration)
- ⏳ Go-to-definition (pending)
- ⏳ Hover type information (pending)

## Installation

### 1. Install fossil-lsp

El language server debe estar disponible en tu PATH:

```bash
# Desde la raíz del proyecto
cd editors/fossil-lsp
cargo install --path .
```

Esto instalará `fossil-lsp` en `~/.cargo/bin/`, que debería estar en tu PATH.

### 2. Install Zed Extension

#### Opción A: Desarrollo Local (Recomendado para desarrollo)

1. Abre Zed
2. Presiona `Cmd+Shift+P` (macOS) o `Ctrl+Shift+P` (Linux)
3. Escribe "zed: install dev extension"
4. Selecciona la carpeta `editors/zed-fossil/`

#### Opción B: Build y Install Manual

```bash
# Install Rust wasm target (primera vez)
rustup target add wasm32-wasip1

# Build la extensión
cd editors/zed-fossil
cargo build --target wasm32-wasip1 --release

# La extensión estará en target/wasm32-wasip1/release/zed_fossil.wasm
```

## Usage

1. Abre cualquier archivo `.fossil` en Zed
2. El syntax highlighting se activará automáticamente
3. El LSP se iniciará en el background
4. Usa `Cmd+Shift+O` para ver el outline (document symbols)
5. Usa `Ctrl+Space` para autocompletado

## Troubleshooting

### El LSP no se inicia

Verifica que `fossil-lsp` esté en tu PATH:

```bash
which fossil-lsp
```

Si no está, instálalo:

```bash
cargo install --path editors/fossil-lsp
```

### No hay syntax highlighting

Verifica que la extensión esté instalada:
- En Zed, abre `Extensions` (Cmd+Shift+X)
- Busca "Fossil"
- Debería aparecer como "Installed"

### Ver logs del LSP

En Zed:
1. Abre el Command Palette (Cmd+Shift+P)
2. Escribe "zed: open log"
3. Busca mensajes de `fossil-lsp`

También puedes correr el LSP manualmente para ver output:

```bash
RUST_LOG=debug fossil-lsp
# El LSP espera input en stdin en formato LSP JSON-RPC
```

## Development

### Testing Changes

1. Haz cambios en el código
2. Rebuild la extensión:
   ```bash
   cargo build --target wasm32-wasip1 --release
   ```
3. En Zed, reload la extensión:
   - Command Palette → "zed: reload extensions"

### Testing Tree-sitter Grammar

```bash
cd ../tree-sitter-fossil
npx tree-sitter parse path/to/file.fossil
```

### Testing LSP Standalone

```bash
cd ../fossil-lsp
cargo run
# Envía requests LSP por stdin
```

## Configuration

Actualmente no hay configuración adicional necesaria. La extensión usa defaults sensibles.

## Contributing

1. Haz tus cambios
2. Testa localmente siguiendo "Development"
3. Envía un PR al repositorio principal

## License

MIT - Same as Fossil language project
