class Cacheexec < Formula
  desc "Cache non-interactive command output and exit status"
  homepage "https://github.com/gin0606/cacheexec"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4d9fa9793d2f0fc5d1ed27b3927a465817881aa4d375566a4c8607a6370e6ea1"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c937abd9c735ceaa1bcb2c3d3c047b19f5358f03c455a62a38df5db19a35bfc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3fcdf6eefc6b0201407139a56a5612dd99b0299c02a0c77c55f9272bfb786edb"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bac0eb42708d15a4948551667ac4a536e3be47346050b4f776698c20feedda7f"
    end
  end

  def install
    bin.install "cacheexec"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cacheexec --version")
  end
end
