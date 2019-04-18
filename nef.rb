class Nef < Formula
  desc "Tool to compile Swift docs written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.1.5.tar.gz"
  sha256 "72f95490a4361ae09b85f956ace0e5b5350ac5bd08fc6a6ab0e3482a1c6cae1c"

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
