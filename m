Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:17561 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752939AbdKWOT6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Nov 2017 09:19:58 -0500
MIME-Version: 1.0
In-Reply-To: <1510737427-12510-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510737427-12510-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Nov 2017 23:19:14 +0900
Message-ID: <CAK7LNAQLt=ka0OffeD-2DkjKnb=JuGNgOGgeN5AatEXihH=4fA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: package: use --transform option to prefix paths
 in tar
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-15 18:17 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> For rpm-pkg and deb-pkg, a source tar file is created.  All paths in
> the archive must be prefixed with the base name of the tar.  That
> means, everything is contained in the directory when you extract it.
>
> Currently, scripts/package/Makefile uses a symlink for that, and
> removes it after the tar is created.
>
> If you terminate the build during the tar creation, the symlink is
> left over.  Then, at the next package build, you will see a warning
> like follows:
>
>   ln: '.' and 'kernel-4.14.0+/.' are the same file
>
> It is possible to fix it by adding -n (--no-dereference) option to
> the "ln" command, but a cleaner way is to use --transform option
> of "tar" command.  This option is GNU extension, but it should not
> hurt to use it in the Linux build system.
>
> The 'S' flag is needed to exclude symlinks from the path fixup.
> Without it, symlinks in the kernel are broken.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
