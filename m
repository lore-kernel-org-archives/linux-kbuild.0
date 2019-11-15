Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30912 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726365AbfKORwe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 12:52:34 -0500
Date: Fri, 15 Nov 2019 11:52:24 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH v4 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191115175224.ozuiei2vlfvynok5@treble>
References: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Sat, Nov 16, 2019 at 12:45:32AM +0800, Shile Zhang wrote:
> Hi,
>=20
> I refactored the code, followed by Peter's suggestions in v3, thank you!
> Any suggestions and comments are welcome!
>=20
> Thanks!
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> v3->v4:
> - Code refactored for Peter's review findings and suggestions.

Hi Shile,

I haven't given it a proper review yet, but one minor suggestion.  In
general it's good practice to wait at least a few business days before
posting a new version of a patch set.  That way it gives people time to
review, and it also helps to avoid flooding people's inboxes.

--=20
Josh
