
PYTHON=python
CONDA=conda

all: env

setup: env pip

env:
	${CONDA} env create -f requirements.yml -p env

pip: env
	${PYTHON} -m pip install -r requirements.txt --no-cache-dir

test:
	${PYTHON} -m pytest -v test.py

test-lint:
	@# stop the build if there are Python syntax errors or undefined names
	./env/bin/flake8 *.py --count --select=E9,F63,F7,F82 --show-source --statistics
	@# exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
	./env/bin/flake8 *.py --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics

