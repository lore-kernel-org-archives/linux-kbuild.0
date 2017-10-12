Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:32081 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752509AbdJLBCJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2017 21:02:09 -0400
MIME-Version: 1.0
In-Reply-To: <1507091240-12756-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507091240-12756-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Oct 2017 10:01:23 +0900
Message-ID: <CAK7LNAQm6RKQWzy+ZPO5u2qgH8qj1Rz9ONh3Cqe4+xnVWi8tvA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix dependency of dtbs targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ley Foon Tan <lftan@altera.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, nios2-dev@lists.rocketboards.org, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

2017-10-04 13:27 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The target "dtbs" should depend on "scripts" because it needs to
> build dtc.  The "prepare" target is unneeded here.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
