Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44989 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726505AbfKORq7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 12:46:59 -0500
Date: Fri, 15 Nov 2019 11:46:49 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH v3 7/7] x86/unwind/orc: remove run-time ORC unwind
 tables sort
Message-ID: <20191115174649.ldif5o7xqo5ntxeo@treble>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-8-shile.zhang@linux.alibaba.com>
 <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Shile Zhang' <shile.zhang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Fri, Nov 15, 2019 at 04:51:24PM +0000, David Laight wrote:
> From: Shile Zhang
> > Sent: 15 November 2019 06:48
> ...
> >  arch/x86/kernel/unwind_orc.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.=
c
> > index 332ae6530fa8..280da6fa9922 100644
> > --- a/arch/x86/kernel/unwind_orc.c
> > +++ b/arch/x86/kernel/unwind_orc.c
> > @@ -273,9 +273,11 @@ void __init unwind_init(void)
> >  =09=09return;
> >  =09}
> >=20
> > -=09/* Sort the .orc_unwind and .orc_unwind_ip tables: */
> > -=09sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
> > -=09     orc_sort_swap);
> > +=09/*
> > +=09 * Note, orc_unwind and orc_unwind_ip tables has been sorted in
> > +=09 * vmlinux link phase by sorttable tool at build time.
> > +=09 * Its ready for binary search now.
> > +=09 */
>=20
> How fast is sort() if the table is sorted?
> Relying on the kernel sources and build scripts always being in sync seem=
s dangerous.
> Probably better to leave the sort in for a release of two.

This patch comes after the build script changes, so they'd be in sync.
What would the concern be?

--=20
Josh
