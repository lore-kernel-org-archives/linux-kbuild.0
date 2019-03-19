Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:29879 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfCSEKo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Mar 2019 00:10:44 -0400
MIME-Version: 1.0
References: <1552036419-924-1-git-send-email-yamada.masahiro@socionext.com> <mvm7ecwqz87.fsf@suse.de>
In-Reply-To: <mvm7ecwqz87.fsf@suse.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Mar 2019 13:09:43 +0900
Message-ID: <CAK7LNARKGYm0fO1BR83RdCWtxNj4dWBAVAw-JHXxCrRON986kw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add workaround for Debian make-kpkg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Manoj Srivastava <srivasta@debian.org>, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Manoj Srivastava <manoj.srivastava.1962@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Andreas,

On Mon, Mar 18, 2019 at 7:00 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On M=C3=A4r 08 2019, Masahiro Yamada <yamada.masahiro@socionext.com> wrot=
e:
>
> > +$(warning Do not include top Makefile of Linux Kernel)
>
> So how do I add additional targets then?  Currently I create
> GNUmakefile, include Makefile, then add the targets I need.  It seems
> this is now broken.


---------(GNUmakefile BEGIN)-----------
your-own-target1:
        echo hello

your-own-target2:
        echo world

# For the rest, fall back to the kernel Makefile
%:
        $(MAKE) -f Makefile $@
---------(GNUmakefile END)-----------



Having said that, my previous cheesy workaround sucks.

How about this patch?
https://patchwork.kernel.org/patch/10858809/

I hope you will be able to wrap the top Makefile again.



--=20
Best Regards
Masahiro Yamada
