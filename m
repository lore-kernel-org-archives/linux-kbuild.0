Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53452 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKEOx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 00:14:53 -0400
MIME-Version: 1.0
References: <20190709132639.26802-1-geert@linux-m68k.org> <20190709163042.GA28716@infradead.org>
In-Reply-To: <20190709163042.GA28716@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Jul 2019 13:14:03 +0900
Message-ID: <CAK7LNARKaj9Tw+Am0hvQOOW8ZTh_LvY-tSPoZjvJWez4RaOPQA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Inform user to pass ARCH= for make mrproper
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jul 10, 2019 at 1:30 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> Is there any chance we could save ARCH in .config?  That would make
> cross compile builds so much easier..  Same for CROSS_COMPILE.


Then, I have no idea how "make clean", "make help", etc. should work.

If a user has configured the kernel, do they work for CONFIG_ARCH
stored in the .config file or still for the host-arch?

If not yet, do they fall-back to host-arch?



-- 
Best Regards
Masahiro Yamada
