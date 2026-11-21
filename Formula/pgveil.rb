class Pgveil < Formula
  desc "Zero-trust PostgreSQL wire-protocol dynamic PII masking & AI-agent SQL firewall proxy"
  homepage "https://github.com/duhanguler/pgveil"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.0/pgveil_0.3.0_darwin_arm64.tar.gz"
      sha256 "ca618412e5c87366c0fbec7ba3334d886aeddd9e7e9f47a7f1290839616ed0fc"
    else
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.0/pgveil_0.3.0_darwin_amd64.tar.gz"
      sha256 "d2138107dd1fff8980b2715fb2d24cc987762ec79765c7d00e61feb7444322ca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duhanguler/pgveil/releases/download/v0.3.0/pgveil_0.3.0_linux_amd64.tar.gz"
      sha256 "5e941dfc414f124ecf9415bd4eef2dc375ee0de47048b4ffc0a0856b8e697d2c"
    end
  end

  def install
    bin.install "pgveil"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pgveil version")
  end
end
