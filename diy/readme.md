# diy

在 windows powershell in terminal 下 portable 使用 vim 为目的，并集成以下插件

1.   获取 [vim](https://www.vim.org/download.php) 的 portable 文件，解压到 `E:/toolkit/vim` 目录下备用，后文给出项目具体目录拓扑

2.   将 vim 的 binary 路径添加到 powershell 的配置文件 `$profile` 中，参考如下：

     ```powershell
     $VIMPATH = "E:/toolkit/vim/vim90"
     
     $env:PATH += ";$VIMPATH"
     ```

3.   配置 vim 的几个路径，这里是根据传统单个 windows 下只有 user 和 administrator 两个账户来配置，也就是说默认这台 pc 只有你自己用，如果是多账户模式，那就默认配置吧，多账户电脑你还不如用 unix

     1.   首先查看 vim 的配置文件目录 `vim --version`，可以得到以下输出：

          ```bash
               系统 vimrc 文件: "$VIM/vimrc"
               用户 vimrc 文件: "$HOME/_vimrc"
           第二用户 vimrc 文件: "$HOME/vimfiles/vimrc"
           第三用户 vimrc 文件: "$VIM/_vimrc"
                用户 exrc 文件: "$HOME/_exrc"
            第二用户 exrc 文件: "$VIM/_exrc"
                 defaults 文件: "$VIMRUNTIME/defaults.vim"
          ```

     2.   创建通用配置文件：`touch E:/toolkit/vim/vimrc`，添加以下内容：

          ```ini
          ...
          
          set encoding=UTF-8
          
          " 修改 windows 下备份、撤销、临时文件的目录
          set backupdir=E:/toolkit/vim/tmp
          set undodir=E:/toolkit/vim/tmp
          set directory=E:/toolkit/vim/tmp
          
          let $configs_dir = "E:/toolkit/vim/configs"
          let $vim_base_dir = "E:/toolkit/vim"
          let $vim_runtime_dir = "E:/toolkit/vim/vim90"
          
          let $VIM = $vim_base_dir
          let $HOME = $configs_dir
          let $VIMRUNTIME = $vim_runtime_dir
          
          ...
          ```

          1.   viminfo，\_viminfo 是单个用户启动时的操作备份，记录每个文件打了什么指令，将其全部修改成 `E:/toolkit/vim/configs/_viminfo`；`$home`，这个就是 unix 每个用户的 `~` 目录，在 windows 下对应 `C:/User/user/`，由于其影响到生成 viminfo、\_viminfo 的路径，因此需要将其在 vim 中修改而又不影响到系统变量
          2.   `$vim`，即 `E:/toolkit/vim`
          3.   `$vimrc`，vim 启动时读取的 rc 文件，即 `E:/toolkit/vim/configs/_vimrc`，这里强制指定 user 和 admin 都使用同一个 _vimrc 文件
          4.   `$myvimrc`，单个用户对应的 rc 文件，也改成 `E:/toolkit/vim/configs/_vimrc`
          5.   `$VIMRUNTIME`，就是 vim binary 所在的目录，即 `E:/toolkit/vim/vim90`

4.   顺便修改一下 git 默认的 vim 路径，否则又跑去 `$HOME` 生成文件了：`$env:GIT_EDITOR = "E:/toolkit/vim/vim90/vim.exe"`

5.   安装配置文件

     1.   `cd E:/tmp`，`git clone https://github.com/shi9uma/vim.git vim`
     2.   `cp vim/diy/vimrc E:/toolkit/vim/vimrc`


以上操作的目录拓扑如下：

```bash
E:/
|-- tmp
|   `-- vim
`-- toolkit
    `-- vim
    	|-- configs
        |   `-- _viminfo
        |-- plugins
        |-- tmp
        |-- vim90
        |   |-- ...
        |   |-- vim.exe
        |   `-- ...
        `-- vimrc
```

## references

1.   [A basic .vimrc file that will serve as a good template on which to build.](https://gist.github.com/simonista/8703722)
2.   