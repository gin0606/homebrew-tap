class Cacheexec < Formula
  desc "Cache non-interactive command output and exit status"
  homepage "https://github.com/gin0606/cacheexec"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4c085b0012a39d82172fdd59050c0b1b41df8c2309e8c5807bce360d599f7401"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3c349574fc81fff8ca617a1af68f3d5f6fd0978ac3ddc3b84413242e20b44b76"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4880b043ea76f920f8548f756f01846b14a3411aaab37b84993f07771b15ad68"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6486b3c145bde601205bb088f41a32329b4debdeb706b0fd88774f3e1d2242a6"
    end
  end

  def install
    bin.install "cacheexec"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cacheexec --version")
  end
end
