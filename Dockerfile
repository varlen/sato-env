FROM python:3.9

WORKDIR /sato

ENV BASEPATH=/sato
ENV SHERLOCKPATH=/sato/sherlock
ENV EXTRACTPATH=/sato/extract
ENV PYTHONPATH=${PYTHONPATH}:$SHERLOCKPATH:$BASEPATH
ENV TYPENAME=type78
#### Install deps
RUN pip install numpy==1.21.4; pip install pandas==1.3.1; \
    pip install flask; pip install torch==1.9.0; pip install scikit-learn==0.24.2; \
    pip install gensim==3.8.3; pip install nltk==3.6.2

RUN python -c "import nltk; nltk.download('punkt'); nltk.download('stopwords')"

#### Run
EXPOSE 5000
WORKDIR /sato/demo
CMD ["python", "/sato/demo/server.py"]
