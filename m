Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580488;
	b=2RdLEuc7a/r4yNHpltH5zStIGKFGYbo3rAiHXZnp3Raveab/JwdgVzSItTK1ZgCEG9Tc
	 I1bao5OqMFxFMPXcoEvSnegYYQbEjkhViwrxQJvlERWFqVNdPtC2l2hLnEy9CdoiA+FWJ
	 D5tnOKJICQoa54XiofBDOY1C1hHO/mZZXza3mycth7MJNXPtUse5R0DaCuDd1X+P/U0+h
	 Nhdb/Sd8kNXoPsBO40MApkIc1v0iQ6bf0z1eRwREoGHdNXj86Lz3w0+oWPvNSqaKoVEWX
	 DNQo2csu9pK/7zBDmiv0EI9fel3iy31L6D20iMXms0UcTawQivNCMVAjfXZ0OoPSzsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580488;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/eRK0Q4H1a69gz0iEY9sz+8XiJ9fTW+fHc8T0efA3Fo=;
	b=zO3xvZYW84a22E5w8JfwYIwd8qzqGBZUf+WNwtyzEpw7mpmXASYYNNXx0Jw655WomgW5
	 mQ5Rr+6nYtK/2WAr8ZC8F9TFvrordVXtlfrn+KPyNbGAXJpZMoTO/9uqvqBfViqC6cOTd
	 IYPOJ6hic0rSuJcACYUTVqtDuzSIb2H3oQW0QEA2iafmQuwHMtVDzseJkpjzkf8J2dJ/m
	 R8dxgTK04S2H3fcAlb0KSJEqvWkNLrG8Z/+qUqC8TFg2zzQOzHO/vwXzCE1KNKQeRAd1L
	 2yFLYN0zkTI2uqmVqdVI69uE/VxqjT4Zyk9DAzvVFD5p2XE8UwueOSBCz2h78G3aFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PuDALw9u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28BE606A31B;
	Wed, 21 Oct 2026 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PuDALw9u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C541F000CA;
	Wed, 21 Oct 2026 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580487;
	bh=/eRK0Q4H1a69gz0iEY9sz+8XiJ9fTW+fHc8T0efA3Fo=;
	h=Date:From:To:Cc:Subject;
	b=PuDALw9upIUdSx0azjjAnV/AYIZ7HCeVxbQNzokXZsxB1kr2BZCQJ0MgVydx1i6k7
	 5vIWi5FjWKSfko6FiFBpLlIdSp5HiPCpoC243CIFejhmnmG06eCHCUSbYWVmcHXjMp
	 h2wcqiOBLNSOAKk7EuvjtDXYMg0jCvfwRnMuZ7gQUo0D3uo6DY52Uj43HldEFBXYhe
	 esIfP0IX0TJh1O6erldm1715SQ67a51Ly19vaU6TARVp0eAvwN7XYuVCXN1lhhuzLi
	 rcICG9jHHGLpAaytfERaXbjcqFq5LaXM92z/6mKYTn6vx+kKDqsyIViHntz1qlcSeb
	 jZKmPUneQwXrw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 259161AC5994; Wed, 21 Oct 2026 12:01:24 +0100 (BST)
Date: Wed, 21 Oct 2026 12:01:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>
Subject: linux-next: manual merge of the kbuild-current tree with the origin
 tree
Message-ID: <atibhAMcgKle37-g@sirena.co.uk>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="88Ull06e83rgnJc4"
Content-Disposition: inline


--88Ull06e83rgnJc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild-current tree got a conflict in:

  arch/alpha/boot/Makefile

between commit:

  c437950dceb88 ("alpha: add self-extracting compressed kernel boot stub")

=66rom the origin tree and commit:

  0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")

=66rom the kbuild-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/alpha/boot/Makefile
index 7c2a41c1e2a06,b050753e90157..0000000000000
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@@ -39,14 -38,9 +39,14 @@@ ifdef INITR
  	cat $(INITRD) >> $@
  endif
 =20
 -# Compressed kernel image
 -$(obj)/vmlinux.gz: $(obj)/vmlinux FORCE
 -	+$(call if_changed,gzip)
 +# Self-extracting compressed kernel image: a small ELF stub (see
 +# compressed/) with the real vmlinux linked in compressed, which aboot
 +# loads and enters like a plain vmlinux.
 +$(obj)/compressed/vmlinux: vmlinux FORCE
 +	$(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
 +
 +$(obj)/vmlinuz: $(obj)/compressed/vmlinux FORCE
- 	$(call if_changed,copy)
++	+$(call if_changed,copy)
  	@echo '  Kernel $@ is ready'
 =20
  $(obj)/main.o: $(obj)/ksize.h

--88Ull06e83rgnJc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatibgAAKCRAv73Ows9A4
iXtBAP449H8f4IXGpD76a4y/ZfJJCmDEsaKx8EU8qYwm6gjINAEA6Wt8EHRtda1g
2jsKm3YlUD5mlvB2Ngq8NUKqQZBiZg8=
=4Zgr
-----END PGP SIGNATURE-----

--88Ull06e83rgnJc4--
