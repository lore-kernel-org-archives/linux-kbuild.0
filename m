Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:39209 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfDGEdC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Apr 2019 00:33:02 -0400
MIME-Version: 1.0
References: <38a457e5-ed95-f71b-3f31-fb54ba1b4da7@afaics.de>
In-Reply-To: <38a457e5-ed95-f71b-3f31-fb54ba1b4da7@afaics.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 7 Apr 2019 13:32:10 +0900
Message-ID: <CAK7LNATyKv3oMF7fnGr9+itBLgXEG+YGe=nAbckPz4=R=QjTWg@mail.gmail.com>
Subject: Re: 5.0.7 regression: .config file not found
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Harald Dunkel <harri@afaics.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

(+CC linux-stable, Greg)

On Sun, Apr 7, 2019 at 2:39 AM Harald Dunkel <harri@afaics.de> wrote:
>
> Hi folks,
>
> Since 5.0.7 I get a message at build time about a missing .config file.
> The result of make oldconfig has been lost somehow. 5.0.6 builds fine.
>
> Sample session is attached.



Thanks for the report.


I think the problem will be fixed
by back-porting the following commit:



commit 175209cce23d6b0669ed5366add2517e26cd75cd
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu Feb 14 12:05:14 2019 +0900

    kbuild: pkg: use -f $(srctree)/Makefile to recurse to top Makefile

    '$(MAKE) KBUILD_SRC=' changes the working directory back and forth
    between objtree and srctree.

    It is better to recurse to the top-level Makefile directly.

    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>





-- 
Best Regards
Masahiro Yamada
