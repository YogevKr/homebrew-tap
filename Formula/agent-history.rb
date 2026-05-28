class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.4/agent-history-v0.1.4-darwin-arm64.tar.gz"
    sha256 "b6a77d4d27ee8a9b7c65508cb5227a2300754c0b571b78e267eb1dca5a8fb966"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.4.tar.gz"
    sha256 "0137d0393c3edbb0e9396b7f9515cb248c59df23007a9cb5681c5b4e88986e5c"
  end

  depends_on "rust" => :build if OS.linux? || Hardware::CPU.intel?

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "agent-history", "ah"
    else
      system "cargo", "install", *std_cargo_args
    end

    prefix.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-history --version")
    assert_match version.to_s, shell_output("#{bin}/ah --version")
  end
end
