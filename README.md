# DES ASIC RTL-to-GDSII

A complete ASIC physical implementation of a DES encryption core, starting from an open-source OpenCores RTL implementation and taking the design through synthesis, floorplanning, placement, clock-tree synthesis, routing, and post-route static timing and power analysis.

The implementation uses the ASAP7 predictive 7 nm technology library with Cadence Genus, Cadence Innovus, and Synopsys PrimeTime.

## Overview

This project demonstrates a complete digital ASIC implementation flow:

```text
OpenCores DES RTL
       │
       ▼
RTL Verification
       │
       ▼
Logic Synthesis
       │
       ▼
Gate-Level Netlist
       │
       ▼
Floorplanning
       │
       ▼
Power Planning
       │
       ▼
Placement
       │
       ▼
Clock Tree Synthesis
       │
       ▼
Routing
       │
       ▼
Post-Route STA
       │
       ▼
Power Analysis
       │
       ▼
Physical Design Reports
```

The main focus of this repository is the ASIC implementation and physical-design flow. The original DES RTL is credited to the OpenCores project.

## Results

### PrimeTime post-route analysis

| Metric | Result |
|---|---:|
| Clock period | 500 ps |
| Target clock frequency | 2.0 GHz |
| Critical path delay | 439.411 ps |
| Worst setup slack | +117.225 ps |
| Total power | 5.368 mW |

The PrimeTime report shows the worst reported setup path with:

```text
Data arrival time : 439.410641 ps
Data required time : 556.635997 ps
Setup slack : +117.225357 ps
```

The reported critical path is therefore within the 500 ps clock constraint for the analyzed PrimeTime run.

### Innovus physical implementation

| Metric | Result |
|---|---:|
| Technology | ASAP7 |
| Design | `des` |
| Standard-cell instances | 42,845 |
| Hard macros | 0 |
| Signal nets | 16,798 |
| Core area | 2,624.400 µm² |
| Standard-cell area | 2,624.400 µm² |
| Standard-cell area excluding physical cells | 1,622.900 µm² |
| Pure gate density excluding physical cells | 61.839% |
| Total routed wire length | 41,644.630 µm |
| Average wire length per net | 2.4791 µm |
| I/O pins | 0 pads |
| Routing layers with signal wiring | M2-M6 |

### Innovus timing

The final Innovus report also shows positive setup and hold slack:

| Metric | Result |
|---|---:|
| Setup WNS | +0.185 ns |
| Setup TNS | 0.000 ns |
| Hold WNS | +0.092 ns |
| Hold TNS | 0.000 ns |

These Innovus values are reported separately from PrimeTime because the timing configurations and analysis environments are not identical.

## Design Source

The starting DES RTL is based on the OpenCores:

**DES/Triple DES IP Cores**

The OpenCores project describes the design as a simple DES/Triple-DES core and credits Rudolf Usselmann as the project maintainer.

The original project includes Verilog RTL, test benches, and DES test vectors.

### Attribution

The DES encryption RTL is not claimed as original work in this repository.

The original OpenCores DES/Triple-DES IP is credited to its respective authors and project maintainers.

This repository focuses on the subsequent ASIC implementation work, including synthesis, physical design, timing analysis, power analysis, and implementation reporting.

Original project:

OpenCores DES/Triple DES IP Cores

https://opencores.org/projects/des

OpenCores source repository:

https://opencores.org/ocsvn/des/des/trunk

## DES Architecture

DES is a symmetric-key block cipher based on a Feistel network.

The original DES algorithm operates on:

- 64-bit data blocks
- 64-bit keys including parity bits
- 16 Feistel rounds
- 32-bit left and right data halves

The OpenCores implementation provides the DES functionality used as the RTL starting point for this project.

The ASIC flow treats the DES core as the design-under-test and focuses on its implementation using standard-cell technology.

## Technology

The physical implementation uses the ASAP7 predictive technology model.

ASAP7 is an academic predictive 7 nm technology platform intended for research and educational ASIC design studies.

It should not be interpreted as silicon measured from a commercial 7 nm manufacturing process.

The implementation uses the ASAP7 75-track standard-cell library.

## EDA Tools

| Tool | Purpose |
|---|---|
| Cadence Genus | RTL synthesis |
| Cadence Innovus | Floorplanning, placement, CTS, routing |
| Synopsys PrimeTime | Static timing and power analysis |
| ASAP7 | Predictive technology and standard-cell library |

## ASIC Implementation Flow

### 1. RTL

The flow starts with the OpenCores DES Verilog implementation.

The top-level design used for physical implementation is:

```text
des
```

The original RTL was synthesized and prepared for implementation against the ASAP7 standard-cell library.

### 2. Logic Synthesis

Cadence Genus was used for RTL synthesis.

The synthesis stage performs:

- RTL elaboration
- Logic optimization
- Technology mapping
- Standard-cell selection
- Timing constraint application
- Gate-level netlist generation

The synthesized netlist was then imported into Cadence Innovus for physical implementation.

### 3. Floorplanning

The synthesized design was initialized in Innovus using the ASAP7 technology files and standard-cell libraries.

The final physical design contains:

```text
Hard macros       : 0
Standard cells    : 42,845
Signal nets       : 16,798
```

The reported core area is:

```text
2624.400 µm²
```

The Innovus database reports the core boundary as approximately:

```text
54 µm × 48.6 µm
```

### 4. Power Planning

The design uses:

```text
VDD
VSS
```

as the primary power and ground nets.

Power structures were generated during the Innovus physical implementation flow using multiple metal layers.

The implementation uses power routing across the reported M1-M6 layers.

### 5. Placement

Standard cells were placed inside the defined core area.

Placement optimization considered:

- Timing
- Cell density
- Wirelength
- Routing feasibility
- Electrical constraints

The final Innovus report contains 42,845 standard-cell instances.

The design includes:

```text
DFFHQNx1_ASAP7_75t_L : 1,984
```

reported sequential cells of this type.

The implementation also contains physical-only cells such as:

- Tap cells
- Filler cells
- Decap cells

These cells contribute to the physical implementation but are excluded from the pure gate-density calculation reported by Innovus.

### 6. Clock Tree Synthesis

Clock Tree Synthesis was performed for the `clk` clock.

Innovus inserted and optimized clock-tree cells to distribute the clock to the sequential elements.

The final design includes clock-buffer and clock-inverter cells from the ASAP7 library.

The PrimeTime timing report analyzes register-to-register paths within the `clk` path group.

### 7. Routing

Global and detailed routing were performed in Innovus.

The final implementation uses signal routing across M2-M6.

Reported wire length:

```text
Total routed wire length : 41,644.630 µm
Average wire length/net  : 2.4791 µm
```

Wire-length distribution:

| Layer | Wire length |
|---|---:|
| M1 | 0.000 µm |
| M2 | 12,698.023 µm |
| M3 | 15,134.115 µm |
| M4 | 8,675.520 µm |
| M5 | 3,721.548 µm |
| M6 | 1,415.424 µm |
| Total | 41,644.630 µm |

### 8. Static Timing Analysis

Synopsys PrimeTime was used for post-route timing analysis.

The analyzed clock period is:

```text
500 ps
```

which corresponds to a:

```text
2.0 GHz
```

clock target.

The worst setup path reported by PrimeTime has:

```text
Data arrival time : 439.411 ps
Data required time: 556.636 ps
Setup slack       : +117.225 ps
```

The reported path therefore meets the 500 ps timing constraint in the analyzed corner and configuration.

The critical path is a register-to-register path:

```text
R7_reg_20_ → R8_reg_8_
```

with a reported data arrival time of approximately:

```text
439.411 ps
```

### 9. Power Analysis

PrimeTime was also used for power analysis.

The reported total power is:

```text
5.368 mW
```

Power breakdown from the PrimeTime report:

| Component | Power |
|---|---:|
| Clock network | 3.103 mW |
| Registers | 0.439 mW |
| Combinational logic | 1.826 mW |
| Total | 5.368 mW |

The report also gives:

```text
Net switching power : 1.818 mW
Cell internal power : 3.537 mW
Cell leakage power  : 0.01268 mW
```

The power result depends on the activity assumptions and timing/library configuration used by the PrimeTime analysis.

## Physical Design Summary

```text
Technology
    ASAP7 predictive 7 nm

Design
    des

Hard macros
    0

Standard-cell instances
    42,845

Signal nets
    16,798

Core area
    2,624.400 µm²

Pure gate density
    61.839%
    excluding physical-only cells

Total routed wire length
    41,644.630 µm

Clock period
    500 ps

Target clock frequency
    2.0 GHz

PrimeTime critical path delay
    439.411 ps

PrimeTime worst setup slack
    +117.225 ps

PrimeTime total power
    5.368 mW
```

## Key Takeaways

This project provides hands-on experience with the transition from digital RTL to a physically implemented ASIC.

The main implementation stages covered are:

- RTL synthesis
- Technology mapping
- Timing constraints
- Floorplanning
- Power planning
- Standard-cell placement
- Clock Tree Synthesis
- Global routing
- Detailed routing
- Post-route static timing analysis
- Power analysis
- Physical-design reporting

The project also demonstrates how physical implementation affects:

- Timing
- Wirelength
- Cell density
- Clock distribution
- Power consumption
- Routing resources

## Important Notes

### About the 2.0 GHz result

The 2.0 GHz figure corresponds to the 500 ps clock constraint used in the reported PrimeTime analysis.

It should not be interpreted as the absolute maximum frequency of the design.

The reported PrimeTime result demonstrates positive setup slack at the 500 ps constraint.

### About the ASAP7 technology

ASAP7 is a predictive academic technology model.

The physical dimensions and timing results are therefore simulation and library-based results, not measurements from fabricated silicon.

### About power

The 5.368 mW figure is the total power reported by PrimeTime under the activity and library assumptions used in the analysis.

Power varies with switching activity, clock frequency, voltage, process corner, temperature, and input stimulus.

### About signoff

This repository reports synthesis, physical implementation, timing, and power results.

A timing-clean result should not be interpreted as complete foundry signoff.

Unless corresponding DRC and LVS reports are included in the repository, this project does not claim full DRC/LVS signoff.

## Attribution and Credits

### OpenCores DES/Triple DES IP Core

The original DES RTL used as the starting point for this project comes from the OpenCores DES/Triple DES IP Core project.

Project maintainer:

Rudolf Usselmann

Project:

DES/Triple DES IP Cores

The OpenCores project provides the original DES/Triple-DES RTL and verification material.

The ASIC synthesis, physical implementation, timing analysis, power analysis, and implementation reporting in this repository are separate work performed on the source RTL.

### ASAP7

The physical implementation uses the ASAP7 predictive technology platform and its associated standard-cell libraries.

### EDA Tools

The implementation was performed using:

- Cadence Genus
- Cadence Innovus
- Synopsys PrimeTime

Commercial EDA tools and proprietary/licensed technology files are not redistributed through this repository.

## References

1. OpenCores, DES/Triple DES IP Cores, Rudolf Usselmann.
2. ASAP7 Predictive 7 nm FinFET PDK and standard-cell library.
3. Cadence Genus documentation.
4. Cadence Innovus documentation.
5. Synopsys PrimeTime documentation.

## Author

Mainak Sil

B.Tech Electronics and Communication Engineering

VIT-AP University

GitHub: MainakSil

## Disclaimer

This repository is intended for educational and research purposes.

The original DES RTL is attributed to the OpenCores project and its respective contributors.

This repository documents the ASIC implementation performed using the stated EDA tools and technology libraries. It does not claim ownership of the original DES IP.
