# AutoLightInput
一个简易的自动处理输入输出的插件。

A plugin for acmer.

#### 安装：

```groovy
Plug 'cyanvars/vim-autolightinput'
```

#### 说明：

在很多时候，比如刷acm的oj题，或者牛客题之类，经常要自己写输入。一般利用重定向，比如c++里常见的 `freopen("data.in", "r", stdin);` 能一定程度上解决问题，但是面临一个烦人的点：

+ 多道题目的时候 `data.in` 会被覆盖，以后重新做一道题的时候又需要重新写 `data.in`

这个插件旨在，自动的在指定目录下，默认为 `/tmp/autolightinputdata/`下新建对应的输入文件，比如："1000_poj.cpp"，则会对应生成 /tmp/inputdata/1000_poj_data.in。这样在自己的目录下就会很干净，而且能将输入文件进行保留。

当需要编辑输入文件时，运行 `:AutoLightInputEdit` 即可进入输入文件的buffer。



另外，本插件也直接给出了相应的执行命令。只要运行 `:AutoLightInputRun` 就可以编译当前文件并自动进行相应的重定向输入，目前只支持 `python`,`c/c++`,`java`；



#### 用法总结：

+ 在任意位置打开一份代码程序，运行 `:AutoLightInputEdit`，进行输入文件的编写，编写完运行 `:bd`关闭当前buffer。
+ 运行`AutoLightInputRun` 查看运行情况。



#### 可选项:

插件会默认把输入文件存储在 `/tmp/autolightinputdata/`下，可以通过设置以下变量进行修改：

```shell
let g:auto_light_input_data_dir="/dir_where_you_like/"
```

请勿忘记最后有一个斜杠。c/c++/java 的对应编译结果文件也会存储在这里，不过在运行完后会自行删除。
