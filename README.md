# cryptoAPI
A demo API demonstrating how to create a Python-based REST API with FastAPI, Mangum, Amazon Lambda and API Gateway

## setup python environment

Mark directory v1 as "sources Root" in Pycharm

````bash
conda create --name cryptoAPI python=3.8
conda activate cryptoAPI
cd api && pip install -r requirements.txt
cd api && uvicorn main:app --reload
````



