cask "ediro" do
  version "0.1.5"
  sha256 "605183604298d339b4b8748979f9b2016089acbaf9c62b2e829981cc37685718"

  url "https://github.com/gin0606/ediro/releases/download/v#{version}/Ediro-#{version}.zip"
  name "Ediro"
  desc "Single-window Markdown editor for drafting chat messages"
  homepage "https://github.com/gin0606/ediro"

  # 配布物は swift build が吐く単一アーキテクチャのバイナリ。macOS 26 は
  # 一部の Intel Mac でも動くので、そちらに入らないようにする。
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Ediro.app"

  # ad-hoc 署名なので、ダウンロードで付く quarantine が残ったままだと
  # Gatekeeper が起動を拒否する。
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Ediro.app"]
  end

  # 開きっぱなしで使うので、起動中に足元のバンドルを差し替えない。
  uninstall quit: "me.gin0606.ediro"

  # bundle identifier の domain は v0.1.3 で変わった。それ以前から使っている
  # 環境には旧識別子の残骸があるので、両方を消す。
  zap trash: [
    "~/Library/Application Support/Ediro",
    "~/Library/Preferences/com.gin0606.ediro.plist",
    "~/Library/Preferences/me.gin0606.ediro.plist",
    "~/Library/Saved Application State/com.gin0606.ediro.savedState",
    "~/Library/Saved Application State/me.gin0606.ediro.savedState",
  ]
end
