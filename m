Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:21818 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934790AbeAKPkD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 10:40:03 -0500
MIME-Version: 1.0
In-Reply-To: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com>
References: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Jan 2018 00:39:18 +0900
Message-ID: <CAK7LNAT91ZAOoHR1vQiGSc6puGNQSEYBvdEts1eJquuGE5vdiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: use bool instead of boolean for type
 definition attributes, again
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devel@driverdev.osuosl.org, linux-efi@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matt Fleming <matt@codeblueprint.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

2017-12-16 0:38 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Commit 6341e62b212a ("kconfig: use bool instead of boolean for type
> definition attributes") did treewide replacement of 'boolean', and
> also mentioned the keyword 'boolean' would be dropped later on.
>
> Some years have passed, but it has not happened yet.  Meanwhile, some
> new instances have come up.
>
> I am really going to drop this keyword.  I need to do the replacement
> once again.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kconfig.


-- 
Best Regards
Masahiro Yamada
