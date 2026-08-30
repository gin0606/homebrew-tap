cask "mdopen-app" do
  version "0.1.0"
  sha256 "2c81f03b72ef5325dbc18aaec74c6e6d80cb21f1d2cd4b02a0ed808ccde0e610"

  url "https://github.com/gin0606/mdopen/releases/download/v#{version}/mdopen.app-#{version}-macos-arm64.zip"
  name "mdopen"
  desc "Convert Markdown to a single HTML page and open it in the browser"
  homepage "https://github.com/gin0606/mdopen"

  # 配布物は arm64 の単一アーキテクチャで、bundle は macOS 13 を下限に組んである。
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "mdopen.app"

  # CLI は Formula が入れる。ここでも bin に出すと、両方入れた環境で
  # 同じ場所を取り合う。token を formula と分けているのは、同名だと
  # `brew install gin0606/tap/mdopen` がどちらとも解釈できる旨を毎回警告するため。
end
