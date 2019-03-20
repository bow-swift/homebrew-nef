class Nef < Formula
  desc "Tool to compile Swift docs written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.1.0.tar.gz"
  sha256 "11f2325ec2583e6fcbdef869724e098d8d62283e3ec94b6d6e3902ca2d06d52a"

  depends_on "cocoapods"
  depends_on :xcode => "10.0"

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
    xcodebuild "-project", "./markdown/JekyllMarkdown.xcodeproj", "-scheme", "JekyllMarkdown", "-configuration", "Release", "clean", "build",
    "SYMROOT=/tmp/nef/Build/Products", "-derivedDataPath", "/tmp/nef"
    mv "/tmp/nef/Build/Products/Release/JekyllMarkdown", "./bin/nef-jekyll-page"
    rm "/tmp/nef/", :force => true
  end
end
