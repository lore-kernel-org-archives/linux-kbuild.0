Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:60554 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756509Ab1DLD0D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Apr 2011 23:26:03 -0400
Subject: Re: [PATCH v2] kbuild: Allow to override LINUX_COMPILE_BY and LINUX_COMPILE_HOST macros
In-Reply-To: Your message of "Mon, 11 Apr 2011 17:04:49 +0200."
             <1302534289-17689-1-git-send-email-mmarek@suse.cz>
From: Valdis.Kletnieks@vt.edu
References: <4D9B3AA4.5090402@fastmail.fm>
            <1302534289-17689-1-git-send-email-mmarek@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1302578757_5348P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Apr 2011 23:25:57 -0400
Message-ID: <18001.1302578757@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: jwjstone@fastmail.fm, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--==_Exmh_1302578757_5348P
Content-Type: text/plain; charset=us-ascii

On Mon, 11 Apr 2011 17:04:49 +0200, Michal Marek said:
> Make it possible to override the user@host string displayed during boot
> and in /proc/version by the environment variables KBUILD_BUILD_USER and
> KBUILD_BUILD_HOST. 

> +
> +KBUILD_BUILD_TIMESTAMP

Changelog section doesn't match actual patch.  Other than that, I'm OK on this.

--==_Exmh_1302578757_5348P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFNo8ZFcC3lWbTT17ARAn/tAKDPK4FWOpL/gBSB8dVtjuLJBYN9AACgg0qg
oTXNm96m8yN3jUTHNWA+5wo=
=gslI
-----END PGP SIGNATURE-----

--==_Exmh_1302578757_5348P--

