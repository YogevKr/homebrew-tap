cask "rai" do
  version "0.1.21"
  sha256 "2c8b1e211ac2a5001928c0366c888982d53059c733c10ad753febdf004620547"

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

  caveats <<~CAVEATS
    rai is ad-hoc signed but not notarized. If macOS blocks it on first launch,
    either right-click Rai.app and choose Open, or run:
      xattr -dr com.apple.quarantine "$(brew --caskroom)/rai/#{version}/Rai.app" /Applications/Rai.app 2>/dev/null
    Or install with:  brew install --cask --no-quarantine yogevkr/tap/rai
  CAVEATS
end
