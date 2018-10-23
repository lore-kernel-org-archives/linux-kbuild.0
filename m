Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42789 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbeJWKfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Oct 2018 06:35:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id i4-v6so19894493pgq.9
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Oct 2018 19:13:55 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 1/5] x86/vdso: Renames variable to fix shadow warning.
From: Andy Lutomirski <luto@amacapital.net>
In-Reply-To: <20181023011022.GA6574@WindFlash>
Date: Mon, 22 Oct 2018 19:13:53 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <93692F0D-D25B-4225-B127-4988E43B4CE1@amacapital.net>
References: <20181023011022.GA6574@WindFlash>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?utf-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org



> On Oct 22, 2018, at 6:10 PM, Leonardo Br=C3=A1s <leobras.c@gmail.com> wrot=
e:
>=20
> Renames the char variable to avoid shadowing a variable previously
> declared on this function.

How about =E2=80=9CThe go32() and go64() functions has an argument and a loc=
al variable called =E2=80=98name=E2=80=99.  Rename both to clarify the code a=
nd to fix a warning with -Wshadow.=E2=80=9D

Other than that, Acked-by: Andy Lutomirski <luto@kernel.org>

Ingo or Thomas, it probably makes sense to just apply this to tip:x86/vdso, s=
ince it=E2=80=99s an improvement regardless of the fate of the rest of the s=
eries.
