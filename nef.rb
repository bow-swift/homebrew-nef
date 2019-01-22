class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage ""
  url "https://github.com/bow-swift/nef/archive/0.1.1.tar.gz"
  sha256 "88e285bbf0d8f977837bca2c6f6587f0a68905285e08dcb8e2c6c9e37fd39d89"

  depends_on "cocoapods"
  depends_on :xcode => "10.0"

  def install
    bin.install "./bin/nef"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
  end

end
