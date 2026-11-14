class Axon < Formula
  desc "Local issue tracker for Issues and Groups"
  homepage "https://github.com/gin0606/axon"
  version "0.7.0"
  url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "3d1fdca4fefd1c8b771eadbeee07eb89ad92f728a880fd90c55e50aabf82199a"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "axon"
  end

  test do
    assert_equal "axon #{version}", shell_output("#{bin}/axon --version").strip
    system bin/"axon", "init", "trial"
    system bin/"axon", "capture", "--label", "docs", "--title", "Write a guide",
           "-m", "Explain installation and basic usage."
    system bin/"axon", "storage", "check"
  end
end
