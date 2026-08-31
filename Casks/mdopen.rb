cask "mdopen" do
  version "0.2.0"
  sha256 "d2b2f5972abccade180d70d72eb845d09438d745b777479a140a27430ec9cd33"

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
