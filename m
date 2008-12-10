Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:52497 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754595AbYLJU14 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Dec 2008 15:27:56 -0500
Date: Wed, 10 Dec 2008 15:27:54 -0500 (EST)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Better way to force a rebuild
In-Reply-To: <alpine.DEB.1.10.0812101524230.11805@gandalf.stny.rr.com>
Message-ID: <alpine.DEB.1.10.0812101526350.11805@gandalf.stny.rr.com>
References: <alpine.DEB.1.10.0812101443550.11805@gandalf.stny.rr.com> <20081210200242.GA15692@uranus.ravnborg.org> <alpine.DEB.1.10.0812101524230.11805@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, zippel@linux-m68k.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>


On Wed, 10 Dec 2008, Steven Rostedt wrote:

> > 
> > 	Sam
> > 
> 
> BTW, Sam, are you the new (or current) maintainer of kbuild/kconfig? If 
> so, then we need to update MAINTAINERS.  I just notice that you reply to 
> my kbuild questions more than anybody else (except for Andrew, but he 
> doesn't count ;-)

After writing this, I see...


KCONFIG
P:      Roman Zippel
M:      zippel@linux-m68k.org
L:      linux-kbuild@vger.kernel.org
S:      Maintained

[...]

KERNEL BUILD (kbuild: Makefile, scripts/Makefile.*)
P:      Sam Ravnborg
M:      sam@ravnborg.org
T:      git kernel.org:/pub/scm/linux/kernel/git/sam/kbuild-next.git
T:      git kernel.org:/pub/scm/linux/kernel/git/sam/kbuild-fixes.git
L:      linux-kbuild@vger.kernel.org
S:      Maintained


Bah, I need to make my vim search non-case-sensitive. My search for KBUILD 
came up with nothing, and then I searched for KCONFIG.

-- Steve


