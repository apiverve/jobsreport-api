from setuptools import setup, find_packages

setup(
    name='apiverve_jobsreport',
    version='1.1.14',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Jobs Report provides monthly US employment data including unemployment rate, total employment, labor force participation, and employment by industry sector. The same data released in the monthly BLS jobs report.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/jobsreport?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
