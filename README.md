SIPSequencer
============

Script used to generate SIP Sequence diagrams from debug logs

The idea is to pass in a call-id and a filename and the program will output a visual sequence diagram of the call flow you care about.

Note: This script currently processes Adtran debug logs with 'debug sip stack messages' turned on.

## Usage
`./sequencer.sh <call-id> <filename>`

## Example Output
![Call Flow Diagram](http://i.imgur.com/gHKrHVp.png "Call Flow Diagram")
