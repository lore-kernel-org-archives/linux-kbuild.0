Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:49137 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752040AbYACUHZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Jan 2008 15:07:25 -0500
Date: Thu, 3 Jan 2008 21:07:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC] Make kconfig MinGW friendly
Message-ID: <20080103200709.GE21227@uranus.ravnborg.org>
References: <20071217180741.GA17759@michl.2n.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20071217180741.GA17759@michl.2n.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-kbuild@vger.kernel.org

On Mon, Dec 17, 2007 at 07:07:41PM +0100, Ladislav Michl wrote:
> Why the hell would you want do to such stupid thing?
> 
> Kconfig is powerfull tool. So powerfull that more and more software
> projects are using it for configuration. So instead of fixing some of
> them one by one, lets fix it in kernel and wait for sync.
> 
> This work was originaly done for PTXdist - GPL licensed build system for
> userlands and cross-compilers, but it will not hurt kernel kconfig
> either. PTXdist menuconfig now works on Windows linked with PDCurses and
> compiled using MinGW - there is no termios and signals.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> 
> * Do not include <sys/wait.h> and <signal.h> (comes from times when
>   lxdialog was separate process)
> * Do not mess with termios directly and let curses tell screen size.
>   Comment to commit c8dc68ad0fbd934e78e913b8a8d7b45945db4930 says
>   check for screen size could be removed later, but because it didn't
>   happen for more than year I left it here as well.

Looks good to me and works for me - so applied.

Thanks,
	Sam
