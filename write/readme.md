# learn vim
---

### chapter 0
1. `:h :help cmd` 查看具体命令，特别的如果想查看 insert 状态下某个命令，应该是 `:h i_cmd`
2. `:w` 直接保存，但是 `:w :write new_file_name.txt` 会将其另存为
3. 一些指令并不需要记得很清楚，不记得了就 `:h cmd`，并且使用 `tab` 自动补全

### chapter 1
4. 当通过 `vim file1 file2` 打开多个文件时，使用 `:buffer :b filex` 来切换不同文件
5. vim 支持打开文件后立即执行 cmd，例如 `vim file +version` 以及 `vim +version file` 则使用 vim 打开文件 file 后将自动执行 `:version` 指令；还可以使用 `vim -c version file` 来代替 `+` 号
6. `:substitue :s` 用于替换文本，基本表达式如下：`:[范围]s/被替换值/替换值/[flag]`，flag 值用于...
7. 打开多个窗口：`vim -o5 file1 file2` 用于打开 5 个水平分割的窗口，`vim -O2` 大写的用于打开 2 个垂直分割的窗口，打开窗口可以用鼠标点击来切换工作窗口
8. 在 unix 下可以通过 `ctrl + z`、`:suspend`、`:stop` 直接挂起当前 vim 编写进程，使用 `fg` 可以恢复该进程

### chapter 2
9. 接 4，输入 `:buffers :ls :files` 可以查看当前打开的所有 buffer，输入 `:buffer filename` 或 `:buffer 文件对应编号num` 可以打开对应文件，也可以使用快捷指令 `:bp :bprevious` 或者 `:bn :bnext` 快速切换上下文件；输入 `:bdelete` 来删除当前 buffer，如果指定了数字或者文件名则删除对应 buffer
10. vim 的 buffers 设计是为了一次性修改多个文件，可以通过 `:wqall` 来保存并退出所有 buffer
11. `:split` 主要的作用是创建 windows，当已经打开了一个文件时，此时再 `:split <filename>` 即可将当前 terminal 分割成上下两个窗口，并在另一个窗口显示 filename 的内容，如果不指定文件名就是将当前 buffer 分割两个 windows，`:vsplit` 对应左右两个窗口
12. `crtl + w + H J K L`，这里的 w 就是 windows，用于直觉地切换不同的窗口（但是由于自己设置了 `ctrl + w` 等于关闭当前终端，因此该方式对 vim 无效，但是对 gvim 有效），还可以选择通过 mouse 来切换窗口；`ctrl + w [options]`，v 打开一个新的垂直窗口、s 打开新的水平窗口、c 关闭当前窗口、o 关闭除了当前窗口以外所有的窗口
13. `:tabnew filename`，就是新开一个选项卡并装载 filename，类似的还有：`:tabclose` 关闭当前 tab，`:tabnext :tabpreview :tablast :tabfirst` 下一个、前一个、最后一个、第一个 tab 选项卡；如果想让 vim 在启动时打开多个选项卡，则 `vim -p file1 file2 file3`

### chapter 3
14. `:edit filename` 用于编辑文件，如果文件不存在，则会新建之，也可以 tab 自动列出所有文件然后选择之；`:edit *.md`，然后 tab 即可自动列出所有 .md 的文件供选择；`:edit **/*.md` 然后 tab 可以递归当前目录下所有文件找到这些 .md 文件；如果只是 `:edit .` 传入目录，则将启动 netrw，即 vim 自己的文件浏览器，然后可以选择目录和文件
15. `:find` 指令主要用于根据 `:set path?` 所返回的路径进行查找，一般来说会引入特定的环境变量，例如引入 **/usr/include** 可以查找 c 编译器头文件目录，则执行 `:find filename` 后可以在这些目录下进行查找；添加新的 path 可以按照这个方法：`:set path+=/path/want/to/add`，在进行一些大的项目开发时，可以按照 `:set path+=$PWD/**` 的方法将整个项目的路径引入，这样在 find 时可以找到想要的文件了
16. grep 查找内容，有两种方式：`:vim :vimgrep` 是 vim 内置的 grep，而 `:grep` 是外置的 grep，基本语法与 `grep --help` 的语法一致，即 `grep /pattern/ filename`，这样会打开一个 quickfix 窗口，主要有有以下命令: `:copen :cclose :cnext :cprevious`
17. vim 内置文件浏览器 netrw，主要有以下用法：`:Explore` 直接打开浏览器，`:Sexplore` 打开一个垂直窗口文件浏览器，`:Vexplore` 打开一个水平窗口文件浏览器；在 netrw 中有几个命令：`%` 创建新文件、`d` 创建新目录、`R` 重命名文件或目录、`D` 删除文件或目录
18. 安装插件；
