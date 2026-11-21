class Pgveil < Formula
  desc "Zero-trust PostgreSQL wire-protocol dynamic PII masking & AI-agent SQL firewall proxy"
  homepage "https://github.com/duhanguler/pgveil"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.1/pgveil_0.3.1_darwin_arm64.tar.gz"
      sha256 "46b900491d78de6d71a58d882b447acd809e2147e151f5943c522934dbe8ff6f"
    else
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.1/pgveil_0.3.1_darwin_amd64.tar.gz"
      sha256 "6a734fe9d372c7b3fccf907a90f19ce18631e30b09115d8c8ae497aeaaba13c2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.1/pgveil_0.3.1_linux_amd64.tar.gz"
      sha256 "f742ba562169d236d27f5e4a4a2b417ca512e4719c368a69b252fe8353e708d2"
    end
  end

  def install
    bin.install "pgveil"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pgveil version")
  end
end
