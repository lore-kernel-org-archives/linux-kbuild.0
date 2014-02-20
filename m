Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35447 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752069AbaBTADo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Feb 2014 19:03:44 -0500
Date: Thu, 20 Feb 2014 11:03:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next
Message-Id: <20140220110335.b9078dccb2478d776ab17c37@canb.auug.org.au>
In-Reply-To: <5304F28D.5070604@converseincode.com>
References: <5303C695.4030403@converseincode.com>
	<20140219111753.23912fa4bdbfeba7aa6a6c52@canb.auug.org.au>
	<53041454.6090404@converseincode.com>
	<20140219060717.GA25806@ravnborg.org>
	<53044B35.3010203@converseincode.com>
	<20140219172223.9b107d24c1e5a708a1e3cece@canb.auug.org.au>
	<5304F28D.5070604@converseincode.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__20_Feb_2014_11_03_35_+1100_HMuwc5/c4HYLlaHF"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Jan-Simon =?UTF-8?B?TcO2bGxlcg==?= <dl9pf@gmx.de>

--Signature=_Thu__20_Feb_2014_11_03_35_+1100_HMuwc5/c4HYLlaHF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Behan,

On Wed, 19 Feb 2014 10:06:05 -0800 Behan Webster <behanw@converseincode.com=
> wrote:
>
> Then we're down to just the thinkpad ACPI nested functions patch which=20
> fits those criteria.
>=20
> I will remove the other patches (since they haven't been reviewed by the=
=20
> appropriate kernel community yet), and we will only add patches to that=20
> branch that satisfy those rules.

OK, added form today with just you as contact (I can add other contacts
if that make sense - these are people/lists that will be notified of
conflicts and errors associated with your tree).  I called the tree "clang".

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Thu__20_Feb_2014_11_03_35_+1100_HMuwc5/c4HYLlaHF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTBUZbAAoJEMDTa8Ir7ZwV32AP/ir1PguG4BuMG1qHxN1xFamN
UIFFdGt8bAGUtD1xjRK/LUAY/DyHa3izg+2xIcssz52n6CzwcvBaHPg3yg7UCOVV
ME3i9G5PAJEQVB/k16MB/KUKhXPfucBg4zXGJz27ELOpVdn12BnUnlNVXW8JYTfc
AP3yEupGg8RBqy8w9rfePFLS29djq8Wepyl6W51RK+323+UhFzNhogRbwyi6iuyL
6M2z/OWScUvWzHHaN8NHoz+HtkIfty8vnsDWPGA9RlFRh8I8i9vg/a0G72nD2MkL
bl4BxFxhECa/Uta1n2oImyc0gVnzV0t96VxWC0eAEeBPnTDF8Zu7ImVXKuzruU9a
nzfmKuMuQSrrivXRiYzwDuIMpI+R3fkY0Q6XxxailSiBPH2fa5pqaeKiMPkLllww
y6S9NZAbtEyzMIrLt4YNVsAHHwH1JjDInL12i+teBc7pajk8W0ELbJR1weMNGbM7
ezszrsWDsVFcUyr4G0g/4STBZtr5mgSwtt0F98MbwjFMzikyAbgY1gdg1AZI4NCI
ZbHm8PlKn87HpQCQN0vGrrfQD4s5Aj52rTlUQuZCetktJxhOgrEBwEJtF5k8IRqA
LtlJ+uLFa2mhmzQnGF9UGWn/35EY6ADXMa0+E22aulEYrh34WiSwI1TjZq6h/8rl
AOOv51HtgvN075MUEmNM
=RHOd
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Feb_2014_11_03_35_+1100_HMuwc5/c4HYLlaHF--
