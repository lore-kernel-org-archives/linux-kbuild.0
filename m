Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:56144 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752237AbZGWO1R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Jul 2009 10:27:17 -0400
Date: Thu, 23 Jul 2009 16:27:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH,v2] Only add '-fwrapv' to gcc CFLAGS for gcc 4.2 and
	later
Message-ID: <20090723142716.GA9233@merkur.ravnborg.org>
References: <200907100928.07369.elendil@planet.nl> <200907180043.53257.elendil@planet.nl> <20090718065903.GA7579@merkur.ravnborg.org> <200907231446.44929.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200907231446.44929.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: linux-kbuild@vger.kernel.org

On Thu, Jul 23, 2009 at 02:46:44PM +0200, Frans Pop wrote:
> On Saturday 18 July 2009, Sam Ravnborg wrote:
> > > I based my patch on arch/x86/Makefile:
> > > 35:        KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \
> > > 36:                echo $(call cc-option,-fno-unit-at-a-time); fi ;)
> > >
> > > Guess that could be improved to use cc-ifversion then.
> >
> > Yes, please...
> 
> I've got patches for x86, ia64, powerpc and um, but have a couple of
> questions before I submit them.
> 
> Can the patches go through your kbuild tree or should they go through the
> arch trees (they will be CCed of course)?
Preferably the arch tress, but I will take what they do not apply.

> 
> In my patches I've left the cc-option check where it existed, so for x86
> you get (tested to work):
> -        KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \
> -                echo $(call cc-option,-fno-unit-at-a-time); fi ;)
> +        KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0400, \
> +                               $(call cc-option,-fno-unit-at-a-time))
> 
> Or is it safe to simplify that to just:
> +        KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0400, -fno-unit-at-a-time)
> ?
I think not. The latter would require all gcc versions > 4.00 to support that,
option and looking at the oroginal code it does not.
> 
> > > And a quick git grep gives a few other potential candidates:
> > > arch/parisc/Makefile:129:       @if test "$(call cc-version)" -lt "0303"; then \
> 
> I left this one unchanged as it does not add a compiler option; instead it
> displays an "unsupported' message.
Yes - this is something different.

[I'm away for a few days - will check up on your patches when I'm back].

	Sam
