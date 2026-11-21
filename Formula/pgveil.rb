class Pgveil < Formula
  desc "Zero-trust PostgreSQL wire-protocol PII masking, Virtual RLS & AI-agent SQL firewall proxy"
  homepage "https://github.com/duhanguler/pgveil"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.4.0/pgveil_0.4.0_darwin_arm64.tar.gz"
      sha256 "2ee4f535f303c1269d284290de0ea8f27d2fb976aacdbaa75a0425ad1fdb0262"
    else
      url "https://github.com/duhanguler/pgveil/releases/download/v0.4.0/pgveil_0.4.0_darwin_amd64.tar.gz"
      sha256 "79168f8a8534553efc57dd04ef1a428b7641423023fb2b1df2df19e16de021df"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.4.0/pgveil_0.4.0_linux_amd64.tar.gz"
      sha256 "505caf7a43d233482866e85fec73505f3c2f3b945ff78ae7e3cdf7bedb30a257"
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
