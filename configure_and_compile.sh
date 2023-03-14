# kranke - Nov2020 - Compile WRF on afs machines (ND)

# IMPORTANT: DO NOT LOAD NETCDF LIBRARIES
# USE PRIVATE ONES BY SETTING NETCDF ENV VARIABLE

module load intel
module load mvapich2/2.3.1   # This is for InfiniBand and MPI; should load intel too
module unload R

EXENAME='REAL_WRF_WITH_TENDENCIES'

export NETCDF='/afs/crc/group/EnvStat/build'
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export JASPERINC='/afs/crc/group/EnvStat/build/include'
export JASPERLIB='/afs/crc/group/EnvStat/build/lib'
export LIBTIFF='/afs/crc/group/EnvStat/build/lib'
export GEOTIFF='/afs/crc/group/EnvStat/build/lib'

#./configure
 echo 15 | ./configure #Intel (dmpar) - MPI
# echo 14 | ./configure #Intel (smpar)   - openmp
#echo 13 | ./configure   #Intel (serial)
./compile em_real
#./compile em_hill2d_x

mkdir                 main/executables/${EXENAME}
#cp -p main/ideal.exe  main/executables/${EXENAME}
cp -p main/real.exe   main/executables/${EXENAME}
cp -p main/wrf.exe    main/executables/${EXENAME}