Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.michael-prokop.at ([88.198.6.110]:50773 "EHLO
	mail.michael-prokop.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756462Ab0ICL67 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Sep 2010 07:58:59 -0400
Date: Fri, 3 Sep 2010 13:58:54 +0200
From: Michael Prokop <mika@grml.org>
Subject: Re: scripts/setlocalversion: information retrieval about git
	repository state
Message-ID: <2010-09-03T13-54-06@devnull.michael-prokop.at>
References: <2010-08-25T00-33-12@devnull.michael-prokop.at> <4C77CB27.1070700@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline
In-Reply-To: <4C77CB27.1070700@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org


--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Michal Marek [Fri Aug 27, 2010 at 04:26:47PM +0200]:
> On 25.8.2010 01:03, Michael Prokop wrote:
> > Huh? Ok, scripts/setlocalversion uses 'git describe --exact-match':

> >   % git describe --exact-match
> >   fatal: no tag exactly matches 'd1b113bb028999e82a8528e1484be8c23fb5a7d9'
> >   % git branch --contains d1b113bb028999e82a8528e1484be8c23fb5a7d9
> >   * master

> Git describe only looks at annotated or signed tags (git tag -a/-s) by
> default.

Thanks for the pointer.

My issue is still valid though: scripts/setlocalversion of recent
kernel versions should be adjusted -> either check for the untagged
state or clarify/improve the comment about it. :)

I'd provide a patch for that if you let me know what's the way to
go.

regards,
-mika-

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkyA4v4ACgkQ2N9T+zficugvjwCePxw0s8CjekA3z0KhC3ggYmTQ
4IgAniTLeE4PZ/pjk5t0yLwMJl/s1Ue7
=LFGn
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
