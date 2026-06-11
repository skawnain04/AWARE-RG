# AWARE-RG: Abstraction-Aware Explanation of Resiliency Graphs

AWARE-RG is a planning-based framework for analyzing Cyber-Physical System (CPS) attack-fault scenarios under different stakeholder abstractions.

## Overview

Security analysts often reason about CPS attacks using incomplete knowledge. AWARE-RG helps validate whether an expected attack-fault path succeeds or fails and explains the result using stakeholder-aware abstractions.

## Requirements

```bash
pip install transformers accelerate bitsandbytes sentencepiece pandas openpyxl
```

## External Tools

### VAL

```bash
git clone https://github.com/KCL-Planning/VAL.git
cd VAL
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j2
```

### Fast Downward

```bash
git clone https://github.com/aibasel/downward.git
cd downward
python build.py
```

## Project Structure

```text
AWARE_RG/
├── Query/
├── models_test/
├── lattice_output/
├── Traces/
└── Experiment_Metrics/
```

## Query Format

```text
Stakeholder: OT

Query:
Why does this attack path cause flare flameout?

Steps:
1. Exploit CVE-2018-0296 on the Windows Server.
2. Access PLC port 1132/TCP.
3. Exploit CVE-2017-9312 on the PLC.
4. Block the valve.
5. Cause pilot low supply pressure.
6. Cause pilot extinction.
7. Cause flare flameout.
```

## Running the Framework

```python
BASE_DIR = "/content/drive/MyDrive/AWARE_RG/"
query = "query1"
```

Run all notebook cells sequentially.

## Main Outputs

```text
stakeholder_and_action_mapping_output_*.json
mapped_plan_fragments_*.txt
path_existence_intent_*.json
goal_predicate_inference_output_*.json
mea_lattice_search_result_*.json
mea_lattice_search_report_*.txt
plan_invalidity_result_*.json
plan_invalidity_report_*.txt
invalid_plan_diagnosis_*.json
llm_valid_path_explanation_*.txt
llm_invalid_path_explanation_*.txt
```

## Metrics

```text
Experiment_Metrics/earg_test_metrics.csv
Experiment_Metrics/earg_test_metrics.xlsx
```

## Notes

- The stakeholder view must be explicitly declared as `IT` or `OT`.
- Problem goals are temporarily modified during execution and restored afterward.
- All lattice nodes must reference valid PDDL domain and problem files.

## Citation

If you use this codebase, please cite:

AWARE-RG: Abstraction-Aware Explanation of Resiliency Graphs for Cyber-Physical Systems
