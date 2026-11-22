class Pgveil < Formula
  desc "Zero-trust PostgreSQL wire-protocol PII masking, Virtual RLS & AI-agent SQL firewall proxy"
  homepage "https://github.com/duhanguler/pgveil"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.5.1/pgveil_0.5.1_darwin_arm64.tar.gz"
      sha256 "1abfbbdbf7e66a06bb4a628260027af91c2806a24c2a4d83f78fbadc7bd679e"
    else
      url "https://github.com/duhanguler/pgveil/releases/download/v0.5.1/pgveil_0.5.1_darwin_amd64.tar.gz"
      sha256 "eaf437cdc359b170190380400f874b53a8f6f2035142b04c1a327376d1881d01"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.5.1/pgveil_0.5.1_linux_amd64.tar.gz"
      sha256 "a101674e0c98ab4dbfcc51efc037d95139ce66dc24893be06fe22a7fe3025eab"
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
