Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:57819 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730920AbfAKKVU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Jan 2019 05:21:20 -0500
MIME-Version: 1.0
References: <1547200321-17120-1-git-send-email-yamada.masahiro@socionext.com> <20190111095924.GA555@kroah.com>
In-Reply-To: <20190111095924.GA555@kroah.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 11 Jan 2019 19:20:32 +0900
Message-ID: <CAK7LNAQQdmVpL5_v+6Tw+o0A3_mPWafMfGF5j9imXBuXMHTuDA@mail.gmail.com>
Subject: Re: [PATCH] firmware_loader: move firmware/ to drivers/base/firmware_loader/builtin/
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "Rafael J. Wysocki" <rafael@kernel.org>

On Fri, Jan 11, 2019 at 6:59 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 11, 2019 at 06:52:00PM +0900, Masahiro Yamada wrote:
> > Currently, the 'firmware' directory only contains a single Makefile
> > to embed extra firmware into the kernel.
> >
> > Move it to the more relevant place.
>
> So this moves any "build in" firmware to need to be placed in
> drivers/base/firmare_loader/builtin/ instead of firmware/builtin/ ?

Nope.

The build system searches extra firmware in the directory specified
by CONFIG_EXTRA_FIRMWARE_DIR.  (default is /lib/firmware)


See drivers/base/firmware_loader/Kconfig:

config EXTRA_FIRMWARE_DIR
        string "Firmware blobs root directory"
        depends on EXTRA_FIRMWARE != ""
        default "/lib/firmware"
        help
          This option controls the directory in which the kernel build system
          looks for the firmware files listed in the EXTRA_FIRMWARE option.



>  If
> so, why?  That seems like a lot of extra work for people now.  And
> burrying it down in the drivers/base/ directory is not obvious at all.


The firmware search path is a different thing.


I am just moving the Makefile
because all the other stuff (C files, Kconfig)
has been moved into drivers/base/firmware_loader/.

And, this is the last piece work in order to
make drivers/base/firmware_loader self-contained.



Just a reminder of previous commits you applied:


commit 06bfd3c8ab1dbf0031022d056a90ace682f6a94c
Author: Luis R. Rodriguez <mcgrof@kernel.org>
Date:   Thu May 10 13:08:43 2018 -0700

    firmware_loader: move kconfig FW_LOADER entries to its own file

    This will make it easier to track and easier to understand
    what components and features are part of the FW_LOADER. There
    are some components related to firmware which have *nothing* to
    do with the FW_LOADER, souch as PREVENT_FIRMWARE_BUILD.

    Reviewed-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


commit 5d6d1ddd27301dc85b13b794262c8bcececf88f1
Author: Luis R. Rodriguez <mcgrof@kernel.org>
Date:   Sat Mar 10 06:14:50 2018 -0800

    firmware: move firmware loader into its own directory

    This will make it much easier to manage as we manage to
    keep trimming componnents down into their own files to more
    easily manage and maintain this codebase.

    Suggested-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



-- 
Best Regards
Masahiro Yamada
