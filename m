Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([65.50.211.136]:55345 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750747AbdDNFfi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 01:35:38 -0400
Date: Thu, 13 Apr 2017 22:30:53 -0700
In-Reply-To: <20170414002335.GH28657@google.com>
References: <20170317001520.85223-1-md@google.com> <20170317001520.85223-4-md@google.com> <FB827022-C732-432A-8F31-734C88EBF7A4@zytor.com> <20170403230158.GA145051@google.com> <20170413231439.GG28657@google.com> <3b743cf7-3d81-1fd6-b3a9-2f58a3bd8817@zytor.com> <20170414002335.GH28657@google.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH 3/7] x86, LLVM: suppress clang warnings about unaligned accesses
From: hpa@zytor.com
Message-ID: <D1103AE6-704E-438C-B2D7-7C95DF564EE6@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On April 13, 2017 5:23:35 PM PDT, Matthias Kaehlcke <mka@chromium.org> wrote:
>El Thu, Apr 13, 2017 at 04:55:00PM -0700 H. Peter Anvin ha dit:
>
>> On 04/13/17 16:14, Matthias Kaehlcke wrote:
>> > El Mon, Apr 03, 2017 at 04:01:58PM -0700 Matthias Kaehlcke ha dit:
>> > 
>> >> El Fri, Mar 17, 2017 at 04:50:19PM -0700 hpa@zytor.com ha dit:
>> >>
>> >>> On March 16, 2017 5:15:16 PM PDT, Michael Davidson
><md@google.com> wrote:
>> >>>> Suppress clang warnings about potential unaliged accesses
>> >>>> to members in packed structs. This gets rid of almost 10,000
>> >>>> warnings about accesses to the ring 0 stack pointer in the TSS.
>> >>>>
>> >>>> Signed-off-by: Michael Davidson <md@google.com>
>> >>>> ---
>> >>>> arch/x86/Makefile | 5 +++++
>> >>>> 1 file changed, 5 insertions(+)
>> >>>>
>> >>>> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
>> >>>> index 894a8d18bf97..7f21703c475d 100644
>> >>>> --- a/arch/x86/Makefile
>> >>>> +++ b/arch/x86/Makefile
>> >>>> @@ -128,6 +128,11 @@ endif
>> >>>>         KBUILD_CFLAGS += $(call
>cc-option,-maccumulate-outgoing-args)
>> >>>> endif
>> >>>>
>> >>>> +ifeq ($(cc-name),clang)
>> >>>> +# Suppress clang warnings about potential unaligned accesses.
>> >>>> +KBUILD_CFLAGS += $(call cc-disable-warning,
>address-of-packed-member)
>> >>>> +endif
>> >>>> +
>> >>>> ifdef CONFIG_X86_X32
>> >>>> 	x32_ld_ok := $(call try-run,\
>> >>>> 			/bin/echo -e '1: .quad 1b' | \
>> >>>
>> >>> Why conditional on clang?
>> >>
>> >> My understanding is that this warning is clang specific, it is not
>> >> listed on https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
>> > 
>> > Actually this warning affects other platforms besides x86
>> > (e.g. arm64), I'll submit a patch that disables the warning on all
>> > platforms.
>> > 
>> 
>> Drop the ifeq ($(cc-name),clang).
>> 
>> You should assume that if you have to add one of those ifeq's then
>you
>> are doing something fundamentally wrong.
>
>Thanks, however in the case of the global Makefile it seems we should
>put it inside the already existing clang section:
>
>http://lxr.free-electrons.com/source/Makefile#L692
>
>Cheers
>
>Matthias

We shouldn't, unless it will actively break non-clang builds...
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
