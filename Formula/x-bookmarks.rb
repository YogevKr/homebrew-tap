class XBookmarks < Formula
  include Language::Python::Virtualenv

  desc "Shell-first X bookmarks archive with local search and sync"
  homepage "https://github.com/YogevKr/x-bookmarks"
  url "https://github.com/YogevKr/x-bookmarks/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "b47177d03ac0902c3ec6dfd4468fc79b1e4f3b6611faa6c584dd90b4480b92a1"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/x-bookmarks version")
  end
end
