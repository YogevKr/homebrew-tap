class XBookmarks < Formula
  include Language::Python::Virtualenv

  desc "Shell-first X bookmarks archive with local search and sync"
  homepage "https://github.com/YogevKr/x-bookmarks"
  url "https://github.com/YogevKr/x-bookmarks/releases/download/v0.1.4/x_bookmarks-0.1.4.tar.gz"
  sha256 "abf55acfc68370cb908e3c386c7b57ac64dd12febc08d633f7d6947514a252f7"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/x-bookmarks version")
  end
end
