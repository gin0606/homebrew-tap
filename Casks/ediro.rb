cask "ediro" do
  version "0.2.0"
  sha256 "ed03860e6da90bc76c51499d162b52ce8888befa4796b266d839fe51453661f4"

  url "https://github.com/gin0606/ediro/releases/download/v#{version}/Ediro-#{version}.zip"
  name "Ediro"
  desc "Single-window Markdown editor for drafting chat messages"
  homepage "https://github.com/gin0606/ediro"

  # 配布物は swift build が吐く arm64 だけのバイナリで、macOS 27 以降を要求する。
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Ediro.app"

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
