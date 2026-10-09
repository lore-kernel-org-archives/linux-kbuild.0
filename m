Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED4F36CDF2;
	Fri,  9 Oct 2026 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582112; cv=none; b=eP/sRXeEmwr2qrdQPqDrxSZrMAEsOxjc49eSA55aRkbgN4EWXe5k6ehKIp1n0+G0DBuT/0XdyJe9+d5rG44dzSm9RXGCpdiV+cYWB2I/f+HMp1T3a63nob4KHpLm9qUgnvuR7V/k+nq1Jq74JumhzTIWlpD+njBLeRRB/MJx664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582112; c=relaxed/simple;
	bh=0CoMzLSNsM7Wpb1lVhrrPJ4aejvfuP2Q4m/SRfQlmtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2NZaUkGQ2MEibXTfRRMZKVAsK9h/odcbWWrNjXrm1Gs6u7A/KItvMd/vfnX/J4yjoR43pQfPhz+O6j15sO/57W7XKAUQZKeAglPL94a7eh1doWD6dDFawzEF62Y4Z3jj9+WP3qhkBSpciIB8JDuPUD1TBPdm/1XIbKTDmgyuJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fERJ0fIE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fERJ0fIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26711F000FF;
	Fri,  9 Oct 2026 21:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582111;
	bh=MBuw0vX1F78VJww/vK9poqOhMOFyKJv51MnsKngioFU=;
	h=Date:From:To:Cc:Subject;
	b=fERJ0fIEzOFdGfoyjsrIDhoNTJ7HQq1G7Hfcmgvyvvk9Enlj9kYZfBSm8wUaxdcmZ
	 wAJ2fGVaGXkDMn2YHNOkNqQwjg1usRG3fz0VwXdb888Wv83+9ozoHCLCYiavdpyH82
	 tDnd+XK5Z6sLT5VRF8TWCZRVYRu4L2k3eWPKD/c71rqddcHsJyf+mlDoP5wvEKF0DI
	 Rz07DFbUPW7ppWYc2fa9zbzNQDQaUUrg4Nyv53obxAYhv5x28hNerPHRIA6D/jc3oJ
	 ABDOSYirnrk69f4uqT/Asoa4nz0fqEBkKkqVLsRdHvr+ysMnQuxOi8851KHZgglp/Q
	 0aZhUGwYsXddg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 694891AC57D0; Fri, 09 Oct 2026 22:41:41 +0100 (BST)
Date: Fri, 9 Oct 2026 23:41:41 +0200
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: linux-next: manual merge of the efi tree with the kbuild tree
Message-ID: <aslflbcgByI1rH2_@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9YyDweQGVCwp+fWi"
Content-Disposition: inline


--9YyDweQGVCwp+fWi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the efi tree got a conflict in:

  drivers/firmware/efi/libstub/Makefile

between commit:

  454e00cf8ee5a ("kbuild: avoid re-running compiler and linker probes")

=66rom the kbuild tree and commit:

  aa712d73350dc ("efi/libstub: Disable kernel stack erasing in the common f=
lags")

=66rom the efi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/firmware/efi/libstub/Makefile
index 415f63105b481,7bb5e5066c732..0000000000000
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@@ -40,7 -40,8 +40,8 @@@ KBUILD_CFLAGS			:=3D $(subst $(CC_FLAGS_F
  				   -D__NO_FORTIFY \
  				   -ffreestanding \
  				   -fno-stack-protector \
 +				   $(CONFIG_CC_OPT_NO_ADDRSIG) \
+ 				   $(DISABLE_KSTACK_ERASE) \
 -				   $(call cc-option,-fno-addrsig) \
  				   -D__DISABLE_EXPORTS
 =20
  #

--9YyDweQGVCwp+fWi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaslflQAKCRAv73Ows9A4
ifHZAPwMMUSFDYAKjZulVxxg5WqZgUFCqYgm4slrrUQmcDvzNgEA9ZKnsPv7hRcH
+MTFMq1sBpPEJN9z1Zg3BRmkvXVm5gw=
=7XHq
-----END PGP SIGNATURE-----

--9YyDweQGVCwp+fWi--
