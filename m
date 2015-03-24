Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from omr2.cc.vt.edu ([198.82.141.100]:54063 "EHLO omr2.cc.vt.edu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932114AbbCXQIp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Mar 2015 12:08:45 -0400
Subject: Re: [PATCH] kbuild: Don't reset timestamps in include/generated if not needed
In-Reply-To: Your message of "Tue, 24 Mar 2015 16:36:04 +0100."
             <1427211364-20352-1-git-send-email-mmarek@suse.cz>
From: Valdis.Kletnieks@vt.edu
References: <5502B546.5010806@suse.cz>
            <1427211364-20352-1-git-send-email-mmarek@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1427213311_2001P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Tue, 24 Mar 2015 12:08:31 -0400
Message-ID: <7468.1427213311@turing-police.cc.vt.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

--==_Exmh_1427213311_2001P
Content-Type: text/plain; charset=us-ascii

On Tue, 24 Mar 2015 16:36:04 +0100, Michal Marek said:
> Use filechk to generate asm-offsets.h and bounds.h.
>
> Reported-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
> Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  Kbuild | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Different from my patch, but that's OK.  Feel free to stick an Acked-By:
on there. :)


--==_Exmh_1427213311_2001P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBVRGL/wdmEQWDXROgAQILdQ//YaMqKzTBV977wzfIAnk1/T4jo7XLZAOH
rIUP641QrunfJmV9lNRleJXW2LdQRjmSUQBmt31IlajiDUvr+q0GOnxPnWNgSb3G
UsV0Q5E4I5l/4sNvagrxVF/ElzC2v901Zm4Dja10tzojba0kMFKG7fEaN9gQZvv1
HQfGjA91932h/crOY2YyebROrjJZGIiavJWgppQ5gVET0lQBQpunIrRb4K+KsEbP
gFkzuV/fLfbP9NnNuiUBx96OjdrNKrxIUsRl9ZsMJ8e74o6T1rlr8qrl/WmUm4f0
rtK894XzeLFY2N1a9hnvO1k3/MKQ235dOWjwPwQOu0/GSbDYzPKdaSNaAKBwzhrB
HFLQjAm8gAU7L6ZGSPZg6AbU43NemMH/poXvxmFD4/fCBo66bxoHLqo0JUZ8RMSk
hYfj0tPwjl1NEZsL3xEWw+EqpOkTQtEnKKp1kgr73st+rYxdrO2RskDO4HiWXIwV
32A4+e5S7xEV9ef2gJedd6VhkdCM3E0CY7k6uFy+YmOvlJwsK83ntww+Hgg+33j5
4foODx1YSAQAov8Rqt1GjQPzPPpikBa8YKgTvZVU6u5Em/c5mqDF/6xYD1XTwCuC
6D/soY/DBPd8tBRqhUXkXYHbDHYJxsfIh6amEwOadPsyCXgH5oBtVJmhhYsoFVFW
Strl+Ra+vCo=
=ZhBM
-----END PGP SIGNATURE-----

--==_Exmh_1427213311_2001P--
