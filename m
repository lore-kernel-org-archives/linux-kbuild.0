Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:53272 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751259Ab0HSVjP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Aug 2010 17:39:15 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2010 14:39:13 -0700
Date: Thu, 19 Aug 2010 14:39:13 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: xconfig oddity
Message-Id: <20100819143913.16af8ea3.rdunlap@xenotime.net>
In-Reply-To: <20100819173243.GA19204@merkur.ravnborg.org>
References: <20100819095102.f418cd9c.rdunlap@xenotime.net>
	<20100819173243.GA19204@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Thu, 19 Aug 2010 19:32:43 +0200 Sam Ravnborg wrote:

> On Thu, Aug 19, 2010 at 09:51:02AM -0700, Randy Dunlap wrote:
> > In xconfig, when I enable (on menu) Option/Show Debug Info,
> > the symbol's help/symbol info box (window) often says:
> > 
> > type: tristate
> > unknown property: symbol
> > ^^^^^^^^^^^^^^^^^^^^^^^^
> 
> 
> I introduced a new property P_SYMBOL used
> to hold information about where a symbol is defined.
> (which Kconfig files/line numbers).
> 
> You could just plainly ignore that
> property in ConfigInfoView::debug_info(struct symbol *sym)
> 
> Or you could add info about the file/line where 
> the symbol is defined. Note - it may be in several files.
> 
> Can you try this yourself?

Sure, when I can find a little time...

thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
