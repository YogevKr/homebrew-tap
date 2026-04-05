class XBookmarks < Formula
  include Language::Python::Virtualenv

  desc "Shell-first X bookmarks archive with local search and sync"
  homepage "https://github.com/YogevKr/x-bookmarks"
  url "https://github.com/YogevKr/x-bookmarks/releases/download/v0.1.5/x_bookmarks-0.1.5.tar.gz"
  sha256 "2415e1750ffd51232df03213e1c9c87e940f7774ce9b83f2ae0ccb46004725aa"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/x-bookmarks version")
  end
end
