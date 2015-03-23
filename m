Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:42042 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752221AbbCWVYf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Mar 2015 17:24:35 -0400
Message-ID: <1427145868.10958.5.camel@x220>
Subject: Re: [PATCH] Kconfig: drop bogus default values
From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 23 Mar 2015 22:24:28 +0100
In-Reply-To: <178407860.0zoJnDfCo1@tacticalops>
References: <5500584D02000078000688F5@mail.emea.novell.com>
	 <1426162307.5304.41.camel@x220> <178407860.0zoJnDfCo1@tacticalops>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: Jan Beulich <JBeulich@suse.com>, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi Martin,

On Mon, 2015-03-23 at 22:08 +0100, Martin Walch wrote:
> On Thursday 12 March 2015 13:11:47 Paul Bolle wrote:
> Your memory is right.

That's nice to hear, but I'm pretty sure this never occurred to me.

> It is rarely used, but there is an application for
> using a plain "default n": to overwrite an existing other default value.
> Particularly in one special case this is desired: Let us say there is a
> symbol that may lack a visible prompt, but has the default value y set in
> a Kconfig file that is used across all architectures. If there is a single
> architecture that must have the default value n then it is possible to
> override the default y in the global file with a default n in the
> architecture specific file.
> 
> A real world case is PCI_QUIRKS in the mainline kernel:
> 
> init/Kconfig:1554:	default y
> arch/s390/Kconfig:59:	def_bool n
> 
> When setting PCI!=n && EXPERT=n then on each architecture PCI_QUIRKS=y
> except on s390 where PCI_QUIRKS=n.

Good catch!

For the same effect, would it do to have
    config PCI_QUIRKS
        default y if !S390
        [...]

in init/Kconfig?


Paul Bolle

