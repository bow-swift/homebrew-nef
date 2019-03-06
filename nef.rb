class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage ""
  url "https://github.com/bow-swift/nef/archive/0.1.9.tar.gz"
  sha256 "77a80980367f6d02fa30b6ea06c7cba7017359bed3bccd4b40243f757cf8fd72"

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
