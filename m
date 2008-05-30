Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from host36-195-149-62.serverdedicati.aruba.it ([62.149.195.36]:41273
	"EHLO mx.cpushare.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892AbYE3MlN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2008 08:41:13 -0400
Date: Fri, 30 May 2008 14:41:11 +0200
From: Andrea Arcangeli <andrea@qumranet.com>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080530124111.GC15295@duo.random>
References: <20080521144211.902CD37652C@pmx1.sophos.com> <20080521190453.GA12638@uranus.ravnborg.org> <20080521194806.GJ22488@duo.random> <20080528190907.GA6466@uranus.ravnborg.org> <20080528191315.GA6979@uranus.ravnborg.org> <20080528201803.GF8086@duo.random> <20080529193658.GA20113@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080529193658.GA20113@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: tvrtko.ursulin@sophos.com, linux-kbuild@vger.kernel.org

On Thu, May 29, 2008 at 09:36:58PM +0200, Sam Ravnborg wrote:
> On Wed, May 28, 2008 at 10:18:03PM +0200, Andrea Arcangeli wrote:
> > On Wed, May 28, 2008 at 09:13:15PM +0200, Sam Ravnborg wrote:
> > > Inspect the gcc commandlien to see if the last -I
> > > contains the expected value (which is `pwd`)
> > 
> > I can reproduce a failure, not sure if it's the same one but it ends
> > up with -I. Actually on the good build it seems the -I wasn't there at
> > all.
> 
> I tracked it down now (a simple bisect would have doen the trick too).
> It was the introduction of KBUILD_EXTRA_SYMBOLS that caused
> us troubles because we started to include the Makefile
> in Makefile.modpost and thus ccflags-y (EXTRA_CFLAGS) were
> assigned the value "-I$(src)" but $(src) was not defined so
> we ended up with an empty -I which then picked up the following
> parameter on the command line.
> 
> I cooked up the following fix:
> 
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index a098a04..28ef233 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -37,6 +37,10 @@
>  # symbols in the final module linking stage
>  # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
>  # This is solely usefull to speed up test compiles
> +
> +# Assign src as it may be used in ccflags-y
> +src = .
> +
>  PHONY := _modpost
>  _modpost: __modpost
>  

The module source is the src, so this fixes the build for KVM at least.

Signed-off-by: Andrea Arcangeli <andrea@qumranet.com>

diff -r d99f6640491e scripts/Makefile.modpost
--- a/scripts/Makefile.modpost	Tue May 20 18:19:45 2008 +0200
+++ b/scripts/Makefile.modpost	Fri May 30 14:40:16 2008 +0200
@@ -37,6 +37,10 @@
 # symbols in the final module linking stage
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely usefull to speed up test compiles
+
+# Assign src as it may be used in ccflags-y
+src = $(KBUILD_EXTMOD)
+
 PHONY := _modpost
 _modpost: __modpost
 
