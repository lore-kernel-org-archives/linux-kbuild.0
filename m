Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:35313 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932979Ab1JXQ4T (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Oct 2011 12:56:19 -0400
Subject: Re: [PATCH RFC] try to create KBUILD_OUTPUT automatically
In-Reply-To: Your message of "Sat, 22 Oct 2011 11:12:29 EDT."
             <alpine.LNX.2.00.1110221049460.59156@linux>
From: Valdis.Kletnieks@vt.edu
References: <alpine.LNX.2.00.1110221049460.59156@linux>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1319475304_2592P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Mon, 24 Oct 2011 12:55:04 -0400
Message-ID: <8033.1319475304@turing-police.cc.vt.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Foley <pefoley2@verizon.net>
Cc: Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mmarek@suse.cz

--==_Exmh_1319475304_2592P
Content-Type: text/plain; charset=us-ascii

On Sat, 22 Oct 2011 11:12:29 EDT, Peter Foley said:
> This patch makes it possible to execute make O=work instead of
> mkdir work
> make O=work

The case can be made that this is a Bad Idea, because it means you can't catch
a typo in your O= setting.  This is particularly bad when it silently fails to
update the stuff in out-dir because you did a 'make O=out-diir'.

So NACK on this, if anybody cares what I think... ;)


--==_Exmh_1319475304_2592P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFOpZhocC3lWbTT17ARAl/eAJ97DHrnIkFcivMcLg/HgJbTA6pECwCfehy0
HCq3iqgo/rN5u7o+XasDpvY=
=XURA
-----END PGP SIGNATURE-----

--==_Exmh_1319475304_2592P--

