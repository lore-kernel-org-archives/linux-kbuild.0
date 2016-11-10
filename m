Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34255 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755282AbcKJMR6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2016 07:17:58 -0500
Received: by mail-lf0-f48.google.com with SMTP id o141so115918038lff.1
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2016 04:17:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4ea0912a-f024-266f-12b6-3945e8c751c6@suse.com>
References: <20161104161407.10354-1-kilobyte@angband.pl> <CAAqcGH=zgWkO4LiF5U22v-mpaaY6ZdabkKrkSDtsrkctp2at=Q@mail.gmail.com>
 <CAAqcGHkn2TbyS1e7Aa_wMZEaJ9AYUNnVsM23ZEbogNHyY0cu0Q@mail.gmail.com> <4ea0912a-f024-266f-12b6-3945e8c751c6@suse.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Thu, 10 Nov 2016 14:17:55 +0200
Message-ID: <CAAqcGHmx-CNLqwDDBS31rB1GC2TikW101sNbfAseNzV5CcxLQQ@mail.gmail.com>
Subject: Re: [PATCH] builddeb: fix cross-building to arm64 producing host-arch debs
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Adam Borowski <kilobyte@angband.pl>, linux-kbuild <linux-kbuild@vger.kernel.org>, regressions@leemhuis.info

On 10 November 2016 at 13:04, Michal Marek <mmarek@suse.com> wrote:
> On 2016-11-10 09:47, Riku Voipio wrote:
>> On 10 November 2016 at 10:24, Riku Voipio <riku.voipio@linaro.org> wrote:
>>> On 4 November 2016 at 18:14, Adam Borowski <kilobyte@angband.pl> wrote:
>>>> Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
>>>> "aarch64".
>>>
>>> I cross-compile arm64 kernels all the time and they come out as arm64.deb.
>>> What exact command are you using to build your kernel to see host arch.deb?
>>
>> OK, I see. UTS_MACHINE use to incorrect, now it has been fixed:
>>
>> commit cfa88c79462d15098db29edebe623428c3620a4b
>> Author: Michal Marek <mmarek@suse.com>
>> Date:   Tue Aug 30 10:31:35 2016 +0200
>>
>>     arm64: Set UTS_MACHINE in the Makefile
>>
>> But that commit caused regression to builddeb since it wasn't updated
>> at the same time.
>
> Sorry about that.
>
>
>> The patch below is correct fix,
>>
>> Acked-by: Riku Voipio <riku.voipio@linaro.org>
>>
>>>> ---
>>>>  scripts/package/builddeb | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>>>> index 8ea9fd2..3c575cd0 100755
>>>> --- a/scripts/package/builddeb
>>>> +++ b/scripts/package/builddeb
>>>> @@ -51,7 +51,7 @@ set_debarch() {
>>>>                 debarch=hppa ;;
>>>>         mips*)
>>>>                 debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
>>>> -       arm64)
>>>> +       aarch64|arm64)
>>>>                 debarch=arm64 ;;
>
> UTS_MACHINE is now always aarch64 on this architecture, so maybe stop
> matching "arm64" to avoid confusion?

I was wondering if it might makes sense to keep the arm64 around for a
while, for example if someone reverts the UTS_MACHINE setting patch
from arch/arm64 for unrelated reasons and still tries to build a deb.
But I guess that's a corner case, and it's indeed cleaner without the
arm64 bit. So either way works for me.

Riku
