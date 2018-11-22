Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34118 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390514AbeKVUuP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Nov 2018 15:50:15 -0500
Received: by mail-lf1-f66.google.com with SMTP id p6so6136747lfc.1
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Nov 2018 02:11:28 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUPaoEf0JzXJO6T5xBBrr8tcw2NmNXBk4=HD6WBbLtEdw@mail.gmail.com>
In-Reply-To: <CA+icZUUPaoEf0JzXJO6T5xBBrr8tcw2NmNXBk4=HD6WBbLtEdw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 22 Nov 2018 11:11:16 +0100
Message-ID: <CA+icZUWrbTPk7ws+LBjzMSKsbfwbZODjCoBt7uQU0Z4ykzd6mw@mail.gmail.com>
Subject: Re: builddeb: Missing arch/x86/kernel/macros.s when building modules
 with dkms
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org

On Tue, Nov 13, 2018 at 3:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi,
>
> I wanted to compile acpi-call-dkms on Debian/testing AMD64 with
> clang-8/experimental.
>
> When doing a...
>
> # LC_ALL=C dkms install -m acpi-call -v 1.1.0 -k 4.20.0-rc2-2-amd64-cbl
>
> ...I saw that arch/x86/kernel/macros.s file was missing.
>
> My workaround was...
>
> $ cd $BUILD_DIR
> $ sudo cp -av arch/x86/kernel/macros.s
> /usr/src/linux-headers-4.20.0-rc2-2-amd64-cbl/arch/x86/kernel/
>
> I guess the generated linux-headers debian package is missing this file.
>
> I wanted to let you and others know.
>

Hi,

where is the right place to put a cp-line to copy the missing
arch/x86/kernel/macro.s file?

In the section of [1]?

[ scripts/package/builddeb ]

# Build kernel header package
(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name
\*.pl) > "$objtree/debian/hdrsrcfiles"
(cd $srctree; find arch/*/include include scripts -type f -o -type l)
>> "$objtree/debian/hdrsrcfiles"
(cd $srctree; find arch/$SRCARCH -name module.lds -o -name
Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfi

Is the macro.s file only generated for x86 arch only or also for other archs?

Thanks for your feedback.

Regards,
- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/builddeb#n156
