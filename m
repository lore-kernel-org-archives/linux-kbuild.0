Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr820079.outbound.protection.outlook.com ([40.107.82.79]:28160
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726335AbeKHE2e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Nov 2018 23:28:34 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Date: Wed, 7 Nov 2018 18:56:52 +0000
Message-ID: <192946CF-8543-4CF5-B2A3-93674FCD07E2@vmware.com>
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
 <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
 <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
In-Reply-To: <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7211FD300DB08248A699CA13BAEFB2B2@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>

From: Logan Gunthorpe
Sent: November 7, 2018 at 6:53:02 PM GMT
> Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inli=
ne asm
>=20
>=20
>=20
>=20
> On 2018-11-07 11:01 a.m., Nadav Amit wrote:
>> Ideas? Do people care about it?
>=20
> Just spit balling, but is there a reason we didn't just put the macros
> for inline assembly directly in the header? Something like this:
>=20
> asm(".macro ANNOTATE_UNREACHABLE counter:req\n\t"
>    "\\counter:\n\t"
>        ".pushsection .discard.unreachable\n\t"
>        ".long \\counter\\()b -.\n\t"
>        ".popsection\n\t"
>    ".endm\n");
>=20
> #define annotate_unreachable() ({                   \
>    asm volatile("ANNOTATE_UNREACHABLE counter=3D%c0" \
>                 : : "i" (__COUNTER__));            \
> })
>=20
> It does mean the macros won't be usable in non-inline assembly, without
> duplicating them, but do we care about that?

HPA indicated more than once that this is wrong (and that was indeed my
initial solution), since it is not guaranteed that the compiler would put
the macro assembly before its use.
