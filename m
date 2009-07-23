Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml105.kpnxchange.com ([195.121.3.9]:56487 "EHLO
	CPSMTPM-EML105.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753823AbZGWMqq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Jul 2009 08:46:46 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH,v2] Only add '-fwrapv' to gcc CFLAGS for gcc 4.2 and later
Date: Thu, 23 Jul 2009 14:46:44 +0200
References: <200907100928.07369.elendil@planet.nl> <200907180043.53257.elendil@planet.nl> <20090718065903.GA7579@merkur.ravnborg.org>
In-Reply-To: <20090718065903.GA7579@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907231446.44929.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Saturday 18 July 2009, Sam Ravnborg wrote:
> > I based my patch on arch/x86/Makefile:
> > 35:        KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \
> > 36:                echo $(call cc-option,-fno-unit-at-a-time); fi ;)
> >
> > Guess that could be improved to use cc-ifversion then.
>
> Yes, please...

I've got patches for x86, ia64, powerpc and um, but have a couple of
questions before I submit them.

Can the patches go through your kbuild tree or should they go through the
arch trees (they will be CCed of course)?

In my patches I've left the cc-option check where it existed, so for x86
you get (tested to work):
-        KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \
-                echo $(call cc-option,-fno-unit-at-a-time); fi ;)
+        KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0400, \
+                               $(call cc-option,-fno-unit-at-a-time))

Or is it safe to simplify that to just:
+        KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0400, -fno-unit-at-a-time)
?

> > And a quick git grep gives a few other potential candidates:
> > arch/parisc/Makefile:129:       @if test "$(call cc-version)" -lt "0303"; then \

I left this one unchanged as it does not add a compiler option; instead it
displays an "unsupported' message.
