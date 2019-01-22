class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage ""
  url "https://github.com/bow-swift/nef/archive/0.1.0.tar.gz"
  sha256 "22108b6f2845e22581af216f87b93340884dbd5d66ef0ab0e38e15ee1a9cf38d"

  def install
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
  end

end
