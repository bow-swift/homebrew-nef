class Nef < Formula
  desc "Tool to compile Swift docs written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.3.2.tar.gz"
  sha256 "889b533fe976eb4c20eab8cb5b7d12319c4eab0a25c636af3ff9a085e562add6"

  depends_on :xcode => "11.0"

  def install
    build_project

    bin.install "./bin/nef"
    bin.install "./bin/nef-common"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
    bin.install "./bin/nef-markdown-page"
    bin.install "./bin/nef-markdown"
    bin.install "./bin/nef-jekyll-page"
    bin.install "./bin/nef-jekyll"
    bin.install "./bin/nef-carbon-page"
    bin.install "./bin/nef-carbon"
  end

  test do
    print ""
  end

  def build_project
    build_mardown_project
    build_jekyll_project
    build_carbon_project
  end

  def build_mardown_project
      xcodebuild "-project", "./markdown/Markdown.xcodeproj", "-scheme", "Markdown", "-configuration", "Release", "clean", "build", "SYMROOT=/tmp/nef/Build/Products", "-derivedDataPath", "/tmp/nef"
      mv "/tmp/nef/Build/Products/Release/Markdown", "./bin/nef-markdown-page"
      rm "/tmp/nef/", :force => true
  end

  def build_jekyll_project
      xcodebuild "-project", "./markdown/Markdown.xcodeproj", "-scheme", "JekyllMarkdown", "-configuration", "Release", "clean", "build", "SYMROOT=/tmp/nef/Build/Products", "-derivedDataPath", "/tmp/nef"
      mv "/tmp/nef/Build/Products/Release/JekyllMarkdown", "./bin/nef-jekyll-page"
      rm "/tmp/nef/", :force => true
  end

  def build_carbon_project
      xcodebuild "-project", "./markdown/Markdown.xcodeproj", "-scheme", "Carbon", "-configuration", "Release", "clean", "build", "SYMROOT=/tmp/nef/Build/Products", "-derivedDataPath", "/tmp/nef"
      mv "/tmp/nef/Build/Products/Release/Carbon", "./bin/nef-carbon-page"
      rm "/tmp/nef/", :force => true
  end
end
