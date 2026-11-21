# Homebrew Tap for `pgveil`

Official Homebrew formulas for **[pgveil](https://github.com/duhanguler/pgveil)** — Zero-Trust PostgreSQL Wire-Protocol Dynamic PII Masking & AI-Agent SQL Firewall Proxy.

## Install

```bash
brew install duhanguler/tap/pgveil
```

Or tap first:

```bash
brew tap duhanguler/tap
brew install pgveil
```

## Quick Usage

```bash
# Verify install
pgveil version

# Audit any live PostgreSQL database for exposed PII columns
pgveil discover --dsn "postgres://user:pass@localhost:5432/mydb"

# Run the wire proxy (:6432) & embedded Workbench UI (:8088)
pgveil serve --config pgveil.yaml

# Run the zero-Node.js native MCP stdio server for Claude Desktop / Cursor
pgveil mcp --config pgveil.yaml --profile ai_agent
```

## Upgrade

```bash
brew update && brew upgrade pgveil
```
