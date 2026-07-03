class AniTupi < Formula
  desc "Assista anime e leia mangá direto do terminal sem anúncios"
  homepage "https://github.com/levyvix/ani-tupi"
  url "https://github.com/levyvix/ani-tupi/archive/refs/tags/v2.3.5.tar.gz"
  sha256 "0e4dd4015e86d4f07f7532bd7882110a109f3909bbf26f7e8e839f9b6a191703"
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
