Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38918 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755063AbcKJLXt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2016 06:23:49 -0500
Subject: Re: [PATCH] builddeb: fix cross-building to arm64 producing host-arch
 debs
References: <20161104161407.10354-1-kilobyte@angband.pl>
 <CAAqcGH=zgWkO4LiF5U22v-mpaaY6ZdabkKrkSDtsrkctp2at=Q@mail.gmail.com>
 <CAAqcGHkn2TbyS1e7Aa_wMZEaJ9AYUNnVsM23ZEbogNHyY0cu0Q@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <4ea0912a-f024-266f-12b6-3945e8c751c6@suse.com>
Date: Thu, 10 Nov 2016 12:04:38 +0100
MIME-Version: 1.0
In-Reply-To: <CAAqcGHkn2TbyS1e7Aa_wMZEaJ9AYUNnVsM23ZEbogNHyY0cu0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>, Adam Borowski <kilobyte@angband.pl>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, regressions@leemhuis.info

On 2016-11-10 09:47, Riku Voipio wrote:
> On 10 November 2016 at 10:24, Riku Voipio <riku.voipio@linaro.org> wrote:
>> On 4 November 2016 at 18:14, Adam Borowski <kilobyte@angband.pl> wrote:
>>> Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
>>> "aarch64".
>>
>> I cross-compile arm64 kernels all the time and they come out as arm64.deb.
>> What exact command are you using to build your kernel to see host arch.deb?
> 
> OK, I see. UTS_MACHINE use to incorrect, now it has been fixed:
> 
> commit cfa88c79462d15098db29edebe623428c3620a4b
> Author: Michal Marek <mmarek@suse.com>
> Date:   Tue Aug 30 10:31:35 2016 +0200
> 
>     arm64: Set UTS_MACHINE in the Makefile
> 
> But that commit caused regression to builddeb since it wasn't updated
> at the same time.

Sorry about that.


> The patch below is correct fix,
> 
> Acked-by: Riku Voipio <riku.voipio@linaro.org>
> 
>>> ---
>>>  scripts/package/builddeb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>>> index 8ea9fd2..3c575cd0 100755
>>> --- a/scripts/package/builddeb
>>> +++ b/scripts/package/builddeb
>>> @@ -51,7 +51,7 @@ set_debarch() {
>>>                 debarch=hppa ;;
>>>         mips*)
>>>                 debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
>>> -       arm64)
>>> +       aarch64|arm64)
>>>                 debarch=arm64 ;;

UTS_MACHINE is now always aarch64 on this architecture, so maybe stop
matching "arm64" to avoid confusion?

Thanks,
Michal

