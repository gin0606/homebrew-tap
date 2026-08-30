class Mdopen < Formula
  desc "Convert Markdown to a single HTML page and open it in the browser"
  homepage "https://github.com/gin0606/mdopen"
  version "0.1.0"
  url "https://github.com/gin0606/mdopen/releases/download/v#{version}/mdopen-#{version}-macos-arm64.tar.gz"
  sha256 "62204c015aec8ebb312aed8eac19e3e5f3e3fe935d881151554e73a0cea58cce"
  license any_of: ["MIT", "Apache-2.0"]

  # 配布しているのは arm64 の単一アーキテクチャで、bundle も CLI も macOS 13 を
  # 下限に組んである。
  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "mdopen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdopen --version")
  end
end
