cask "rai" do
  version "0.1.89"
  sha256 "187e62c186c91b34582ee8fec0ad8ee71da79834b075b9c715cf1db92fa340ac"

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
