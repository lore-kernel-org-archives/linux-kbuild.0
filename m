Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48498 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721Ab0CKFDe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Mar 2010 00:03:34 -0500
Date: Thu, 11 Mar 2010 16:03:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] kbuild: Do not unnecessarily regenerate modules.builtin
Message-Id: <20100311160326.bad1500e.sfr@canb.auug.org.au>
In-Reply-To: <1268047222-13218-1-git-send-email-mmarek@suse.cz>
References: <1268047222-13218-1-git-send-email-mmarek@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Mar_2010_16_03_26_+1100_VqnVbtbyV0If52Gl"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org

--Signature=_Thu__11_Mar_2010_16_03_26_+1100_VqnVbtbyV0If52Gl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon,  8 Mar 2010 12:20:22 +0100 Michal Marek <mmarek@suse.cz> wrote:
>
> Only regenerate it if the configuration has changed. Also, do this after
> the modules build to fix errors with some weird Makefiles that are
> generated during build.

This breaks a "make modules modules_install" type build:

$ rm -rf ../ntest.obj ../lib
$ mkdir ../ntest.obj ../lib
$ echo CONFIG_MODULES=3Dy >../ntest.conf
$ KCONFIG_ALLCONFIG=3D../ntest.conf make O=3D../ntest.obj allnoconfig
	.
	.
$ make O=3D../ntest.obj INSTALL_MOD_PATH=3D../ -s modules modules_install
cp: cannot stat `/home/sfr/kernels/ntest.obj/modules.builtin': No such file=
 or directory

reverting that patch allows that build to work again.

Unfortunately, this breaks our test system which like to do

	make zImage
	make modules
	make modules_install

The last step fails :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Mar_2010_16_03_26_+1100_VqnVbtbyV0If52Gl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuYeZ4ACgkQjjKRsyhoI8zX0gCfd7Yds4cFbYGQVDZFz9eP/MCc
AScAoLWyRGKudeCEUqNL95Bk8AKjEu7P
=R9SB
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Mar_2010_16_03_26_+1100_VqnVbtbyV0If52Gl--
