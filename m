Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:62319 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261Ab3JZH42 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Oct 2013 03:56:28 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so4996552pab.20
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Oct 2013 00:56:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <526AE051.5020809@gmx.de>
References: <526AD08D.10506@gmx.de>
	<CAMuHMdX+GtHDB5r6-oXyehbemqS36rVE=Agpi0w-6TcCPQotZQ@mail.gmail.com>
	<526AE051.5020809@gmx.de>
Date: Sat, 26 Oct 2013 09:56:28 +0200
Message-ID: <CAMuHMdWotLn5NwtjxL57YVK_X_N1gb2xxB4qd+sciUTJokourQ@mail.gmail.com>
Subject: Re: [uml-devel] RFC: Shouldn't "./linux --version" always print the
 the git commit id
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Toralf_F=C3=B6rster?= <toralf.foerster@gmx.de>
Cc: UML devel <user-mode-linux-devel@lists.sourceforge.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Oct 25, 2013 at 11:19 PM, Toralf Förster <toralf.foerster@gmx.de> wrote:
> On 10/25/2013 10:18 PM, Geert Uytterhoeven wrote:
>> On Fri, Oct 25, 2013 at 10:11 PM, Toralf Förster <toralf.foerster@gmx.de> wrote:
>>> Just realized today the fact, that v3.11 reports just the tag and not
>>> "tag-g<commit id>"

Actually it's "<tag>-<number>-<commit id>", with <number> indicating the
number of commits on top of the tag.

>>
>> You don't have CONFIG_LOCALVERSION_AUTO=y in your .config?
>>
>> Gr{oetje,eeting}s,
>>
> I do :
> tfoerste@n22 ~/devel/linux $ ./linux --showconfig | grep AUTO
> CONFIG_LOCALVERSION_AUTO=y
>
> pls look here :
>
>
> $ ./linux --version
> 3.11.0-00001-g65984ff-dirty
>
> versus
>
> $ git checkout HEAD~1
> Previous HEAD position was 65984ff... um: hostfs: Fix writeback
> HEAD is now at 6e46645... Linux 3.11
>
> $ make -j4 ARCH=um CC="ccache gcc"
> ...
>
> $ ./linux --version
> 3.11.0

If there are no additional commits on top of the tag, no number and commit
ID are printed. I guess the rationale is that tags are global, hence present
in all clones, so there's no need to tell what commit ID the tag corresponds
to.

> which correlates to
>
> $ git describe
> v3.11
>
> $ git describe --long
> v3.11-0-g6e46645

This is not UML-specific. If you want to change this, you have to involve
the kbuild people (CC added).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
