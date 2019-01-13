Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25547 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfAMD4F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jan 2019 22:56:05 -0500
MIME-Version: 1.0
References: <1547175108-14744-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547175108-14744-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 13 Jan 2019 12:55:05 +0900
Message-ID: <CAK7LNAT6fB=97RMmxNxEc4vAJL8+3pS4SSpa8ntKXGqRAvPUSA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: clean generated *conf-cfg files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 11, 2019 at 2:12 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I accidentally dropped '*' in the previous renaming patch.
>
> Revive it so that 'make mrproper' can clean the generated files.
>
> Fixes: d86271af6460 ("kconfig: rename generated .*conf-cfg to *conf-cfg")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild/fixes.




-- 
Best Regards
Masahiro Yamada
