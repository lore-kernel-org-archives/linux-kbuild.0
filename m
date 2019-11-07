Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55298 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726640AbfKGPrK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 10:47:10 -0500
Date: Thu, 7 Nov 2019 09:46:54 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191107154654.jyg24wzqujdtx7zq@treble>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shile.zhang@linux.alibaba.com
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, Nov 07, 2019 at 10:32:01PM +0800, shile.zhang@linux.alibaba.com wro=
te:
> From: Shile Zhang <shile.zhang@linux.alibaba.com>
>=20
> Hi,
>=20
> I found the unwind_init taken long time (more than 90ms) in kernel
> booting, mainly spent on sorting the two ORC unwind tables, orc_unwind
> and orc_unwind_ip.
>=20
> I also noticed that this issued has reported and discussed last year:
> https://lkml.org/lkml/2018/10/8/342
> But seems no final solution until now, I tried to sort the ORC tables at
> build time, followed the helpful hints from Josh and Ingo in that thread.
> And mainly referred the implementation of 'sortextable' tool:
> https://lore.kernel.org/linux-mips/1334872799-14589-1-git-send-email-ddan=
ey.cavm@gmail.com/
>=20
> What I did:
>=20
> - Add a Kconfig to control build-time sorting or runtime sorting;
> - Referred 'sortextable', create a similar helper tool 'sortorctable',
>   help to sort the ORC unwind tables at vmlinux link process.
>=20
> One potential improvement is to sort the module ORC tables in future.
>=20
> Thanks!

Thanks a lot for working on this!

I'd say the new config option isn't needed.  The runtime ORC sorting
logic is unconditionally bad and the code should just be removed.  I saw
recently that it's one of the main offenders for boot time latency.

I also agree with Peter that we should try to reduce the link-time
penalty as much as possible.  But it's a necessary evil to a certain
extent.

--=20
Josh
