class Nef < Formula
  desc "💊 steroids for Xcode Playgrounds"
  homepage "https://github.com/bow-swift/nef"
  url "https://github.com/bow-swift/nef/archive/0.5.2.tar.gz"
  sha256 "050181c1e541e54428f8214092b17a321fb1e4f2460ae2bd8115063637244b02"

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
    bin.install "./bin/nef-playground-book"
  end

  test do
    print ""
  end

  def build_project
    system "swift", "build", "--disable-sandbox", "--package-path", "project", "--build-path", "release"
    cp "./release/x86_64-apple-macosx/debug/nef-markdown-page", "./bin"
    cp "./release/x86_64-apple-macosx/debug/nef-jekyll-page", "./bin"
    cp "./release/x86_64-apple-macosx/debug/nef-carbon-page", "./bin"
    cp "./release/x86_64-apple-macosx/debug/nef-playground-book", "./bin"
  end
end
