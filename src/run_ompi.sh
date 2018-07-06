#!/bin/bash

export MPI_HOME=/ivylogin/home/spotluri/MPI/openmpi-1.8.3-cuda-gnu-install
export CUDA_HOME=/usr/local/cuda-6.5

TESTLIST="PingPong PingPing Sendrecv Exchange Reduce_scatter Allgather Allgatherv Gather Gatherv Scatter Scatterv Alltoall Alltoallv Bcast Barrier"
#TESTLIST="PingPong PingPing Sendrecv Exchange Reduce Allreduce Reduce_scatter Allgather Allgatherv Gather Gatherv Scatter Scatterv Alltoall Alltoallv Bcast Barrier"

make clean
make -f make_ompi
sleep 2

${MPI_HOME}/bin/mpirun -hostfile hfile -npernode 2 ./IMB-MPI1 $TESTLIST -cuda 1 
