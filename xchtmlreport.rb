class Xchtmlreport < Formula
  desc "XCTestHTMLReport: Xcode-like HTML report for Unit and UI Tests"
  homepage "https://github.com/Raizlabs/XCTestHTMLReport"
  url "https://github.com/Raizlabs/XCTestHTMLReport/archive/1.5.0-raizlabs.zip"
  sha256 "fe142145e3d84c2416b7614044b0b3cf1bb3a8c2e02ab7c48347063e7cd02497"
  head "https://github.com/Raizlabs/XCTestHTMLReport.git"

  def install
    system "xcodebuild clean build CODE_SIGN_IDENTITY=\"\" CODE_SIGNING_REQUIRED=NO -workspace XCTestHTMLReport.xcworkspace -scheme XCTestHTMLReport -configuration Release"
    bin.install "xchtmlreport"
  end
end
