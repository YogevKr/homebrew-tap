class Draftsx < Formula
  include Language::Python::Virtualenv

  desc "CLI and rebuildable local index for Drafts.app"
  homepage "https://github.com/YogevKr/draftsx"
  url "https://github.com/YogevKr/draftsx/releases/download/v0.1.0/draftsx-0.1.0.tar.gz"
  sha256 "6b1a0f4fa9e8ba0fa330b977c1f72dee2edb2fae4657415c4dfad59047432aff"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/draftsx --version")
  end
end
