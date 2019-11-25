class Nef < Formula
  desc "💊 steroids for Xcode Playgrounds"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.4.0.tar.gz"
  sha256 "1bf4bd964e3f7fe0b93414cee724dccce45b560696c75170d6b7477f44d459dc"

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
    system "swift", "build", "--disable-sandbox", "--package-path", "project", "--build-path", "release"
    FileUtils.cp "./release/x86_64-apple-macosx/debug/nef-markdown-page", "./bin"
    FileUtils.cp "./release/x86_64-apple-macosx/debug/nef-jekyll-page", "./bin"
    FileUtils.cp "./release/x86_64-apple-macosx/debug/nef-carbon-page", "./bin"
  end
end
