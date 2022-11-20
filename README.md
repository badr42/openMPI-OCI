# openMPI-OCI
Terraform script that helps you stand up an Ampere A1 parallel computing machine on OCI

**OpenMPI** is used for parallel algorithm execution allowing for integration of multiple machines into a cluster, same script can be re-used to spin up more machines and connect them together throught the --hosts argument  
 
Start an Ampere A1 server with OpenMPI installed for parallel programming, this also includes several test projects you can test the environment with

## Requirements
OCI account

## Configuration

1. Log into cloud console 
2. run the following 
```
git clone https://github.com/badr42/openMPI-OCI
cd openMPI-OCI
export TF_VAR_tenancy_ocid='<tenancy-ocid>'
export TF_VAR_compartment_ocid='<comparment-ocid>'
export TF_VAR_region='<home-region>'
export TF_VAR_core_count='2'
<optional>
# Select Availability Domain, zero based, if not set it defaults to 0
export TF_VAR_AD_number='0'
```

3. Execute the script generate-keys.sh to generate private key to access the instance
```
sh generate-keys.sh
```


## Build
To build simply execute the next commands. 
```
terraform init
terraform plan
terraform apply
```


**After applying, the service will be ready in about 25 minutes** (it will install OS dependencies, as well as the packages needed to get openMPI to work)

## Post configuration

To test the app ssh to the machine and run one of the test algorithms pre-loaded to the environment 

```
ssh -i server.key ubuntu@<instance-public-ip>
cd ~/Desktop/sharedfolder
mpirun -np 2 ./mpi-prime
```


the result should look like :

```
ubuntu@openmpi:~/Desktop/sharedfolder$ mpirun -np 20 ./mpi-prime
20 November 2022 11:55:34 AM

PRIME_MPI
  C/MPI version

  An MPI example program to count the number of primes.
  The number of processes is 20

         N        Pi          Time

         1         0        0.009797
         2         1        0.000177
         4         2        0.000106
         8         4        0.000057
        16         6        0.000117
        32        11        0.000054
        64        18        0.000055
       128        31        0.000053
       256        54        0.000055
       512        97        0.000054
      1024       172        0.000056
      2048       309        0.000103
      4096       564        0.000338
      8192      1028        0.001200
     16384      1900        0.004490
     32768      3512        0.016233
     65536      6542        0.060947
    131072     12251        0.227687
    262144     23000        0.848808
    524288     43390        3.205449
   1048576     82025       12.120073

PRIME_MPI - Master process:
  Normal end of execution.
```
