Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-co1nam03on0082.outbound.protection.outlook.com ([104.47.40.82]:26879
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726185AbeKHPw3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 10:52:29 -0500
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Date: Thu, 8 Nov 2018 06:18:33 +0000
Message-ID: <3B824A03-AB76-4B34-B1CA-F27C0F1B0575@vmware.com>
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
 <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
 <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
 <192946CF-8543-4CF5-B2A3-93674FCD07E2@vmware.com>
 <7bc80811-8ab3-d26a-6fb3-b7aeebcfce43@deltatee.com>
 <85B77A64-5FF3-4B82-8A07-E045E259C985@zytor.com>
In-Reply-To: <85B77A64-5FF3-4B82-8A07-E045E259C985@zytor.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0CC1A880DE192E4F8367B16E11070D19@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "hpa@zytor.com" <hpa@zytor.com>, Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>

From: hpa@zytor.com
Sent: November 7, 2018 at 9:50:28 PM GMT
> To: Logan Gunthorpe <logang@deltatee.com>, Nadav Amit <namit@vmware.com>,=
 Ingo Molnar <mingo@redhat.com>
> Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Rav=
nborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gl=
eixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.k=
ernel.org>, Stephen Bates <sbates@raithlin.com>
> Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inli=
ne asm
>=20
>=20
> On November 7, 2018 1:43:39 PM PST, Logan Gunthorpe <logang@deltatee.com>=
 wrote:
>> On 2018-11-07 11:56 a.m., Nadav Amit wrote:
>>> HPA indicated more than once that this is wrong (and that was indeed
>> my
>>> initial solution), since it is not guaranteed that the compiler would
>> put
>>> the macro assembly before its use.
>>=20
>> Hmm, that's very unfortunate. I don't really understand why the
>> compiler
>> would not put the macro assembly in the same order as it appears in the
>> code and it would be in the correct order there.
>>=20
>> In any case, I've submitted a couple of issues to icecc[1] and
>> distcc[2]
>> to see if they have any ideas about supporting this on their sides.
>>=20
>> Thanks,
>>=20
>> Logan
>>=20
>> [1] https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Ficecc%2Ficecream%2Fissues%2F428&amp;data=3D02%7C01%7Cnamit%40vm=
ware.com%7C30ab3751343b49f869ab08d644fb1d8c%7Cb39138ca3cee4b4aa4d6cd83d9dd6=
2f0%7C1%7C0%7C636772242666772528&amp;sdata=3DdXKTR79LkFDQ9IXxYw9XYt0VPFa4MX=
rMUcc86w5uy%2Fk%3D&amp;reserved=3D0
>> [2] https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Fdistcc%2Fdistcc%2Fissues%2F312&amp;data=3D02%7C01%7Cnamit%40vmw=
are.com%7C30ab3751343b49f869ab08d644fb1d8c%7Cb39138ca3cee4b4aa4d6cd83d9dd62=
f0%7C1%7C0%7C636772242666772528&amp;sdata=3DXynZ1bFbKAb8V2eoPQbXudEJ%2B%2Bu=
8QA3mM4Sr4E%2FTzWs%3D&amp;reserved=3D0
>=20
> Apparently gcc will treat them like basic blocks and possibly move them a=
round.

Maybe it is possible to break the compilation of each object into two
stages: first, compile the source without assembly, and then take the
generated .s file and assemble it with the .s file of the macros.

Does it sounds as something that may work? I guess it should only be done
when distcc is used.
