# Polaris Data Example Notebooks

This repository contains analysis-first Jupyter notebooks for the current `polaris-data` Python SDK. Together, the six notebooks cover every standardized schema documented by Polaris while remaining runnable against the no-key public catalog windows.

## Quickstart

The project uses `uv` for environment management and installs `polaris-data` with its Pandas and PyArrow support.

```bash
make install
make notebook
```

No `POLARIS_API_KEY` is required. Open datasets use a short window ending at the catalog's latest timestamp. Preview datasets are clamped to the UTC date in `access.public_cutoff_date`, which prevents the notebooks from accidentally requesting authenticated history.

Historical event methods in the current SDK return single-pass iterators by default. The examples consume those iterators inside the client context with explicit row caps, or request `output="dataframe"` when a method supports the columnar path.

## Notebook Overview

### [`notebooks/hyperliquid_btc_trade_analysis.ipynb`](notebooks/hyperliquid_btc_trade_analysis.ipynb)

Uses a short Hyperliquid BTC window to connect one-minute OHLCV bars with typed trades, buy/sell volume, notional, and signed execution flow.

### [`notebooks/hyperliquid_l4_post_trade_analysis.ipynb`](notebooks/hyperliquid_l4_post_trade_analysis.ipynb)

Builds participant-attributed post-trade analytics from raw Hyperliquid BTC events, including buyer/seller wallets, aggressor and passive roles, counterparties, execution cost, and forward midpoint markouts.

### [`notebooks/lighter_aapl_standardized_schema_tour.ipynb`](notebooks/lighter_aapl_standardized_schema_tour.ipynb)

Follows a Lighter AAPL perpetual through mixed events, raw and reconstructed L2 books, BBO, depth and slippage, funding and mark-price coverage, and bucketed volume, VWAP, and volatility.

### [`notebooks/uniswapx_intents_and_rfqs_analysis.ipynb`](notebooks/uniswapx_intents_and_rfqs_analysis.ipynb)

Contrasts canonical UniswapX intent fields with venue-native payloads, measures field and status coverage, correlates lifecycle observations, and analyzes canonical asset-flow activity. RFQ and quote absence is reported explicitly when the selected public sample contains only executable intents.

### [`notebooks/aevo_btc_options_surface_analysis.ipynb`](notebooks/aevo_btc_options_surface_analysis.ipynb)

Reconstructs the latest state of an Aevo BTC option chain, demonstrates exact-contract filtering, and analyzes moneyness, expiries, implied-volatility smiles, Greeks, and open interest.

### [`notebooks/propamm_quote_ladder_analysis.ipynb`](notebooks/propamm_quote_ladder_analysis.ipynb)

Checks all six documented PropAMM sources, selects a comparable directed token pair, preserves decimal precision, and visualizes normalized quote curves and within-source price impact.

## Schema Coverage

| Polaris schema | Notebook |
| --- | --- |
| [Events](https://docs.polaris.supply/schemas/events) | Lighter AAPL schema tour; Hyperliquid L4 post-trade analysis |
| [Trades](https://docs.polaris.supply/schemas/trades) | Hyperliquid BTC trade analysis |
| [Intents and RFQs](https://docs.polaris.supply/schemas/intents-and-rfqs) | UniswapX intents and RFQs |
| [Option tickers](https://docs.polaris.supply/schemas/option-tickers) | Aevo BTC options surface |
| [L2 snapshots and updates](https://docs.polaris.supply/schemas/l2-snapshots) | Lighter AAPL schema tour |
| [BBO](https://docs.polaris.supply/schemas/bbo) | Lighter AAPL schema tour |
| [Depth metrics](https://docs.polaris.supply/schemas/depth-metrics) | Lighter AAPL schema tour |
| [Funding rates](https://docs.polaris.supply/schemas/funding-rates) | Lighter AAPL schema tour |
| [Mark prices](https://docs.polaris.supply/schemas/mark-prices) | Lighter AAPL schema tour |
| [OHLCV](https://docs.polaris.supply/schemas/ohlcv) | Hyperliquid BTC trade analysis |
| [Volume](https://docs.polaris.supply/schemas/volume) | Lighter AAPL schema tour |
| [VWAP](https://docs.polaris.supply/schemas/vwap) | Lighter AAPL schema tour |
| [Volatility](https://docs.polaris.supply/schemas/volatility) | Lighter AAPL schema tour |
| [PropAMM quote ladders](https://docs.polaris.supply/schemas/propamm-quote-ladders) | PropAMM quote ladder analysis |

## Repository Layout

```text
.
├── notebooks/
│   ├── aevo_btc_options_surface_analysis.ipynb
│   ├── hyperliquid_btc_trade_analysis.ipynb
│   ├── hyperliquid_l4_post_trade_analysis.ipynb
│   ├── lighter_aapl_standardized_schema_tour.ipynb
│   ├── propamm_quote_ladder_analysis.ipynb
│   └── uniswapx_intents_and_rfqs_analysis.ipynb
├── Makefile
├── pyproject.toml
└── uv.lock
```

Committed notebooks retain their latest successful execution outputs and embedded charts so they can be reviewed without a local Jupyter environment. Re-running them will refresh row counts and charts as Polaris catalog coverage advances.
