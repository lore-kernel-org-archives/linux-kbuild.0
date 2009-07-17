Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml108.kpnxchange.com ([195.121.3.12]:63485 "EHLO
	CPSMTPM-EML108.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757950AbZGQWny (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jul 2009 18:43:54 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH,v2] Only add '-fwrapv' to gcc CFLAGS for gcc 4.2 and later
Date: Sat, 18 Jul 2009 00:43:51 +0200
References: <200907100928.07369.elendil@planet.nl> <200907102205.49642.elendil@planet.nl> <20090717221846.GA7347@merkur.ravnborg.org>
In-Reply-To: <20090717221846.GA7347@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907180043.53257.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, akpm@linux-foundation.org, torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org, barryn@pobox.com

On Saturday 18 July 2009, Sam Ravnborg wrote:
> >  # disable invalid "can't wrap" optimizations for signed / pointers
> > -KBUILD_CFLAGS	+= $(call cc-option,-fwrapv)
> > +KBUILD_CFLAGS  += $(shell if [ $(call cc-version) -ge 0402 ]; then \
> > +		    echo $(call cc-option,-fwrapv); fi ;)
>
> This would be simpler if you use:

That's now academic as Linus decided on a different fix.

> # cc-ifversion
> # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
> cc-ifversion = $(shell [ $(call cc-version, $(CC)) $(1) $(2) ] && echo $(3))
>
> We have only one user at the moment so I understand why you missed it.

:-)

I based my patch on arch/x86/Makefile:
35:        KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \
36:                echo $(call cc-option,-fno-unit-at-a-time); fi ;)

Guess that could be improved to use cc-ifversion then.

And a quick git grep gives a few other potential candidates:
arch/ia64/Makefile:44:ifeq ($(call cc-version),0304)
arch/parisc/Makefile:129:       @if test "$(call cc-version)" -lt "0303"; then \
arch/powerpc/Makefile:80:GCC_BROKEN_VEC := $(shell if [ $(call cc-version) -lt 0400 ] ; then echo "y"; fi)
arch/powerpc/Makefile:219:      @if test "$(call cc-version)" = "0304" ; then \
arch/um/Makefile-i386:38:KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \

Cheers,
FJP
