Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:52550 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758189AbZKFQFo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Nov 2009 11:05:44 -0500
Subject: Re: [PATCH] nconfig v5
In-Reply-To: Your message of "Fri, 06 Nov 2009 10:36:54 +0200."
             <1257496614-12052-1-git-send-email-nir.tzachar@gmail.com>
From: Valdis.Kletnieks@vt.edu
References: <1257496614-12052-1-git-send-email-nir.tzachar@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1257523499_2875P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Nov 2009 11:04:59 -0500
Message-ID: <4185.1257523499@turing-police.cc.vt.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nir.tzachar@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org, zippel@linux-m68k.org, andi@firstfloor.org

--==_Exmh_1257523499_2875P
Content-Type: text/plain; charset=us-ascii

On Fri, 06 Nov 2009 10:36:54 +0200, nir.tzachar@gmail.com said:
> Building on menuconfig, this patch implements a more modern look interface using
> ncurses and ncurses' satellite libraries (menu, panel, form).

What is the minimum release of ncurses needed?  Some of us silverbacks have
bad memories of twisty little mazes of ncurses releases, all incompatible. ;)

(Much less of an issue if we're only trying to build on Linux - but at least
in the semi-recent past we've supported doing a kernel build on non-Linux
boxes.  Did that get lopped out at some point, or do we need to worry about
what ncurses Solaris ships with?)

--==_Exmh_1257523499_2875P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFK9EkrcC3lWbTT17ARAu8TAKDp+W2/NJzWADBeAjmqQEm65bOfYgCg330W
0NV+D86LCWRfAZba0FgYQfU=
=XBfP
-----END PGP SIGNATURE-----

--==_Exmh_1257523499_2875P--

