#!/usr/bin/env bash

## 安装软件
is_installed=$(whereis dialog | awk '{print NF}')
if [[ ${is_installed} -le 1 ]]
then
    sudo apt-get install dialog
else
    echo "dialog has been installed"
fi

menu=("network" "disk" "exit" "textbox" "menu" "fselect")

function menu (){
    PS3="input optional:"
    select option in ${menu[*]}
    do
       case ${option} in
        "network")
            clear
            dialog --title "Please answer" --yesno "is this thing on?" 10 20
            ;;
        "disk")
            clear
            if [[ -r /tmp/age.txt ]]
            then
                rm -r /tmp/age.txt
            else
                dialog --inputbox "Enter you age:" 10 20 > age.txt
                age=$(cat age.txt) # 输出无换行符
                echo ${age}
            fi
            ;;
        "textbox")
            clear
            dialog --textbox /etc/passwd 15 45
            ;;
        "menu")
            clear
            ##参数说明：标题，宽和高，一次显示菜单二等总数，使用方向键滚动显示
            dialog --menu "Sys Admin Menu" 20 30 10 1 "display disk space" 2 "Display users" 3 "Display memory usage" 4 "Exit" 2 > test.txt
            ;;
        "fselect")
            clear
            dialog --title "Select a file" --fselect $HOME/ 10 50 2>file.txt
            ;;
        "exit")
           temp="/tmp/age.txt"
           # 文件描述符0,1,2
           # 0->标准输入
           # 1->标准输出
           # 2->标准错误
           # > $ >>
           # /dev/null 特殊设备文件，接收的数据会被丢弃掉，null这个设备被称为位桶
           rm -f ${temp} 2>> /dev/null
           break;;
        *)
          clear
          echo "BREAK"
       esac
    done
}

main(){
  dialog --title "please answer" --yesno "Is this " 10 20
  echo $?
  menu
}

main