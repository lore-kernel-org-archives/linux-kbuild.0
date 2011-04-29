Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:49809 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754567Ab1D2S2p (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 14:28:45 -0400
Subject: Re: [PATCH] kbuild: Allow to combine multiple W= levels
In-Reply-To: Your message of "Fri, 29 Apr 2011 14:13:11 EDT."
             <BANLkTimsNF=OeaLSnSt2gFdDaAbJ6tMFng@mail.gmail.com>
From: Valdis.Kletnieks@vt.edu
References: <71633.1304013549@localhost> <1304083893-18849-1-git-send-email-mmarek@suse.cz>
            <BANLkTimsNF=OeaLSnSt2gFdDaAbJ6tMFng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1304101670_56837P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Fri, 29 Apr 2011 14:27:50 -0400
Message-ID: <154175.1304101670@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, bp@alien8.de, sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, davej@redhat.com

--==_Exmh_1304101670_56837P
Content-Type: text/plain; charset=us-ascii

On Fri, 29 Apr 2011 14:13:11 EDT, Arnaud Lacombe said:

> I do not really like that, it would mean that W=123, W=321, W=231 and
> W=132 would lead to the same result. What about a comma separated
> string, ala:

OK, I'll bite - if W=321 should behaved differently than 123, exactly *how*
should it be different?

--==_Exmh_1304101670_56837P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFNuwMmcC3lWbTT17ARArMwAKCub6CW1fZOFqk7qXknoY0xiJnhXACgiu8/
MOevDU7/IuwL/frfQrp25f8=
=kw2C
-----END PGP SIGNATURE-----

--==_Exmh_1304101670_56837P--

