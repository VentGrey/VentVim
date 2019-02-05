# VentVim

Just a little (very little) vim distribution of mine, you are completely free
to use it, modify it or copy it (in fact it is encouraged).

:warning: Contains stong-words in spanish :warning:


## Requirements
* clang 6.0+ with `libclang`.
* Rust `Nightly`.

## Components

VentVim comes with a small variety of components that **should** work out of the
box. (I cannot guarantee it tho...).

### Plugin Manager
VentVim uses `[vim-plug](https://github.com/junegunn/vim-plug)` as it's plugin
manager, I will try to change that in the future, I'm considering `dein` or
`Vundle`.

To update your VentVim distribution you just have to run the following command
`vim +PlugUpdate` or `:PlugUpdate` from inside vim.

### Language Support
VentVim comes with support for old and modern programming Languages.
> Some languages have partial support, if you wish full-support, you can
> either wait or submit an awesome PR with your awesome work :D

VentVim uses `vim-polyglot` for partial language support.

#### C/C++
* `vim-cpp-enhanced-highlight` A pluging that adds more colors to C/C++ syntax
and improves code readability.
* `deoplete-clang` A plugin that integrates with deoplete to provide C/C++
completion tags (requires Clang 6 installed)
* C snippets loaded in `vim-snippets` & `ultisnips`.
* `c-support` Plugin, built in `vim-plugins`.
* 8 spaces tabs for both C & C++


#### Rust (Configured for Nightly)
* `rust-vim` A plugin that provides Rust-syntax highlight, comes with default
cargo installation path.
* `vim-racer` Completion + Goto definition plugin for Vim.
* `deoplete-rust` Integrates with vim-racer to provide a better completion engine
* 4 spaces tabs

TODO: Continue this file
