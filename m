Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45958 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfGQPbB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 11:31:01 -0400
MIME-Version: 1.0
References: <20190717142922.214d54ec@canb.auug.org.au>
In-Reply-To: <20190717142922.214d54ec@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 17 Jul 2019 17:30:47 +0200
Message-ID: <CA+icZUUhnSGkLQcCZBzYXCRxExiZ1F=KnzdeiNSbojHRfxRjOA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

Hi Steven, Hi Darrick,

Unfortunately, my build-script is not working anymore.

I am using builddeb/mkdebian scripts.

[ BUILD-LOG ]
...
set -e; mkdir -p include/config/; { echo "5.2.0$(/bin/bash
./scripts/setlocalversion .)"; } > include/config/kernel.release.tmp;
if [ -r include/config/kernel.release ] && cmp -s
include/config/kernel.release include/config/kernel.release.tmp; then
rm -f include/config/kernel.release.tmp; else : '  UPD
include/config/kernel.release'; mv -f
include/config/kernel.release.tmp include/config/kernel.release; fi
make -f ./scripts/Makefile.build obj=3Dscripts/package bindeb-pkg
/bin/bash ./scripts/package/mkdebian
./scripts/package/mkdebian: line 149: cd: source/: No such file or director=
y
make[1]: *** [scripts/package/Makefile:79: bindeb-pkg] Error 1
make: *** [Makefile:1442: bindeb-pkg] Error 2

Investigations revealed hardcoded stuff from the ...

Merge remote-tracking branch 'iomap/iomap-for-next'

$ git blame scripts/package/mkdebian | grep 'cd source'
87bdff62e470c (Darrick J. Wong    2019-06-27 17:30:15 -0700 149) (cd
source/ ; stg ser | sed -e '/^-/d' -e 's/^. /  * /g') >>
debian/changelog

$ git log --oneline --author=3D"Darrick J. Wong" scripts/package/mkdebian
87bdff62e470 mtr: Build script adjustments

I do not think this was intended?

Reverting seems to be easy and fix it for me.

$ git revert --no-edit 87bdff62e470
F=C3=BChre Erkennung f=C3=BCr ungenaue Umbenennung aus: 100% (2251440/22514=
40), Fertig.
[5.2.0-3-amd64-cbl-asmgoto db8ec1968620] Revert "mtr: Build script adjustme=
nts"
 Date: Wed Jul 17 17:27:26 2019 +0200
 3 files changed, 10 insertions(+), 17 deletions(-)

Please make it work again for $WORLD.

Thanks.

Regards,
- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log=
/scripts/package/mkdebian?h=3Dnext-20190717
