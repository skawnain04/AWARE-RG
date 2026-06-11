# AWARE-RG: Abstraction-Aware Explanation of Resiliency Graphs

AWARE-RG is a planning-based framework for analyzing Cyber-Physical System (CPS) attack-fault paths under stakeholder-specific abstractions. It checks whether a proposed path is valid, diagnoses why it fails, and generates explanations using an abstraction lattice.

## Input from Lattice Generation

Before running AWARE-RG, first run the lattice-generation pipeline. Its final output is the bridge-node lattice JSON:

```text
lattice_output/eval_lattice_with_bridge_nodes.json
```

This file is used as the main lattice input for AWARE-RG. It must contain all node metadata, bridge nodes, edges, and valid paths to each node's `domain.pddl` and `problem.pddl`.

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
│   ├── FULL/
│   ├── MIT0/
│   ├── MIT1/
│   ├── MOT0/
│   ├── MOT1/
│   ├── MIT3-MOT1/
│   └── ...
├── lattice_output/
│   └── eval_lattice_with_bridge_nodes.json
├── Traces/
└── Experiment_Metrics/
```

## Query Format

Each query must declare the stakeholder view as `IT` or `OT`.

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

## Running the Code

Update the main paths:

```python
BASE_DIR = "/content/drive/MyDrive/AWARE_RG/"
query = "query1"

LATTICE_JSON = BASE_DIR + "lattice_output/eval_lattice_with_bridge_nodes.json"
```

Then run all notebook cells sequentially.

## Main Outputs

```text
Traces/stakeholder_and_action_mapping_output_*.json
Traces/mapped_plan_fragments_*.txt
Traces/path_existence_intent_*.json
Traces/goal_predicate_inference_output_*.json
Traces/mea_lattice_search_result_*.json
Traces/mea_lattice_search_report_*.txt
Traces/plan_invalidity_result_*.json
Traces/plan_invalidity_report_*.txt
Traces/invalid_plan_diagnosis_*.json
Traces/llm_valid_path_explanation_*.txt
Traces/llm_invalid_path_explanation_*.txt
```

Metrics are saved in:

```text
Experiment_Metrics/earg_test_metrics.csv
Experiment_Metrics/earg_test_metrics.xlsx
```

## Notes

- Run the lattice-generation code first.
- Use `eval_lattice_with_bridge_nodes.json` as the AWARE-RG lattice input.
- The stakeholder view must be explicitly declared in the query.
- All lattice nodes must point to valid `domain.pddl` and `problem.pddl` files.
- Problem goals may be temporarily updated during execution and restored afterward.

## Citation

If you use this codebase, please cite:

**AWARE-RG: Abstraction-Aware Explanation of Resiliency Graphs for Cyber-Physical Systems**
