# WHAT

### update

现在使用 macos（macmini）系统了,

用于备份 macos 上常用的软件、配置，

**或许不常更新，但是会很重要**

# WHY

方便之后查阅。并且这是我常用的一个模板环境，而且之后都会以此为基础进行更改

# HOW

~~此仓库是使用[shallow-backup](https://github.com/alichtman/shallow-backup)备份的，仓库内文件大部分为配置文件，可供参考~~

~~`backup-dots -m  "add i3+polybar+compton"`,also you can `shallow-backup --help` to find other instructions~~

~~- of course, can change the script `backup-dots` in ~/.bashrc~~

~~- `shallow-backup -show`  分析下backup-dots，~~相当于先shallow-backup 再git push上去。可以用lazygit 来做~~~~

- ~~shallow-backup只是备份功能~~

~~- `/usr/bin/compton --config ~/.config/compton.conf` 指定配置文件，在i3/config里有~~

# Q&A

1. **问题描述：**

- ArchLinux运行在虚拟机中，ssh链接github的时候，提示如下

```shell
[lemo@myarch st]$ ssh -T git@github.com 
The authenticity of host 'github.com (52.74.223.119)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com,52.74.223.119' (RSA) to the list of known hosts.
client_loop: send disconnect: Broken pipe
```

- **解决办法：**

  - `vim /etc/ssh/ssh_config`  ，在Host * 条目下添加内容

  ```shell
  Host *
  IPQos=throughput
  ```

  - `sudo systemctl restart sshd`  
  - 再次尝试，返回如下信息就成功了
  
  ```shell
  [lemo@myarch ~]$ ssh -T git@github.com 
  Hi liuzel01! You've successfully authenticated, but GitHub does not provide shell access.
  ```
  
2. **问题描述：**

- ArchLinux 使用终端st时，无法使用Delete键位删除字符

- **解决办法：**

  - `sudo vim /etc/inputrc` ，在$endif之上添加内容

  ```shell
  #for delete 
  #"\e[P": delete-char
  set enable-keypad on 
  ```

  - 或是修改 ~/.zshrc 的配置，如下
- **相关参考：**

  - [使用zsh后重新映射键值](https://blog.csdn.net/gatieme/article/details/104170950)，[problem with home,end and del under zsh](https://bbs.archlinux.org/viewtopic.php?pid=201942#p201942)

3. **问题描述：**
   - archlinux使用polybar时，图标Font Awesome一直无法显示。偶然间，在[polybar-issue](https://github.com/polybar/polybar/issues/924)发现线索了
   - `fc-list | grep -i awesome`   查看支持的字体  
   - ~/.config/polybar/config  大约在67行，继续进行修改 。
   - 大致修改了下可用的图标，之前的xwindows图标换成了forg，各个ws-icon也更换了（时间那里，鼠标点击可以显示日期）
   ![](https://cdn.jsdelivr.net/gh/liuzel01/MyPicBed@master/data/20200604230531.png)
