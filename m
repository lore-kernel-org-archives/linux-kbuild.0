Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f49.google.com ([74.125.83.49]:35990 "EHLO
        mail-pg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753019AbdDNAXi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Apr 2017 20:23:38 -0400
Received: by mail-pg0-f49.google.com with SMTP id g2so37137996pge.3
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Apr 2017 17:23:37 -0700 (PDT)
Date: Thu, 13 Apr 2017 17:23:35 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 3/7] x86, LLVM: suppress clang warnings about unaligned
 accesses
Message-ID: <20170414002335.GH28657@google.com>
References: <20170317001520.85223-1-md@google.com>
 <20170317001520.85223-4-md@google.com>
 <FB827022-C732-432A-8F31-734C88EBF7A4@zytor.com>
 <20170403230158.GA145051@google.com>
 <20170413231439.GG28657@google.com>
 <3b743cf7-3d81-1fd6-b3a9-2f58a3bd8817@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b743cf7-3d81-1fd6-b3a9-2f58a3bd8817@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

El Thu, Apr 13, 2017 at 04:55:00PM -0700 H. Peter Anvin ha dit:

> On 04/13/17 16:14, Matthias Kaehlcke wrote:
> > El Mon, Apr 03, 2017 at 04:01:58PM -0700 Matthias Kaehlcke ha dit:
> > 
> >> El Fri, Mar 17, 2017 at 04:50:19PM -0700 hpa@zytor.com ha dit:
> >>
> >>> On March 16, 2017 5:15:16 PM PDT, Michael Davidson <md@google.com> wrote:
> >>>> Suppress clang warnings about potential unaliged accesses
> >>>> to members in packed structs. This gets rid of almost 10,000
> >>>> warnings about accesses to the ring 0 stack pointer in the TSS.
> >>>>
> >>>> Signed-off-by: Michael Davidson <md@google.com>
> >>>> ---
> >>>> arch/x86/Makefile | 5 +++++
> >>>> 1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> >>>> index 894a8d18bf97..7f21703c475d 100644
> >>>> --- a/arch/x86/Makefile
> >>>> +++ b/arch/x86/Makefile
> >>>> @@ -128,6 +128,11 @@ endif
> >>>>         KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args)
> >>>> endif
> >>>>
> >>>> +ifeq ($(cc-name),clang)
> >>>> +# Suppress clang warnings about potential unaligned accesses.
> >>>> +KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
> >>>> +endif
> >>>> +
> >>>> ifdef CONFIG_X86_X32
> >>>> 	x32_ld_ok := $(call try-run,\
> >>>> 			/bin/echo -e '1: .quad 1b' | \
> >>>
> >>> Why conditional on clang?
> >>
> >> My understanding is that this warning is clang specific, it is not
> >> listed on https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
> > 
> > Actually this warning affects other platforms besides x86
> > (e.g. arm64), I'll submit a patch that disables the warning on all
> > platforms.
> > 
> 
> Drop the ifeq ($(cc-name),clang).
> 
> You should assume that if you have to add one of those ifeq's then you
> are doing something fundamentally wrong.

Thanks, however in the case of the global Makefile it seems we should
put it inside the already existing clang section:

http://lxr.free-electrons.com/source/Makefile#L692

Cheers

Matthias
