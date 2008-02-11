Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36438 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752314AbYBKNeq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 08:34:46 -0500
Date: Mon, 11 Feb 2008 14:34:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: shell command is empty, when "silent" (Re: make V=1 broken)
Message-ID: <20080211133453.GC20959@uranus.ravnborg.org>
References: <20080210225939.GB15317@uranus.ravnborg.org> <20080211024640.GF24008@flower.upol.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080211024640.GF24008@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@flower.upol.cz>
Cc: Sam Ravnborg <linux-kbuild@vger.kernel.org>

On Mon, Feb 11, 2008 at 03:46:40AM +0100, Oleg Verych wrote:
> On Sun, Feb 10, 2008 at 11:59:40PM +0100, Sam Ravnborg wrote:
> > make V=1 is broken at the moment.
> > 
> > I do not have possibility to look at it until
> > in ~20 hours.
> > So if anyone can help until then...
> > 
> > To reproduce:
> > 
> > make defconfig
> > make V=1
> > 
> 
> Somehow $(quiet) == "", when it should be "silent_". Thus command is
> empty (just ";"), which is error.
> 
> ,--`make V=1`--
> |  GEN     /dev/shm/blinux/Makefile
> |set -e; ; mkdir -p include/linux/; 
> []
> |/bin/sh: Syntax error: ";" unexpected
> `--
> 
> That "silent" juggling with `echo` is overhead, thus remove it.

Hi Oleg.
People has requested to make the build even more silent with
make -s. So when Mike provided a patch is was applied (but unfortunately faulty).

So I fixed it by appended patch.
The right fix would have been to resue echo-cmd but that
required a bit more rework.

	Sam

From 49af821e4b1c07e756cbc2e389eba9d885912602 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 11 Feb 2008 14:26:26 +0100
Subject: [PATCH] kbuild: fix make V=1

When make -s support were added to filechk to
combination created with make V=1 were not
covered.
Fix it by explicitly cover this case too.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Mike Frysinger <vapier@gentoo.org>
---
 scripts/Kbuild.include |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index da3559e..d64e6ba 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -39,10 +39,13 @@ escsq = $(subst $(squote),'\$(squote)',$1)
 # - If they are equal no change, and no timestamp update
 # - stdin is piped in from the first prerequisite ($<) so one has
 #   to specify a valid file as first prerequisite (often the kbuild file)
+       chk_filechk = :
  quiet_chk_filechk = echo '  CHK     $@'
 silent_chk_filechk = :
+       upd_filechk = :
  quiet_upd_filechk = echo '  UPD     $@'
 silent_upd_filechk = :
+
 define filechk
 	$(Q)set -e;				\
 	$($(quiet)chk_filechk);			\
-- 
1.5.4.rc3.14.g44397

