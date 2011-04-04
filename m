Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:56655 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061Ab1DDMqJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Apr 2011 08:46:09 -0400
Subject: Re: [PATCH 2/2] kbuild: move KALLSYMS_EXTRA_PASS from Kconfig to Makefile
In-Reply-To: Your message of "Mon, 04 Apr 2011 13:40:51 +0300."
             <1301913651-9055-2-git-send-email-dedekind1@gmail.com>
From: Valdis.Kletnieks@vt.edu
References: <1301913651-9055-1-git-send-email-dedekind1@gmail.com>
            <1301913651-9055-2-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1301921158_92930P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Apr 2011 08:45:58 -0400
Message-ID: <131611.1301921158@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paulo Marques <pmarques@grupopie.com>

--==_Exmh_1301921158_92930P
Content-Type: text/plain; charset=us-ascii

On Mon, 04 Apr 2011 13:40:51 +0300, Artem Bityutskiy said:

> 3. By default KALLSYMS_EXTRA_PASS is disabled and if kallsyms has issues,
>    "make" should print a warning and suggest using KALLSYMS_EXTRA_PASS

If the Makefile has enough information to print the warning, why can't it go
ahead and do the extra pass itself instead of issuing the warning?

(I'm obviously missing something here, as I'm foolishly posting to lkml before
caffeine ;)


--==_Exmh_1301921158_92930P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFNmb2GcC3lWbTT17ARAloDAKD+x1wg/vN9qk/rvfpcBG42d0cszACfRXyJ
kXlTDEMJ28XKz6VNmbypuvo=
=gnYt
-----END PGP SIGNATURE-----

--==_Exmh_1301921158_92930P--

