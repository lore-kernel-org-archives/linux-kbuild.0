Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41742 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbeJXL4i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Oct 2018 07:56:38 -0400
MIME-Version: 1.0
References: <20181023011022.GA6574@WindFlash> <93692F0D-D25B-4225-B127-4988E43B4CE1@amacapital.net>
In-Reply-To: <93692F0D-D25B-4225-B127-4988E43B4CE1@amacapital.net>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Tue, 23 Oct 2018 21:39:33 -0300
Message-ID: <CADvQ+rEk-VE4uLZ_iRi26BnuEWFzCNZxdcdHRgWW6YbKS4R_tA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] x86/vdso: Renames variable to fix shadow warning.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: luto@amacapital.net
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Hello Andy,

Yeah, it's much better. I will replace this part of the commit message.
It will be fixed for v3.

Thank you!


On Mon, Oct 22, 2018 at 11:13 PM Andy Lutomirski <luto@amacapital.net> wrot=
e:

> How about =E2=80=9CThe go32() and go64() functions has an argument and a =
local variable called =E2=80=98name=E2=80=99.  Rename both to clarify the c=
ode and to fix a warning with -Wshadow.=E2=80=9D
>
> Other than that, Acked-by: Andy Lutomirski <luto@kernel.org
