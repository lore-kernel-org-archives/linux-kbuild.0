Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:34109 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754748AbbLXKRd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Dec 2015 05:17:33 -0500
Received: by mail-ig0-f182.google.com with SMTP id m11so80853584igk.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Dec 2015 02:17:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1450395897.19696.0.camel@ellerman.id.au>
References: <1450346273-31633-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1450395897.19696.0.camel@ellerman.id.au>
Date: Thu, 24 Dec 2015 18:17:32 +0800
Message-ID: <CAFy1USTM1B_pWuPUun+yrhcHspNUOm9_2giWwJgOaJvgWDsiEA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Create specific kconfig for kselftest
From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-api <linux-api@vger.kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, yann.morin.1998@free.fr, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Mark Brown <broonie@kernel.org>, dvhart@infradead.org, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, Michael

On 12/18/2015 07:44 AM, Michael Ellerman wrote:
> On Thu, 2015-12-17 at 17:57 +0800, Bamvor Jian Zhang wrote:
>
>> There is a discussion about improving the usability of kselftest by
>> creating test-specific kconfig in recent kernel Summit.
>>
>> Patch 1 keep test-specific kconfig fragments inside each selftest so
>> that merge_configs.sh could build up a kernel that can test the
>> specific or all feature(s).
>>
>> Patch 2 add config option(kselftest-mergeconfig) in make file as a
>> helper to merge all the test config dependecies to .config.
>>
>> Changes since v2:
>> 1.  Fix the misuse of objtree and srctree in the
>>     kselftest-mergeconfig target.
>>
>> Changes since v1:
>> 1.  Add kselftest-mergeconfig in scripts/kconfig/Makefile according
>>     to the suggestion from Michael.
>
> Sorry I only just noticed you put it in scripts/kconfig/Makefile. I meant for
> it to go in Makefile, alongside the other kselftest targets.

Do you mean "tools/testing/selftest/Makefile"? I try to do it but I could not
get the objtree and srctree if it is called directly(objtree and srctree is
defined in toplevel Makefile)
> make -C tools/testing/selftests kselftest-mergeconfig
make: Entering directory
'/home/bamvor/works/source/kernel/linux/tools/testing/selftests'
Makefile:112: *** No .config exists, config your kernel first!.  Stop.
make: Leaving directory
'/home/bamvor/works/source/kernel/linux/tools/testing/selftests'

Suggestions?

Regards

Bamvor

> cheers
>
