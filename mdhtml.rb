class Mdhtml < Formula
  desc "Convert Markdown to a single HTML page and print where it went"
  homepage "https://github.com/gin0606/mdopen"
  version "0.2.0"
  url "https://github.com/gin0606/mdopen/releases/download/v#{version}/mdhtml-#{version}-macos-arm64.tar.gz"
  sha256 "ecaf949f3ade5f11b9c727675c44561c56517f8746e8f172992c1524ec092efa"
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
