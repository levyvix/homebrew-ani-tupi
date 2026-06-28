class AniTupi < Formula
  desc "Assista anime e leia mangá direto do terminal sem anúncios"
  homepage "https://github.com/levyvix/ani-tupi"
  url "https://github.com/levyvix/ani-tupi/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "29437573a3bdef9f31d042d9ace6ebdda2a7ff96843f3880f536fa5b29cd515e"
  license "GPL-3.0-only"
  head "https://github.com/levyvix/ani-tupi.git", branch: "master"

  depends_on "python@3.12"
  depends_on "mpv"

  def install
    venv = libexec/"venv"
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", "."
    bin.install_symlink venv/"bin/ani-tupi"
    bin.install_symlink venv/"bin/manga-tupi"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ani-tupi --help")
  end
end
