class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.1.0.tar.gz"
  sha256 "ec982a271c55e0003f03821dbf8f11306b28f232c8a6df3f5cbfdb11b8d4cbf5"

  depends_on "cocoapods"
  depends_on :xcode => "10.0"

  def install
    buildJekyllPage

    bin.install "./bin/nef"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
    bin.install "./bin/nef-jekyll-page"
    bin.install "./bin/nef-jekyll"
  end

  def buildJekyllPage
    system "xcodebuild", "-project", "./markdown/JekyllMarkdown.xcodeproj",  "-scheme", "JekyllMarkdown", "clean", "build", "-derivedDataPath", "/tmp/nef"
    system "mv", "/tmp/nef/Build/Products/Release/JekyllMarkdown", "./bin/nef-jekyll-page"
    system "rm", "-rf", "/tmp/nef/"
  end

end
