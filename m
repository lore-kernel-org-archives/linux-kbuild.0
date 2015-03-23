Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:61331 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753182AbbCWW7E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Mar 2015 18:59:04 -0400
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH] Kconfig: drop bogus default values
Date: Mon, 23 Mar 2015 23:58:52 +0100
Message-ID: <1565998.uAQ7oZ5VxV@tacticalops>
In-Reply-To: <1427145868.10958.5.camel@x220>
References: <5500584D02000078000688F5@mail.emea.novell.com> <178407860.0zoJnDfCo1@tacticalops> <1427145868.10958.5.camel@x220>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Martin Walch <walch.martin@web.de>, Jan Beulich <JBeulich@suse.com>, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Monday 23 March 2015 22:24:28 Paul Bolle wrote:
> > A real world case is PCI_QUIRKS in the mainline kernel:
> > 
> > init/Kconfig:1554:	default y
> > arch/s390/Kconfig:59:	def_bool n
> > 
> > When setting PCI!=n && EXPERT=n then on each architecture PCI_QUIRKS=y
> > except on s390 where PCI_QUIRKS=n.
> 
> Good catch!
> 
> For the same effect, would it do to have
>     config PCI_QUIRKS
>         default y if !S390
>         [...]
> 
> in init/Kconfig?

Basically yes (although I suppose the maintainer had a good reason for
writing it the way it is now). But in the case with "def_bool n" in
arch/s390/Kconfig, the default value is explicitly set to n, while
"default y if !S390" does not set the value at all. As long as there are no
further default lines for PCI_QUIRKS below, this leads to the same
configuration. However if there was a third default line, then in the former
case that third default value would be always ignored while in the latter
case it would determine the default value on s390.

Regards,
Martin Walch
-- 

