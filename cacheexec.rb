class Cacheexec < Formula
  desc "Cache non-interactive command output and exit status"
  homepage "https://github.com/gin0606/cacheexec"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cf4344e299f12b63ba338afe8c42e7714002a7b754beb975a217b6514aa82660"
    elsif Hardware::CPU.intel?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b5643b1b3bc0781f697496fe168bc7c097a10e0d262d7d5eb1280a9212c70c1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dde6f742e95985da62c98cc2237bc7057d5ceedf74c6094551b707305193175a"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gin0606/cacheexec/releases/download/v#{version}/cacheexec-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2f9e1c7827a8bdb5e379dce25ae8779f669b253acca78dfb540edca40e307985"
    end
  end

  def install
    bin.install "cacheexec"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cacheexec --version")
  end
end
