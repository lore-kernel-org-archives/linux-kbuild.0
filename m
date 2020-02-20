Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39293 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgBTQ35 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 11:29:57 -0500
MIME-Version: 1.0
References: <20200215075020.10426-1-masahiroy@kernel.org>
In-Reply-To: <20200215075020.10426-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 21 Feb 2020 01:29:07 +0900
Message-ID: <CAK7LNASCoR_KrVA-7+HOTkgFSx-hZbboYbtMPfN1GdookT8DUw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove the owner check in mkcompile_h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Feb 15, 2020 at 4:50 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This reverts a very old commit, which dates back to the pre-git era:
>
> |commit 5d1cfb5b12f72145d30ba0f53c9f238144b122b8
> |Author: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
> |Date:   Sat Jul 27 02:53:19 2002 -0500
> |
> |    kbuild: Fix compiling/installing as different users
> |
> |    "make bzImage && sudo make install" had the problem that during
> |    the "sudo make install" the build system would notice that the information
> |    in include/linux/compile.h is not accurate (it says "compiled by <user>",
> |    but we are root), thus causing compile.h to be updated and leading to
> |    some recompiles.
> |
> |    We now only update "compile.h" if the current user is the owner of
> |    include/linux/autoconf.h, i.e. the user who did the "make *config". So the
> |    above sequence will correctly state "compiled by <user>".
> |
> |diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> |index 6313db96172..cd956380978 100755
> |--- a/scripts/mkcompile_h
> |+++ b/scripts/mkcompile_h
> |@@ -3,6 +3,17 @@ ARCH=$2
> | SMP=$3
> | CC=$4
> |
> |+# If compile.h exists already and we don't own autoconf.h
> |+# (i.e. we're not the same user who did make *config), don't
> |+# modify compile.h
> |+# So "sudo make install" won't change the "compiled by <user>"
> |+# do "compiled by root"
> |+
> |+if [ -r $TARGET -a ! -O ../include/linux/autoconf.h ]; then
> |+  echo ' (not modified)'
> |+  exit 0
> |+fi
> |+
> | if [ -r ../.version ]; then
> |   VERSION=`cat ../.version`
> | else
>
> The 'make bzImage && sudo make install' problem no longer happens
> because commit 1648e4f80506 ("x86, kbuild: make "make install" not
> depend on vmlinux") fixed the root cause.
>
> Commit 19514fc665ff ("arm, kbuild: make "make install" not depend on
> vmlinux") fixed the similar issue on ARM, with detailed explanation.
>
> So, the rule is that the installation targets should never trigger
> the builds of any build artifact. By following it, this check is
> unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild.


> ---
>
>  scripts/mkcompile_h | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 3a5a4b210c86..3ff26e5b2eac 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -10,17 +10,6 @@ CC=$6
>
>  vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
>
> -# If compile.h exists already and we don't own autoconf.h
> -# (i.e. we're not the same user who did make *config), don't
> -# modify compile.h
> -# So "sudo make install" won't change the "compiled by <user>"
> -# do "compiled by root"
> -
> -if [ -r $TARGET -a ! -O include/generated/autoconf.h ]; then
> -  vecho "  SKIPPED $TARGET"
> -  exit 0
> -fi
> -
>  # Do not expand names
>  set -f
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
