Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:53703 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753158AbdKMQF7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 11:05:59 -0500
Subject: Re: [PATCH] sh: select KBUILD_DEFCONFIG depending on ARCH
References: <1509644432-21252-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNATw7iTKy2VLUd0toiKO7q8SuCTVRdSkhceANHuTPj93hw@mail.gmail.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <49c4f436-d58c-d44f-ddce-3a18b38c7d0b@physik.fu-berlin.de>
Date: Mon, 13 Nov 2017 16:57:20 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNATw7iTKy2VLUd0toiKO7q8SuCTVRdSkhceANHuTPj93hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 11/13/2017 04:26 PM, Masahiro Yamada wrote:
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> 
> Applied to linux-kbuild/kbuild.
Thanks for this. The linux-sh maintainers are currently falling behind
a bit, so I'm glad someone still takes care of these updates.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
