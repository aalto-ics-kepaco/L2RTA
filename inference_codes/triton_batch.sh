#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --time=0-00:00:05 --mem-per-cpu=4000
#SBATCH --array=1-100
#SBATCH -o hello.out
#SBATCH -p play

export OMP_PROC_BIND=true
module load matlab
python triton_auto_run_RSTA.py $SLURM_ARRAY_TASK_ID

