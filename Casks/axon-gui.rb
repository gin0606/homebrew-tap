cask "axon-gui" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "3d6240a82323e839e649315516dc35cd843a8921c6e0c682866c6b43d9369fa0",
         intel: "71879c390e9eeb65fb85c4ceaa07f40c44add756643711ae09098cf6ac53fe2c"

  url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-gui-v#{version}-#{arch}-apple-darwin.zip"
  name "Axon"
  desc "Desktop app for browsing Axon issue trackers"
  homepage "https://github.com/gin0606/axon"

  depends_on macos: :sequoia

  app "Axon.app"

  # The app stays open while in use, so do not replace the bundle under it.
  uninstall quit: "me.gin0606.axon"

  zap trash: [
    "~/Library/Application Support/Axon",
    "~/Library/Saved Application State/me.gin0606.axon.savedState",
  ]
end
