# flutter-github-demo

使用`Flutter`开发的`Github`客户端，适用于`Android`和`iOS`平台，页面功能简单，易于上手学习`Flutter`。

项目提供了多种 **状态管理** 组件对应的实现方式，开发者只需切换对应的 **分支**，便可以根据自己感兴趣的模式进行学习开发：

* [basic_provider   ](https://github.com/qingmei2/FlutterGitHubApp/tree/basic_provider): `Google`官方推荐的 [provider](https://github.com/rrousselGit/provider) 库；
* [basic_bloc_rxdart](https://github.com/qingmei2/FlutterGitHubApp/tree/basic_bloc_rxdart): 经典的 [bloc](https://github.com/felangel/bloc) 模式的实现案例，适用于复杂的业务场景开发；
* [basic_fish_redux ](https://github.com/qingmei2/FlutterGitHubApp/tree/basic_fish_redux) (开发中...): 阿里巴巴前端团队推出的状态管理解决方案[fish-redux](https://github.com/alibaba/fish-redux);

* master(当前项目的默认分支)： 该分支始终展示的是最新稳定版本的状态管理实践，目前展示的是 **bloc_rxdart** 模式的开发示例。

## 通知

* 下载后，编译遇到错误？

> 如果遇到 `Error: Error when reading 'lib/common/constants/ignore.dart': No such file or directory` 的错误，请参考下方【开始使用】，对项目进行配置。


## 使用

* 通过git命令行进行clone:

```shell
$ git clone https://github.com/qingmei2/FlutterGitHubApp.git
```

## 感谢

:art: 项目中的UI设计部分参考了 [gitme](https://github.com/flutterchina/gitme).

:star: 项目参考了 [GSYGithubAppFlutter](https://github.com/CarGuo/GSYGithubAppFlutter) 并对其部分代码进行了引用.
