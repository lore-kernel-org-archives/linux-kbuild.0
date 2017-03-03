Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr40042.outbound.protection.outlook.com ([40.107.4.42]:52192
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750709AbdCCFFQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Mar 2017 00:05:16 -0500
From: James Tau <jtau@mellanox.com>
Subject: RE: [PATCH v2] staging: mkspec: added aarch64 ifarch case.
Date: Fri, 3 Mar 2017 04:44:01 +0000
Message-ID: <AM3PR05MB371BE283AA3C7A141970497AF2B0@AM3PR05MB371.eurprd05.prod.outlook.com>
References: <20170301172414.GA29242@mtbu-fae-softiron1.internal.tilera.com>
 <20170302040539.GB15590@arm.com>
In-Reply-To: <20170302040539.GB15590@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarek@suse.com" <mmarek@suse.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Chris Metcalf <cmetcalf@mellanox.com>

Hi Will,

This patch (http://lkml.kernel.org/r/20161122213434.14788-1-mmarek@suse.com=
) looks better.  It has what Linus calls "good taste". ;-)  I didn't see it=
 in mmarek's kbuild branches (for-next,rc-fixes), however.  Still making it=
s way there?

But it doesn't quite fix the native 'make rpm' build completely.  While it =
gets beyond the point at which 'make rpm' fails without my patch, it expose=
s another issue for which I am debugging right now:

  ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/unix/unix.ko=
 net/unix/unix.o net/unix/unix.mod.o ;  true
make -f ./scripts/Makefile.fwinst obj=3Dfirmware __fw_modbuild
error: Bad exit status from /var/tmp/rpm-tmp.YcfiLf (%build)
    Bad exit status from /var/tmp/rpm-tmp.YcfiLf (%build)

RPM build errors:
make[1]: *** [rpm] Error 1
make: *** [rpm] Error 2
 =20
If I succeed in root-causing the problem, I'll submit a patch for that (if =
another doesn't beat me to it).  And assuming that patch is accepted for ha=
ving Linusian "good taste", then it, and http://lkml.kernel.org/r/201611222=
13434.14788-1-mmarek@suse.com, will make my current submitted patch extrane=
ous.

Thanks,
James

-----Original Message-----
From: Will Deacon [mailto:will.deacon@arm.com]=20
Sent: Wednesday, March 1, 2017 11:06 PM
To: James Tau <jtau@mellanox.com>
Cc: linux-kernel@vger.kernel.org; linux-kbuild@vger.kernel.org; mmarek@suse=
.com; catalin.marinas@arm.com; Chris Metcalf <cmetcalf@mellanox.com>
Subject: Re: [PATCH v2] staging: mkspec: added aarch64 ifarch case.

On Wed, Mar 01, 2017 at 09:24:14AM -0800, James Tau wrote:
> Patch attempting to fix native 'make rpm' build on ARM64 machines by=20
> adding an "ifarch aarch64" case.  Without it, build fails because the=20
> 'cp ...' in the default case can't find the built image.
>=20
> Signed-off-by: James Tau <jtau@mellanox.com>
> ---
>  scripts/package/mkspec | 4 ++++
>  1 file changed, 4 insertions(+)

Is this the same issue that was fixed by:

http://lkml.kernel.org/r/20161122213434.14788-1-mmarek@suse.com

?

I was assuming that Michael was going to queue those, but I could be wrong.

Will
