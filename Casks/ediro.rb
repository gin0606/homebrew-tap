cask "ediro" do
  version "0.1.2"
  sha256 "250ba34618c57b66dd8bbb2a4a49df104b5bd00f558bafea8af1f24544277249"

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
  uninstall quit: "com.gin0606.ediro"

  zap trash: [
    "~/Library/Application Support/Ediro",
    "~/Library/Preferences/com.gin0606.ediro.plist",
    "~/Library/Saved Application State/com.gin0606.ediro.savedState",
  ]
end
