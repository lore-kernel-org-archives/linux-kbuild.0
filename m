Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:35494 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab1E3PI4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 May 2011 11:08:56 -0400
Subject: Re: [PATCH 2/4] kbuild: Fix <linux/version.h> for X.Y versions
In-Reply-To: Your message of "Mon, 30 May 2011 16:50:50 +0200."
             <1306767052-15593-3-git-send-email-mmarek@suse.cz>
From: Valdis.Kletnieks@vt.edu
References: <1306767052-15593-1-git-send-email-mmarek@suse.cz>
            <1306767052-15593-3-git-send-email-mmarek@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1306768129_2897P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Mon, 30 May 2011 11:08:49 -0400
Message-ID: <5164.1306768129@turing-police.cc.vt.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--==_Exmh_1306768129_2897P
Content-Type: text/plain; charset=us-ascii

On Mon, 30 May 2011 16:50:50 +0200, Michal Marek said:

> +	expr $(VERSION) \* 65536 + $(PATCHLEVEL) \* 256 + 0$(SUBLEVEL));    \

expr isn't going to interpret that last field as octal, is it?

--==_Exmh_1306768129_2897P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFN47MBcC3lWbTT17ARAjs8AKDuRh/ZlXbZuvJAx9aur73aDQAgNgCgqpe1
oNA5NbC+ZtkyW6R9aAX6sGQ=
=nC+B
-----END PGP SIGNATURE-----

--==_Exmh_1306768129_2897P--

