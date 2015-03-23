Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:52395 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752728AbbCWVIr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Mar 2015 17:08:47 -0400
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH] Kconfig: drop bogus default values
Date: Mon, 23 Mar 2015 22:08:24 +0100
Message-ID: <178407860.0zoJnDfCo1@tacticalops>
In-Reply-To: <1426162307.5304.41.camel@x220>
References: <5500584D02000078000688F5@mail.emea.novell.com> <1426162307.5304.41.camel@x220>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Jan Beulich <JBeulich@suse.com>, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Thursday 12 March 2015 13:11:47 Paul Bolle wrote:
> On Wed, 2015-03-11 at 13:59 +0000, Jan Beulich wrote:
> > Default "no" is pretty pointless for options without (visible) prompts:
> 
> Related: is there ever a situation where using "default n" or "def_bool
> n" makes sense (whether or not the entry has a prompt)? I think I once
> thought of one but I can't remember it at all, so I guess my memory is
> fooling me.

Your memory is right. It is rarely used, but there is an application for
using a plain "default n": to overwrite an existing other default value.
Particularly in one special case this is desired: Let us say there is a
symbol that may lack a visible prompt, but has the default value y set in
a Kconfig file that is used across all architectures. If there is a single
architecture that must have the default value n then it is possible to
override the default y in the global file with a default n in the
architecture specific file.

A real world case is PCI_QUIRKS in the mainline kernel:

init/Kconfig:1554:	default y
arch/s390/Kconfig:59:	def_bool n

When setting PCI!=n && EXPERT=n then on each architecture PCI_QUIRKS=y
except on s390 where PCI_QUIRKS=n.

Regards,
Martin Walch
-- 

