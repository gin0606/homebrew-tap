class Axon < Formula
  desc "Local issue tracker for Issues and Groups"
  homepage "https://github.com/gin0606/axon"
  version "0.1.0"
  license "MIT"

  depends_on macos: :sequoia

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b0c99e552ae09e09b49e4c95d95801776d2b27b14bd135aeb03ded6e488ab74c"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d460c44dcbeeda87cbfc540d2605fab2acbbacad3fe69cbe826b8e604baaa03d"
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
