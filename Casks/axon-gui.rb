cask "axon-gui" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "d987f44fbbf65ad7ff23d10232be69c587b9f8f15cf663e60a0dd60701842992",
         intel: "45d9a3cbf0b44852a755a7baa4d2e49361289d4c81166109caf5da0901259b26"

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
