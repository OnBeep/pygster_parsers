# Makefile for pygster.
#
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/OnBeep/pygster_parsers
#


.DEFAULT_GOAL := develop


develop:
	python setup.py develop

install:
	python setup.py install

uninstall:
	pip uninstall pygster

install_requirements:
	pip install -r requirements.txt --use-mirrors

lint:
	pylint --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" \
		-r n pygster_parsers/*.py tests/*.py || exit 0

flake8:
	flake8 --max-complexity 12 --exit-zero pygster_parsers/*.py tests/*.py

pep8: flake8

nosetests:
	python setup.py nosetests

test: nosetests

clean:
	@rm -rf *.egg* build/* dist/* *.pyc *.pyo cover doctest_pypi.cfg \
	nosetests.xml *.egg output.xml *.log */*.pyc .coverage

publish:
	python setup.py register sdist upload
