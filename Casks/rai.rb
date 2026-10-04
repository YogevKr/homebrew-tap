cask "rai" do
  version "0.1.72"
  sha256 "2d01ef8ed24cc34637b961c0c14ce644613e2fd75459405ce76ce44da528eddb"

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
