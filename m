Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:49196 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751305Ab3JZKGL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Oct 2013 06:06:11 -0400
Received: from [92.224.82.115] ([92.224.82.115]) by mail.gmx.com (mrgmx002)
 with ESMTPSA (Nemesis) id 0LskKv-1VgJPU3zrt-012EYi for
 <linux-kbuild@vger.kernel.org>; Sat, 26 Oct 2013 12:06:10 +0200
Message-ID: <526B940F.5090803@gmx.de>
Date: Sat, 26 Oct 2013 12:06:07 +0200
From: =?UTF-8?B?VG9yYWxmIEbDtnJzdGVy?= <toralf.foerster@gmx.de>
MIME-Version: 1.0
Subject: Re: [uml-devel] RFC: Shouldn't "./linux --version" always print the
 the git commit id
References: <526AD08D.10506@gmx.de>	<CAMuHMdX+GtHDB5r6-oXyehbemqS36rVE=Agpi0w-6TcCPQotZQ@mail.gmail.com>	<526AE051.5020809@gmx.de> <CAMuHMdWotLn5NwtjxL57YVK_X_N1gb2xxB4qd+sciUTJokourQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWotLn5NwtjxL57YVK_X_N1gb2xxB4qd+sciUTJokourQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: UML devel <user-mode-linux-devel@lists.sourceforge.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 10/26/2013 09:56 AM, Geert Uytterhoeven wrote:
> On Fri, Oct 25, 2013 at 11:19 PM, Toralf Förster <toralf.foerster@gmx.de> wrote:
>> On 10/25/2013 10:18 PM, Geert Uytterhoeven wrote:
>>> On Fri, Oct 25, 2013 at 10:11 PM, Toralf Förster <toralf.foerster@gmx.de> wrote:
>>>> Just realized today the fact, that v3.11 reports just the tag and not
>>>> "tag-g<commit id>"
> 
> Actually it's "<tag>-<number>-<commit id>", with <number> indicating the
> number of commits on top of the tag.
> 
>>>
>>> You don't have CONFIG_LOCALVERSION_AUTO=y in your .config?
>>>
>>> Gr{oetje,eeting}s,
>>>
>> I do :
>> tfoerste@n22 ~/devel/linux $ ./linux --showconfig | grep AUTO
>> CONFIG_LOCALVERSION_AUTO=y
>>
>> pls look here :
>>
>>
>> $ ./linux --version
>> 3.11.0-00001-g65984ff-dirty
>>
>> versus
>>
>> $ git checkout HEAD~1
>> Previous HEAD position was 65984ff... um: hostfs: Fix writeback
>> HEAD is now at 6e46645... Linux 3.11
>>
>> $ make -j4 ARCH=um CC="ccache gcc"
>> ...
>>
>> $ ./linux --version
>> 3.11.0
> 
> If there are no additional commits on top of the tag, no number and commit
> ID are printed. I guess the rationale is that tags are global, hence present
> in all clones, so there's no need to tell what commit ID the tag corresponds
> to.
> 
>> which correlates to
>>
>> $ git describe
>> v3.11
>>
>> $ git describe --long
>> v3.11-0-g6e46645
> 
> This is not UML-specific. If you want to change this, you have to involve
> the kbuild people (CC added).
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

Well, the reationale behind my idea comes from the (stupid) logic of one
of my bisect scripts. I used there the commit id derived from the UML
linux exe as a suffix for gdb back trace files created during the bisect
process.
Sure - logic can be easily adapted and was in the mean while.
But IMO it would be more stringent to have always the commit id
presented in the version string for similar cases.

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
MfG/Sincerely
Toralf Förster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
