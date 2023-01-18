#!/bin/bash -l
#SBATCH --job-name=ML-Constructive
#SBATCH --nodes=1
#SBATCH --output=ml-constr-%j.out
#SBATCH --error=ml-constr-%j.err
#SBATCH -J MLConst_job
#SBATCH --time=12:00:00
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu
#SBATCH --mem=12020

echo Starting Job ML-Constructive
module load python/3.9.0
source ~/venv/bin/activate

export PYTHONPATH=~/mthesis/ML-Constructive:~/mthesis/ML-Constructive/pyconcorde
cd ~/mthesis/ML-Constructive/
pip3 install -r requirements.txt
cd ./pyconcorde/
pip3 install -e .
cd ~/mthesis/ML-Constructive/version1
python3 cli.py --operation train

echo Finished
