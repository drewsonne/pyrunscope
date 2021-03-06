install: clean build
	pip install dist/pyrunscope*.whl

build:
	python setup.py sdist bdist_wheel

release-test: clean build
	twine upload -r pypitest dist/pyrunscope-*

release: clean build
	twine upload -r pypi dist/pyrunscope-*

test: clean
	tox

test-server: clean
	devpi test route-registry

clean:
	rm -rf dist build *.egg-info MANIFEST .tox .eggs

doc:
	@echo 'building documentation'
	pip install sphinx sphinx_rtd_theme
	pip install --editable .
	cd docs/ && $(MAKE) -f Makefile clean html
	cd docs/build/html && zip -r ../pyrunscope.zip *

doc-pdf:
	@echo 'building documentation as latexpdf'
	pip install sphinx
	pip install --editable .
	cd docs/ && $(MAKE) -f Makefile clean latexpdf
	mkdir -p docs/build/pdf/
	mv docs/build/latex/*.pdf docs/build/pdf/
