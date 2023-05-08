// Welch, Wright, & Morrow,
// Real-time Digital Signal Processing, 2017

///////////////////////////////////////////////////////////////////////
// Filename: ISRs.c
//
// Synopsis: Interrupt service routine for codec data transmit/receive
//
///////////////////////////////////////////////////////////////////////

#include "DSP_Config.h"

// Data is received as 2 16-bit words (left/right) packed into one
// 32-bit word.  The union allows the data to be accessed as a single
// entity when transferring to and from the serial port, but still be
// able to manipulate the left and right channels independently.

#define LEFT 0
#define RIGHT 1

volatile union
{
    Uint32 UINT;
    Int16 Channel[2];
} CodecDataIn, CodecDataOut;

/* add any global variables here */
float x[5] = {0, 0, 0, 0, 0};

interrupt void
Codec_ISR()
///////////////////////////////////////////////////////////////////////
// Purpose:   Codec interface interrupt service routine
//
// Input:     None
//
// Returns:   Nothing
//
// Calls:     CheckForOverrun, ReadCodecData, WriteCodecData
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
{
    /* add any local variables here */
    float ycurr,xcurr;

    if (CheckForOverrun()) // overrun error occurred (i.e. halted DSP)
        return;            // so serial port is reset to recover

    CodecDataIn.UINT = ReadCodecData(); // get input data samples

    /* add your code starting here */

    // this example simply copies sample data from in to out
    xcurr = CodecDataIn.Channel[RIGHT];

    ycurr = 0.2*(x[0] + x[1] + x[2] + x[3] + x[4]); // calculate current output using difference equation

    x[4] = x[3];
    x[3] = x[2];
    x[2] = x[1];
    x[1] = x[0];
    x[0] = xcurr;

    CodecDataOut.Channel[RIGHT] = ycurr;

    /* end your code here */

    WriteCodecData(CodecDataOut.UINT); // send output data to  port
}
