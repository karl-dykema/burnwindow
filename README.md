# 🔥 BurnWindow
**Prescribed Fire Decision Dashboard** · v1.0.2

BurnWindow is an open-source, browser-based go/no-go decision support tool for prescribed fire managers. It integrates real-time weather forecasts, the Canadian Fire Weather Index (FWI) system, CFFDRS Fire Behavior Prediction (FBP), drought indices, air quality, and nearby active fire detection into a single field-ready dashboard — with no server, no login, and no installation required.

> ⚠ **Disclaimer:** BurnWindow is experimental decision-support software. It does not replace a certified burn plan, NWS spot weather forecast, trained burn boss judgment, or compliance with applicable laws and permits. Always follow your written burn plan and maintain adequate holding resources.

---

## Features

- **Multi-unit management** — track multiple burn units with name, coordinates, acreage, and last burn date
- **Per-unit burn prescriptions** — RH, wind speed/direction, temperature, precip probability, gust limits, FWI component maxima
- **Hourly 24-cell burn window** — in / marginal / out status for every hour of the day
- **Canadian FWI System** — FFMC, DMC, DC, ISI, BUI, FWI computed from a 60-day historical weather chain (Van Wagner 1987); FWI chain uses daily minimum RH to better approximate noon conditions
- **CFFDRS FBP System** — fuel-type-based fire behavior prediction: Rate of Spread (m/min), Head Fire Intensity (kW/m), Crown Fraction Burned, fire type (surface / intermittent / active crown)
- **KBDI** — Keetch-Byram Drought Index stepped daily from forecast precipitation and temperature
- **Dead fuel moisture (NFDRS)** — 1-hr, 10-hr, 100-hr equilibrium moisture content
- **Ventilation Index** — boundary layer height × transport wind
- **AQI** — Air quality via AirNow API (requires free key)
- **Nearby active fires** — NIFC incident detection with distance and acreage; wildfires and nearby prescribed burns (RX) shown separately; each incident links directly to its location in [Watch Duty](https://app.watchduty.org)
- **Station observations** — current weather from the nearest station, fetched in priority order: (1) Synoptic Data RAWS (free token optional — provides actual fire-weather stations); (2) NWS weather.gov ASOS airport observations (no key required, automatic fallback); (3) Open-Meteo forecast model as last resort. Observations outside the 10 AM–4 PM window revert to model values to maintain FWI accuracy.
- **5-day forecast** — clickable forecast strip updates all FWI and FBP outputs for each forecast day
- **5-day all-units window** — collapsible panel showing simultaneous prescription windows across all units for the full week; day-selector strip with colored status dots and hour counts; click any day to view hourly stacked bars and the intersection row
- **Go/No-Go modal** — structured decision checklist with burn log
- **CSV import/export** — bulk unit management
- **State resource links** — quick access to state forestry, DNR, and fire permitting contacts
- **Field view** — mobile-optimized layout for use on-site
- **Dark/daylight themes** — readable in full sun or at night
- **Print report** — formatted single-page output for documentation

---

## Get Your API Keys (5 minutes)

BurnWindow works out of the box with no keys. Without any setup, it automatically uses NWS weather.gov airport observations for current conditions. Two free optional keys unlock better data.

**1. Synoptic Data — fire-weather RAWS station observations (optional, recommended)**
1. Go to [developers.synopticdata.com/signup](https://developers.synopticdata.com/signup) → **Sign Up** (free)
2. After confirming your email, go to your account → **API Tokens** → copy your Public Token
3. In BurnWindow, open the **🛰 Synoptic Data Token** panel at the bottom of the page and paste your token

Without a token, BurnWindow falls back to the nearest airport (ASOS) via NWS weather.gov — this works fine for most users. A Synoptic token upgrades to actual fire-weather RAWS stations, which report conditions more relevant to prescribed burn decision-making (forest/rangeland sites rather than airports).

**2. AirNow — air quality index (AQI)**
1. Go to [docs.airnowapi.org](https://docs.airnowapi.org) → **Register**
2. Check your email for your API key (arrives immediately)
3. In BurnWindow, open the **AQI Settings** panel and paste your key

This adds current AQI to each unit card — important for smoke management and public health compliance on burn days.

---

## Quick Start

1. Download `burnwindow.html`
2. Open it in any modern browser (Chrome, Firefox, Safari, Edge)
3. Click **+ Add Unit** to add your first burn unit
4. Enter coordinates (or address — it geocodes automatically), acreage, and prescription parameters
5. The dashboard fetches weather and computes FWI/FBP automatically

No build step. No server. No dependencies to install. All state is stored in `localStorage`.

---

## Supported Fuel Types (CFFDRS FBP System)

| Code | Type |
|---|---|
| C-1 through C-7 | Conifer (spruce-lichen woodland → ponderosa pine/Douglas fir) |
| D-1, D-2 | Deciduous (leafless / green aspen) |
| M-1, M-2 | Boreal mixedwood (leafless / green) |
| M-3, M-4 | Dead balsam fir mixedwood |
| S-1, S-2, S-3 | Slash (jack pine / white spruce / coastal) |
| O-1a, O-1b | Grass (matted / standing) |

Set the fuel type per unit in the unit editor. Optionally add slope (%) and grass curing (%) for more accurate spread predictions.

---

## Fire Science References

- Van Wagner, C.E. (1987). *Development and structure of the Canadian Forest Fire Weather Index System.* Forestry Technical Report 35. Canadian Forestry Service, Ottawa.
- Forestry Canada Fire Danger Group (1992). *Development and structure of the Canadian Forest Fire Behavior Prediction System.* Information Report ST-X-3. Forestry Canada, Ottawa.
- Keetch, J.J. & Byram, G.M. (1968). *A Drought Index for Forest Fire Control.* Research Paper SE-38. USDA Forest Service.
- Taylor, S.W., Pike, R.G., & Alexander, M.E. (1997). *Field Guide to the Canadian Forest Fire Behaviour Prediction (FBP) System.* Special Report 11. Canadian Forest Service.

---

## Data Sources

| Data | Provider | License |
|---|---|---|
| Weather forecast + archive | [Open-Meteo](https://open-meteo.com) | Free non-commercial / paid commercial |
| Station obs (airport ASOS) | [NWS weather.gov](https://www.weather.gov) | Public domain, no key required |
| Station obs (fire-weather RAWS) | [Synoptic Data](https://synopticdata.com) | Free tier / paid commercial |
| Air quality (AQI) | [AirNow / EPA](https://www.airnow.gov) | Public (non-commercial) |
| Active fire incidents | [NIFC](https://www.nifc.gov) | Public domain |
| Weather alerts | [NWS / weather.gov](https://www.weather.gov) | Public domain |
| Maps | [Leaflet](https://leafletjs.com) + OpenStreetMap | BSD / ODbL |

---

## Privacy & Anonymous Usage Stats

BurnWindow collects anonymous usage data to help improve the app. No personal information, burn unit data, or location coordinates are ever transmitted.

| Service | Purpose | Data collected |
|---|---|---|
| [GoatCounter](https://www.goatcounter.com) | Usage counts | Page hit, approximate country (from IP), browser, OS — no cookies, no cross-site tracking |
| [Sentry](https://sentry.io) | Error reporting | JavaScript error message and stack trace, browser, OS — no user content |

### Opting out

To disable all tracking, open `burnwindow.html` in a text editor and remove these two lines from the `<head>`:

```html
<script>window.goatcounter = ...</script>
<script async src="https://gc.zgo.at/count.js" ...></script>
```

And clear the `SENTRY_DSN` value in the `ERROR TRACKING` section near the bottom of the `<script>` block.

---

## Contributing

Pull requests are welcome. This is a single-file app — all HTML, CSS, and JS lives in `burnwindow.html`. Open an issue to discuss significant changes before submitting a PR.

---

## License

BurnWindow is free software, released under the **GNU General Public License v3.0** — see [LICENSE](LICENSE).

You are free to use, study, modify, and distribute BurnWindow. Any derivative work must also be released under the GPL v3 and remain open source. BurnWindow may not be used as the basis for proprietary or closed-source software.
