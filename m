Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:54818 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727734AbfBAJmX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 04:42:23 -0500
Date: Fri, 1 Feb 2019 10:42:17 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Message-ID: <20190201094217.GB31854@zn.tnic>
References: <20190121095338.8565-1-bp@alien8.de>
 <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 01, 2019 at 12:06:13PM +0900, Masahiro Yamada wrote:
> This would make the build speed slower
> because the compiler is invoked to check those flags in every directory.
> 
> I tested this patch with x86_64_defconfig and GCC 8.2
> (on ubuntu 18.10 in docker)
> but I saw no effect of this patch.

Yes, because that's the .s target which is meant to be used to convert
only a *single* .c file to assembly in order to stare at the resulting
asm. For example:

make arch/x86/kernel/cpu/common.s

It is a debugging aid - and a very basic and important one - and is not
usually used during a normal kernel build. AFAIK.

So we shouldn't worry about any slowdowns here.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
