# DES ASIC RTL-to-GDSII

ASIC implementation of a DES encryption core from RTL through synthesis, physical design, static timing analysis, and final layout using the ASAP7 predictive 7 nm technology library.

The DES RTL used in this project is based on the open-source DES/Triple DES IP core from OpenCores, maintained by Rudolf Usselmann. The original OpenCores project provides the DES/Triple-DES Verilog IP. This repository focuses on taking the RTL through a complete ASIC implementation flow.

## Project Overview

The implementation flow covers:

```text
OpenCores DES RTL
        ↓
RTL Synthesis
        ↓
Gate-Level Netlist
        ↓
Floorplanning
        ↓
Power Planning
        ↓
Placement
        ↓
Clock Tree Synthesis
        ↓
Routing
        ↓
Static Timing Analysis
        ↓
Physical Design Reports
```

The design was implemented with the ASAP7 standard-cell libraries using Cadence Genus and Innovus, followed by timing analysis using Synopsys PrimeTime.

## Original RTL

Source:

OpenCores DES/Triple DES IP Cores  
https://opencores.org/projects/des

Original project:

- Project: DES/Triple DES IP Cores
- Maintainer: Rudolf Usselmann
- Language: Verilog
- Category: Crypto core
- OpenCores project created: 2001
- OpenCores project updated: 2009

OpenCores describes the original design as a simple DES/Triple-DES core designed for fast and small implementations. The original project also provides DES test benches and test vectors.

This repository does not claim authorship of the original DES algorithm implementation.

## What This Repository Adds

The focus of this repository is the ASIC implementation rather than development of the DES algorithm itself.

The work includes:

- RTL synthesis
- Timing constraint setup
- ASAP7 standard-cell mapping
- Floorplanning
- Power distribution planning
- Standard-cell placement
- Clock Tree Synthesis
- Global and detailed routing
- Post-route timing analysis
- Area and utilization analysis
- Physical-design reporting

## Technology

| Parameter | Value |
|---|---|
| Technology library | ASAP7 |
| Standard-cell library | ASAP7 75-track |
| Process configuration | 7 nm |
| Top-level design | `des` |
| Hard macros | 0 |
| Standard-cell instances | 42,845 |
| Signal nets | 16,798 |
| Routing layers used | M1-M6 |
| Clock | `clk` |

The ASAP7 PDK is a predictive academic technology model. The reported dimensions and timing results should therefore not be interpreted as measurements from a fabricated 7 nm commercial process.

## Tools

| Tool | Purpose |
|---|---|
| Cadence Genus | RTL synthesis |
| Cadence Innovus | Physical implementation |
| Synopsys PrimeTime | Static timing analysis |
| ASAP7 | Technology and standard-cell library |

## ASIC Flow

### 1. RTL

The design starts from the OpenCores DES Verilog implementation.

The top-level module used for implementation is:

```text
des
```

The design contains the DES datapath and associated key and control logic from the original OpenCores implementation.

### 2. Logic Synthesis

Cadence Genus was used to synthesize the RTL against the ASAP7 standard-cell libraries.

The synthesis flow produces:

- Gate-level Verilog netlist
- Timing constraints
- Standard-cell mapping
- Synthesis reports

The resulting gate-level netlist was subsequently imported into Innovus.

### 3. Floorplanning

The synthesized design was initialized in Cadence Innovus using the ASAP7 technology and standard-cell LEF files.

The implementation contains:

- 0 hard macros
- 42,845 standard-cell instances
- 16,798 signal nets
- 1 clock

The reported core area is:

```text
2624.4 µm²
```

The final physical database reports:

```text
Core density excluding physical cells: 61.839%
```

### 4. Power Planning

VDD and VSS power networks were created during physical implementation.

Power routing was performed across the available routing layers used by the implementation.

### 5. Placement

Standard cells were placed within the core region.

Placement optimization considered:

- Timing
- Cell density
- Routing congestion
- Electrical design-rule constraints

The implementation report shows zero routing overflow in the reported final timing/optimization stage.

### 6. Clock Tree Synthesis

Clock Tree Synthesis was performed for the `clk` clock.

Clock cells were inserted and optimized to distribute the clock to sequential elements.

The final design contains approximately 1,984 reported data flip-flop cells before accounting for other sequential and physical cells.

### 7. Routing

Global and detailed routing were performed in Innovus.

The final design report contains approximately:

```text
41.645 mm total routed wire length
```

or approximately:

```text
41,644.63 µm
```

The routing report covers M2 through M6 for the reported signal wiring.

### 8. Static Timing Analysis

Static timing was analyzed during physical implementation and separately using PrimeTime.

The Innovus implementation used a 0.5 ns clock period for its reported timing analysis.

Final reported setup timing:

| Metric | Result |
|---|---:|
| Clock period | 0.500 ns |
| WNS | +0.185 ns |
| TNS | 0.000 ns |
| Violating setup paths | 0 |

Final reported hold timing:

| Metric | Result |
|---|---:|
| WNS | +0.092 ns |
| TNS | 0.000 ns |
| Violating hold paths | 0 |

These values correspond to the Innovus timing reports in the implementation log.

PrimeTime was also used for independent static timing analysis. The supplied PrimeTime report uses a 1000 ps timing period and reports a worst setup slack of approximately 117.2 ps for the paths shown in the report.

The PrimeTime and Innovus results should therefore not be directly compared as identical operating points because the supplied runs use different clock-period constraints.

## Physical Design Summary

| Metric | Reported result |
|---|---:|
| Technology | ASAP7 |
| Top module | `des` |
| Hard macros | 0 |
| Standard cells | 42,845 |
| Signal nets | 16,798 |
| Core area | 2,624.4 µm² |
| Core density excluding physical cells | 61.839% |
| Total routed wire length | 41,644.63 µm |
| Innovus setup WNS | +0.185 ns |
| Innovus setup TNS | 0.000 ns |
| Innovus hold WNS | +0.092 ns |
| Innovus hold TNS | 0.000 ns |
| Setup violating paths | 0 |
| Hold violating paths | 0 |

The exact directory contents depend on the files included in the repository.

## Key Implementation Metrics

The final Innovus implementation contains:

- 42,845 standard-cell instances
- 16,798 signal nets
- 2,624.4 µm² reported core area
- 61.839% density after excluding physical-only cells
- 41,644.63 µm total routed wire length
- 0 setup violating paths
- 0 hold violating paths
- 0 ns setup TNS
- 0 ns hold TNS

## Attribution

### DES RTL

The DES RTL used as the starting point for this project is derived from the OpenCores DES/Triple DES IP Core:

https://opencores.org/projects/des

Original project maintained by Rudolf Usselmann.

OpenCores identifies the project as a Verilog DES/Triple-DES crypto core and provides the associated source and test infrastructure.

### ASIC Implementation

The synthesis, physical implementation, timing analysis, reporting, and repository organization in this project were performed as part of this work.

The original DES RTL should therefore be attributed to its OpenCores source rather than presented as original RTL development.

## References

- OpenCores DES/Triple DES IP Cores: https://opencores.org/projects/des

## Disclaimer

This repository is intended for educational and research purposes.

The ASIC implementation uses academic EDA access and the ASAP7 predictive technology model.

The original DES RTL is credited to its OpenCores source.
