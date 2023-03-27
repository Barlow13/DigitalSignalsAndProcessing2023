///////////////////////////////////////////////////////////////////////
// Filename: ISRs.c
// Synopsis: Interrupt service routine for codec data transmit/receive
///////////////////////////////////////////////////////////////////////
#include "DSP_Config.h"
#include <math.h>
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
#define N 8 // signal period for f = Fs/
Int32 signalCos[N] = {6000, 3000, 0, -3000, -6000, -3000, 0, 3000}; // cos waveform
Int32 signalSin[N] = {0,3000, 6000, 0, -3000, -6000, -3000, 0}; // sin waveform
Int32 index = 0; /* signal's indexing variable */
interrupt void Codec_ISR()
///////////////////////////////////////////////////////////////////////
// Purpose: Codec interface interrupt service routine
// Input: None
// Returns: Nothing
// Calls: CheckForOverrun, ReadCodecData, WriteCodecData
// Notes: None
///////////////////////////////////////////////////////////////////////
{
/* add any local variables here */
if(CheckForOverrun()) // overrun error occurred (i.e. halted DSP)
return; // so serial port is reset to recover
CodecDataIn.UINT = ReadCodecData(); // get input data samples
/* algorithm begins here */
if (index == N) index = 0;
CodecDataOut.Channel[ LEFT] = signalCos[index]; // cos output
CodecDataOut.Channel[RIGHT] = signalSin[index]; // sin output
index++;
/* algorithm ends here */
WriteCodecData(CodecDataOut.UINT); // send output data to port
}
