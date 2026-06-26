# インストール手順

HanaEdit は Homebrew Cask として配布します。インストールすると
`/Applications/HanaEdit.app` に配置され、Launchpad や Finder の
「このアプリケーションで開く」から起動できます。

## 初回インストール

```sh
brew tap webfreakjp/hanaedit
brew trust webfreakjp/hanaedit
brew install --cask hanaedit
```

直接指定してインストールする場合:

```sh
brew trust webfreakjp/hanaedit
brew install --cask webfreakjp/hanaedit/hanaedit
```

インストール後の確認:

```sh
hanaedit --version
open -a HanaEdit
```

## アップデート

```sh
brew update
brew upgrade --cask hanaedit
```

更新されない場合は、再インストールします。

```sh
brew update
brew reinstall --cask hanaedit
```

tap が古いままの場合は、tap を入れ直します。

```sh
brew untap webfreakjp/hanaedit
brew tap webfreakjp/hanaedit
brew trust webfreakjp/hanaedit
brew reinstall --cask hanaedit
```

## キャッシュを消す

Release zip を差し替えた直後など、Homebrew の download cache が残っている場合は
キャッシュを削除してから再インストールします。

```sh
rm -f "$(brew --cache)/downloads/"*HanaEdit*
brew reinstall --cask hanaedit
```

## 「壊れているため開けません」と表示される場合

現在の配布物は Apple Developer ID 署名と notarize が未対応です。Launchpad や Finder から
起動したときに「壊れているため開けません」と表示される場合は、quarantine 属性を外します。

```sh
xattr -dr com.apple.quarantine /Applications/HanaEdit.app
open -a HanaEdit
```

今後、Developer ID 署名と notarize に対応してこの手順を不要にする予定です。
