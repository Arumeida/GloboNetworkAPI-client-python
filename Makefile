# Makefile for globonetworkapi-client-python

help:
	@echo
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  clean      to clean garbage left by builds and installation"
	@echo "  compile    to compile .py files (just to check for syntax errors)"
	@echo "  test       to execute all tests"
	@echo "  build      to build without installing"
	@echo "  install    to install"
	@echo "  dist       to create egg for distribution"
	@echo "  publish    to publish the package to PyPI"
	@echo

clean:
	@echo "Cleaning..."
	@rm -rf build dist *.egg-info
	@find . \( -name '*.pyc' -o -name '**/*.pyc' -o -name '*~' \) -delete

compile: clean
	@echo "Compiling source code..."
	@python -tt -m compileall .
	@pep8 --format=pylint --statistics networkapiclient setup.py

test: compile
	@make clean
	@echo "Nothing yet"
#	@echo "Starting tests..."
# 	@nosetests -s --verbose --with-coverage --cover-erase --cover-package=networkapiclient tests

install:
	@python setup.py install

build:
	@python setup.py build

dist: clean
	@python setup.py sdist

publish: clean
	@python setup.py sdist upload

