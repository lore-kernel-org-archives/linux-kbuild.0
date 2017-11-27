Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56776 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752101AbdK0KqN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 05:46:13 -0500
Received: from mail-ot0-f197.google.com ([74.125.82.197])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1eJGvT-00067x-An
        for linux-kbuild@vger.kernel.org; Mon, 27 Nov 2017 10:46:11 +0000
Received: by mail-ot0-f197.google.com with SMTP id z30so15704344otd.9
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2017 02:46:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS0ieC+e0v+Gq-84_bJk-vZL2QHpRAjVePiPUEsVsJJ6g@mail.gmail.com>
References: <1505211091-19295-1-git-send-email-paolo.pisati@canonical.com> <CAK7LNAS0ieC+e0v+Gq-84_bJk-vZL2QHpRAjVePiPUEsVsJJ6g@mail.gmail.com>
From: Paolo Pisati <paolo.pisati@canonical.com>
Date: Mon, 27 Nov 2017 11:46:09 +0100
Message-ID: <CAMsH0TT2nPnT885GqcrK2aoHtXTBqCmDSkL=ZLkfumzonFCbJA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Sep 20, 2017 at 11:28 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>> @@ -0,0 +1,14 @@
>> +name: kernel
>> +version: KERNELRELEASE
>> +summary: Linux kernel
>> +description: The upstream Linux kernel
>> +grade: stable
>> +confinement: strict
>> +type: kernel
>> +
>> +parts:
>> +  kernel:
>> +    plugin: kernel
>> +    source: SRCTREE
>> +    source-type: git
>> +    kconfigfile: SRCTREE/.config
>
>
> Other targets such as rpm-pkg and deb-pkg
> work without relying on git.
>
> However, snap-pkg every time does "git clone", so
> changes added to the source tree, but not committed yet,
> are not reflected to the package.
>
> Is it possible to work with a tarball,
> like other targets do?

Thanks for your feedback Yamada-san.

Yes, switching to a tarball is doable and i'll send a v3 with that change.
-- 
bye,
p.
