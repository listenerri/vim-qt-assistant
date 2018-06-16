# vim-qt-assistant

Search and display the document of the word under the current cursor in qt assistant.

# Installation

Put `assistant.vim` under the `plugin` directory, or use a plugin manager(VimPlug)

# Usage
just call `GetDocFromAssistant()` function in vim.

```
:call GetDocFromAssistant()

# or map a key to do this:

map <F1> :call GetDocFromAssistant()<CR>
```
