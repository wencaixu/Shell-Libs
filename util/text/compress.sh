#!/usr/bin/env bash
# Java Script文本压缩,通过压缩空白字符和换行符,使用Sed命令处理
# tr命令，sed命令研究
cat ./example.js | tr -d '\n'

# |   tr -d '\n\t' |  tr -s ' '  | sed 's:/\*.*\*/::g'  | sed 's/ \?\([{}();,:]\) \?/\1/g'