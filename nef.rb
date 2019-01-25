class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage ""
  url "https://github.com/bow-swift/nef/archive/0.1.1.tar.gz"
  sha256 "4b1edb73280512d8665b401c6b26d7b7fe370948df13dedf8b31b0759532fbb0"

  depends_on "cocoapods"
  depends_on :xcode => "10.0"

  def install
    bin.install "./bin/nef"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
  end

end
