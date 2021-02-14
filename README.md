# python-defaults

### Install dependency

#### With virtualenv

```bash
python -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/pip install -r requirements-dev.txt
```

#### With conda

```bash
conda install --yes --file requirements.txt
```
### Install pre-commit

```bash
pre-commit install
```