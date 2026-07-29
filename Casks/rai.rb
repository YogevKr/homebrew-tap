cask "rai" do
  version "0.1.26"
  sha256 "ee3f8bd3bf0008d420a923bb78e54e1f31e39e5747332ab8cc4e14df803bc349"

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
    rai is ad-hoc signed but not notarized, so macOS quarantines it. Clear the
    flag before the first launch:
      xattr -dr com.apple.quarantine "$(brew --caskroom)/rai/#{version}/Rai.app" /Applications/Rai.app 2>/dev/null
    Homebrew 6 removed --no-quarantine and macOS 15 removed the right-click Open
    bypass; if Gatekeeper still blocks it, use
    System Settings > Privacy & Security > Open Anyway.
  CAVEATS
end
