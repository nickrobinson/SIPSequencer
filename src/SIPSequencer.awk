BEGIN { }
    {
        if($4 == "Tx:" || $4 == "Rx:") {
	    split($6, a, "=");
	    if(interfaces[a[2]] != 1) {
	        interfaces[a[2]] = 1;
	        printf "%s,",  a[2];
	    }
	    split($7, b, "=");
	    if(interfaces[b[2]] != 1) {
	        interfaces[b[2]] = 1;
	        printf "%s,", b[2];
	    }
        }
    }
END   {  }
