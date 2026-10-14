cask "ediro" do
  version "0.1.13"
  sha256 "c5c26ac99401550c5063363a3bebf966106106e138ec5b4aaf344e53165b2149"

  url "https://github.com/gin0606/ediro/releases/download/v#{version}/Ediro-#{version}.zip"
  name "Ediro"
  desc "Single-window Markdown editor for drafting chat messages"
  homepage "https://github.com/gin0606/ediro"

  # 配布物は swift build が吐く arm64 だけのバイナリで、macOS 27 以降を要求する。
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Ediro.app"

  # ad-hoc 署名なので、ダウンロードで付く quarantine が残ったままだと
  # Gatekeeper が起動を拒否する。
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Ediro.app"]
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
