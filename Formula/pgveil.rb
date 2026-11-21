class Pgveil < Formula
  desc "Zero-trust PostgreSQL wire-protocol dynamic PII masking & AI-agent SQL firewall proxy"
  homepage "https://github.com/duhanguler/pgveil"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.2/pgveil_0.3.2_darwin_arm64.tar.gz"
      sha256 "c7ca63263f2b9e1430e7b7837e5bf8c24a0bbb5b85e060d09464f6873b9302db"
    else
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.2/pgveil_0.3.2_darwin_amd64.tar.gz"
      sha256 "f03e2c029de40df7b72a26c67e24a9229a748939b89725335cb83e74cfae3b3d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.2/pgveil_0.3.2_linux_amd64.tar.gz"
      sha256 "af572c3a45f43057eff25e1b112108418e70f0bf0511dfc40e468b893979a4b7"
    end
  end

  def install
    bin.install "pgveil"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pgveil version")
  end
end
