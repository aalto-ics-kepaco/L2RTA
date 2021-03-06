


# L2-norm random spanning tree approximation

## General information
   - Random spanning tree approximation in L2-norm regularization for multilabel structured output prediction.
   - Please start examining the RSTA codes from MATLAB function run_RSTA.m.
   - To compile the code, please make sure you have `gcc` compiler that supports OMP. 
   - Inference function are implemented with OpenMP library in C, which enables parallel computation for multiple trees.
   - The C function can be compiled with the following command. Note that you might need to change the path of gcc compiler.

		`mex compute_topk_omp.c forward_alg_omp.c backward_alg_omp.c  CFLAGS="\$CFLAGS -fopenmp -std=c99" LDFLAGS="\$LDFLAGS -fopenmp" CC="/usr/bin/gcc"`
		`mex find_worst_violator_new.c CFLAGS="\$CFLAGS -fopenmp -std=c99" LDFLAGS="\$LDFLAGS -fopenmp" CC="/usr/bin/gcc"`
	
   - To run RSTA algorithm, try following command in MATLAB, which will run the algorithm on a test sample of 'ArD15' dataset with 5 random spanning trees and maximum depth of K-best list being 2 

		`run_RSTA('ArD15','tree','5','1','1','2','2')`

   - There are two PYTHON scripts:

		auto_run_RSTA.py	
		auto_profile_RSTA.py
	
   - The python scripts will run/profile Random Spanning Tree Approximation algorithm parallel on interactive cluster.
   - The parallelism is for the purpose of multiple parameters and datasets.
   - The scripts use the help of PYTHON 'thread' and 'queue' package.
   - The framework looks at each combination of parameters as a job and pools all jobs into a job queue.
   - A group of workers (computing nodes) are then activated, each will take and process from the queue the first job.
   - If the job is not completed by the worker, the worker will push the job back to the queue, an other worker sill processe the job later on.
   - A penalty system is implemented to make it difficult for worker to get job if the worker is somehow malfunctioning. 
   - There are thoughts need to be implemented.
      - loss function should be scaled.
   - Detailed description can be found from

		./inference_code/README.md

   - Description of the GitHub repository
      - This repository contains RTA algorithm with improved inference algorithm for update direction finding. The RTA algorithm was originally introduced in Advances in Neural Informatics Processing System NIPS 2014. In each stochastic gradient descent iteration, the new inference algorithm aims to combine multiple updated directions. In other words, the optimal updated direction is given by a convex combination of many suboptimal update directions. Thus, the new inference algorithm avoid computing the best direction from the K-best list which was used in original RTA algorithm. 
   - Website of this project
      - http://hongyusu.github.io/L2RTA/
