# Implementing the Electronics Australia "EDUC-8" Microcomputer in VHDL

## What is it?

EDUC-8 was designed by Jaimeson (Jim) Rowe and published in "Electronics Australia" Magazine in 1975,  According to the articles, this was the result of a year's effort, and was beaten to be being the first ever computer construction project article by about 1 month, when "Popular Electronics" in the USA published their 8008-based design.

EDUC-8 was based on around discrete TTL chips, and originally was published with just 32-bytes of memory, this was later extended to 256-bytes.  It's instruction set resembled the PDP-8, although much simplified.

Electronics Australia was subsequently acquired by Silicon Chip after the former has ceased printing.  Thus the ownership of all the related intellectual property rests with them.

## Why?

I was in high school and started reading EA when the articles were first published.  At around $A400 to build at the time, I could never have afforded it, and by the time I could afford it, parts were getting hard to obtain.

I wanted to try to re-create this historic, yet largely unknown machine, and I also wanted to learn about FPGA devices, so I figured why not combine the two goals?  As a result "FEDUC-8" was born.

## The design

Rather than build an emulator, I set out to re-create the original hardware design as closely as possible.  I discovered early on in the process that the schematics were sometimes abbreviated, so I ended up tracing out the PCB overlays and poring over databooks to map out all the circuit paths.  The VHDL presented here is the result.

In keeping with the original design, I have a discrete front panel with switches and LEDs, these are driven via external logic because the load on the FPGA device would be exceeded otherwise, but these drivers don't affect the original design.

One of the larger challenges has been that while EDUC-8 was static in design, FPGA devices don't work the same way, so there _may_ be timing inconsistencies I have not yet discovered.  Also on the device I have used, the lowest rate I could clock the circuit was 1MHz, which is almost 1,000 times faster than the original!

## Copyrights, Acknowledgements, and the like

EDUC-8, it's designs and all the related materials are the property of Silicon Chip Publications.  While the VHDL implementation is my work, it would not be possible without access to those materials.  If you'd like to know more about the original design, reprints are available from Silicon Chip, although the "EDUC-8" book is no longer available.

I am grateful to Nicholas Vinen and Jim Rowe for their permission to publish this work, and in accordance with their approval, I need to remind one and all that the correct pronunciation is "Educate".

