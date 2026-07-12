# Polaris Data Example Notebooks

This workspace packages a Jupyter notebook that demonstrates practical `polaris-data` usage against live Polaris market data.

The examples are meant to show a few core patterns clearly:

- discovering markets from the Polaris catalog
- fetching bounded OHLCV windows
- fetching raw trade streams
- turning API responses into Pandas analysis frames
- building quick visual checks with Matplotlib

## Notebook Overview

### [`notebooks/hyperliquid_btc_trade_analysis.ipynb`](notebooks/hyperliquid_btc_trade_analysis.ipynb)

A compact single-market walkthrough using Hyperliquid BTC data. It shows the most direct end-to-end `polaris-data` flow:

- discover the market with `PolarisClient.catalog(...)`
- fetch 1-minute OHLCV bars with `PolarisClient.ohlcv(...)`
- fetch the matching raw trades with `PolarisClient.trades(...)`
- summarize buy and sell flow
- visualize price alongside signed trade pressure

This is the best starting point if someone wants to understand the package API shape quickly.

## Repo Layout

```text
.
├── notebooks/
│   └── hyperliquid_btc_trade_analysis.ipynb
├── Makefile
├── pyproject.toml
└── uv.lock
```

## Quickstart

This repo uses `uv` for environment management.

```bash
make install
make notebook
```

Then open the notebooks from the JupyterLab file browser.

## Notes

- The notebooks intentionally use explicit bounded time windows so they stay fast to rerun.
- Outputs have been cleared so the examples are portable and do not carry stale environment-specific artifacts.
- If you want to extend the examples, the easiest next step is to widen the ticker basket or swap in different `source` and `market` combinations.
