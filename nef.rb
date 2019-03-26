class Nef < Formula
  desc "Tool to compile Swift docs written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.1.2.tar.gz"
  sha256 "3120bddde4c0a9dfe49de718f63ac41a471fd528bbd00b664bc24ee344c3c550"

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
