cask "axon-gui" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.1"
  sha256 arm:   "7b761a95af43eee4683a2ab06a22ebfc0fa330a3fa982d8505c5ffd77f3c3f85",
         intel: "4a2cf6c05694b169b163a67b4be890527839484151510838150e0bbccfd9e75e"

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
