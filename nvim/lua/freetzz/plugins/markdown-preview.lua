return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && yarn install",
  config = function()
    vim.cmd([[do FileType]])
    vim.cmd([[
         function OpenMarkdownPreview (url)
            let cmd = "/home/freetzz/Documents/zen/zen-specific.AppImage --new-window " . shellescape(a:url) . " &"
            silent call system(cmd)
         endfunction
      ]])
    vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
  end,
}
