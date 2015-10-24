#!/bin/bash

echo "■■■ CustomROM JP_Completeファイル作成ツール   ICS by Y2R  ■■■"
echo "■                                                                ■"
echo "■     このツールを実行するには、JAVA開発環境（JDK）が必要です。  ■"
echo "■          従前に下記URLよりJDKをインストールして下さい。        ■"
echo "■          http://java.sun.com/javase/ja/6/download.html         ■"
echo "■                                                                ■"
echo "■    カスタマイズしたいROM以外のzipファイルは置かないで下さい。  ■"
echo "■                                                                ■"
echo "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo  "for L-04E Customed By tkawajir LolliPop"

mkdir work1
cp *.zip work1
cd work1
mv *.zip temp.zip
7z x temp.zip -aoa
rm temp.zip

sed -f ../tools/fix_build.prop.linux.sed system/build.prop > system/build.prop_fixed
mv system/build.prop_fixed system/build.prop

sed -e "s/e988/geevl04e/g" META-INF/com/google/android/updater-script > META-INF/com/google/android/updater-script1
mv META-INF/com/google/android/updater-script1 META-INF/com/google/android/updater-script

cd ..
mkdir work2
cd diff
cp -rp system ../work1/
cp -rp boot.img ../work1/boot.img

cd ../work1
7z a ../work2/update-tmp.zip *

cd ..
echo "."
echo "."
echo インストールファイルにサインしています。
echo "."
echo 最後の処理をしています。
echo "."
echo "."
java -jar tools/signapk.jar tools/testkey.x509.pem tools/testkey.pk8 work2/update-tmp.zip JP_L04E_LP_Complete.zip
echo "."
echo "."
echo "Signing Complete"
echo "."
echo "."
echo 一時ファイルを削除しています。
echo "."
echo "."
rm -rf work*
clear
echo "."
echo "."
echo "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo "■                                                                        ■"
echo "■              JP_Completeファイルの作成が無事成功しました。             ■"
echo "■         CWMにてJP_Complete.zipをインストールして下さい。  　　　       ■"
echo "■                     ご利用ありがとうございました。                     ■"
echo "■                                                                        ■"
echo "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo "  for L-04E Customed (for linux) By tkawajir LolliPop only :-)"
echo "."
echo "                                              Make archives Powered by 7-Zip."
echo "                    7-Zip Copyright (C) 1999-2010 Igor Pavlov. www.7-zip.org"
echo "."
echo "."
