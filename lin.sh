if [ -z "$disk1" ]
then
      echo ""
else
      wget --no-check-certificate -O disk1.dsk $disk1
fi

if [ -z "$disk2" ]
then
	echo ""
else
      wget --no-check-certificate -O disk2.dsk $disk2
fi

if [[ -z "$disk1" ] || [ -z "$disk2" ]]
then	
	echo "not both"
else
	echo "Starting with 2 disks"
	linapple -1 disk1.dsk -2 disk2.dsk -b
	exit 0
fi

if [ -z "$disk1" ]
then
	echo ""
else
	echo "Starting with 1 disk"
	linapple -1 disk1.dsk -b
	exit 0 
fi

linapple -b


