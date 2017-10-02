Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:57739 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750891AbdJBJAi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2017 05:00:38 -0400
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com [209.85.161.174]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id v9290Tv7006955
        for <linux-kbuild@vger.kernel.org>; Mon, 2 Oct 2017 18:00:30 +0900
Received: by mail-yw0-f174.google.com with SMTP id w9so3209638ywi.11
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Oct 2017 02:00:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHmnKMZcHXt-Uf0ka5rZbELptiSGw8CZ9awmv+RW2E60AA@mail.gmail.com>
References: <1506159583-18894-1-git-send-email-riku.voipio@linaro.org>
 <CAK7LNASgbbG2XT-Vs5Sx242mJ1-vjA6dEe24dW1mD-hzh8JEbw@mail.gmail.com> <CAAqcGHmnKMZcHXt-Uf0ka5rZbELptiSGw8CZ9awmv+RW2E60AA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 2 Oct 2017 17:59:48 +0900
Message-ID: <CAK7LNAT+4e6osjuRokNfSTXD81Gat7=M1297BoYTy9adqGDJGQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>

Hi Riku,


2017-10-02 16:21 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
>   On 29 September 2017 at 12:36, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Hi Riku,
>>
>>
>> 2017-09-23 18:39 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
>>> Move debian/ directory generation out of builddeb to a new script,
>>> mkdebian. The package build commands are kept in builddeb, which
>>> is now and internal command called from debian/rules.
>>>
>>> With these changes in place, we can now use dpkg-buildpackage from
>>> deb-pkg and bindeb-pkg removing need for handrolled source/changes
>>> generation.
>>>
>>> This patch is based on the criticism of the current state of builddeb
>>> discussed on:
>>>
>>> https://patchwork.kernel.org/patch/9656403/
>>>
>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>
>>
>> Sorry for delay.
>>
>> When I was testing this patch, I was hit by a problem
>> when building the package with a parallel option.
>>
>> Did you see the problem as below?
>>
>>
>> Please try this:
>>
>> make defconfig
>> make -j8 bindeb-pkg
>
>> This stalled on my build machine due to too many jobs.
>
> I couldn't reproduce this. Which versions of dpkg and make do you have
> ? I'm using debian stable for testing now, but will try new
> combinations.



I use dpkg-buildpackage bundled with Ubuntu 16.04

masahiro@pug:~/workspace/linux$ dpkg-buildpackage  --version | head -1
Debian dpkg-buildpackage version 1.18.4.


But, I think it depends on GNU Make version.


For Make 4.1 or older,

make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.

is displayed.  And submake is run in a single thread.



For Make 4.2 or newer, I do not see the warning.
Instead, my build machine stalled.



>>> +build:
>>> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=
>>
>> The problem is here.
>>
>> If I invoked "make -j<N> bindeb-pkg",
>> I see -j in MAKEFLAGS.   (<N> is missing)
>
> I think MAKEFLAGS is special, it will always show -j without <N> when inspected.


I do not think so.

When I inspect MAKEFILE, -j is usually displayed with <N>,
but not here.



>> I am not sure if this is a bug of dpkg-buildpackage or not.
>
> I think the we can live without the parallel= parsing. We'll support
> two usecases:
> 1. make -jX bindeb-pkg
> export the MAKEFLAGS down with + and tell dpkg-buildpackage to do
> nothing with -j1
> 2. dpkg-buidpackage -jX
> now dpkg-buildpackage will set the MAKEFLAGS and user will get parallel builds
>
> This leaves two unsupported ways
> 3. Users who set DEB_BUILD_OPTIONS=parallel=X wont get parallel builds
> 4. The new "dpkg-buildpackage -J auto" will also get serial builds
>
> Pre-refactoring, only case #1 worked, so I think this is acceptable.
>
> https://manpages.debian.org/stretch/dpkg-dev/dpkg-buildpackage.1.en.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
