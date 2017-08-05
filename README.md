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
4. 撤销
# 恢复暂存区的指定文件到工作区
$ git checkout [file]

# 恢复某个commit的指定文件到暂存区和工作区
$ git checkout [commit] [file]

# 恢复暂存区的所有文件到工作区
$ git checkout .

# 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变
$ git reset [file]

# 重置暂存区与工作区，与上一次commit保持一致
$ git reset --hard

# 重置当前分支的指针为指定commit，同时重置暂存区，但工作区不变
$ git reset [commit]

# 重置当前分支的HEAD为指定commit，同时重置暂存区和工作区，与指定commit一致
$ git reset --hard [commit]

# 重置当前HEAD为指定commit，但保持暂存区和工作区不变
$ git reset --keep [commit]

# 新建一个commit，用来撤销指定commit
# 后者的所有变化都将被前者抵消，并且应用到当前分支
$ git revert [commit]

# 暂时将未提交的变化移除，稍后再移入
$ git stash
$ git stash pop
