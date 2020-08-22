# C++/Win32 プログラミング（2020年版）未完成

## 片山博文MZ（かたやまひろふみエムゼッド）

# はじめに

## この文書について

スマホに親しんだ若者がWindows 10で現代的な C++/Win32 のプログラムを作る場合に役立てばいいなと思って作りました。

## 基本精神

文字がわからなければ、親か先生に「あいうえお」と「アルファベット」を教えてもらって下さい。

パソコンの使い方が分からなければ、パソコン関係の本を調べる。Windowsを知らなければWindowsの本を調べる。

単語がわからなかったらGoogleで調べる。https://google.co.jp

漢字がわからなかったら漢和辞典を見る。

無関係なことや細かいことは飛ばしてもよい。

調べても調べてもわからなかったらひとまず、ほっといて先読みしてみる。

## テキストファイルの作り方

最初に高機能なテキストエディタ（サクラエディタ、秀丸、VS Code など）をダウンロード＆インストールしないといけない。この本ではサクラエディタの使用を推奨する。

- サクラエディタ [https://sakura-editor.github.io/download.html](https://sakura-editor.github.io/download.html)

テキストエディタを起動して文字を書いて保存する。保存するには、右上の「ファイル」メニューから「上書き保存」を選ぶ。保存したい場所を選んで「保存」。これでテキストファイルが作成できる。

ファイルを編集したいなら、テキストエディタにファイルアイコンをドラッグ＆ドロップしてそれを開き、エディタで編集して保存する。

サクラエディタが嫌いであれば、Visual Studio Code (VS Code) などを使用してもよい。

## 日本語入力

キーボードの左上の「半角／全角」キーを押すと、日本語入力モードに入ったり出ることができる。日本語入力モードで適当に入力して「変換」キーを押して漢字交じりに変換、Enterキーで確定を繰り返すと日本語が入力できる。

## 全角文字と半角文字について

以下の２つの文字列を比較してほしい：

- `"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ０１２３４５６７８９＃！＠"`
- `"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789#!@"`

前者が全角（ぜんかく）文字で、後者が半角（はんかく）文字である。昔のパソコンでは全角文字は半角文字の二倍の幅を持っていた。半角文字の多くは英語のASCII文字と互換性があり、英語圏でも同じデータでやり取りできるが、全角文字を日本語ではないパソコンで表示しようとすると問題が発生することがある。

プログラミングでは主に半角文字を使う。

## ファイル名

プログラミングで使うファイルや識別子の名前は、基本的に日本語や全角文字は使えないと考えた方がいいだろう。ファイル名には使えない特殊な文字がいくつかある。

ファイル名は1字でも間違うと動かないことがあるので、全角半角の区別、大文字小文字の区別ができるようになろう。

Windowsではファイル名には大文字小文字の区別がないが、他のシステムでも使うファイルについては大文字小文字を意識する必要がある。

## 拡張子

ファイル名の最後に「.txt」「.png」などのドット（dot）で始まる文字列が付いているのが拡張子。拡張子は、ファイルの種類を表している。

拡張子は半角でなければならない。Windowsでは拡張子がファイルの種類を区別している。拡張子が1字でも違うとファイルが開かないことがある。

[https://ja.wikipedia.org/wiki/拡張子](https://ja.wikipedia.org/wiki/%E6%8B%A1%E5%BC%B5%E5%AD%90)

拡張子が見えなければ、Windowsで拡張子が見える設定にしないといけない。開発現場では拡張子表示は必須。

## フォルダとは

フォルダとは、ファイルを入れる入れ物であり、エクスプローラやデスクトップを右クリックして出てくる「新規作成」メニューの「フォルダー」を選べば作成できる。さらにフォルダの中に別のフォルダや複数のファイルを入れることができる。ファイルをまとめたり、分類するときに便利だ。

例えば、Windows 10 には、`C:`ドライブに`Windows`というフォルダ（`C:\Windows`）があり、この中にWindowsのシステムファイルが含まれている。さらにこの中に`system32`フォルダ（`C:\Windows\system32`）がある。

## フォルダのパスとは

この`C:\Windows`や`C:\Windows\system32`というのが、フォルダのパス（path）と呼ばれる文字列で、フォルダの位置を表す。passwordとまぎらわしいので、混同しないように。`\`（バックスラッシュ）は、パスの区切りと呼ばれる。パスの区切りは環境によって異なり、Windowsでは`\`であり、Bashでは`/`（スラッシュ）である。

`\`はバックスラッシュ（backslash）という記号であり、`/`はスラッシュ（slash）という記号である。日本語キーボードでは半角モードで「ろ」や「め」を押すと入力できる。日本語環境では、バックスラッシュは半角の円記号（￥）で表示されることもある。

パスは、相対的な位置を表す「相対パス」と、絶対的な位置を表す「絶対パス」に分類される。

1個のドット（`.`）は、現在のフォルダを表す特殊なフォルダ名で、2個のドット（`..`）は、一つ上のフォルダを表す特殊なフォルダ名である。例えば、`C:\Windows\system32\..`は`C:\Windows\system32`の一つ上、すなわち、`C:\Windows`と同じ意味である。

`C:\Windows\system32`は絶対パスで、`..\system32`は相対パスである。

## 検索機能

### Ctrl+F

テキストデータの中から素早く文字列を探すには、検索機能を使う。サクラエディタでは、`Ctrl+F`キー（`Ctrl`キーを押しながら`F`キー）で検索を開始できる。

### Grep

複数のテキストファイルからある文字列を探すには、サクラエディタで`grep`（グレップ）機能を使う（「検索」メニュー→「Grep...」）。

## ファイルのロックについて

Windowsでは、アプリでファイルを開くと、アプリはそのファイルが変更されないようにロックすることができる。ロックされたファイルは開いたり、変更できない。ファイルが開けない場合は、すでに開いているプログラムがないか確認しよう。

## プログラムとプロセスについて

### EXEファイルとDLLファイル

Windowsのプログラムのほとんどは、`.exe`という拡張子を持ったEXEファイルで出来ている。EXEファイルをダブルクリックするとプログラムを起動できるかもしれない。`.exe`の実行に必要な`DLL`ファイル（`*.dll`）が足りないと、実行に失敗する。

### プロセス

Windowsで実行したプログラムは、「プロセス」という単位で実行される。プロセスはタスクバーを右クリックすれば出てくる「タスクマネージャ」から操作できる。1個のEXEファイルから複数のプロセスを同時に起動できる。

### 実行中のロック

プロセスは、使用しているEXEファイルとDLLファイルをロックする。そのため、実行中はEXEファイルを変更できないので、ビルドの前にそのプログラムを終了させる必要がある。終了できない場合はタスクマネージャからプロセスを強制終了しよう。

# 開発環境の整備

## どんな開発環境を使うか

通常、WindowsでC/C++コンパイラを使いたい場合、Visual Studio か MSYS2 を使うといい。Visual Studio（以下VS）はパワフルな統合開発環境（IDE）で非常に使いやすい。MSYS2はCUIベースの開発環境で、低スペックのPCでも使える。MSYS2は最小限のWindows開発環境「MinGW」にLinuxライクなBashシェルを追加したようなもので、ちょびっとLinux風に使える開発環境だ。

簡単なプログラムをコンパイルしたい場合は、最近ではオンラインコンパイラという選択肢もあるが、ソースファイルが1つしか使えないとか、そもそもWin32をサポートしていないなどの制限がある。

この文書では簡単のため、開発環境として ReactOS Build Environment (RosBE) を使用する。

## RosBEのインストール

では早速、Windows版のReactOS Build Environment (RosBE) をインストールしてみよう。次のリンクからWindows版のRosBEを選択すれば、ダウンロードできる。

- [https://reactos.org/wiki/Build_Environment](https://reactos.org/wiki/Build_Environment)

ダウンロードに成功したらインストールしよう。ファイルアイコンをダブルクリックすれば、インストールが始まる。

![RosBE サイト](images/rosbe-site.png)

## RosBEの起動

インストールに成功したら、デスクトップにRosBEのアイコンが出来ているはずである。ダブルクリックしてRosBEを起動しよう。

![RosBE アイコン](images/rosbe-icon.png)

起動すると次のようなRosBEのコマンドプロンプトが表示される。

![RosBE コマンドプロンプト](images/rosbe-cmd.png)

著者のユーザ名は`katahiromz`なので、読者の環境ではいくつか表示が異なるかもしれない。

## コマンドプロンプトの練習

コマンドプロンプトは、コマンドを受けとって、何かの処理を行う対話型端末である。１コマンドを入力し、Enterキーを押すと、コマンドプロンプトでコマンドを実行できる。

以下では、コマンドプロンプトの使い方を少し解説する。

### CDコマンド

`CD`コマンドはディレクトリ（フォルダの位置）を移動するコマンドである。

![CDコマンドの実行例](images/rosbe-cmd-cd.png)

`cd ..`で一つ上のフォルダに移動できる。`cd (フォルダパス)`で現在のディレクトリを移動できる。相対パスと絶対パスのいずれかを指定できる。

試しに、マイドキュメントに移動してみよう。マイドキュメントの位置（例えば、筆者の環境では`C:\User\katahiromz\Documents`）を確認して、CDコマンドで指定すると移動できる。

![CDコマンドの実行例2](images/rosbe-cmd-cd2.png)

## `DIR`コマンド

`DIR`コマンドで現在のフォルダにあるファイルやフォルダの一覧を見ることができる。`CD`コマンドで`C:\Windows\system32`に移動して`dir`を実行してみよう。

## コマンドを中断するには

`C:\Windows\system32`には、大量のファイルがあるので、ここで`DIR`コマンドを実行すると、実行が止まらなくなるかもしれない。`Ctrl+C`を押すと、現在実行中のコマンドを中断することができる。

## `MD`/`MKDIR`コマンド

`MD`コマンド（`MKDIR`コマンド）でフォルダを作成できる。

`C:`ドライブのルートに「`dev`」というフォルダを作り、その中に「`cxx`」というフォルダを作ってみよう。

```cmd
cd C:\
md dev
cd dev
md cxx
dir
```

このようにコマンドを入力すると以下のような表示になる。

![MDコマンドの実行例](images/rosbe-cmd-ex1.png)

## `START .`コマンド

`start .`（スタート、スペース、ドット）コマンドを使えば現在のフォルダをエクスプローラーで開くことができる。

# C++/Win32開発の実践

## 初めてのC++プログラム（hello.cpp）

C++では、ソースと呼ばれるテキストファイルを作成し、それをC++コンパイラでコンパイル（ビルド）して、EXEファイルを作成する。

それでは、実際にソースファイルを作成しよう。`C:\dev\cxx`に次のような内容の`hello.cpp`というテキストファイルを作成して下さい。

```cpp
#include <cstdio>
int main(void) 
{
    printf("Hello, world\n");
}
```

念のため、プログラミングで使う記号について確認しよう。以下は半角英数モードで入力する。

1. `#include` の`#`はシャープ記号で、キーボードの`Shift`キーを押しながらキーボード左上の「`3`」を押せば入力できる。
2. `<cstdio>` の`<`と`>`は、不等号であり、`Shift`キーを押しながらキーボードの「`ね`」、もしくは「`る`」を押せば入力できる。
3. `(`と`)`は、丸カッコであり、`Shift`キーを押しながらキーボード中央の「`8`」または「`9`」を押せば入力できる。
4. `"`は、二重引用符であり、`Shift`キーを押しながらキーボード左上の「`2`」を押せば入力できる。
5. `\`は、バックスラッシュ（\）または半角の円記号（￥）であり、半角英数モードでキーボード右下の「`ろ`」を押せば入力できる。
6. `;`は、セミコロンである。半角英数モードでキーボードの「`れ`」を押せば入力できる。

## コンパイルの方法

RosBEではC++コンパイラとして`g++`を使用する。`CD`コマンドで`C:\dev\cxx`に移動し、次のように入力すれば`hello.cpp`をコンパイル・実行できる。

```cmd
g++ hello.cpp -o hello
hello
```

エラーメッセージが表示されたら、何か文字を間違えているかもしれません。`hello.cpp`の内容を注意深く確認して下さい。

![RosBEでC++コンパイル](images/rosbe-build-cpp.png)

無事にコンパイルが終了すると、EXEファイル`C:\dev\cxx\hello.exe`が作成され、`hello.exe`が実行可能になる。`hello`と入力すると、同じフォルダにある`hello.exe`が実行され、`Hello, world`と表示される。

このようにしてRosBEで作成したプログラムは、おそらくWindows XPでも実行可能である。

これで、あなたはC++プログラムを作成できた。

## 初めてのWin32プログラム（hello2.cpp）

次はC++/Win32プログラムを作ってみよう。次のような内容の`hello2.cpp`を作って下さい。

```cpp
#include <windows.h>
#include <cstdio>
int main(void) 
{
    if (MessageBoxA(NULL, "Yes or No?", "Test",
                    MB_ICONINFORMATION | MB_YESNO) == IDYES)
    {
        printf("You chose YES\n");
    }
    else
    {
        printf("You chose NO\n");
    }
}
```

```cmd
g++ hello2.cpp -o hello2
hello2
```

これを実行すると、黒い画面の上にメッセージボックスが表示され「はい」か「いいえ」の選択を促される。「はい」を選択すると`"You chose YES"`と表示される。「いいえ」を選択すると`"You chose NO"`と表示される。`MessageBoxA`はメッセージボックスを表示するWin32 API関数`MessageBox`のANSI版であり、これを使うために事前に`#include <windows.h>`が必要になる。

![hello2の実行イメージ](images/messagebox.png)

コマンドプロンプトから`hello2.exe`を実行できるし、`hello2.exe`をダブルクリックしても実行可能である。

これであなたもWin32 APIの入口に入ったのである。

## CMake/Ninjaとは

ここまで、コマンドプロンプトでコマンドを入力してビルドをしていたが、複雑なプロジェクトになると、コマンド入力では対応できない。C/C++ではCMakeというビルド支援ソフトを使うと、ビルド処理を自動化できる。

CMakeでは次のような手順でプロジェクトをビルドする。

1. プロジェクトのフォルダに`CMakeLists.txt`というテキストファイルを作成する。`CMakeLists.txt`には、プロジェクトのビルド方法を特殊な言葉で記述する。
2. CMakeプログラムを起動して`CMakeLists.txt`からビルドに必要なファイルを生成させる。
3. 生成されたファイルを使ってプロジェクトをビルドする。

RosBEでは実際にビルドを実行させるのはNinjaである。MinGWやMSYS2ではMakefile であり、Visual Studioではプロジェクトファイル＆ソリューションファイルである。

## CMake/Ninjaによるビルド

それではCMake/Ninjaによるビルドを試してみよう。まずは、プロジェクトに必要なファイルをフォルダで分けないといけない。`C:\dev\cxx`に`hello2`というフォルダを作成し、そこに先ほど作成した`hello2.cpp`を移動する。`C:\dev\cxx`に次のようなファイル`CMakeLists.txt`を作成する。

```txt
cmake_minimum_required(VERSION 2.4)
project(hello2 C CXX RC)
add_executable(hello2 hello2.cpp)
```

一行目の`cmake_minimum_required`は、CMakeの最小バージョンを指定するものである。次の`project`はプロジェクト名と使用する言語（`C CXX RC`）を指定するものである。最後の行の`add_executable(hello2 hello2.cpp)`は`hello2.exe`というEXEファイルのビルド方法を指定するものである。

RosBEで`CD`コマンドで`C:\dev\cxx\hello2`フォルダに移動し、次のようにコマンドを実行すると、`hello2`のビルドが完了する。

```cmd
cmake -G "Ninja" .
ninja
```

実行結果は次の通り。

![CMake/Ninjaによるビルド](images/ninja.png)

ビルドの際にEXE以外にさまざまなファイルが作成されるが、無視してもよい。

## リソーエディタのインストール

次は、ダイアログ ボックス（dialog box; 通称ダイアログ）を表示するプログラムを作成してみよう。ダイアログとはユーザーに対して対話的なウィンドウのことであり、メッセージボックスもダイアログの一種である。

しかし、簡単にダイアログを作成するには「リソースファイル」（拡張子`.rc`）というものが必要になる。そこで、リソースを編集・作成するための「リソースエディタ」というものが必要になる。

この文書ではリソースエディタとして「リソーエディタ」（RisohEditor）を推奨する。次のリンクからリソーエディタをダウンロード＆インストールして下さい。

- [リソーエディタ https://katahiromz.web.fc2.com/re/ja/](https://katahiromz.web.fc2.com/re/ja/)

リソーエディタをインストールすれば、次のようなアイコンがデスクトップに作成される。

![リソーエディタ](images/RisohEditor.png)

## 初めてのダイアログプログラム（dialog.cpp）

ではダイアログアプリを作成しよう。`C:\dev\cxx`に`dialog`というフォルダを作成し、次のC++ソースファイル`dialog.cpp`を作成する。

```cpp
#include <windows.h>
#include <windowsx.h>

BOOL OnInitDialog(HWND hwnd, HWND hwndFocus, LPARAM lParam)
{
    return TRUE;
}

void OnCommand(HWND hwnd, int id, HWND hwndCtl, UINT codeNotify)
{
    switch (id)
    {
    case IDOK:
    case IDCANCEL:
        EndDialog(hwnd, id);
        break;
    }
}

INT_PTR CALLBACK
DialogProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
        HANDLE_MSG(hwnd, WM_INITDIALOG, OnInitDialog);
        HANDLE_MSG(hwnd, WM_COMMAND, OnCommand);
    }
    return 0;
}

INT WINAPI
WinMain(HINSTANCE   hInstance,
        HINSTANCE   hPrevInstance,
        LPSTR       lpCmdLine,
        INT         nCmdShow)
{
    DialogBox(hInstance, MAKEINTRESOURCE(1), NULL, DialogProc);
    return 0;
}
```

急にプログラムがややこしくなったが、１つ１つ理解していけば問題ない。
`#include <windows.h>`は、Win32 APIを使うために必要なヘッダをインクルードする。`#include <windowsx.h>`は、`HANDLE_MSG`マクロを使用するために必要である。`HANDLE_MSG`マクロは、メッセージハンドラとウィンドウプロシージャ（もしくはダイアログプロシージャ）を結び付けるのに使う。メッセージハンドラとは、ウィンドウで発生したイベントに応じて発生するメッセージを処理する関数である。ダイアログプロシージャは、ここでは`DialogProc`関数のことである。これらは典型的なイベント駆動型のプログラミングである。

main関数の代わりに`WinMain`という関数を使う。main関数を使うと黒い画面が表示されるが、ウィンドウアプリでは黒い画面は不必要なので`main`関数は使わない。`DialogBox`関数はダイアログを表示するAPI関数である。`HWND`は、ウィンドウのハンドルを格納する型である。`UINT`は`unsigned int`型と同じである。`WPARAM`や`LPARAM`は、ポインタと同じサイズの整数型である。`DialogProc`関数では`WM_INITDIALOG`メッセージと`WM_COMMAND`メッセージを処理している。`DialogBox`や`WM_INITDIALOG`などの意味については、それをインターネットで検索すれば出てくる。

開発が進むにつれて、複雑なコードを入力するはめになるが、`WinMain`や`DialogProc`などのよく使うコードは、コピーしたり、テンプレートを使ったり、マクロなどで自動入力すれば問題ない。

次はリソースファイルである。リソーエディタで以下の手順に従って`dialog_res.rc`ファイルを作成する。

1. リソーエディタを開く。
2. 「編集」メニューから「追加」→「ダイアログを追加」を選び、「リソースの名前」に「1」（いち）を入力し、「OK」ボタンを押す。`RT_DIALOG`→`1`→`日本語`が追加される。
3. 「ファイル」メニューから「名前を付けて保存」を選び、`c:\dev\cxx\dialog`に「`dialog_res.rc`」という名前で保存する。
4. 「保存」オプションが表示されたら、「言語別にファイルを分ける」のチェックを外し、「OK」ボタンを押す。
5. 左下に「ファイルを保存しました」と表示されたら完了。リソーエディタを閉じる。

このように保存すると、`dialog_res.rc`ファイルは次のような内容になる。

```rc
// dialog_res.rc
// This file is automatically generated by RisohEditor.
// † <-- This dagger helps UTF-8 detection.

#define APSTUDIO_HIDDEN_SYMBOLS
#include <windows.h>
#include <commctrl.h>
#undef APSTUDIO_HIDDEN_SYMBOLS
#pragma code_page(65001) // UTF-8

//////////////////////////////////////////////////////////////////////////////

LANGUAGE LANG_JAPANESE, SUBLANG_DEFAULT

//////////////////////////////////////////////////////////////////////////////
// RT_DIALOG

1 DIALOG 0, 0, 215, 135
CAPTION "サンプル ダイアログ"
STYLE DS_CENTER | DS_MODALFRAME | WS_POPUPWINDOW | WS_CAPTION
FONT 9, "MS UI Gothic"
{
    DEFPUSHBUTTON "OK", IDOK, 35, 115, 60, 14
    PUSHBUTTON "キャンセル", IDCANCEL, 115, 115, 60, 14
}

...(以下略)...
```

このようにリソースを使えば、日本語の埋め込みも問題ない。

次に次のような内容の`CMakeLists.txt`を作成する。

```txt
cmake_minimum_required(VERSION 2.4)
project(dialog C CXX RC)
add_executable(dialog WIN32 dialog.cpp dialog_res.rc)
target_link_libraries(dialog PRIVATE comctl32)
```

さらに、`cmake -G "Ninja" .`と`ninja`を実行すれば、`dialog.exe`がビルドされる。

![dialogのビルド](images/dialog-build.png)

少し解説しよう。`CMakeLists.txt`の`add_executable`に`WIN32`があるのは、`main`関数を使わず、`WinMain`関数を使うためである。`WinMain`関数を使えば起動時に黒い画面は表示されない。リソースをコンパイルするために、`dialog_res.rc`を追加した。`target_link_libraries`については`dialog.exe`にリンクするDLLファイル`comctl32`を指定している。

それでは`dialog.exe`を実行してみよう。次のようなダイアログが開かれるはずである。

![dialog.exeのイメージ](images/dialog.png)

「OK」や「キャンセル」を押しても`EndDialog`関数でダイアログを終了するだけで何も面白くない。`EndDialog`の呼び出しの前に処理を追加すれば、ボタンを押したときに何か処理を行うことができる。`MesssageBoxA`関数の呼び出しを追加したり、ダイアログのリソースを編集したりすると面白いかもしれない。

## ウェブサービスを利用して活動を始める

ウェブサービスを利用するためには、ユーザIDとパスワードを使ってログインすることが、個人認証のために必要。

まず、名無しで活動するか、実名で活動するか考える。実力がないなら実名は避けたほうがいい。

アルファベットと数字を組み合わせて、適当に自分のユーザIDを決める（覚えやすいのがいい）。

パスワードは十分長くて（12字以上）推測されにくいものを使う（短かったり、単純だと簡単にハッキングされる）。

ユーザIDとパスワードは家のカギのように大事。わすれないようにしよう。

パスワードはサービスごとに分けた方がいい。

## メールアドレスを取得する

GMail はGoogleが運営するウェブメールサービスだ。GMail でメールアドレスを取得する。必要事項を入力する。ログインすれば使えるようになる。

GMail https://mail.google.com

## GitHubアカウントを取得する

GitHubは有用なソースコードがごろごろ転がっていて開発の参考になる。

メールアドレスを使ってGitHubでアカウントを取得する。

GitHub https://github.com

## GitHubでレポジトリを作成する

ローカルでGitの初期設定が必要。

https://qiita.com/wnoguchi/items/f7358a227dfe2640cce3

GitHubにログインしたら緑色の「New」ボタンを押して新規レポジトリを作成する。表示された画面に従ってGitコマンドをいくつか入力すれば GitHubのレポジトリを作成できる。レポジトリ名は「test」。

```bash
$ mkdir test                        # testフォルダを作成。
$ cd test                           # testフォルダへ移動。
$ echo "# test" >> README.md        # README.mdファイルを作成。
$ git init                          # ローカルレポジトリの初期化。
$ git commit -m "first commit"      # コミット。
$ git remote add origin https://github.com/katahiromz/test.git      # リモートレポジトリの設定。
$ git push -u origin master         # プッシュ（アップロードされる）。
```

最後のコマンドでユーザIDとパスワードが要求されるので入力する（入力内容は画面に表示されない）。

## GitHubで`hello.cpp`を公開する

再び緑色の「New」ボタンを押して`hello.cpp`を全世界に公開しよう。

```bash
$ cd ..　　　　　　　　　　　　　　　　　　# 一つ上のフォルダへ移動。
$ cd hello                              #  helloフォルダへ移動。
$ git init                              # ローカルレポジトリの初期化。
$ git add hello.cpp CMakeLists.txt      # レポジトリにファイルを追加。
$ git commit -m "first commit"          # 追加したファイルをコミット。
$ git remote add origin https://github.com/katahiromz/hello.git   # リモートレポジトリの設定。
$ git push -u origin master             # プッシュ（アップロード）。
```

`https://github.com/katahiromz/hello.git`の`katahiromz`には自分のIDが入る。

## `.gitignore`ファイルを追加する

`.gitignore`ファイルはテキストファイルで、改行区切りで無視したいファイルのパターン（ワイルドカード）を記載する。

ビルドなどでフォルダやファイルが勝手に作られるが、それをレポジトリには含めたくないとき、本質的に重要ではないファイルやフォルダ、でかすぎるファイルなどは、`.gitignore`に記載するとよい。記載例は下の通り。

```txt
*.autosave
*.cmake
*.dir
*.exe
*.filters
*.idb
*.map
*.ncb
*.o
*.obj
*.opensdf
*.res
*.sdf
*.sln
*.suo
*.tds
*.user
*.vcproj
*.vcxproj
*~
.vs
CMakeCache.txt
CMakeFiles
Debug
Makefile
Release
TMP1.$$$
build
ipch
x64
*-old
*.skrold
```
ワイルドカードでは、`*`（アスタリスク）と`?`（疑問符）は特殊な意味がある。`*`は任意の0文字以上の文字列にマッチする。

この`.gitignore`ファイルをレポジトリに追加しておく。
```bash
$ git add .gitignore
$ git commit -m "add .gitignore"
$ git push
```
この`.gitignore`ファイルを追加しておけば、`git status`の実行結果に無視ファイルが出てこないし、`git add -A`しても無視ファイルは追加されない。

