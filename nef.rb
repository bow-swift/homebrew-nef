class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage ""
  url "https://github.com/bow-swift/nef/archive/0.1.2.tar.gz"
  sha256 "77e6faf6cba6e664451766f21415ae9312d4929a2ef21c4e496ca287c9b0ce2b"

  depends_on "cocoapods"
  depends_on :xcode => "10.0"

  def install
    bin.install "./bin/nef"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
  end

end
