class Romsen < Formula
  desc "Print what the Slack desktop app shows as text, via the Accessibility API"
  homepage "https://github.com/gin0606/romsen"
  version "0.2.0"
  url "https://github.com/gin0606/romsen/releases/download/v#{version}/romsen-v#{version}-macos-arm64.tar.gz"
  sha256 "836b2a4dab32f4fd4986317f19c6566d646b5ea7e3c487d495aa27c7fd00cc47"
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
