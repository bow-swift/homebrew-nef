class Nef < Formula
  desc "A command line tool to compile Swift documentation written in Playground format with Bow support"
  homepage ""
  url "https://github.com/bow-swift/nef/archive/0.1.0.tar.gz"
  sha256 "03eaf838606c182fe5a200f71b1aa4eb8f98b90eb38b115087d27a2a2db953f8"

  depends_on "cocoapods"
  depends_on :xcode => "10.0"

  def install
    bin.install "./bin/nef"
    bin.install "./bin/nefc"
    bin.install "./bin/nef-playground"
  end

end
