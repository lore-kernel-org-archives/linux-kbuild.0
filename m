Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:27554 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbeKXLjS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Nov 2018 06:39:18 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id wAO0qnc3006973
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Nov 2018 09:52:50 +0900
Received: by mail-vs1-f51.google.com with SMTP id x1so8086815vsc.10
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Nov 2018 16:52:50 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUPaoEf0JzXJO6T5xBBrr8tcw2NmNXBk4=HD6WBbLtEdw@mail.gmail.com>
 <CA+icZUWrbTPk7ws+LBjzMSKsbfwbZODjCoBt7uQU0Z4ykzd6mw@mail.gmail.com>
In-Reply-To: <CA+icZUWrbTPk7ws+LBjzMSKsbfwbZODjCoBt7uQU0Z4ykzd6mw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 24 Nov 2018 09:52:13 +0900
Message-ID: <CAK7LNAQ_8RYQaLbouR84=HH+xoxvVGX=gN5z-vQqu0=PCVzOuQ@mail.gmail.com>
Subject: Re: builddeb: Missing arch/x86/kernel/macros.s when building modules
 with dkms
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Ben Hutchings <ben@decadent.org.uk>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Sedat,

Sorry, I missed your email.



On Fri, Nov 23, 2018 at 6:25 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Tue, Nov 13, 2018 at 3:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi,
> >
> > I wanted to compile acpi-call-dkms on Debian/testing AMD64 with
> > clang-8/experimental.
> >
> > When doing a...
> >
> > # LC_ALL=C dkms install -m acpi-call -v 1.1.0 -k 4.20.0-rc2-2-amd64-cbl
> >
> > ...I saw that arch/x86/kernel/macros.s file was missing.
> >
> > My workaround was...
> >
> > $ cd $BUILD_DIR
> > $ sudo cp -av arch/x86/kernel/macros.s
> > /usr/src/linux-headers-4.20.0-rc2-2-amd64-cbl/arch/x86/kernel/
> >
> > I guess the generated linux-headers debian package is missing this file.
> >
> > I wanted to let you and others know.
> >
>
> Hi,
>
> where is the right place to put a cp-line to copy the missing
> arch/x86/kernel/macro.s file?
>
> In the section of [1]?
>
> [ scripts/package/builddeb ]
>
> # Build kernel header package
> (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name
> \*.pl) > "$objtree/debian/hdrsrcfiles"
> (cd $srctree; find arch/*/include include scripts -type f -o -type l)
> >> "$objtree/debian/hdrsrcfiles"
> (cd $srctree; find arch/$SRCARCH -name module.lds -o -name
> Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfi
>
> Is the macro.s file only generated for x86 arch only or also for other archs?


Only for x86.

> Thanks for your feedback.
>
> Regards,
> - Sedat -
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/builddeb#n156

Yes, this section.


Maybe like this?


diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f43a274..4cf5a5c 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -165,6 +165,9 @@ fi
 if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
        (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
gcc-common.h) >> "$objtree/debian/hdrobjfiles"
 fi
+if [ -r arch/$SRCARCH/kernel/macros.s ]; then
+       echo arch/$SRCARCH/kernel/macros.s >> "$objtree/debian/hdrobjfiles"
+fi
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd
$destdir; tar -xf -)


--
Best Regards
Masahiro Yamada
