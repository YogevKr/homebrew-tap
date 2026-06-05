class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.6/agent-history-v0.1.6-darwin-arm64.tar.gz"
    sha256 "5b59155448e3cf31173554d7825636a4e77c18a92d0959a968912a0e6b02c937"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.6.tar.gz"
    sha256 "50ae6597f58d0c9e7a422fffb68a02f1df818b9511e9acc4085495fc5bea3c9e"
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
