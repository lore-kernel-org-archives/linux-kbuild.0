Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47887 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751992Ab0G2JBZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 05:01:25 -0400
Message-ID: <4C51432D.3020600@suse.cz>
Date: Thu, 29 Jul 2010 11:00:29 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] update of various kbuild flags to allow user	settings
References: <20100728182523.GA29198@merkur.ravnborg.org>
In-Reply-To: <20100728182523.GA29198@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Denys Vlasenko <vda.linux@googlemail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Chen Liqin <liqin.chen@sunplusct.com>, David Howells <dhowells@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Hirokazu Takata <takata@linux-m32r.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Mike Frysinger <vapier@gentoo.org>, Ralf Baechle <ralf@linux-mips.org>, Tony Luck <tony.luck@intel.com>

On 28.7.2010 20:25, Sam Ravnborg wrote:
> Denys Vlasenko complained that he could not set
> a moduel specific linker flags on the command line.
> 
> It turned out that the cause of this was kbuild
> that assigned a value to a variables that
> may be modified by the user.
> So any user supplied value would overwrite
> the kbuild assigned value.
> 
> Fix this so we use internal variables for kbuild
> feering up the official variables for use by
> the user.

Acked-by: Michal Marek <mmarek@suse.cz>

but I'll wait a while before applying it so that the arch maintainers
can object to / ack the arch-specific changes.

Michal
