# AWARE-RG: Abstraction-Aware Explanation of Resiliency Graphs

AWARE-RG is a planning-based framework for analyzing Cyber-Physical System (CPS) attack-fault paths under security analyst-specific abstractions. It first generates an abstraction lattice from a FULL PDDL model, then uses that lattice to validate or diagnose analyst-provided attack paths.

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
├── models/
│   ├── FULL/
│   │   ├── domain.pddl
│   │   └── problem.pddl
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

## Step 1: Generate the AWARE-RG Lattice

Run the lattice-generation notebook first.

The lattice-generation pipeline:

1. Reads the FULL PDDL model:

```text
models/FULL/domain.pddl
models/FULL/problem.pddl
```

2. Extracts predicates from the FULL domain.

3. Maps predicates to MITRE ATT&CK for ICS concepts.

4. Builds MIT and MOT abstraction chains.

5. Generates filtered PDDL models for each node:

```text
models/MIT0/domain.pddl
models/MIT0/problem.pddl
models/MOT2/domain.pddl
models/MOT2/problem.pddl
```

6. Creates bridge nodes between IT and OT views:

```text
models/MIT3-MOT1/domain.pddl
models/MIT3-MOT1/problem.pddl
models/MOT2-MIT3/domain.pddl
models/MOT2-MIT3/problem.pddl
```

7. Saves the final bridge-node lattice JSON:

```text
lattice_output/eval_lattice_with_bridge_nodes.json
```

This JSON is the main lattice input for AWARE-RG.

## Step 2: Prepare a Query

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

## Step 3: Run AWARE-RG Query Analysis

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

- Run the lattice-generation notebook before the AWARE-RG query-analysis notebook.
- Use `eval_lattice_with_bridge_nodes.json` as the lattice input.
- The stakeholder view must be explicitly declared in each query.
- All lattice nodes must point to valid `domain.pddl` and `problem.pddl` files.
- Problem goals may be temporarily updated during execution and restored afterward.
- The FULL model is the ground-truth reference model.

## Citation

If you use this codebase, please cite:

**AWARE-RG: Abstraction-Aware Explanation of Resiliency Graphs for Cyber-Physical Systems**
