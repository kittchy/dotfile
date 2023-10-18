# dotfile

## supported 
- ubuntu
- macOS

## install zsh

```bash
./zsh_install.sh
```
## setup environtment

```
./setup.sh
```

## setting the cron tab

```
# 以下のコマンドで設定画面にはいる
crontab -e

# 以下を書き込む
# 毎月1日の3時0分にupdateする
0 3 1 * * bash ~/dotfile/setup.sh
```
