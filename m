Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49]:34357 "EHLO
	mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261AbbIOEHH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Sep 2015 00:07:07 -0400
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <55F7931F.2020100@converseincode.com>
References: <1442287188-11326-1-git-send-email-sedat.dilek@gmail.com>
	<55F7931F.2020100@converseincode.com>
Date: Tue, 15 Sep 2015 06:07:06 +0200
Message-ID: <CA+icZUX5D__B6sP5YYZn1+Yob+aq+g586-ZAeiN0NpjxpChraw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: llvmlinux: Set appropriate compiler-flag for CONFIG_CC_OPTIMIZE_FOR_SIZE
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 15, 2015 at 5:40 AM, Behan Webster
<behanw@converseincode.com> wrote:
> Other than you changing the commit comment, this *is* my patch.
>

You were mentioned in the commit-message as original author.

> I haven't upstreamed this patch yet because we are still characterizing its
> effects on other architectures.
>

Then embed this information into the changelog of *your* patch.

> Clang certainly doesn't require -Oz to be used to be able to boot for arm
> nor arm64. So the commit message isn't correct either.
>

Read my changelog carefully - I reported success on AMD64.

So what is *your* solution in case of CONFIG_CC_OPTIMIZE_FOR_SIZE=y
(OptLevel '-Os' is wrong, '-Oz' is correct)?

Hack around with BROKEN Kconfig keyword :-)...

[ init/Kconfig ]
...
config CC_OPTIMIZE_FOR_SIZE
        bool "Optimize for size"
        help
          Enabling this option will pass "-Os" instead of "-O2" to
          your compiler resulting in a smaller kernel.

          If unsure, say N.
...

Or at least document it in the official upstream Linux-kernel as clang
supported landed there.
Document BROKEN kernel-options with llvmlinux (clang).
Do you have a doc-file in Documentation-dir?

- Sedat -

>
> On 09/14/15 21:19, Sedat Dilek wrote:
>>
>> Based on a patch of Behan Webster (see [1]).
>>
>> CLANG (here: v3.7) requires '-Oz' as OptLevel to be set.
>>
>> A Linux v4.3-rc1 kernel built fine with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>> and boots on bare metal.
>> This is a Ubuntu/precise AMD64 system.
>>
>> Tested against Linux v4.3-rc1 and a refreshed llvmlinux patchset.
>>
>> [1]
>> http://git.linuxfoundation.org/?p=llvmlinux.git;a=blob;f=arch/all/patches/smaller.patch
>>
>> CC: Behan Webster <behanw@converseincode.com>
>> ---
>>   Makefile | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 4249441e535d..a57fb6b39ed7 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -622,7 +622,8 @@ KBUILD_CFLAGS       += $(call
>> cc-option,-fno-delete-null-pointer-checks,)
>>   endif
>>     ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
>> -KBUILD_CFLAGS  += -Os $(call cc-disable-warning,maybe-uninitialized,)
>> +KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
>> +KBUILD_CFLAGS  += $(call cc-disable-warning,maybe-uninitialized,)
>>   else
>>   KBUILD_CFLAGS += -O2
>>   endif
>
>
>
> --
> Behan Webster
> behanw@converseincode.com
>
