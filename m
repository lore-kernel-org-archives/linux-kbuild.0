Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:56920 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935302AbeFMUgT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 16:36:19 -0400
Date: Wed, 13 Jun 2018 22:36:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 1/9] Makefile: Prepare for using macros for inline asm
Message-ID: <20180613203614.GB10472@ravnborg.org>
References: <20180612115050.185112-1-namit@vmware.com>
 <20180612115050.185112-2-namit@vmware.com>
 <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nadav Amit <namit@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

> 
> > +macros: $(obj)/macros.s
> > +       @:
> 
> If you add a phony target, it should be added to 'PHONY'.

Or this part:
> +archmacros:
> +       $(Q)$(MAKE) $(build)=arch/x86/kernel macros

could be modified to specify the exact filename so this indirection is not needed.

PS. Only one file posted to kbuild, so impossible to review as context is missing.

	Sam
