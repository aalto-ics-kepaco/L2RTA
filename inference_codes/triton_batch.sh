#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=10000
#SBATCH --time=3-00:00:00
#SBATCH --array=1-5000
#SBATCH -o terminal.out
#SBATCH -p pbatch 

export OMP_PROC_BIND=true
module load matlab
python triton_auto_run_RSTA.py $SLURM_ARRAY_TASK_ID $TMPDIR

