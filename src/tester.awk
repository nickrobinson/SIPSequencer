BEGIN {
	print "msc{"; 
	split(ipAddrs, ip, ",");
	count = 0;
	for( entry in ip) {
	    if(length(ip[entry]) >= 7) {
	        str = "u" count;
                uArr[ip[entry]] = str;
		if(count == 0) 
			printf "\tu%d[label=\"%s\"]", count, ip[entry];
		else
			printf ",u%d[label=\"%s\"]", count, ip[entry];
	        count = count + 1;
	    }
	}
	printf " ;\n";

    }
    {
    	if($4 == "Rx:" || $4 == "Tx:") {
		split($6, src, "=");
		split($7, dst, "=");
		printf "\t%s=>%s [ label = \"",  uArr[src[2]], uArr[dst[2]];
		getline;
		$1=$2=$3="";
		printf "%s\" ] ;\n", $0;
	}
    }
END   { print "}";}

