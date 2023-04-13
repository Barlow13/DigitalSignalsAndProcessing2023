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
#define N 3
float x[4] = {0, 0, 0, 0};
int i = 0;
float h[4] = {.25, .25, .25, .25};

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
    float xLeft, xRight, yLeft, yRight;
    float y = 0;

    if (CheckForOverrun()) // overrun error occurred (i.e. halted DSP)
        return;            // so serial port is reset to recover

    CodecDataIn.UINT = ReadCodecData(); // get input data samples

    /* add your code starting here */

    // this example simply copies sample data from in to out
    x[0] = CodecDataIn.Channel[RIGHT];
    for (i = 0; i <= N; i++)
    {
        y += x[i] * h[i];
    }
    for (i = N; i > 0; i--)
    {
        x[i] = x[i - 1];
    }

    CodecDataOut.Channel[RIGHT] = y;

    /* end your code here */

    WriteCodecData(CodecDataOut.UINT); // send output data to  port
}
