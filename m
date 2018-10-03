Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.136]:35377 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726964AbeJDCd1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Oct 2018 22:33:27 -0400
Date: Wed, 03 Oct 2018 12:43:13 -0700
In-Reply-To: <20181002105952.GA13611@gmail.com>
References: <20180918212847.199085-1-namit@vmware.com> <20180918212847.199085-3-namit@vmware.com> <1aa5a1f3-ef3d-5cd3-831c-2202d73d3c9e@rasmusvillemoes.dk> <307823F9-DCCF-4384-9FBE-28642FAD6B4E@vmware.com> <20181002105952.GA13611@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH v8 02/10] Makefile: Prepare for using macros for inline asm
From: hpa@zytor.com
Message-ID: <24BB4662-B220-4295-9040-17CF4C7B8CCE@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Nadav Amit <namit@vmware.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On October 2, 2018 3:59:52 AM PDT, Ingo Molnar <mingo@kernel.org> wrote:
>
>* Nadav Amit <namit@vmware.com> wrote:
>
>> at 1:58 AM, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
>> 
>> > On 2018-09-18 23:28, Nadav Amit wrote:
>> > 
>> >> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
>> >> index 8f6e7eb8ae9f..944fa3bc9376 100644
>> >> --- a/arch/x86/Makefile
>> >> +++ b/arch/x86/Makefile
>> >> @@ -214,8 +214,8 @@ ifdef CONFIG_X86_64
>> >> KBUILD_LDFLAGS += $(call ld-option, -z max-page-size=0x200000)
>> >> endif
>> >> 
>> >> -# Speed up the build
>> >> -KBUILD_CFLAGS += -pipe
>> >> +# We cannot use -pipe flag since we give an additional .s file to
>the compiler
>> >> +#KBUILD_CFLAGS += -pipe
>> > 
>> > Is this really necessary? The gas manual says that one can use --
>to
>> > name stdin, though that's probably a typo and should just be - .
>Doing
>> > 
>> > gcc -pipe -Wa,foo.s -Wa,-
>> 
>> Good idea. I didn’t think of it. Yes, this can do the trick. I’ll do
>it in
>> v9.
>
>Ok, will wait for v9.
>
>Thanks,
>
>	Ingo

Does -pipe actually win anything these days?
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
