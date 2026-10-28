cask "axon-gui" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "9e6691a2d1e6ddc72b4ea063cb29fe5e5e6c134e6dda5e661b73a524fea0f4d6",
         intel: "0bd0cda47c1b1a698292f5abdf2a48b397acc6c7f036f87c674674a2646d6049"

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
