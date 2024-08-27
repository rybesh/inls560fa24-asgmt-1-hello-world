PYTHON := ./venv/bin/python
PIP := ./venv/bin/python -m pip
PYTEST := ./venv/bin/pytest
PYTEST_FLAGS := -vv -x -s
REPL := ./venv/bin/ptpython

.PHONY: setup run test repl clean

$(PYTHON):
	python3 -m venv venv

$(PYTEST) $(REPL): | $(PYTHON)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

setup: $(PYTEST) $(REPL)

run: | $(PYTHON)
	$(PYTHON) hello_world.py

test: | $(PYTEST)
	$(PYTEST) $(PYTEST_FLAGS)

repl:
	$(REPL)

clean:
	rm -rf venv
