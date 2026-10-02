class Mdhtml < Formula
  desc "Convert Markdown to a single HTML page and print where it went"
  homepage "https://github.com/gin0606/mdopen"
  version "0.3.0"
  url "https://github.com/gin0606/mdopen/releases/download/v#{version}/mdhtml-#{version}-macos-arm64.tar.gz"
  sha256 "e117cc62b7cf9f304a3cfd148194dfc675e8e142e3d4ca9a550ffe73b625eead"
  license any_of: ["MIT", "Apache-2.0"]

  # 配布しているのは arm64 の単一アーキテクチャで、bundle も CLI も macOS 13 を
  # 下限に組んである。
  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "mdhtml"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdhtml --version")
  end
end
