#!/bin/bash
SCRIPT_DIR="/home/wuzhongyang/src" #这个改成你存放刚刚下载下来的qshell的文件夹位置
BACKUP_SRC="/home/wuzhongyang/www/leanote/leanote/mongodb_backup" #这个是你想要备份的本地VPS上的文件，不同的目录用空格分开
BACKUP_DST="/home/wuzhongyang/www/leanote/backup/tmp" #这个是你暂时存放备份压缩文件的地方，一般用/tmp即可
BUCKET="backup" #这个是你七牛空间名称，可以为公开空间或私有空间
TYPE="leanote"
NOW=$(date +"%Y.%m.%d")
DESTFILE="$BACKUP_DST/$NOW-$TYPE.tar.gz"

tar cfzP "$DESTFILE" $BACKUP_SRC 
echo "所有数据打包完成，准备上传..."

# 用脚本上传到七牛云
# $SCRIPT_DIR/qshell rput "$BUCKET" "$NOW.tar.gz"  "$DESTFILE" true
qshell rput "$BUCKET" "$NOW-$TYPE.tar.gz"  "$DESTFILE" true
if [ $? -eq 0 ];then
     echo "上传完成"
else
     echo "上传失败，重新尝试"
fi
# 删除本地的临时文件
rm -f "$DESTFILE"
