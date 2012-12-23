Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:38765 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741Ab2LWIZF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 23 Dec 2012 03:25:05 -0500
Date: Sun, 23 Dec 2012 09:25:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [BUG] Build whitespaces Ignored
Message-ID: <20121223082501.GA31501@merkur.ravnborg.org>
References: <CAK2BWAp__KOnFPzgeynu+Zxb3kvjuEDTa5dPFzTECmqedp1S2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK2BWAp__KOnFPzgeynu+Zxb3kvjuEDTa5dPFzTECmqedp1S2g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sunil Beta Baskar <betasam@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sun, Dec 23, 2012 at 07:45:43AM +0530, Sunil Beta Baskar wrote:
> Here is the source path for the Kernel
> /home/betasam/Downloads/New Folder/linux-2.6.32.60
> 
> (Notice the " " or New\ Folder in-between.)
> 
> betasam@nadia ~/Downloads/New Folder/linux-2.6.32.60 $ make i386_defconfig
> Makefile:302: warning: overriding commands for target
> `/home/betasam/Downloads/New'
> Makefile:104: warning: ignoring old commands for target
> `/home/betasam/Downloads/New'
> Makefile:303: /home/betasam/Downloads/New: No such file or directory
> Makefile:303: Folder/linux-2.6.32.60/scripts/Kbuild.include: No such
> file or directory
> Makefile:446: /home/betasam/Downloads/New: No such file or directory
> Makefile:446: Folder/linux-2.6.32.60/arch/x86/Makefile: No such file
> or directory
> make: *** No rule to make target
> `Folder/linux-2.6.32.60/arch/x86/Makefile'.  Stop.
> 
> 
> We had a linux kernel build workshop at Pune University, Pune India
> and at least three hit this bug.
For any experienced developer it is well-known that make does not
deal well with directories containing spaces.
So they avoid them.

> 
> Is there a fix already that hasn't been backported or should we be
> submitting a patch that fixes issues when whitespaces are observed in
> the /path/to/kernel/src/
If you can come up with clean fixes - then plase submit them.
An alternative approach could be to test if current
directory has spaces included and error out early.

	Sam
