cask "hanaedit" do
  version "0.1.0"
  sha256 "6d2130a657423914822b9b34bd29861eddc77823d226fdbcd1f6e5cdcc780fcb"

  url "https://github.com/webfreakjp/hanaedit/releases/download/v#{version}/HanaEdit-#{version}.zip"
  name "HanaEdit"
  desc "macOS native AppKit text editor"
  homepage "https://github.com/webfreakjp/hanaedit"

  depends_on macos: :ventura

  app "HanaEdit.app"
  binary "#{appdir}/HanaEdit.app/Contents/MacOS/HanaEdit", target: "hanaedit"
end
