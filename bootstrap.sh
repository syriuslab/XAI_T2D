#!/usr/bin/env bash
set -e

echo "Creating project structure..."

mkdir -p notebooks paper figures \
         src/xai_t2d/{utils,data,modeling,explainability} \
         scripts data/{raw/{nhanes,sparcs},processed} \
         models reports tests

touch src/xai_t2d/__init__.py
touch src/xai_t2d/utils/__init__.py
touch src/xai_t2d/data/__init__.py
touch src/xai_t2d/modeling/__init__.py
touch src/xai_t2d/explainability/__init__.py

cat << 'EOF' > .gitignore
__pycache__/
*.pyc
.ipynb_checkpoints/
.venv/
venv/
.env

data/raw/
data/processed/
models/
reports/

*.joblib
*.pkl
*.csv
*.parquet
*.feather
*.h5
EOF

cat << 'EOF' > requirements.txt
numpy
pandas
scikit-learn
matplotlib
shap
joblib
pyyaml
tqdm
EOF

cat << 'EOF' > pyproject.toml
[build-system]
requires = ["setuptools>=68", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "xai-t2d"
version = "0.1.0"
description = "Reproducible XAI pipeline for T2D modelling."
requires-python = ">=3.10"

[tool.setuptools]
package-dir = {"" = "src"}

[tool.setuptools.packages.find]
where = ["src"]
EOF

cat << 'EOF' > README.md
# XAI_T2D

Reproducible ML + XAI pipeline for T2D-related modelling.

## Structure
- notebooks/: exploratory work
- src/xai_t2d/: reusable library code
- scripts/: reproducible entrypoints
- figures/: paper figures
- paper/: manuscript drafts

## Run
python scripts/run_pipeline.py
EOF

cat << 'EOF' > scripts/run_pipeline.py
import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--stage", default="all")
    args = parser.parse_args()
    print("Pipeline stub, stage:", args.stage)

if __name__ == "__main__":
    main()
EOF

echo "Bootstrap completed."

