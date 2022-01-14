#!/usr/bin/env bash

VENVNAME=Psychedelic_KG

python3 -m venv $VENVNAME
source $VENVNAME/bin/activate
pip install --upgrade pip

pip install ipython
pip install jupyter
pip install matplotlib
pip install tqdm
python -m ipykernel install --user --name=$VENVNAME

test -f requirements.txt && pip install -r requirements.txt

deactivate
echo "build $VENVNAME"
© 2021 GitHub, Inc.
Terms
Privacy
