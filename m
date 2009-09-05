Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from turing-police.cc.vt.edu ([128.173.14.107]:47960 "EHLO
	turing-police.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752575AbZIERIB (ORCPT
	<RFC822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Sep 2009 13:08:01 -0400
Subject: Odd Kconfig output..
From: Valdis.Kletnieks@vt.edu
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1252155974_2420P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Sat, 05 Sep 2009 09:06:14 -0400
Message-ID: <12284.1252155974@turing-police.cc.vt.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

--==_Exmh_1252155974_2420P
Content-Type: text/plain; charset=us-ascii

Saw this while doing  a 'make oldconfig' moving from -mmotm0827 to -mmotm0903:

RCU Implementation
> 1. Tree-based hierarchical RCU (TREE_RCU)
  2. Preemptable tree-based hierarchical RCU (TREE_PREEMPT_RCU) (NEW)
choice[1-2]: ?

There is no help available for this kernel option.
Prompt: RCU Implementation
  Defined at init/Kconfig:329
  Location:
    -> General setup
      -> RCU Subsystem
  Selected by: m [=m]

Where did that 'Selected by:' come from? Or is that just an artifact of
the way Kconfig implements 'choice'?



--==_Exmh_1252155974_2420P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFKomJGcC3lWbTT17ARAoazAKCLMS2hhz9lXO3eistRqMEPQnWxKACgvICa
557ZFY691/0DRczp2tjkOXA=
=B2Qd
-----END PGP SIGNATURE-----

--==_Exmh_1252155974_2420P--
