class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage ""
  url "https://github.com/bow-swift/nef/archive/0.1.7.tar.gz"
  sha256 "db400107bbd43e1a5e19f80ef8dbd8d1e1eaf0a5bb77fcd0bd2ae0074d58cfb8"

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
