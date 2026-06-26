# homebrew-hanaedit

HanaEdit の Homebrew tap です。

## インストール

Launchpad や Finder の「このアプリケーションで開く」から起動できる `.app` として
インストールします。

```sh
brew tap webfreakjp/hanaedit
brew trust webfreakjp/hanaedit
brew install --cask hanaedit
```

直接インストールする場合:

```sh
brew trust webfreakjp/hanaedit
brew install --cask webfreakjp/hanaedit/hanaedit
```

`Refusing to load cask ... from untrusted tap` と表示された場合は、上の
`brew trust` を実行してから再度 `brew install` してください。

インストール後の確認:

```sh
hanaedit --version
```

## Cask

この tap は Cask のみを提供します。

- Cask: [Casks/hanaedit.rb](Casks/hanaedit.rb)

HanaEdit 本体のリポジトリ:

```text
https://github.com/webfreakjp/hanaedit
```

## リリース手順

ここでは `v0.1.0` を例にします。バージョンを変える場合は、コマンド内の `0.1.0` も置き換えてください。

### 1. 本体リポジトリでバージョンを更新する

```sh
cd ../hanaedit
```

`Sources/HanaEdit/AppInfo.swift` の `version` を更新します。

```swift
static let version = "0.1.0"
```

動作確認します。

```sh
swift build -c release
.build/release/HanaEdit --version
./scripts/build-app.sh
./scripts/package-app.sh 0.1.0
```

commit して push します。

```sh
git add .
git commit -m "Release 0.1.0"
git push origin main
```

### 2. tag を作成して push する

```sh
git tag v0.1.0
git push origin v0.1.0
```

### 3. GitHub Release に app zip をアップロードする

本体リポジトリで作成した `dist/HanaEdit-0.1.0.zip` を GitHub Release の
`v0.1.0` に添付します。

`gh` コマンドは必須ではありません。GitHub の Web UI から
`webfreakjp/hanaedit` の Releases を開き、`v0.1.0` の release を作成または編集して、
`dist/HanaEdit-0.1.0.zip` をアップロードします。

Cask の `sha256` はこの zip ファイルの SHA-256 です。

```sh
shasum -a 256 dist/HanaEdit-0.1.0.zip
```

### 4. tap の Cask を更新する

```sh
cd ../homebrew-hanaedit
```

[Casks/hanaedit.rb](Casks/hanaedit.rb) の `version` と `sha256` を更新します。

```ruby
version "0.1.0"
sha256 "..."
```

### 5. Cask をローカルで検証する

Homebrew は Cask を tap 配下から読み込むため、ローカル clone で編集した Cask を
インストール済み tap に一時反映して確認します。

```sh
mkdir -p /opt/homebrew/Library/Taps/webfreakjp/homebrew-hanaedit/Casks
cp Casks/hanaedit.rb /opt/homebrew/Library/Taps/webfreakjp/homebrew-hanaedit/Casks/hanaedit.rb

brew uninstall --cask hanaedit 2>/dev/null || true
brew install --cask webfreakjp/hanaedit/hanaedit
open -a HanaEdit
```

Cask として読めるかも確認します。

```sh
brew info --cask webfreakjp/hanaedit/hanaedit
```

### 6. tap を commit して push する

```sh
git add Casks/hanaedit.rb README.md
git commit -m "Update hanaedit to 0.1.0"
git push origin main
```

これで他の Mac から `brew update && brew upgrade --cask hanaedit` または
`brew install --cask hanaedit` で使えるようになります。
