Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41670 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbeKXRiw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Nov 2018 12:38:52 -0500
Received: by mail-lf1-f67.google.com with SMTP id c16so10030118lfj.8
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Nov 2018 22:51:32 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUPaoEf0JzXJO6T5xBBrr8tcw2NmNXBk4=HD6WBbLtEdw@mail.gmail.com>
 <CA+icZUWrbTPk7ws+LBjzMSKsbfwbZODjCoBt7uQU0Z4ykzd6mw@mail.gmail.com> <CAK7LNAQ_8RYQaLbouR84=HH+xoxvVGX=gN5z-vQqu0=PCVzOuQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ_8RYQaLbouR84=HH+xoxvVGX=gN5z-vQqu0=PCVzOuQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 24 Nov 2018 07:51:19 +0100
Message-ID: <CA+icZUXU8z_zke=3HCkceZo_becUL2Q=5j=QtAKkqYn8o-5-vw@mail.gmail.com>
Subject: Re: builddeb: Missing arch/x86/kernel/macros.s when building modules
 with dkms
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org

On Sat, Nov 24, 2018 at 1:53 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Sedat,
>
> Sorry, I missed your email.
>
>
>
> On Fri, Nov 23, 2018 at 6:25 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Tue, Nov 13, 2018 at 3:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I wanted to compile acpi-call-dkms on Debian/testing AMD64 with
> > > clang-8/experimental.
> > >
> > > When doing a...
> > >
> > > # LC_ALL=C dkms install -m acpi-call -v 1.1.0 -k 4.20.0-rc2-2-amd64-cbl
> > >
> > > ...I saw that arch/x86/kernel/macros.s file was missing.
> > >
> > > My workaround was...
> > >
> > > $ cd $BUILD_DIR
> > > $ sudo cp -av arch/x86/kernel/macros.s
> > > /usr/src/linux-headers-4.20.0-rc2-2-amd64-cbl/arch/x86/kernel/
> > >
> > > I guess the generated linux-headers debian package is missing this file.
> > >
> > > I wanted to let you and others know.
> > >
> >
> > Hi,
> >
> > where is the right place to put a cp-line to copy the missing
> > arch/x86/kernel/macro.s file?
> >
> > In the section of [1]?
> >
> > [ scripts/package/builddeb ]
> >
> > # Build kernel header package
> > (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name
> > \*.pl) > "$objtree/debian/hdrsrcfiles"
> > (cd $srctree; find arch/*/include include scripts -type f -o -type l)
> > >> "$objtree/debian/hdrsrcfiles"
> > (cd $srctree; find arch/$SRCARCH -name module.lds -o -name
> > Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfi
> >
> > Is the macro.s file only generated for x86 arch only or also for other archs?
>
>
> Only for x86.
>
> > Thanks for your feedback.
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/builddeb#n156
>
> Yes, this section.
>
>
> Maybe like this?
>
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f43a274..4cf5a5c 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -165,6 +165,9 @@ fi
>  if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
>         (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
> gcc-common.h) >> "$objtree/debian/hdrobjfiles"
>  fi
> +if [ -r arch/$SRCARCH/kernel/macros.s ]; then
> +       echo arch/$SRCARCH/kernel/macros.s >> "$objtree/debian/hdrobjfiles"
> +fi
>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
>  (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd
> $destdir; tar -xf -)
>
>
> --
> Best Regards
> Masahiro Yamada

Hi Masahiro Yamada,

thanks, that fixes here the problem with building DKMS kernel modules:

# find /usr/src/linux-headers-4.20.0-rc3-7-amd64-cbl -name macros.s
/usr/src/linux-headers-4.20.0-rc3-7-amd64-cbl/arch/x86/kernel/macros.

I guess commit...

77b0bf55bc67 kbuild/Makefile: Prepare for using macros in inline
assembly code to work around asm() related GCC inlining bugs

...is the root cause (mention as a "Fixes:" tag in a future patch)?

Not sure if the according script for building Linux RPM packages needs
the same fix, too.

I can send a fix for the builddeb part or if you want to do it, it's OK for me.

I highly appreciate to see a fix in Linux v4.20-rcN if possible.

Thanks.

Kind regards,
- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=77b0bf55bc67
