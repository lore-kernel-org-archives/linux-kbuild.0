Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eastrmmtao101.cox.net ([68.230.240.7]:54568 "EHLO
	eastrmmtao101.cox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753175AbYFQCRI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Jun 2008 22:17:08 -0400
Message-ID: <48571D0D.2030708@ou.edu>
Date: Mon, 16 Jun 2008 21:10:21 -0500
From: Steve Kenton <skenton@ou.edu>
Reply-To: skenton@ou.edu
MIME-Version: 1.0
Subject: FYI - cross  building on Cygwin works for multiple arches with only
 one hack to kbuild
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux-Kbuild <linux-kbuild@vger.kernel.org>

I have been working with cross compilers and portable tool chains. To 
flush out hidden assumptions I sometimes build in environments like 
Solaris and Cygwin as well as on Linux.  I recently got 22 different gcc 
cross compilers and associated binutils etc. to build on Cygwin so I 
gave a try building kernel defconfigs for most of the arches.  To my 
pleasant surprise, I was able to successfully build vmlinux in 10 cases 
while only having to make one (1) hack on the kernel build system. Kudos 
to the kbuild support!

The only problem was that the Cygwin /usr/include/elf.h file used in 
scripts/mod/modpost.h is lacking a few arch specific symbols and 
redefines a few other symbols. But, by adding these and ignoring the 
redefines I got variable numbers of section mismatches on different 
arches so mod post was apparently not too unhappy with the hack.

Is it worth trying to use the linux/elf.h or otherwise work round the 
Cygwin elf.h?  If I remember correctly Solaris had similar problems last 
time I tried it,  but that port is not building right now because of 
other problems so I can't easily test it right now.  I'd be glad to hack 
on and/or try stuff if it's worth while and someone can point me in the 
right direction.  I'm not currently subscribed so please include in on 
reply.

Steve Kenton


#define R_386_32           1            /* Direct 32 bit  */
#define R_386_PC32         2            /* PC relative 32 bit */
#define R_386_32PLT        11
#define R_MIPS_32               2       /* Direct 32 bit */
#define R_MIPS_26               4       /* Direct 26 bit shifted */
#define R_MIPS_HI16             5       /* High 16 bit */
#define R_MIPS_LO16             6       /* Low 16 bit */
#define R_ARM_PC24              1       /* PC relative 26 bit branch */
#define R_ARM_ABS32             2       /* Direct 32 bit  */

WARNING: modpost: Found 7 section mismatch(es).
WARNING: modpost: Found 4 section mismatch(es).
WARNING: modpost: Found 37 section mismatch(es).
WARNING: modpost: Found 1 section mismatch(es).
WARNING: modpost: Found 19 section mismatch(es).
WARNING: modpost: Found 12 section mismatch(es).
WARNING: modpost: Found 1 section mismatch(es).
WARNING: modpost: Found 3 section mismatch(es).
WARNING: modpost: Found 18 section mismatch(es).
WARNING: modpost: Found 25 section mismatch(es).
WARNING: modpost: Found 3 section mismatch(es).



