Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:32833 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932278AbcECCMd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 May 2016 22:12:33 -0400
Received: by mail-oi0-f50.google.com with SMTP id v145so8401359oie.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 May 2016 19:12:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1535117.FXDhxv6m8v@wuerfel>
References: <57267469.8ade420a.aec17.ffffc1ee@mx.google.com>
	<CAOesGMiwACS7Gq41c1p58h_Uj1RBz-_g-BQFZwgRTaKs6QwmvQ@mail.gmail.com>
	<1535117.FXDhxv6m8v@wuerfel>
Date: Mon, 2 May 2016 19:12:31 -0700
Message-ID: <CAOesGMgb=Z1hjKaEG96dOpvKuEFOJQ=TQB_Dag0C-AXNBNTTgg@mail.gmail.com>
Subject: Re: mainline build: 896 warnings 1 failures (mainline/v4.6-rc5-224-gda9373d)
From: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, Olof's autobuilder <build@lixom.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 2, 2016 at 12:24 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sunday 01 May 2016 16:19:53 Olof Johansson wrote:
>> On Sun, May 1, 2016 at 2:26 PM, Olof's autobuilder <build@lixom.net> wrote:
>> > Here are the build results from automated periodic testing.
>> >
>> > The tree being built was mainline, found at:
>> >
>> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git (master branch)
>> >
>> > Topmost commit:
>> >
>> > da9373d Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal
>> >
>> > Build logs (stderr only) can be found at the following link (experimental):
>> >
>> > http://arm-soc.lixom.net/buildlogs/mainline/v4.6-rc5-224-gda9373d/
>> >
>> >
>> >         Runtime:                5m 0s
>> >
>> >         Passed:                 117
>> >         Failed:                 1
>> >
>> >         Warnings:               896
>> >
>> >         Section mismatches:     0
>>
>> So, yeah, I updated to GCC 6.1.0 and it looks noisy. If it doesn't get
>> whittled down pretty quickly I might switch to an older compiler
>> again.
>
> Oops, it looks like I never submitted a patch to shut up
> -Wunused-const-variable, though I've been building that way
> myself here and fixing all /other/ warnings.
>
> I think we want to have -Wunused-const-variable at the W=1 level, but
> not by default.

Agreed, at least as long as it is as noisy as it is today.

Care to send it in so we can see it in 4.6?

-Olof
