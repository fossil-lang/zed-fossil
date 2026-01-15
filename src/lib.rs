use zed_extension_api::{self as zed, Result};

struct FossilExtension {
    cached_binary_path: Option<String>,
}

impl zed::Extension for FossilExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        // Return cached path if available
        if let Some(path) = &self.cached_binary_path {
            return Ok(zed::Command {
                command: path.clone(),
                args: vec![],
                env: Default::default(),
            });
        }

        let binary_name = "fossil-lsp";

        // Use Zed's worktree.which() to find the binary in PATH
        // This is the WASM-compatible way to search for executables
        if let Some(path) = worktree.which(binary_name) {
            self.cached_binary_path = Some(path.clone());
            return Ok(zed::Command {
                command: path,
                args: vec![],
                env: Default::default(),
            });
        }

        // Fallback: just use the binary name (Zed will search PATH)
        Ok(zed::Command {
            command: binary_name.to_string(),
            args: vec![],
            env: Default::default(),
        })
    }

    fn language_server_initialization_options(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        Ok(None)
    }

    fn language_server_workspace_configuration(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        Ok(None)
    }
}

zed::register_extension!(FossilExtension);
