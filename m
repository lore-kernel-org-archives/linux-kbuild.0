Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42057 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751347AbeETIWE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 May 2018 04:22:04 -0400
MIME-Version: 1.0
In-Reply-To: <1e943db9-1340-2a23-be43-2bde85e3535b@infradead.org>
References: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
 <1526619146-1895-5-git-send-email-yamada.masahiro@socionext.com> <1e943db9-1340-2a23-be43-2bde85e3535b@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 20 May 2018 17:21:16 +0900
Message-ID: <CAK7LNAQ7p7TD2_qVCbdAjLKjpYYoaDWx-73Xqba__Ub6zwsJcQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] kconfig: refactor ncurses package checks for building mconf
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

2018-05-20 3:02 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 05/17/18 21:52, Masahiro Yamada wrote:
>> The mconf (or its infrastructure, lxdiaglog) depends on ncurses.
>> check-lxdialog.sh has additional checks in case pkg-config is not
>> available.  However, qconf and gconf already rely on pkg-config to
>> check necessary packages.  For simplification, drop the fallback
>> code from check-lxdialog.sh and move/rename to mconf-cfg.sh to
>> make it work in the same way as the other GUI frontends.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Hi,
>
> I began by testing "make menuconfig" first and immediately got this:
>
> *
> * Unable to find the ncurses.
> * Install ncurses (ncurses-devel or libncurses-dev
> * depending on your distribution)
> *
>
> I do have ncurses-devel installed.  However, it seems that
> pkg-config on openSUSE is not very reliable.  zypper (package management
> tool) says:


Oh, this is unfortunate.

I was eager to use pkg-config only,
but I do not want to cause troubles.

Could you check v2, please?



-- 
Best Regards
Masahiro Yamada
