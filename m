Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32940 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbeJBRmj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Oct 2018 13:42:39 -0400
Date: Tue, 2 Oct 2018 12:59:52 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v8 02/10] Makefile: Prepare for using macros for inline
 asm
Message-ID: <20181002105952.GA13611@gmail.com>
References: <20180918212847.199085-1-namit@vmware.com>
 <20180918212847.199085-3-namit@vmware.com>
 <1aa5a1f3-ef3d-5cd3-831c-2202d73d3c9e@rasmusvillemoes.dk>
 <307823F9-DCCF-4384-9FBE-28642FAD6B4E@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <307823F9-DCCF-4384-9FBE-28642FAD6B4E@vmware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>


* Nadav Amit <namit@vmware.com> wrote:

> at 1:58 AM, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
> 
> > On 2018-09-18 23:28, Nadav Amit wrote:
> > 
> >> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> >> index 8f6e7eb8ae9f..944fa3bc9376 100644
> >> --- a/arch/x86/Makefile
> >> +++ b/arch/x86/Makefile
> >> @@ -214,8 +214,8 @@ ifdef CONFIG_X86_64
> >> KBUILD_LDFLAGS += $(call ld-option, -z max-page-size=0x200000)
> >> endif
> >> 
> >> -# Speed up the build
> >> -KBUILD_CFLAGS += -pipe
> >> +# We cannot use -pipe flag since we give an additional .s file to the compiler
> >> +#KBUILD_CFLAGS += -pipe
> > 
> > Is this really necessary? The gas manual says that one can use -- to
> > name stdin, though that's probably a typo and should just be - . Doing
> > 
> > gcc -pipe -Wa,foo.s -Wa,-
> 
> Good idea. I didn’t think of it. Yes, this can do the trick. I’ll do it in
> v9.

Ok, will wait for v9.

Thanks,

	Ingo
