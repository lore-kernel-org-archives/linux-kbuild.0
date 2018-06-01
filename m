Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:43155 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751311AbeFALJU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jun 2018 07:09:20 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNATn-1zkbVwaSEzKATioGUF0w7-yTNndzDONMfe9QOTnAg@mail.gmail.com>
References: <1527499328-13213-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNATmbiigNnPmfwOgMHqxyTOJ0H4ROMAfHZKqRxYN+W-=1w@mail.gmail.com>
 <CAK7LNAT0S-4qq1T3q25H0BGsJSUpTsgV_+TGKBiPW-MUKyqzsQ@mail.gmail.com>
 <CAK8P3a0SSJCK36JWxMuTWX1vCF4y7Rys8QL=_nz6syPsR_+c=w@mail.gmail.com> <CAK7LNATn-1zkbVwaSEzKATioGUF0w7-yTNndzDONMfe9QOTnAg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 1 Jun 2018 13:09:19 +0200
Message-ID: <CAK8P3a2k6X0OV4npY=5Tc2wED9CDy1dBMUyz4c4QEYLo+BW5yA@mail.gmail.com>
Subject: Re: [PATCH v5 00/31] kconfig: move compiler capability tests to Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Fri, Jun 1, 2018 at 12:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-06-01 17:31 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> On Wed, May 30, 2018 at 2:38 AM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> 2018-05-28 21:23 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>>>> 2018-05-28 18:21 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>
> In the original scripts/Makefile.gcc-plugins,
> the parameters to scripts/gcc-plugin.sh were quoted by "..."
>
> I need to keep quoting.
> https://patchwork.kernel.org/patch/10442941/
>
> Hmm, too much quoting is messy.
> It works though...

Ok, confirmed it fixes the problem for me.

      Arnd
