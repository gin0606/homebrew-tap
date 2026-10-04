class Romsen < Formula
  desc "Print what the Slack desktop app shows as text, via the Accessibility API"
  homepage "https://github.com/gin0606/romsen"
  version "0.2.1"
  url "https://github.com/gin0606/romsen/releases/download/v#{version}/romsen-v#{version}-macos-arm64.tar.gz"
  sha256 "e61b66da9ea775b1c3e363c8c56c35124bbcb79ddfae34a068af64d0613355e6"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "romsen"
  end

  def caveats
    <<~EOS
      romsen reads Slack through the macOS Accessibility API. The permission belongs to
      the app that runs romsen, such as your terminal or agent host, not to romsen
      itself. Allow that app in System Settings > Privacy & Security > Accessibility.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/romsen --version")
  end
end
