Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:35094 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726821AbeIMRmC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Sep 2018 13:42:02 -0400
Message-ID: <eb1fe15c9ced6950d6a38c901278b8196ae4938d.camel@decadent.org.uk>
Subject: Re: 4.19-rc3: bindeb-pkg target is failing on ppc64
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 13 Sep 2018 13:32:35 +0100
In-Reply-To: <CALjTZvb4hOY_Hew-jEUtpyhkGbmh4Tgb0doPC6EaGtz_rMGt7A@mail.gmail.com>
References: <CALjTZvb4hOY_Hew-jEUtpyhkGbmh4Tgb0doPC6EaGtz_rMGt7A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-4saDnkeQRwr71nfUjRPF"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rui Salvaterra <rsalvaterra@gmail.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--=-4saDnkeQRwr71nfUjRPF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-11 at 15:58 +0100, Rui Salvaterra wrote:
> Greetings! I'm having trouble building the kernel on my ppc64 machine
> (Power Mac G5) running Debian Sid. The make bindeb-pkg target is failing
> ever since 4.19-rc1. Is this a known issue? If not, let me know if you ne=
ed
> anything else in order to help debug this. Thanks in advance!

It sounds like you don't actually have a ppc64 installation, but a
powerpc installation with a 64-bit kernel.  In that case you will now
need to add ppc64 as a secondary architecture by running:

    dpkg --add-architecture ppc64

If that doesn't help, please send the error messages you're getting.

Ben.

--=20
Ben Hutchings
Computers are not intelligent.	They only think they are.



--=-4saDnkeQRwr71nfUjRPF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAluaWOQACgkQ57/I7JWG
EQllCg/+If7rEF/SFCUdHE9Lo4cXEXwjzd0zkECbnOoM091fotF1hd0H6vy0Vh2R
Rxwmz+2g88hNbgaYMMEDhNhxLBTwqVnoalFPWUdRgW5J56rKUpJYYg4YQ7BRvpth
yyMCub2zPrtq4mtpSfhYwOEtD1R83FgvV9mkCm6jUgpIGo3KbHo5H3EiKEuouwok
vX3IoI2l33Dr92VEifyy/NOqKWl/JlvO2sNOpo6Zs4uMQaqZY5bi0ulaerVN45Sd
Amel1q/G5p9HzpdkzTRfBki/348y7OfYYQy7Ad0I/NgX0Cs8Q8wDc6/T4ltph3L+
mo/wwhOG+UbTbnSCiLTBZmdkGvMBe5FCkSLxPwwOrvMghAnG8xgh1ejZsYec0URH
4B0hIYn65KfQpNr1rhEW/ukDGxfagmtkQdTN/mPueeZov1mG3zrBGNBfUONmfpn3
AsQAHEeB5Q0WbUeFIZ0aI4alhJz+NLgDZzMBtXVtDbgEw0qZGHWGs379pJMhCMEv
Q4dzj0xrz5ZXY2zkF5wHm0KBap9eHQvHbv3t+yEcTP/MdNeX/X/5bRBs5fjIYEOQ
ee3jXPuuywa0NB1GRHK66uCRU/aHPpJ+tOuCwuudvPxw45qij/MEVgVfVaxU0Bv7
5pmqHiuKvLCm6C5OQcwJZ1W0Evx2NjJzyMQsT6c5MBTWfMDKQnI=
=a0gt
-----END PGP SIGNATURE-----

--=-4saDnkeQRwr71nfUjRPF--
