BEGIN {foundMatch = 0; containsId = 0; lineCounter = 0;}
    {
        if($4 == "Tx:" || $4 == "Rx:") {
            lineCounter = 0;
            delete lineArray;
        }
 
        if($2 == "SIP.STACK" && ($4 != "Tx:" && $4 != "Rx:")) {
            containsId = index($0, callID)
            if(containsId > 0) {
                foundMatch = 1;
            }
            lineArray[lineCounter] = $0;
            lineCounter++;
        }
        else if($2 == "SIP.STACK" && foundMatch == 0){
            containsId = index($0, callID)
            if(containsId > 0) {
                foundMatch = 1;
            }
            lineArray[lineCounter] = $0;
            lineCounter++;
        }
        else {
            if(foundMatch) {
                for (x = 0; x < lineCounter; x++) {
                    print lineArray[x];
                }
            }
            lineCounter = 0;
            foundMatch = 0;
            containsId = 0;
        }
    }
END   {  }