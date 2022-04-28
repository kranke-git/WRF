# kranke - Nov2020 - Compile WRF on afs machines (ND)

# IMPORTANT: DO NOT LOAD NETCDF LIBRARIES
# USE PRIVATE ONES BY SETTING NETCDF ENV VARIABLE

module load mvapich2/2.3.1   # This is for InfiniBand and MPI
module unload R

export NETCDF='/afs/crc/group/EnvStat/build'
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export JASPERINC='/afs/crc/group/EnvStat/build/include'
export JASPERLIB='/afs/crc/group/EnvStat/build/lib'
export LIBTIFF='/afs/crc/group/EnvStat/build/lib'
export GEOTIFF='/afs/crc/group/EnvStat/build/lib'

#./configure
echo 15 | ./configure #Intel (dmpar)
./compile em_real
