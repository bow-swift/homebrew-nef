class Nef < Formula
  desc "Tool to compile Swift docs written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.2.0.tar.gz"
  sha256 "ac2fed3bb7cd5291c6b843faf074341ae7606e2b4ac63e7fcbe77b73714cbd68"

  depends_on :xcode => "10.2"

  def install
    build_project

    bin.install "./bin/nef"
    bin.install "./bin/nef-common"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
    bin.install "./bin/nef-jekyll-page"
    bin.install "./bin/nef-jekyll"
    bin.install "./bin/nef-markdown-page"
    bin.install "./bin/nef-markdown"
  end

  test do
    print ""
  end

  def build_project
    build_jekyll_project
    build_mardown_project
  end

  def build_jekyll_project
      xcodebuild "-project", "./markdown/Markdown.xcodeproj", "-scheme", "JekyllMarkdown", "-configuration", "Release", "clean", "build", "SYMROOT=/tmp/nef/Build/Products", "-derivedDataPath", "/tmp/nef"
      mv "/tmp/nef/Build/Products/Release/JekyllMarkdown", "./bin/nef-jekyll-page"
      rm "/tmp/nef/", :force => true
  end

  def build_mardown_project
      xcodebuild "-project", "./markdown/Markdown.xcodeproj", "-scheme", "Markdown", "-configuration", "Release", "clean", "build", "SYMROOT=/tmp/nef/Build/Products", "-derivedDataPath", "/tmp/nef"
      mv "/tmp/nef/Build/Products/Release/Markdown", "./bin/nef-markdown-page"
      rm "/tmp/nef/", :force => true
  end
end
