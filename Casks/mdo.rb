cask "mdo" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/gin0606/mdo/releases/download/v#{version}/mdo.app-#{version}-macos-arm64.zip"
  name "mdo"
  desc "Convert Markdown to a single HTML page and open it in the browser"
  homepage "https://github.com/gin0606/mdo"

  # 配布物は arm64 の単一アーキテクチャで、bundle は macOS 13 を下限に組んである。
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "mdo.app"

  # CLI は Formula が入れる。ここでも bin に出すと、両方入れた環境で
  # 同じ場所を取り合う。
end
