class Xchtmlreport < Formula
  desc "XCTestHTMLReport: Xcode-like HTML report for Unit and UI Tests"
  homepage "https://github.com/Raizlabs/XCTestHTMLReport"
  url "https://github.com/Raizlabs/XCTestHTMLReport/archive/1.5.0-raizlabs.zip"
  sha256 "801cd9fff6887a0c209e85766917c4da05e6a3e519439758c21cd37e0c6ec6fc"
  head "https://github.com/Raizlabs/XCTestHTMLReport.git", :using => :git, :branch => '1.5.0-raizlabs'

  def install
    system "xcodebuild clean build CODE_SIGN_IDENTITY=\"\" CODE_SIGNING_REQUIRED=NO -workspace XCTestHTMLReport.xcworkspace -scheme XCTestHTMLReport -configuration Release"
    bin.install "xchtmlreport"
  end
end
