Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37928 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752041AbcHPVeX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 17:34:23 -0400
Received: by mail-wm0-f53.google.com with SMTP id o80so195526034wme.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Aug 2016 14:34:23 -0700 (PDT)
From: Dmitry Monakhov <dmonakhov@openvz.org>
Subject: Re: [PATCH 2/2] scripts: buildtar use parallel compress if available
In-Reply-To: <CA+r1ZhhSa0bfP_iDOP8zsXtEcKYmwWQViyhAq-bPjvk93di58w@mail.gmail.com>
References: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org> <1471354514-12323-2-git-send-email-dmonakhov@openvz.org> <CA+r1ZhhSa0bfP_iDOP8zsXtEcKYmwWQViyhAq-bPjvk93di58w@mail.gmail.com>
Date: Wed, 17 Aug 2016 00:34:16 +0300
Message-ID: <871t1o9z53.fsf@openvz.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jim Davis <jim.epost@gmail.com> writes:

> On Tue, Aug 16, 2016 at 6:35 AM, Dmitry Monakhov <dmonakhov@openvz.org> w=
rote:
>
>> +               type pigz >/dev/null 2>&1 && compress=3D"pigz"
>
> Isn't the "type" builtin a feature of the bash shell?  The buildtar
> script won't necessarily be executed by bash.
Yes, you are right.  Let's use '/usr/bin/which'. I'll resend new version.=20
>
> --=20
> Jim

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCgAGBQJXs4bYAAoJELhyPTmIL6kBU7wH/RfuHmKpHkf+NZ4fT/q171/R
7vSoiv1XhPSMg1awN7XWxj1461kJ1TdmrTfKoQQulkVu0WB4SBPPPUPSmzFT1f8T
RhQro0Ztq8yVy7PU0NU2CqWcXuYxRAEemztrwqs/aYDUFgbonGUUE01/WL6b2xEf
iVt8eOC4ahbq07ihLe6r8Yujw+PRiVOj7K8Mk0MwohKHy+B6O93oJ5I/XzMlypi3
ZNcVfKT3Pu4lI4yvZeLDHImVtgr8harvkopTIzBhWriYdcSrE5G3GEd7Xb3gPBHQ
+76QbU8rZjSbskhc/asrw/W9Xghc35xE2ZPsXPJ2Nqh1+bGjsE5cHT5uISDjJxg=
=DORs
-----END PGP SIGNATURE-----
--=-=-=--
