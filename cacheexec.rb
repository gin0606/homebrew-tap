class Cacheexec < Formula
  desc "Cache non-interactive command output and exit status"
  homepage "https://github.com/gin0606/cacheexec"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "834116b448bd40af3cb3b6541d2add871c4ba3d758fc633c38d5eb9acdefabf5"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2289cbaa5acfcda0e1664d98776714eba461fe9832a2ef44735484ce78ef6b35"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9530f7740f6b2ba9beaf7bc67cda60f21cf65d4d9193aaf7c22fcdcd8e7a9a19"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d2130aff1bda8746f4c9796355fcc6971427de9bc436131caa28caf50ba59c96"
    end
  end

  def install
    bin.install "cacheexec"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cacheexec --version")
  end
end
