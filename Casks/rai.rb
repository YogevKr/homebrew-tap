cask "rai" do
  version "0.1.8"
  sha256 "12e612672b330a2f7da0f8795a5395e024602bba6544794d4a54f21413061645"

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
