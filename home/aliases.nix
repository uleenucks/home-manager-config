{
  ls = "ls -G --color=auto";
  lsa = "ls -G -a --group-directories-first";
  lsl = "ls -G -l -F -k -h --group-directories-first";
  cp = "cp -i";
  mv = "mv -i";
  dt = "dmesg | tail -n 25";
  rmd = "rm -r";
  mem = "free -m";

  L = "| less";
  G = "| egrep --color=auto -n";
  rsync = "rsync -haxHAX --partial --info=progress2";
  ssh = "TERM=xterm ssh";
}
