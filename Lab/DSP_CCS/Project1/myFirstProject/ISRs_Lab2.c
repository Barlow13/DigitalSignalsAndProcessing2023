#include "DSP_Config.h"
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
#define N_buffer 256 // define buffer length
short i = 0; // index for buffer
short buffer[N_buffer]; // buffer to hold values for display in CCS
interrupt void Codec_ISR()
///////////////////////////////////////////////////////////////////////
// Purpose: Codec interface interrupt service routine
// Input: None
// Returns: Nothing
// Calls: CheckForOverrun, ReadCodecData, WriteCodecData
///////////////////////////////////////////////////////////////////////
{
/* add any local variables here */
float xLeft, xRight, yLeft, yRight;
if(CheckForOverrun()) // overrun error occurred (i.e. halted DSP)
return; // so serial port is reset to recover
CodecDataIn.UINT = ReadCodecData(); // get input data samples
/* add your code starting here */
// this example simply copies sample data from in to out
xLeft = CodecDataIn.Channel[ LEFT];
xRight = CodecDataIn.Channel[ RIGHT];
//==========================================
// Store samples in a short buffer for display
buffer[i] = (short) xRight;
i += 1;
if (i >= N_buffer)
{
i = 0;
}
//==========================================
yLeft = xLeft;
yRight = xRight;

if(yLeft >= 0){
    yLeft = 1000;
}
else{
    yLeft = -1000;
}

if(yRight >= 0){
    yRight = 1000;
}
else{
    yRight = -1000;
}


CodecDataOut.Channel[ LEFT] = (short) yLeft;
CodecDataOut.Channel[RIGHT] = (short) yRight;
/* end your code here */
WriteCodecData(CodecDataOut.UINT); // send output data to port
}
