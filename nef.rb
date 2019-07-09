class Nef < Formula
  desc "Tool to compile Swift docs written in Playground format with Bow support"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.3.0.tar.gz"
  sha256 "0556227f4ebe81cdfaaa6be394dcad4e5003568144da45d008aded144648fe09"

  depends_on :xcode => "10.2"

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
