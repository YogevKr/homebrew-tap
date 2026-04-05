class Draftsx < Formula
  include Language::Python::Virtualenv

  desc "CLI and rebuildable local index for Drafts.app"
  homepage "https://github.com/YogevKr/draftsx"
  url "https://github.com/YogevKr/draftsx/releases/download/v0.1.1/draftsx-0.1.1.tar.gz"
  sha256 "9d14cb053e73293180744bbfa5c50e702e0cf628d723cee9c00b82099ad30210"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/draftsx --version")
  end
end
