Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:49753 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751794AbYE2TgS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 May 2008 15:36:18 -0400
Date: Thu, 29 May 2008 21:36:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080529193658.GA20113@uranus.ravnborg.org>
References: <20080521144211.902CD37652C@pmx1.sophos.com> <20080521190453.GA12638@uranus.ravnborg.org> <20080521194806.GJ22488@duo.random> <20080528190907.GA6466@uranus.ravnborg.org> <20080528191315.GA6979@uranus.ravnborg.org> <20080528201803.GF8086@duo.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080528201803.GF8086@duo.random>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrea Arcangeli <andrea@qumranet.com>
Cc: tvrtko.ursulin@sophos.com, linux-kbuild@vger.kernel.org

On Wed, May 28, 2008 at 10:18:03PM +0200, Andrea Arcangeli wrote:
> On Wed, May 28, 2008 at 09:13:15PM +0200, Sam Ravnborg wrote:
> > Inspect the gcc commandlien to see if the last -I
> > contains the expected value (which is `pwd`)
> 
> I can reproduce a failure, not sure if it's the same one but it ends
> up with -I. Actually on the good build it seems the -I wasn't there at
> all.

I tracked it down now (a simple bisect would have doen the trick too).
It was the introduction of KBUILD_EXTRA_SYMBOLS that caused
us troubles because we started to include the Makefile
in Makefile.modpost and thus ccflags-y (EXTRA_CFLAGS) were
assigned the value "-I$(src)" but $(src) was not defined so
we ended up with an empty -I which then picked up the following
parameter on the command line.

I cooked up the following fix:

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index a098a04..28ef233 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -37,6 +37,10 @@
 # symbols in the final module linking stage
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely usefull to speed up test compiles
+
+# Assign src as it may be used in ccflags-y
+src = .
+
 PHONY := _modpost
 _modpost: __modpost
 

Please let me know if this solves your problem or more issues reamin.

	Sam
