Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33806 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935202AbeEXABD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 May 2018 20:01:03 -0400
Received: by mail-pg0-f65.google.com with SMTP id k2-v6so10128533pgc.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 May 2018 17:01:03 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCHv3 2/2] x86/vdso: Add build salt to the vDSO
From: Andy Lutomirski <luto@amacapital.net>
In-Reply-To: <CA+55aFxxUadENxUWU8jZqLnG=hvNA-fKCPQUMCKs2r0yWHc=rA@mail.gmail.com>
Date: Wed, 23 May 2018 17:01:00 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <195C83C0-067C-4B55-89BD-9CF3155C6E69@amacapital.net>
References: <20180523001939.9431-1-labbott@redhat.com> <20180523001939.9431-3-labbott@redhat.com> <CALCETrX9P2Lwrx7wGc22poVWX2AHAqXbUdhcijyoJ3tGhaxijg@mail.gmail.com> <15dcff14-ea1b-18c8-4cd1-06586cf6f05b@redhat.com> <CA+55aFxxUadENxUWU8jZqLnG=hvNA-fKCPQUMCKs2r0yWHc=rA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Laura Abbott <labbott@redhat.com>, Andrew Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nickc@redhat.com, ccoutant@gmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>



> On May 23, 2018, at 4:55 PM, Linus Torvalds <torvalds@linux-foundation.org=
> wrote:
>=20
>> On Wed, May 23, 2018 at 3:53 PM Laura Abbott <labbott@redhat.com> wrote:
>>=20
>> Actually I remember now why this is necessary: there is not a simple way
>> to encode a string into a linker file as it has to be spit out byte
>> by byte.
>=20
> I think you can use the "fill" thing to basically add any random data to a=

> section.
>=20
> So you can do something like
>=20
>        . =3D ALIGN(16);
>        .salt : AT(ADDR(.salt) - LOAD_OFFSET) {
>                LONG(0xffaa5500);
>                . =3D ALIGN(16);
>        } =3D0x01234567890abcdef
>=20
> in the lds file, and you'll get a section that looks like this:
>=20
>   [torvalds@i7 linux]$ objdump -h vmlinux -j .salt -s
>=20
>   vmlinux:     file format elf64-x86-64
>=20
>   Sections:
>    Idx Name          Size      VMA               LMA               File of=
f
>  Algn
>     15 .salt         00000010  ffffffff8432b000  000000000432b000  0352b00=
0
>  2**0
>                      CONTENTS, ALLOC, LOAD, DATA
>    Contents of section .salt:
>     ffffffff8432b000 0055aaff 00123456 7890abcd ef001234  .U....4Vx......4=

>=20
> Now whether that is sufficient for your needs, I dunno.
>=20

I don=E2=80=99t know whether I=E2=80=99m missing something obvious, but can=E2=
=80=99t this be in C?

asm (=E2=80=9C.pushsection \=E2=80=9D.comment\=E2=80=9D; .ascii \=E2=80=9D=E2=
=80=9D WHATEVER =E2=80=9C\=E2=80=9D; .popsection=E2=80=9D);

Or the .S equivalent.

