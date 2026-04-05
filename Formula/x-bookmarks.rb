class XBookmarks < Formula
  include Language::Python::Virtualenv

  desc "Shell-first X bookmarks archive with local search and sync"
  homepage "https://github.com/YogevKr/x-bookmarks"
  url "https://github.com/YogevKr/x-bookmarks/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/x-bookmarks version")
  end
end
