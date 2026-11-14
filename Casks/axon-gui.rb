cask "axon-gui" do
  version "0.7.0"
  sha256 "853109c1f78875447d7db08b07f90dfb8284d4032c73d96e5e82e98a1f17c6eb"

  url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-gui-v#{version}-aarch64-apple-darwin.zip"
  name "Axon"
  desc "Desktop app for browsing Axon issue trackers"
  homepage "https://github.com/gin0606/axon"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Axon.app"

  # The app stays open while in use, so do not replace the bundle under it.
  uninstall quit: "me.gin0606.axon"

  zap trash: [
    "~/Library/Application Support/Axon",
    "~/Library/Saved Application State/me.gin0606.axon.savedState",
  ]
end
