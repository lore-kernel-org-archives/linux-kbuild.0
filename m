Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36847 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752420AbcHPVig (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 17:38:36 -0400
Received: by mail-wm0-f65.google.com with SMTP id i138so18542827wmf.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Aug 2016 14:37:25 -0700 (PDT)
From: Dmitry Monakhov <dmonakhov@openvz.org>
Subject: Re: [PATCH 1/2] scripts: buildtar fix build w/o modules
In-Reply-To: <CA+r1ZhgdtRUO3r1neBjgWJeC6D=6gK=Fos1icakYr9wV7yi+gw@mail.gmail.com>
References: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org> <CA+r1ZhgdtRUO3r1neBjgWJeC6D=6gK=Fos1icakYr9wV7yi+gw@mail.gmail.com>
Date: Wed, 17 Aug 2016 00:37:17 +0300
Message-ID: <87y43w8kfm.fsf@openvz.org>
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
>> If build configured w/o modules script fails because lib/ is not exit.
>
> "does not exist"?
>
> When I ran into this once before, it did seem the tar archive was
> fine.  But it was disconcerting to see an error message, followed by
> buildtar claiming that the tarball was successfully created...
>
>
>> +       tar cf - -C "$tmpdir" . $opts | ${compress} > "${tarball}${file_=
ext}"
>
> If, somehow, there are files in $tmpdir that aren't in /boot (or /lib)
> then this would put things in the tar archive that weren't there
> before the patch.  I don't offhand see how that could happen, but a
> more conservative approach would be to test for /lib.
$tmpdir dir was created by this script. So any files which in $tmpdir are
definitely created with the purpose, and imho it it is reasonable to place
it to tarball. But in order to be on a safe side let's preserve original
behavior. I'll resend the patch.
>
> --=20
> Jim

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCgAGBQJXs4eNAAoJELhyPTmIL6kBUjUH/0Z7C0xGfVcKojmbcKU1ZO0X
BU4yZBKhBsgaT/kH33HmfkNHcIy8u/k53tJjIpGrMxB1Vjap6aqC/NXsrgplrabJ
QolBqj4U9rj8YlZYSzt/CWQXptz5TZL2cCzSM5P+x5C4CwutdP16pcag4h4KQBAb
ItILnxIRawjOAGfXEVNW95g6zkBAr1tzi7jAkp3l19hEpNykxJSpNOvfbB0BfMK9
OWShnjTrnRDX/YNLSpA4XaGtbdNeqll4o41muyWjccCcXWU56HLnysafHSrkjWDP
bLE1/nStmBaqwhxqtQd/Bflk6Zu4c647mls6HCqx6kk5p7e9tfei8k2CdSz3IXE=
=fP6W
-----END PGP SIGNATURE-----
--=-=-=--
