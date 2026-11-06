class Axon < Formula
  desc "Local issue tracker for Issues and Groups"
  homepage "https://github.com/gin0606/axon"
  version "0.5.1"
  license "MIT"

  depends_on macos: :sequoia

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "61dce1cbc01735fdc5cfe3a733cd0b7f9ebe1a6be1aae0127593e0327a18dee2"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d6b790403243bcc8c92066ed687d18af2e5310d4af4d4e2e9adbbdafd93c62ea"
    end
  end

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
