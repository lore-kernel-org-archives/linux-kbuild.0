Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.136]:56451 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfKRCUI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Nov 2019 21:20:08 -0500
Date: Sun, 17 Nov 2019 18:18:37 -0800
In-Reply-To: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
References: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH v4 0/7] Speed booting by sorting ORC unwind tables at build time
From: hpa@zytor.com
Message-ID: <6DC4AA3A-15CA-43B5-B560-5DBB168D3899@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On November 15, 2019 8:45:32 AM PST, Shile Zhang <shile=2Ezhang@linux=2Eali=
baba=2Ecom> wrote:
>Hi,
>
>I refactored the code, followed by Peter's suggestions in v3, thank
>you!
>Any suggestions and comments are welcome!
>
>Thanks!
>
>Changelog:
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>v3->v4:
>- Code refactored for Peter's review findings and suggestions=2E
>
>v2->v3:
>- Discard new added sortorctable tool and related Kconfig changes=2E
>- Refactored sortextable, makes it more readable and extendable=2E
>- Rename 'sortextable' to 'sorttable', for more kernel tables extend=2E
>- Add ORC unwind tables sort into sorttable=2E
>- Remove the runtime ORC tables sort=2E
>https://lore=2Ekernel=2Eorg/lkml/20191115064750=2E47888-1-shile=2Ezhang@l=
inux=2Ealibaba=2Ecom/
>
>v1->v2:
>- Removed new added Kconfig and runtime sort code, advised by Josh
>Poimboeuf=2E
>- Some minor refactoring=2E
>https://lore=2Ekernel=2Eorg/lkml/20191108071108=2E72132-1-shile=2Ezhang@l=
inux=2Ealibaba=2Ecom/
>
>v1:
>- Added a new sortorctable tool to sort ORC unwind tables at build
>time,
>  same as sortextable=2E
>- Add a new Kconfigure to control if ORC unwind tables sort at build
>  time=2E
>https://lore=2Ekernel=2Eorg/lkml/20191107143205=2E206606-1-shile=2Ezhang@=
linux=2Ealibaba=2Ecom/
>
>Shile Zhang (7):
>  scripts/sortextable: Rewrite error/success handling
>  scripts/sortextable: kernel coding style formating
>  scripts/sortextable: Remove dead code
>  scripts/sortextable: refactor do_func() function
>  scripts/sorttable: rename sortextable to sorttable
>  scripts/sorttable: Add ORC unwind tables sort concurrently
>  x86/unwind/orc: remove run-time ORC unwind tables sort
>
> arch/arc/Kconfig                       |   2 +-
> arch/arm/Kconfig                       |   2 +-
> arch/arm64/Kconfig                     |   2 +-
> arch/microblaze/Kconfig                |   2 +-
> arch/mips/Kconfig                      |   2 +-
> arch/parisc/Kconfig                    |   2 +-
> arch/parisc/kernel/vmlinux=2Elds=2ES       |   2 +-
> arch/powerpc/Kconfig                   |   2 +-
> arch/s390/Kconfig                      |   2 +-
> arch/x86/Kconfig                       |   2 +-
> arch/x86/kernel/unwind_orc=2Ec           |   8 +-
> arch/xtensa/Kconfig                    |   2 +-
> init/Kconfig                           |   2 +-
> scripts/=2Egitignore                     |   2 +-
> scripts/Makefile                       |  10 +-
> scripts/link-vmlinux=2Esh                |  10 +-
> scripts/sortextable=2Eh                  | 209 -------------
> scripts/{sortextable=2Ec =3D> sorttable=2Ec} | 299 +++++++++---------
> scripts/sorttable=2Eh                    | 401 +++++++++++++++++++++++++
> 19 files changed, 568 insertions(+), 395 deletions(-)
> delete mode 100644 scripts/sortextable=2Eh
> rename scripts/{sortextable=2Ec =3D> sorttable=2Ec} (67%)
> create mode 100644 scripts/sorttable=2Eh

Any actual time measurements?
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
