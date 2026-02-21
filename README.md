# parthenon

A simple Neovim plugin for switching colorschemes interactively.

## Installation

### lazy.nvim

```lua
{
  "aidyak/parthenon",
  keys = {
    { "<leader>tc", "<cmd>Parthenon<CR>", desc = "Pick colorscheme" },
  },
  config = function()
    require("parthenon").setup({
      schemes = {
        "colorscheme",
        "colorscheme2",
        "colorscheme3",
      },
    })
  end,
}
```

## Usage

### Command

```vim
:Parthenon
```

### Lua

```lua
require("parthenon").pick()
```

## Setup

```lua
require("parthenon").setup({
  schemes = { "colorscheme1", "colorscheme2", ... },
})
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `schemes` | `string[]` | `{}` | List of colorscheme names to choose from |

## License

MIT
