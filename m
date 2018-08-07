Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:32369 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbeHGEdO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Aug 2018 00:33:14 -0400
MIME-Version: 1.0
In-Reply-To: <20180807105955.06c70fc8@canb.auug.org.au>
References: <20180806103738.794c479d@canb.auug.org.au> <20180806222401.3d68fb28@canb.auug.org.au>
 <20180807105955.06c70fc8@canb.auug.org.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 Aug 2018 11:20:21 +0900
Message-ID: <CAK7LNATFjpxxVje=5vUF88kQVYJxaYzZbPwDzqkC6hKwgscpuw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>

2018-08-07 9:59 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> On Mon, 6 Aug 2018 22:24:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Mon, 6 Aug 2018 10:37:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
>> > failed like this:
>> >
>> > samples/statx/test-fsinfo.c:26:10: fatal error: linux/fsinfo.h: No such file or directory
>> >  #include <linux/fsinfo.h>
>> >           ^~~~~~~~~~~~~~~~
>> >
>> > Caused by commit
>> >
>> >   90b413cb970a ("vfs: syscall: Add fsinfo() to query filesystem information")
>> >
>> > I guess that headers_install (or whatever its called) has not bee run
>> > before the sample code is built.
>> >
>> > I have applied the following patch for today:
>> >
>> > From: Stephen Rothwell <sfr@canb.auug.org.au>
>> > Date: Mon, 6 Aug 2018 10:29:34 +1000
>> > Subject: [PATCH] vfs: don;t build new sample programs yet
>> >
>> > It seems that headers_install is not done before the samples
>> > are build so some needed include files are not in the right place.
>> >
>> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> > ---
>> >  samples/statx/Makefile | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/samples/statx/Makefile b/samples/statx/Makefile
>> > index 05b4d30cdd3c..0b4d01822eca 100644
>> > --- a/samples/statx/Makefile
>> > +++ b/samples/statx/Makefile
>> > @@ -1,5 +1,5 @@
>> >  # List of programs to build
>> > -hostprogs-$(CONFIG_SAMPLE_STATX) := test-statx test-fsinfo test-fs-query
>> > +hostprogs-$(CONFIG_SAMPLE_STATX) := test-statx
>> >
>> >  # Tell kbuild to always build the programs
>> >  always := $(hostprogs-y)
>>
>> It turns out that commit
>>
>>   ba5214f7f40c ("vfs: Implement parameter value retrieval with fsinfo()")
>>
>> removed the "depends on BROKEN" from CONFIG_SAMPLE_STATX and that
>> breaks other builds (at least allyesconfig on s390).
>
> I have added the following suggested patch (I am sorry I can't
> find/remember who pointed me to this patch) for today (I guess that it
> should be merged via the vfs tree as that is what is causing the build
> failures ... in which case a real patch should be supplied with
> appropriate SOB line).  This seems to fix the current problem.
>
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date: Tue, 7 Aug 2018 10:33:43 +1000
> Subject: [PATCH] Try to get the headers installed before we build the samples
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 9e71826f67d7..d224d94c14be 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1023,6 +1023,7 @@ endif
>  # Build samples along the rest of the kernel
>  ifdef CONFIG_SAMPLES
>  vmlinux-dirs += samples
> +samples: headers_install
>  endif
>
>  # The actual objects are generated when descending,
> --


OK, I will queue this up to my tree.


I suggested this in the discussion:
https://patchwork.kernel.org/patch/10552353/

I did not get response, though.




-- 
Best Regards
Masahiro Yamada
