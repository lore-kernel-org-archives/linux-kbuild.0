Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:38780 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750817AbeBPWkX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 17:40:23 -0500
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1ZvA3dk8qRXaF_yjirYTYkvuCggh8x7QU_p+vMxpTPNA@mail.gmail.com>
References: <20180216214117.1947175-1-arnd@arndb.de> <20180216214117.1947175-2-arnd@arndb.de>
 <20180216170346.497114b3@gandalf.local.home> <CAK8P3a1ZvA3dk8qRXaF_yjirYTYkvuCggh8x7QU_p+vMxpTPNA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 16 Feb 2018 23:40:22 +0100
Message-ID: <CAK8P3a1U-FWXOAut9322BoK3H8drRvHh8E8CcsEq7HG2cv635Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] Kconfig: disable PROFILE_ALL_BRANCHES for compile testing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, stable <stable@vger.kernel.org>

On Fri, Feb 16, 2018 at 11:14 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Feb 16, 2018 at 11:03 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
>> On Fri, 16 Feb 2018 22:41:11 +0100
>> Arnd Bergmann <arnd@arndb.de> wrote:
>>
>>> This can easily double the time for compiling a driver but does not
>>> provide any benefit for the compile tester, so it's better left disabled.
>>>
>>> In addition, any 'inline' function that is not also 'static' and that
>>> contains an 'if' causes a warning like
>>>
>>> include/linux/string.h:212:2: note: in expansion of macro 'if'
>>>   if (strscpy(p, q, p_size < q_size ? p_size : q_size) < 0)
>>>   ^~
>>> include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'strcpy' which is not static
>>>
>>> without this patch, and I could not come up with a nice fix for that.
>>> In combination with my patch to always enable 'CONFIG_COMPILE_TEST'
>>> during 'randconfig' builds, we can at least hide these warnings for
>>> most users.
>>
>> This looks like it fixes the same issue that was already fixed and is
>> in Linus's tree.
>>
>>  http://lkml.kernel.org/r/9199446b-a141-c0c3-9678-a3f9107f2750@infradead.org
>>
>> See commit 68e76e034b6b1 ("tracing: Prevent PROFILE_ALL_BRANCHES when
>> FORTIFY_SOURCE=y")
>
> Ah, right. I missed that when I wrote the new changelog text for this old
> patch of mine. It also means I should rebase the patch so it applies
> on mainline, as I still want PROFILE_ALL_BRANCHES to be disabled
> in COMPILE_TEST kernels for the build speed aspect.

I retested on top of that patch and found a couple of other warnings show up
in an allmodconfig build with PROFILE_ALL_BRANCHES:

lib/zstd/decompress.c: In function 'ZSTD_decompressStream':
lib/zstd/decompress.c:416:2: error: argument 1 null where non-null
expected [-Werror=nonnull]
drivers/crypto/qat/qat_common/qat_algs.c: In function 'qat_alg_do_precomputes':
drivers/crypto/qat/qat_common/qat_algs.c:156:7: error: argument 1
range [18446744071562067968, 18446744073709551615] exceeds maximum
object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
drivers/isdn/hardware/eicon/message.c: In function 'mixer_notify_update':
drivers/isdn/hardware/eicon/message.c:11162:54: error: array subscript
is above array bounds [-Werror=array-bounds]
     ((CAPI_MSG *) msg)->info.facility_req.structs[1] =
LI_REQ_SILENT_UPDATE & 0xff;
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/isdn/hardware/eicon/message.c:11163:54: error: array subscript
is above array bounds [-Werror=array-bounds]
     ((CAPI_MSG *) msg)->info.facility_req.structs[2] =
LI_REQ_SILENT_UPDATE >> 8;
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/isdn/hardware/eicon/message.c:11164:54: error: array subscript
is above array bounds [-Werror=array-bounds]
     ((CAPI_MSG *) msg)->info.facility_req.structs[3] = 0;

All those are nonsense AFAICT, and we see them only because the "if()" override
ends up confusing gcc's value-range tracking in the same way it used to cause
lots of -Wmaybe-uninitialized warnings (which we just disable these days
with PROFILE_ALL_BRANCHES).

        Arnd
