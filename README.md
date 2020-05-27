# WHAT

- This repo is about the dotfiles of the software and related configuration used during ArchLinux, including some learned from the famous ones on the githubers.  
- Software used:ArchLinux,i3wm,polybar,compton,st(simple terminal),rofi
  - spf13-vim,lazygit
- 这个仓库记录了ArchLinux期间，使用的软件和相关配置。其中一些是借鉴的网络上大牛的。
  - 使用环境：ArchLinux,i3wm,polybar,compton,st(simple terminal),rofi

# WHY

- It's convenience for me to check these later. And this template env is my prefer,the later changes will base on this.
- 方便之后查阅。并且这是我比较喜欢的一个模板环境，而且之后都会以此为基础进行更改

# HOW 

- This repo is backed up using shallow-backup,and most of it's files are conf for reference.  
- 此仓库是使用[shallow-backup](https://github.com/alichtman/shallow-backup)备份的，仓库内文件大部分为配置文件，可供参考
- `backup-dots -m  "add i3+polybar+compton"`,also you can `shallow-backup --help` to find other instructions
  - of course, can change the script `backup-dots` in ~/.bashrc

---

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
