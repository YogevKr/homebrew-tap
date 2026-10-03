class SkillRouter < Formula
  include Language::Python::Virtualenv

  desc "Scoped, cached routing for agent skills"
  homepage "https://github.com/YogevKr/skill-router"
  url "https://github.com/YogevKr/skill-router/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "ee28bb8e69ea94e2ec1e7633ac774b65452b9594ab642ab224e399e05c9858a2"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Search and load skills", shell_output("#{bin}/skill-router --help")
  end
end
