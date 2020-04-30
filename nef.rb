class Nef < Formula
  desc "💊 steroids for Xcode Playgrounds"
  homepage "https://nef.bow-swift.io"
  url "https://github.com/bow-swift/nef/archive/0.6.1.tar.gz"
  sha256 "182d5f91e3048f046a63bf81d148f94acc7c667b5314cf76f36a9fb75efdb3a7"

  depends_on :xcode => "11.4"
  depends_on macos: '>= :mojave'
  
  def install
    system "make", "install", "prefix=#{prefix}", "version=#{version}"
  end

  test do
    system "#{bin}/nef", "markdown",
           "--project", "#{share}/tests/Documentation.app",
           "--output", "#{testpath}/nef"
    assert_path_exist "#{testpath}/nef/resources.md", :exist?
  end
end
