Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:61799 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfLIGFi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 01:05:38 -0500
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xB965TJh028548
        for <linux-kbuild@vger.kernel.org>; Mon, 9 Dec 2019 15:05:30 +0900
Received: by mail-vk1-f173.google.com with SMTP id x199so4030203vke.6
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Dec 2019 22:05:30 -0800 (PST)
MIME-Version: 1.0
References: <CAN19L9G-mFN-MTmw0FS3ZX4d1MjeoL2U+s-Fk7Qw9UYWn5Q1YA@mail.gmail.com>
In-Reply-To: <CAN19L9G-mFN-MTmw0FS3ZX4d1MjeoL2U+s-Fk7Qw9UYWn5Q1YA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Dec 2019 15:04:53 +0900
Message-ID: <CAK7LNAR2bJW8BMq3xbt2FuuC_=uGqFrDsL9jEw6H1B78wHG_yg@mail.gmail.com>
Subject: Re: Some header files being ignored when calculating srcversion
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Galvan <omgalvan.86@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>

(+CC: Rusty Russell, Andrew Morton)

On Sat, Dec 7, 2019 at 5:12 AM Martin Galvan <omgalvan.86@gmail.com> wrote:
>
> Hi all,
>
> I'm working on a kernel module and noticed that sometimes my changes
> to certain header files don't affect the module's srcversion hash.
> This matters because tools like dkms will refuse to upgrade a module
> if the new hash is the same as the one currently installed.
>
> The files being ignored are those that are not (however indirectly)
> included by a .c placed in the same directory. In my case, I have a
> header which is included by several .c files placed in other
> directories; changes to this header won't affect the final srcversion
> hash.
>
> The cause of this seems to be this check in sumversion.c:
>
> /* Check if this file is in same dir as objfile */
> if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
>     if (!parse_file(line, md)) {
>         warn("could not open %s: %s\n",
>              line, strerror(errno));
>         goto out_file;
>     }
>
> }
>
> I'm not sure what's the rationale behind this check, not whether this
> behavior is documented anywhere.



I also wondered about this design
when I looked into this code for the first time.

In my understanding, this is based on the assumption that
headers file from the same or sub- directories are highly
relevant to the module in question, while the header
files from other locations are less related.


The actual code dates back to 2004, the following commit:

Rusty Russell seems to be the author,
and the Andrew Morton is the committer.




Author: Andrew Morton <akpm@osdl.org>
Date:   Thu Feb 26 06:51:58 2004 -0800

    [PATCH] Add a MODULE_VERSION macro

    From: Rusty Russell <rusty@au1.ibm.com>

    The way it works is that the .mod file contains the name of the module (as
    before), but succeeding lines are the constituent parts (assumed to be .c
    files, which usually works: if they use MODULE_VERSION in a file for which
    this isn't true we'll get a warning).

    As we postprocess modules, we look in the .modinfo section for a
    "version=", which is placed by the MODULE_VERSION() macro.  This will be of
    form "version=<macroarg>" "\0" [24 chars] "\0".  The 24 chars are replaced
    by the md4 sum of the .c files and any files they #include using '#include
    "file"' which are found in the current directory.  Whitespace is collapsed
    outside strings, and comments are ignored for purposes of the sum.

    The result is a .modinfo entry such as

            version=1.16ac-rustytest B13E9451C4CA3B89577DEFF



    At the kernel summit, various people asked for a MODULE_VERSION macro to
    store module strings (for later access through sysfs).  A simple md4 is
    needed to identify changes in modules which, inevitably, do not update the
    version.  It skips whitespace and comments, and includes #includes which
    are in the same dir.

    The module versions should be set according to this definition, based on
    the RPM one, or CVS Revision tags.  Violators will be shot.

     [<epoch>`:']<version>[`-'<extraversion>]
     <epoch>: A (small) unsigned integer which allows you to start versions
              anew. If not mentioned, it's zero.  eg. "2:1.0" is after
         "1:2.0".
     <version>: The <version> may contain only alphanumerics.
     <extraversion>: Like <version>, but inserted for local
              customizations, eg "rh3" or "rusty1".

    Comparison of two versions (assuming same epoch):

    Split each into all-digit and all-alphabetical parts.  Compare each one one
    at a time: digit parts numerically, alphabetical in ASCII order.  So 0.10
    comes after 0.9.







-- 
Best Regards
Masahiro Yamada
