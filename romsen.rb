class Romsen < Formula
  desc "Print what the Slack desktop app shows as text, via the Accessibility API"
  homepage "https://github.com/gin0606/romsen"
  version "0.1.0"
  url "https://github.com/gin0606/romsen/releases/download/v#{version}/romsen-v#{version}-macos-arm64.tar.gz"
  sha256 "69b1e870641120d55c36d24fb3fd048d17b99cf5f9ba12bf67ce078fe1e32190"
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
