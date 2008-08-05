Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:37899 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759985AbYHEUoN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Aug 2008 16:44:13 -0400
Date: Tue, 5 Aug 2008 22:44:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: How to separate obj and src for external module build?
Message-ID: <20080805204426.GC5464@uranus.ravnborg.org>
References: <74FD445BA9418847A54455595122B4B43F7F4F@CORPUSMX70C.corp.emc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74FD445BA9418847A54455595122B4B43F7F4F@CORPUSMX70C.corp.emc.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Qian_Riny@emc.com
Cc: linux-kbuild@vger.kernel.org

On Tue, Aug 05, 2008 at 04:47:44AM -0400, Qian_Riny@emc.com wrote:
> Hi,
> 
> I want to put all obj files (*.o, *.ko etc) into a different directory
> (e.g. obj/) 
> rather than the same src (*.c, Makefile) directory while building an
> external module:
> $(MAKE) -C $(KERNELDIR) M=$(SRC) modules
> How to do it?
> 
> I tried to use O (KBUILD_OUTPUT), but still no luck. It seems that
> O (KBUILD_OUTPUT) is just used for kernel build output.
> 
> $(MAKE) -C $(KERNELDIR) M=$(SRC) O=$(OBJ) modules
> It doesn't work.

This is not yet supported by kbuild and I have no plans to look
into it at the moment.

	Sam
