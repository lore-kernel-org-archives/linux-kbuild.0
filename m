Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:64111 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfKFEEC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:04:02 -0500
MIME-Version: 1.0
References: <20191102063036.28601-1-unixbhaskar@gmail.com> <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org> <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106031027.GA20442@Gentoo>
In-Reply-To: <20191106031027.GA20442@Gentoo>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Nov 2019 13:03:16 +0900
Message-ID: <CAK7LNAQVhUS=WNoqgWQaS2-MJ9KoVBXurop8_vS5OC1VPtVTKw@mail.gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 6, 2019 at 12:10 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> On 11:53 Wed 06 Nov 2019, Masahiro Yamada wrote:
> >On Tue, Nov 5, 2019 at 11:32 AM J. Bruce Fields <bfields@fieldses.org> wrote:
> >>
> >> On Mon, Nov 04, 2019 at 06:03:13PM -0800, Randy Dunlap wrote:
> >> > On 11/1/19 11:30 PM, Bhaskar Chowdhury wrote:
> >> > > This patch allow you to remove old kernels and associated modules
> >> > > directory from the system.You can do it at once with the -r flag
> >> > > and interactively with the -i flag.
> >> > >
> >> > > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> >> > > ---
> >> > >  scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---------
> >> > >  1 file changed, 65 insertions(+), 17 deletions(-)
> >> >
> >> > Hi,
> >> > I believe that this script now does what the patch author intends it to do.
> >> > It does have a few whitespace issues, but no big deals.  (see below)
> >>
> >> My original comment stands: looks like it prompts for full module path
> >> and kernel versions which means it's no more convenient than just doing
> >> an "ls" and then removing the ones you want to.  (In fact, with "rm"
> >> you'd also get the benefit of tab completion....)
> >>
> >> It's quite different from the original script and I don't really see the
> >> advantage.
> >>
> >> --b.
> >
> >I am with Bruce.
> >
> >This patch is trying to replace everything
> >with worse code.
> Well,Masahiro,
> I won't mind dropping the idea, which you already concluded.But, would
> you care to let me know how worse the code seems to be????


As far as I understood this script,
it is useful to delete stale versions with a single command.

scripts/prune-kernel  5.2-rc1  5.2-rc2  5.2-rc3


This patch is dropping the 'for f in "$@"' loop,
so you would end up with running this script multiple times.

scripts/prune-kernel -r  5.2-rc1  5.2-rc1
scripts/prune-kernel -r  5.2-rc2  5.2-rc2
scripts/prune-kernel -r  5.2-rc3  5.2-rc3


What is funny is, it takes the kernel_version and modules_version
separately.
And now it requires -r option for the default behavior.
I see nothing cool overall.



J. Bruce Fields suggested:
"But if somebody does actually use it as-is, it'd be nicer to keep the
current behavior and add an option ("-i" or something) for the
interactive behavior."


I want to see a patch if and only if
you can add -i without intrusively changing the current code.


Masahiro




> >
> >BTW.
> >Bruce,
> >Does the current script expect RHEL or something?
> >I do not see 'new-kernel-pkg' on my Ubuntu machine.
> >
> >It would still work with 'new-kernel-pkg: command not found'
> >warning.
> >
> >We could bypass it if we like.
> >
> >command -v new-kernel-pkg && new-kernel-pkg --remove $f
> >
> >
> >
> >Masahiro Yamada
> >
> >
> >
> >> >
> >> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> >> >
> >> >
> >> > > diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> >> > > index e8aa940bc0a9..01d0778db71f 100755
> >> > > --- a/scripts/prune-kernel
> >> > > +++ b/scripts/prune-kernel
> >> > > @@ -1,21 +1,69 @@
> >> > >  #!/bin/bash
> >> > >  # SPDX-License-Identifier: GPL-2.0
> >> > > +#This script will remove old kernels and modules directory related to it.
> >> > > +#"-r" or "--remove" show how to silently remove old kernel and modules dir.
> >> > > +# "-h" or "--help" show how to use this script or show without parameter.
> >> > > +#"-i" or "--interactive" show how to remove interactively.
> >> > > +
> >> > > +flag=$1
> >> > > +kernel_version=$2
> >> > > +modules_version=$3
> >> > > +boot_dir=/boot
> >> > > +modules_dir=/lib/modules
> >> > > +
> >> > > +remove_old_kernel() {
> >> > > +   cd $boot_dir
> >> > > +   rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
> >> > > +   return 0
> >> > > +}
> >> > > +
> >> > > +remove_old_modules_dir() {
> >> > > +   cd $modules_dir
> >> > > +   rm -rf $modules_version
> >> > > +   return 0
> >> > > +}
> >> > > +
> >> > > +usage() {
> >> > > +   printf "Usage: $(basename $0) [-ri]\n"
> >> > > +   printf "\n -r or --remove  kernel_version modules_version\n"
> >> > > +   printf "\n -i or --interactive do as interactive way\n"
> >> > > +   return 0
> >> > > +}
> >> > > +
> >> > > +case "$flag" in
> >> > > +   -i | --interactive)
> >> > > +           printf "\nEnter kernel version to remove or blank/empty to exit:"
> >> > > +           read kernel_version
> >> > > +           if [[ $kernel_version != "" ]]; then
> >> > > +                   remove_old_kernel
> >> > > +                   printf "\nRemoved kernel version:$kernel_version from the system.\n\n"
> >> >
> >> > space after ':'
> >> >
> >> > drop one \n above.
> >> >
> >> > > +                   printf "Please give the full modules directory name to remove:"
> >> > > +                   read modules_version
> >> > > +                   if [[ $modules_version != "" ]]; then
> >> > > +                           remove_old_modules_dir
> >> > > +                           printf "\n\nRemoved modules directory:$modules_version from the system.\n\n"
> >> >
> >> > space after ':'
> >> >
> >> > drop one \n above.
> >> >
> >> > > +                   else
> >> > > +                           exit 1
> >> > > +                   fi
> >> > > +           fi
> >> > > +           ;;
> >> > > +   -h | --help)
> >> > > +           usage
> >> > > +           exit 0
> >> > > +           ;;
> >> > > +   -r | --remove)
> >> > > +           if [[ $# -ne 3 ]]; then
> >> > > +                    printf "You need to provide kernel version and modules directory name.\n"
> >> > > +                    exit 1
> >> > > +            else
> >> > > +                    remove_old_kernel
> >> > > +                    remove_old_modules_dir
> >> > > +           fi
> >> > > +           ;;
> >> > > +   *)
> >> > > +           usage
> >> > > +           exit 1
> >> > > +           ;;
> >> > > +esac
> >> > >
> >> > > -# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
> >> > > -# again, /boot and /lib/modules/ eventually fill up.
> >> > > -# Dumb script to purge that stuff:
> >> > >
> >> >
> >> > OK, the former script's loop is removed.. good.
> >> > But the 2 preceding blank lines are not removed, so the script
> >> > now ends with 2 unnecessary blank lines.
> >> >
> >> > > -for f in "$@"
> >> > > -do
> >> > > -        if rpm -qf "/lib/modules/$f" >/dev/null; then
> >> > > -                echo "keeping $f (installed from rpm)"
> >> > > -        elif [ $(uname -r) = "$f" ]; then
> >> > > -                echo "keeping $f (running kernel) "
> >> > > -        else
> >> > > -                echo "removing $f"
> >> > > -                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
> >> > > -                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
> >> > > -                rm -rf "/lib/modules/$f"
> >> > > -                new-kernel-pkg --remove $f
> >> > > -        fi
> >> > > -done
> >> > > --
> >> >
> >> >
> >> > --
> >> > ~Randy
> >
> >
> >
> >--
> >Best Regards
> >
> >Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
