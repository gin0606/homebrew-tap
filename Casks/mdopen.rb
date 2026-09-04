cask "mdopen" do
  version "0.2.1"
  sha256 "acf50c98fdd7024aa17eb904237a2f03fc5cb0ff6838675a14c9a8bb129b8d34"

  url "https://github.com/gin0606/mdopen/releases/download/v#{version}/mdopen.app-#{version}-macos-arm64.zip"
  name "mdopen"
  desc "Convert Markdown to a single HTML page and open it in the browser"
  homepage "https://github.com/gin0606/mdopen"

  # 配布物は arm64 の単一アーキテクチャで、bundle は macOS 13 を下限に組んである。
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "mdopen.app"

  # CLI は mdhtml formula が入れる。ここでも bin に出すと、両方入れた環境で
  # 同じ場所を取り合う。
end
