# learnemacs
备份学习进度到git
1.所在客户机打开git. （win10用户到home目录，点file\git bash here)
2.$ git init 新建本地仓库
  $ git add .
  $ git commit -m "first commit"
3.客户机到github上注册ssh
  $ cd .ssh  ;  cat id_rsa.pub  ;  github 右上角用户标签下settings\ssh 将上步公钥内容粘贴上。
4.github 上新建仓库learnemacs
5.本地客户机连接运程github
  $ git remote add origin git@github.com:benbenxong/learnemacs.git
6.将本地home下内容备份到github

home机器上部署：
1. cd ~/.emacs.d/ 运行git-bash
2. 从github上clone仓库 
git clone git@github.com:benbenxong/learnemacs.git .
3. 每天回家第一件事
git pull //远程库与本地库合并

