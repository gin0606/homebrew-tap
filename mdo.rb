class Mdo < Formula
  desc "Convert Markdown to a single HTML page and open it in the browser"
  homepage "https://github.com/gin0606/mdo"
  version "0.0.0"
  url "https://github.com/gin0606/mdo/releases/download/v#{version}/mdo-#{version}-macos-arm64.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license any_of: ["MIT", "Apache-2.0"]

  # 配布しているのは arm64 の単一アーキテクチャで、bundle も CLI も macOS 13 を
  # 下限に組んである。
  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "mdo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdo --version")
  end
end
