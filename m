Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:56802 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752474AbdEMPXC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 May 2017 11:23:02 -0400
MIME-Version: 1.0
In-Reply-To: <20170513113126.13281-1-x-linux@infra-silbe.de>
References: <20170513113126.13281-1-x-linux@infra-silbe.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 14 May 2017 00:22:56 +0900
Message-ID: <CAK7LNASc7NgthfZCWFT=3FhRQxxJuuzDVjT8GHik5A0+zBVxpw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add ARM support for tar-pkg
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sascha Silbe <x-linux@infra-silbe.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-05-13 20:31 GMT+09:00 Sascha Silbe <x-linux@infra-silbe.de>:
> The fallback code for "unknown" architectures doesn't work on ARM
> because for ARM (and a couple of other architectures) KBUILD_IMAGE
> contains only the file name, not the full path. Having an explicit
> rule also avoids printing the warning for unknown architectures.
>
> Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
> ---

Now KBUILD_IMAGE contains the full path for all architectures.


Please check the following commit.

commit 152e6744ebfc8fa6cc9fff4ba36271f5f1ba2821
Author: Michal Marek <mmarek@suse.com>
Date:   Tue Nov 22 22:34:30 2016 +0100

    arm: Use full path in KBUILD_IMAGE definition



-- 
Best Regards
Masahiro Yamada
