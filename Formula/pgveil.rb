class Pgveil < Formula
  desc "Zero-trust PostgreSQL wire-protocol PII masking, Virtual RLS & AI-agent SQL firewall proxy"
  homepage "https://github.com/duhanguler/pgveil"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.5.0/pgveil_0.5.0_darwin_arm64.tar.gz"
      sha256 "7933e8fb1943abda3a6ea5362409a8fc8f30e4e89bf2b1727d98839e19373a45"
    else
      url "https://github.com/duhanguler/pgveil/releases/download/v0.5.0/pgveil_0.5.0_darwin_amd64.tar.gz"
      sha256 "c627bca8de051c3ac1ebb8deae0d51dbb179cb1387bc8ae107805e1e589259d3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.5.0/pgveil_0.5.0_linux_amd64.tar.gz"
      sha256 "5f71fcf2390bcc31074f61b22e8e5fb551953e380e28f5d61a8fd686bf7f1f3a"
    end
  end

  def install
    bin.install "pgveil"
  end

  def caveats
    <<~EOS
      Try pgveil live in 3 seconds with zero Docker or external PostgreSQL:
        pgveil demo

      Or scan your own PostgreSQL database and generate a validated pgveil.yaml:
        pgveil init --dsn "postgres://user:pass@localhost:5432/mydb"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pgveil version")
  end
end
