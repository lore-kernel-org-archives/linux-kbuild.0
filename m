Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37914 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729438AbfIINnr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 09:43:47 -0400
MIME-Version: 1.0
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <20190909105317.20473-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190909105317.20473-2-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 Sep 2019 15:43:29 +0200
Message-ID: <CAK8P3a0XX_ZZNgZcU=PucJ3-aJccR80mBnTpgpGNew_mOUv8-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] export.h, genksyms: do not make genksyms calculate
 CRC of trimmed symbols
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Nicolas Pitre <nico@fluxnic.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Sep 9, 2019 at 12:53 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Since commit 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
> functions"), it is harmful because the bogus __crc* symbols make
> modpost call sym_update_crc(), and then new_symbol(), but there is
> no one that clears the ->is_static member.
>
> I gave Fixes to the first commit that uncovered the issue, but the
> potential problem has long existed since commit f235541699bc
> ("export.h: allow for per-symbol configurable EXPORT_SYMBOL()").
>
> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Tested-by: Arnd Bergmann <arnd@arndb.de>

Thanks for providing a proper fix!

       Arnd
