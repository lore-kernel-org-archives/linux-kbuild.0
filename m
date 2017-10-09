Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:55170 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755080AbdJIQog (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 12:44:36 -0400
MIME-Version: 1.0
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 10 Oct 2017 01:43:48 +0900
Message-ID: <CAK7LNARZcmP1etAESP5m9CtfkJRCC6ODeAHgL6QH43xeOf=+9Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] kbuild: rpm-pkg: remove ppc64 specific image handling
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-09-30 10:10 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This conditional was added by commit 1a0f3d422bb9 ("kbuild: fix
> make rpm for powerpc").  Its git-log explains the default kernel
> image is zImage, but obviously the current arch/powerpc/Makefile
> does not set KBUILD_IMAGE, so the image file is actually vmlinux.
>
> Moreover, since commit 09549aa1baa9 ("deb-pkg: Remove the KBUILD_IMAGE
> workaround"), all architectures are supposed to set the full path to
> the image in KBUILD_IMAGE.  I see no good reason to differentiate
> ppc64 from others.  Rip off the conditional.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


The series, applied to linux-kbuild/misc.



-- 
Best Regards
Masahiro Yamada
