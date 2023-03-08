# npairs-integrate-upair
This is a plugin which tries to combine the features of [ultimate-autopair.nvim](https://github.com/altermo/ultimate-autopair.nvim) and [nvim-autopair](https://github.com/windwp/nvim-autopairs). Both plugins have features which are useful. Here is a list of what the plugins supports/does better than the other one:
##### ultimate-autopair.nvim
+ cmdline support
+ better backspace
+ space mapping support
+ fastwarp support
+ more default extension
##### nvim-autopair
+ better newline
+ much better autocompletion support
+ better system for rules
+ `<C-w>` and `<C-h>` mapping support
+ fastwrap support
+ better treesitter support
+ more extendible
## install
### packer
```lua
use {
    'npairs-integrate-upair',
    requires={'windwp/nvim-autopairs','altermo/ultimate-autopair.nvim'},
    config=function() require('npairs-int-upair').setup({}) end
}
```
# configuration
For options where the plugin can be chosen, use `u` for ultimate-autopair.vim, `n` for nvim-autopair and ` ` for disable.
```lua
map='u', --which of them should be the insert mode autopair
cmap='u', --which of them should be the cmd mode autopair (only 'u' supported)
bs='n', --which of them should be the backspace
cr='n', --which of them should be the newline
space='u', --which of them should be the space (only 'u' supported)
c_h='', --which of them should be the <C-h> (only 'n' supported)
c_w='', --which of them should be the <C-w> (only 'n' supported)
--
fastwarp='<A-e>', --ultimate-autopair's fastwarp mapping ('' for disable)
rfastwarp='<A-E>', --ultimate-autopair's reverse fastwarp mapping ('' for disable)
fastwrap='<A-]>', --nvim-autopairs's fastwrap mapping ('' for disable)
npairs_conf={}, --nvim-autopairs's configuration
upair_conf={}, --ultimate-autopair's configuration
```
# Important note about nvim-autopairs
If you add rules to `nvim-autopairs` using the `nvim-autopair.add_rule` function after running `npairs-integrate-upair.setup` with the option to disables `nvim-autopairs` insertion,  then it will not disable the insertion of that new rule. The way to fix this is by manually setting `key_map` to nil for that rule.
Example:
```lua
require('npairs-int-upair').setup({map=''})
local npairs=require('ultimate-autopair')
local Rule=require('ultimate-autopair.rule')
local newrule=Rule('$','$')
newrule.key_map=nil
npairs.add_rule(newrule)
```
