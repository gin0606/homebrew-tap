cask "axon-gui" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "c72e5a4fa36b1b31de234cbc492da648d25c2024c2ba3dd44ea3d1200e7bdfd5",
         intel: "3ad60f7819dd0f87292d9adeb243fb6a206c2ddc34b3109939dc8d47c8955f5c"

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
