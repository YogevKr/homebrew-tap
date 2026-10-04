cask "rai" do
  version "0.1.76"
  sha256 "699bd3003c14d091933c75607b3569981a0ac4d2a85964e161f3a89755b322cb"

  url "https://github.com/YogevKr/rai/releases/download/v#{version}/Rai-#{version}-macos.dmg",
      verified: "github.com/YogevKr/rai/"
  name "rai"
  desc "Native macOS window for your herdr herd"
  homepage "https://github.com/YogevKr/rai"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Rai.app"

  zap trash: "~/Library/Preferences/gr.krig.rai.plist"
end
