Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pmx1.sophos.com ([213.31.172.16]:40740 "EHLO pmx1.sophos.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750885AbYE3MwL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2008 08:52:11 -0400
In-Reply-To: <20080530124111.GC15295@duo.random>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
MIME-Version: 1.0
From: tvrtko.ursulin@sophos.com
Date: Fri, 30 May 2008 13:52:05 +0100
Content-Type: text/plain; charset="US-ASCII"
Message-Id: <20080530125207.0F13D33669E@pmx1.sophos.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrea Arcangeli <andrea@qumranet.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Andrea Arcangeli <andrea@qumranet.com> wrote on 30/05/2008 13:41:11:

> On Thu, May 29, 2008 at 09:36:58PM +0200, Sam Ravnborg wrote:
> > I tracked it down now (a simple bisect would have doen the trick too).
> > It was the introduction of KBUILD_EXTRA_SYMBOLS that caused
> > us troubles because we started to include the Makefile
> > in Makefile.modpost and thus ccflags-y (EXTRA_CFLAGS) were
> > assigned the value "-I$(src)" but $(src) was not defined so
> > we ended up with an empty -I which then picked up the following
> > parameter on the command line.
> > 
> > I cooked up the following fix:
> > 
> > diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> > index a098a04..28ef233 100644
> > --- a/scripts/Makefile.modpost
> > +++ b/scripts/Makefile.modpost
> > @@ -37,6 +37,10 @@
> >  # symbols in the final module linking stage
> >  # KBUILD_MODPOST_NOFINAL can be set to skip the final link of 
modules.
> >  # This is solely usefull to speed up test compiles
> > +
> > +# Assign src as it may be used in ccflags-y
> > +src = .
> > +
> >  PHONY := _modpost
> >  _modpost: __modpost
> > 
> 
> The module source is the src, so this fixes the build for KVM at least.
> 
> Signed-off-by: Andrea Arcangeli <andrea@qumranet.com>
> 
> diff -r d99f6640491e scripts/Makefile.modpost
> --- a/scripts/Makefile.modpost   Tue May 20 18:19:45 2008 +0200
> +++ b/scripts/Makefile.modpost   Fri May 30 14:40:16 2008 +0200
> @@ -37,6 +37,10 @@
>  # symbols in the final module linking stage
>  # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
>  # This is solely usefull to speed up test compiles
> +
> +# Assign src as it may be used in ccflags-y
> +src = $(KBUILD_EXTMOD)
> +
>  PHONY := _modpost
>  _modpost: __modpost

This works for me as well.

Tvrtko



Sophos Plc, The Pentagon, Abingdon Science Park, Abingdon,
OX14 3YP, United Kingdom.

Company Reg No 2096520. VAT Reg No GB 348 3873 20.

