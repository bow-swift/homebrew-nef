class Nef < Formula
  desc "Tool to compile Swift docs written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.1.6.tar.gz"
  sha256 "04f751645a05ff6dde0433e20744769af1a0a1ab722b149851f6e33554d2565b"

  depends_on :xcode => "10.2"

  def install
    build_jekyll_page
    bin.install "./bin/nef"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
    bin.install "./bin/nef-jekyll-page"
    bin.install "./bin/nef-jekyll"
  end

  test do
    print ""
  end

  def build_jekyll_page
    xcodebuild "-project", "./markdown/Markdown.xcodeproj", "-scheme", "JekyllMarkdown", "-configuration", "Release", "clean", "build",
    "SYMROOT=/tmp/nef/Build/Products", "-derivedDataPath", "/tmp/nef"
    mv "/tmp/nef/Build/Products/Release/JekyllMarkdown", "./bin/nef-jekyll-page"
    rm "/tmp/nef/", :force => true
  end
end
