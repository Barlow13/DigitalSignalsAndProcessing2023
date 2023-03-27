#include "DSP_Config.h"
#include <math.h> /* define the used cosine (cosf) & sine (sinf) functions in this code */
// Data is received as 2 16-bit words (left/right) packed into one
// 32-bit word. The union allows the data to be accessed as a single
// entity when transferring to and from the serial port, but still be
// able to manipulate the left and right channels independently.
#define LEFT 0
#define RIGHT 1
volatile union {
Uint32 UINT;
Int16 Channel[2];
} CodecDataIn, CodecDataOut;
/* add any global variables here */
float A = 32767/4; /* signal's amplitude, you can increase A to a comfortable level */
float fDesired = 1000; /* signal's frequency */
float phase = 0; /* signal's initial phase */
float pi = 3.1415927; /* value of pi */
float phaseIncrement; /* incremental phase */
Int32 fs = 48000; /* sample frequency */
interrupt void Codec_ISR()
///////////////////////////////////////////////////////////////////////
// Purpose: Codec interface interrupt service routine
// Input: None
// Returns: Nothing
// Calls: CheckForOverrun, ReadCodecData, WriteCodecData
///////////////////////////////////////////////////////////////////////
{
/* add any local variables here */
if(CheckForOverrun()) // overrun error occurred (i.e. halted DSP)
return; // so serial port is reset to recover
CodecDataIn.UINT = ReadCodecData(); // get input data samples
/* algorithm begins here */
phaseIncrement = 2*pi*fDesired/fs; /* calculate the phase increment */
phase += phaseIncrement; /* calculate the next phase */
if (phase >= 2*pi){
        phase -= 2*pi;} /* modulus 2*pi operation */
if ((A*phase)<=0){
    CodecDataOut.Channel[ LEFT] = 0; /* scaled L output */
    CodecDataOut.Channel[RIGHT] = 0; /* scaled R output */
}
else{

CodecDataOut.Channel[ LEFT] = (A*phase); /* scaled L output */
CodecDataOut.Channel[RIGHT] = (A*phase); /* scaled R output */}
/* algorithm ends here */
WriteCodecData(CodecDataOut.UINT); // send output data to port
}
