# Cadence VLSI Projects

This repository documents a nine-lab VLSI design sequence completed in Cadence, progressing from transistor-level standard-cell design through a full 8-bit pipelined adder layout, simulation, and optimization workflow.

Each lab folder contains the original report in PDF/DOCX form, with supporting screenshots, waveform captures, timing reports, layout images, netlists, or implementation artifacts where available.

## Project Scope

The central design path is an 8-bit pipelined adder developed from first principles:

- Created schematics, symbols, and testbenches for arithmetic and sequential building blocks.
- Designed CMOS layouts for inverter, NAND2, and XOR2 primitive cells.
- Characterized cells using Cadence Spectre simulation.
- Built and simulated 1-bit, 4-bit, and 8-bit adder implementations.
- Designed and simulated a D flip-flop for pipelined datapath storage.
- Evaluated delay, power, sizing, and layout tradeoffs.
- Practiced ASIC place-and-route concepts using a cruise-control digital design.
- Applied logical effort to analyze power, die area, and performance tradeoffs.

## Repository Contents

| Lab | Topic | Overview |
| --- | --- | --- |
| 1 | 8-bit adder and component schematics | Full adder, 4-bit adder, register, 8-bit pipelined adder schematics, symbols, testbenches, and simulation captures |
| 2 | Gate silicon layouts | CMOS layouts for inverter, NAND2, and XOR2 primitive cells |
| 3 | Cell characterization | Spectre simulation and characterization of inverter, NAND2, and XOR2 behavior |
| 4 | 1-bit adder layout and simulation | Gate-level optimization screenshots, waveform captures, delay measurements, and power analysis |
| 5 | 4-bit adder layout and simulation | Hierarchical arithmetic layout and simulation report |
| 6 | D flip-flop layout and simulation | Sequential-cell design for pipelined datapath storage |
| 7 | Cruise-control ASIC place and route | Verilog netlist, area reports, constraint reports, timing-path reports, hold-time violation analysis, standard-cell count, wirelength/via summaries, and die layout capture |
| 8 | 8-bit adder layout, simulation, and optimization | Final larger-scale adder layout and optimization report |
| 9 | Logical-effort optimization | 4-bit adder sizing and power-vs-area tradeoff analysis with waveform and power screenshots |

## Skills Demonstrated

- Cadence Virtuoso schematic capture and custom layout
- CMOS logic-gate implementation at transistor and layout level
- Hierarchical digital design from primitive cells to multi-bit arithmetic blocks
- Cadence Spectre simulation for functional verification, delay measurement, and power analysis
- Layout-aware reasoning around area, routing, sizing, and physical implementation effects
- Timing-analysis concepts including critical paths, max/min paths, and hold-time violations
- ASIC implementation concepts including constraints, standard-cell placement, routing, wirelength, vias, and die layout review
- Engineering documentation through formal reports and supporting implementation evidence

## Review Guide

For a quick technical review, start with:

1. `1 - 8-bit Adder & Components Schematics/` for the top-level design intent and early simulation evidence.
2. `4 - 1-bit Adder, Silicon Layout & Simulation/` for detailed waveform, delay, power, and optimization captures.
3. `7 - Cruise Control ASIC Design, Placing & Routing Die Layout/` for a separate ASIC implementation project, including artifacts for timing, constraints, area, and layout.
4. `8 - 8-bit Adder, Silicon Layout, Simulation, & Optimization/` for the final adder-focused implementation report.
5. `9 - 4-bit Adder, Optimization using Logical Effort (Power vs. Die Area Tradeoff)/` for design tradeoff analysis.

## Notes

This is an academic project archive rather than a production tapeout. Its value is in the documented design process: schematic capture, custom layout, simulation, characterization, timing and power analysis, physical-design exposure, and clear communication of engineering results.
