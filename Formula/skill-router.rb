class SkillRouter < Formula
  include Language::Python::Virtualenv

  desc "Scoped, cached routing for agent skills"
  homepage "https://github.com/YogevKr/skill-router"
  url "https://github.com/YogevKr/skill-router/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "951482e326e8d537586c9ec68600d9abf120bdb1aec65c7428e0ddcfc5c6de48"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Search and load skills", shell_output("#{bin}/skill-router --help")
  end
end
