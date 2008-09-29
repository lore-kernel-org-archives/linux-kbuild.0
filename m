Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fallback.mail.ru ([194.67.57.14]:2820 "EHLO mx4.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752131AbYI2J2c (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Sep 2008 05:28:32 -0400
Received: from mx71.mail.ru (mx71.mail.ru [194.67.23.4])
	by mx4.mail.ru (mPOP.Fallback_MX) with ESMTP id 3E791540C09
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2008 09:50:13 +0400 (MSD)
From: Andrey Borzenkov <arvidjaar@mail.ru>
Subject: Building two (external) modules from the same sources
Date: Mon, 29 Sep 2008 09:49:34 +0400
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2083589.Lk0uras9UW";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200809290949.35749.arvidjaar@mail.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

--nextPart2083589.Lk0uras9UW
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have here driver that can be built for two different types of
hardware from basically the same sources (this is port of old Agere
drivers for Hermes-I/Hermes-II chipsets). Build differs only in one
define -DHERMES2 and single file with different firmware. Unfortunately
"if HII" are spread over sources which makes splitting of sources rather
questionable.

What is the best way (from kbuild POV) to build two modules - for H-I
and H-II - from the same set of source files?

TIA

-andrey

--nextPart2083589.Lk0uras9UW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkjgbG8ACgkQR6LMutpd94x9WQCZAQkQUQGFw+NqS4XTReiw57b6
pUsAn23EvcFOUIF9Y38hQzBDipClhYgy
=71CF
-----END PGP SIGNATURE-----

--nextPart2083589.Lk0uras9UW--
