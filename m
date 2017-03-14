Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:33893 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752553AbdCNUwk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2017 16:52:40 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNARZHL9Pz0bo8hzs459u=NExJ5UdsAeerVjL6bjyGw6sqw@mail.gmail.com>
References: <201701131834.BsUjtXaC%fengguang.wu@intel.com> <20170113154010.2718601-1-arnd@arndb.de>
 <CAK7LNARZHL9Pz0bo8hzs459u=NExJ5UdsAeerVjL6bjyGw6sqw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Mar 2017 21:52:38 +0100
Message-ID: <CAK8P3a2g_ZYXLZsE-m8YsG2PLKKm=rhHMtoOF6GFx-6+Bzf2uQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: use cc-disable-warning consistently for maybe-uninitialized
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, kbuild-all@01.org, stable@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 14, 2017 at 5:17 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Arnd,
>
> 2017-01-14 0:40 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> In commit a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized warning
>> for "make W=1""), I reverted another change that happened to fix a problem
>> with old compilers, and now we get this report again with old compilers
>> (prior to gcc-4.8) and GCOV enabled:
>>
>>    cc1: warnings being treated as errors
>>    drivers/gpu/drm/i915/intel_ringbuffer.c: In function 'intel_ring_setup_status_page':
>>    drivers/gpu/drm/i915/intel_ringbuffer.c:438: error: 'mmio.reg' may be used uninitialized in this function
>>    At top level:
>>>> cc1: error: unrecognized command line option "-Wno-maybe-uninitialized"
>>
>> The problem is that we turn off the warning conditionally in a number
>> of places as we should, but one of them does it unconditionally.
>> Instead, change it to call cc-disable-warning as we do elsewhere.
>>
>> The original patch that caused it was merged into linux-4.7, then
>> 4.8 removed the change and 4.9 brought it back, so we probably want
>> a backport to 4.9 once this is merged.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized warning for "make W=1"")
>> Fixes: e72e2dfe7c16 ("gcov: disable -Wmaybe-uninitialized warning")
>> Reported-by: kbuild test robot <fengguang.wu@intel.com>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>
> Applied to linux-kbuild/fixes.

Thanks!

> But, please let me ask one question.
>
> When I was checking your commit a76bcf557ef4,
> I noticed the following code:
>
>
> KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
>                        $(call cc-disable-warning,maybe-uninitialized,))
>
>
>
> It was not clear to me where this comes from
> because it is not the revert of Linus' commit.
>
>
> My best guess is:
> maybe-uninitialized was introduced by gcc 4.7,
> but only reliable for gcc 4.9 or later.
> So it should be disabled for gcc < 4.9
>
>
> Is this correct?

Yes. Actually this warning is by definition not reliable, but gcc-4.9
got a lot better than earlier versions, and the set of false positives
in 4.9 is different from the one in 4.8, which introduced the flag.
As most people have 4.9 or higher, it makes sense to address all
the warnings found by that version by modifying the code (either
fixing bugs or working around false positives), but to just disable it
for 4.8 and earlier.

In older compiler versions, -Wuninitialized controlled both the
"definitely uninitialized" and the "possibly uninitialized" warnings,
and also had a lot of false positives, but 4.7 and earlier also
prouce lots of other warnings. I try to get a warning free build with
4.8 and higher but don't even try for old versions at the moment,
though I have an idea for how we could do that too.

        Arnd
