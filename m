Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32098 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGINe4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 09:34:56 -0400
MIME-Version: 1.0
References: <20190709132639.26802-1-geert@linux-m68k.org>
In-Reply-To: <20190709132639.26802-1-geert@linux-m68k.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Jul 2019 22:34:09 +0900
Message-ID: <CAK7LNAQaoaovbRmOqc80XF_EcwzE5Sju3ZXQDYSkQGSabxQj_A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Inform user to pass ARCH= for make mrproper
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jul 9, 2019 at 10:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> When cross-compiling an out-of-tree build with an unclean source tree
> directory, the build fails with:
>
>   /path/to/kernel/source/tree is not clean, please run 'make mrproper'
>   in the '/path/to/kernel/source/tree' directory.
>
> However, doing so does not fix the problem, as "make mrproper" now
> requires passing the target architecture to the make command, else it
> won't remove $(srctree)/arch/$(SRCARCH)/include/generated.
> "git ls-files -o" doesn't give a clue, as it doesn't list (empty)
> directories, only files.
>
> Improve usability by including the ARCH= option in the error output.
>
> Fixes: a788b2ed81abeb94 ("kbuild: check arch/$(SRCARCH)/include/generated before out-of-tree build")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Applied to linux-kbuild. Thanks.



-- 
Best Regards
Masahiro Yamada
