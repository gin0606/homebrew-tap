class Axon < Formula
  desc "Local issue tracker for Issues and Groups"
  homepage "https://github.com/gin0606/axon"
  version "0.2.0"
  license "MIT"

  depends_on macos: :sequoia

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2fc546e1093be6d80acb560316bcedde1be3c2e4e953ca4bb4274cd158e90732"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/axon/releases/download/v#{version}/axon-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "56fc91cf5df389700091e90a1b234a237797ffcf03ec605bccd708361abb3329"
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
