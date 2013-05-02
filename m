Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:37836 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758644Ab3EBU0B (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 May 2013 16:26:01 -0400
Date: Thu, 2 May 2013 22:25:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Silent failure when missing bc
Message-ID: <20130502202559.GA17647@merkur.ravnborg.org>
References: <20130502144403.GE6335@pomac.netswarm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130502144403.GE6335@pomac.netswarm.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Kumlien <pomac@vapor.com>
Cc: linux-kbuild@vger.kernel.org, hpa@zytor.com, mmarek@suse.cz

On Thu, May 02, 2013 at 04:44:03PM +0200, Ian Kumlien wrote:
> Hi, 
> 
> A dependency on bc was added at some point during the 3.9 development.
> 
> My machines runs a git forest which contains both stable and Torvalds
> mainline. So any kernel version is only a:
> 	git fetch --all && git checkout <tag> away
> 
> When switching from v3.8.5 to v3.9-rc7 i ran in to a odd thing.
> 
> It seemed to build fine, make install and modules_install was all fine
> as well but rebooting revealed that 3.8.5 had been installed again
> instead.
> 
> Doing make clean and rebuilding revealed that I was missing bc ;)
> 
> I have tried to find exactly where it's run since then, i have found the
> cmd_bc section but not found what triggers it... Due to lack of time and
> energy, I hearby report this bug!
> 
> This is about as far as i got:
> kernel/Makefile:135:quiet_cmd_bc  = BC      $@
> kernel/Makefile:136:      cmd_bc  = bc -q $(filter-out FORCE,$^) > $@

Could you try this patch. Untested but I think it required to catch this bug.

diff --git a/kernel/Makefile b/kernel/Makefile
index d1574d4..18a9083 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -134,7 +134,7 @@ $(obj)/hz.bc: $(objtree)/include/config/hz.h FORCE
 	$(call if_changed,hzfile)
 
 quiet_cmd_bc  = BC      $@
-      cmd_bc  = bc -q $(filter-out FORCE,$^) > $@
+      cmd_bc  = bc -q $(filter-out FORCE,$^) > $@ || (rm -f $@; false)
 
 targets += timeconst.h
 $(obj)/timeconst.h: $(obj)/hz.bc $(src)/timeconst.bc FORCE

> 
> Is there any detaled information and or instructions on kbuild btw?
There is some docs in Documentation/kbuild/* - but I dunno if this is
what you are after.

	Sam
