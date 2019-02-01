Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:33196 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbfBAKXn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 05:23:43 -0500
Date: Fri, 1 Feb 2019 11:23:32 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Message-ID: <20190201102332.GD31854@zn.tnic>
References: <20190121095338.8565-1-bp@alien8.de>
 <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
 <20190201094217.GB31854@zn.tnic>
 <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 01, 2019 at 07:09:36PM +0900, Masahiro Yamada wrote:
> Why should the normal build affected by the debugging aid?

Hmm, ok, so then that target really is being used during the normal
build. I don't know why yet so I'll have to do some more staring.

> One more thing, you did not answer my question.
> 
> If you are complaining about the DWARF info
> enabled by CONFIG_DEBUG_INFO,
> I recommend to turn off CONFIG_DEBUG_INFO.

Yes but I don't want to be changing .config just so that I can look at
the asm output.

I'll think about a better solution.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
