Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:54082 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfGQPdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 11:33:51 -0400
Date: Wed, 17 Jul 2019 08:33:29 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: linux-next: Tree for Jul 17
Message-ID: <20190717153329.GC7116@magnolia>
References: <20190717142922.214d54ec@canb.auug.org.au>
 <CA+icZUUhnSGkLQcCZBzYXCRxExiZ1F=KnzdeiNSbojHRfxRjOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+icZUUhnSGkLQcCZBzYXCRxExiZ1F=KnzdeiNSbojHRfxRjOA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Wed, Jul 17, 2019 at 05:30:47PM +0200, Sedat Dilek wrote:
> Hi Steven, Hi Darrick,
> 
> Unfortunately, my build-script is not working anymore.
> 
> I am using builddeb/mkdebian scripts.

Yeah, I accidentally uploaded an internal build patch yesterday which
got sucked into for-next.  It's been fixed in the iomap-for-next tree
and should disappear in Thursday's for-next tree.  Sorry about that. :(

--D

> [ BUILD-LOG ]
> ...
> set -e; mkdir -p include/config/; { echo "5.2.0$(/bin/bash
> ./scripts/setlocalversion .)"; } > include/config/kernel.release.tmp;
> if [ -r include/config/kernel.release ] && cmp -s
> include/config/kernel.release include/config/kernel.release.tmp; then
> rm -f include/config/kernel.release.tmp; else : '  UPD
> include/config/kernel.release'; mv -f
> include/config/kernel.release.tmp include/config/kernel.release; fi
> make -f ./scripts/Makefile.build obj=scripts/package bindeb-pkg
> /bin/bash ./scripts/package/mkdebian
> ./scripts/package/mkdebian: line 149: cd: source/: No such file or directory
> make[1]: *** [scripts/package/Makefile:79: bindeb-pkg] Error 1
> make: *** [Makefile:1442: bindeb-pkg] Error 2
> 
> Investigations revealed hardcoded stuff from the ...
> 
> Merge remote-tracking branch 'iomap/iomap-for-next'
> 
> $ git blame scripts/package/mkdebian | grep 'cd source'
> 87bdff62e470c (Darrick J. Wong    2019-06-27 17:30:15 -0700 149) (cd
> source/ ; stg ser | sed -e '/^-/d' -e 's/^. /  * /g') >>
> debian/changelog
> 
> $ git log --oneline --author="Darrick J. Wong" scripts/package/mkdebian
> 87bdff62e470 mtr: Build script adjustments
> 
> I do not think this was intended?
> 
> Reverting seems to be easy and fix it for me.
> 
> $ git revert --no-edit 87bdff62e470
> Führe Erkennung für ungenaue Umbenennung aus: 100% (2251440/2251440), Fertig.
> [5.2.0-3-amd64-cbl-asmgoto db8ec1968620] Revert "mtr: Build script adjustments"
>  Date: Wed Jul 17 17:27:26 2019 +0200
>  3 files changed, 10 insertions(+), 17 deletions(-)
> 
> Please make it work again for $WORLD.
> 
> Thanks.
> 
> Regards,
> - Sedat -
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/scripts/package/mkdebian?h=next-20190717
