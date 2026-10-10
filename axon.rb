class Axon < Formula
  desc "Local issue tracker for Issues and Groups"
  homepage "https://github.com/gin0606/axon"
  version "0.3.0"
  license "MIT"

  depends_on macos: :sequoia

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a6a2f0e123b7de5a2d2d919b872186cad943695bdc35a38cb9e018697a09af46"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5218ebdade9f3eef6023d051ac4b9585f04e6f7a86bd35fdd0d9b7cd2a1c9a67"
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
