Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43219 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgBFBye (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 20:54:34 -0500
MIME-Version: 1.0
References: <20200203164708.17478-1-masahiroy@kernel.org> <CAHk-=wiERN+VgxBEOUKMhZFG-yAvVjmDSZXGR22vQBZETQ75yg@mail.gmail.com>
In-Reply-To: <CAHk-=wiERN+VgxBEOUKMhZFG-yAvVjmDSZXGR22vQBZETQ75yg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Feb 2020 10:53:44 +0900
Message-ID: <CAK7LNAREEkuZeXXzGbtemZ=A-YX6Jn6WOtD0azBxaiDiOxLp2w@mail.gmail.com>
Subject: Re: [PATCH] initramfs: do not show compression mode choice if
 INITRAMFS_SOURCE is empty
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Hi Linus,

On Tue, Feb 4, 2020 at 2:35 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Feb 3, 2020 at 4:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > This commit hides the Kconfig choice in that case. The default cpio
> > is embedded without compression, which was the original behavior.
>
> Btw, is there any way to figure out automatically what the initrd
> compression is (for the external case)?
>
> Because I think it would be lovely to be able to have sane defaults
> for the CONFIG_RD_xyz things.
>
> I'm assuming the answer is "no", simply because it comes from distro
> installs, but I thought I'd check.

I think the answer is no.

For external initrd, it is up to distros,
and we have no way to know the compression type beforehand.

We know it after booting.

init/initramfs.c has the following line:
pr_debug("Detected %s compressed data\n", compress_name);



-- 
Best Regards
Masahiro Yamada
