Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409201;
	b=y9s0TokXQ7VwV9pAUwCL+TxplONGgYK7s8myR76ijGxJyoVJnx3OkN/l2oZFMMFCVFBT
	 iobEkCVoEStgAinKtBZPyZt8IGCgMpD2dxvh+VSULiIfbSPMqVq8pu6ACQJNDIINlS7bV
	 NUReTtiALcG/enlHO9js1e2Xz2Hw/A3w19I8+VHNzlvx2P3a2PqQ5L8/vuTvoFISiPx5c
	 tm7WiFTnhxEyVoIXG7D5dDq0asjcmRzCHZ6VRMTjD8cRJces4GKCc721IwKa9I2PDI9Vo
	 1VwoBF2j16428toVeFLjN5ahE8yJzovhtqmz40+ArjsZdU0Gm1LemRbE+a2gtSjOqpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409201;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ypiC4uNdfcoGbAoTjz+aGTLh9KVOkc1XPsD+CPrl5Aw=;
	b=Eq4Svbmnhc9B50ESkFQ9AEUITuAitkTFpp6hYNzTfmkxUSzDZ3LqVsZXudQk08bP19ZA
	 CBVa1Ohqb4B9MXolqp8y7UU0tDEZ4+uNYXyfb+VAAp0BUPW4sauC3nk75fuZQFaU83Qd+
	 +wYyXYUMlIF2KLy3PoheIpRXyZlwN68eSN3QJg2VtMhLA+nYl6Qh9hKOwBNwZnn30iPZN
	 hF1nwVSPwcQJZGfnBszShiyL3csGeQbw1TWDsQO0mEvLvat49FFlgvKK+oW/HdBD139Wh
	 W9uhKwAmtbA0DqbWBa/apq3RBk8ShIR+L9AxAOl0L/9wv79KqVwlBIIiksN8IJVeCOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GarvISh1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1F60A5BFE;
	Wed, 11 Nov 2026 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GarvISh1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E96D1F00A0A;
	Wed, 11 Nov 2026 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794409201;
	bh=ypiC4uNdfcoGbAoTjz+aGTLh9KVOkc1XPsD+CPrl5Aw=;
	h=Date:From:To:Cc:Subject;
	b=GarvISh1kpXSifRwdSycH+m4H/8UuNppcE2/JM3eQF8f2KvVd8KuXYbH09zVO+hiC
	 qmK/12oxLtHpjm6YnqhgOmc6hIk7kYKR2tswf2t2XOgdVWv/aM1FuTkMAMP+dtIblZ
	 6rYIw11Gtd+8Xq2YCjMK692kLwnu3l5BAjkuaqPRPS2v+1kxRyRxcev3m0YdSygM41
	 czV2qc6IxkG4RdTd+Fg/qftiEWleyuvlzMkB4bTmznT019SXsZraZTV6o5I1b63Rw5
	 o7G5ihlXnaPPEC5OsAajaJIj1oTe1rw+Uogqussaz3QUaUVuvgQig0RsYegeuzqhCL
	 qx+0Y9LZs5ufg==
Date: Wed, 11 Nov 2026 14:59:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: linux-next: manual merge of the rust-fixes tree with the
 kbuild-current tree
Message-ID: <avSC7GXOwnbuycR8@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="OYsxV2iGVwCNs3L0"
Content-Disposition: inline


--OYsxV2iGVwCNs3L0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust-fixes tree got a conflict in:

  scripts/Makefile.autofdo

between commit:

  3df238d7a9f5a ("kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-p=
rofi)")

=66rom the kbuild-current tree and commit:

  1178120c3bed1 ("kbuild: rust: support stabilized flag `-Cprofile-sample-u=
se` for Rust >=3D 1.100")

=66rom the rust-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/Makefile.autofdo
index 55fda66ad960c,32c18df237f1b..0000000000000
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@@ -13,10 -13,8 +13,10 @@@ endi
  ifdef CLANG_AUTOFDO_PROFILE
    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFIL=
E) -ffunction-sections
    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
 +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-sa=
mple-profile-use-profi)
-   RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PRO=
FILE) -Zfunction-sections=3Dy
+   RUSTFLAGS_AUTOFDO_CLANG +=3D $(if $(call rustc-min-version,110000),-Cpr=
ofile-sample-use,-Zprofile-sample-use)=3D$(CLANG_AUTOFDO_PROFILE) -Zfunctio=
n-sections=3Dy
    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
 +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=3D=
false
  endif
 =20
  ifdef CONFIG_LTO_CLANG_THIN

--OYsxV2iGVwCNs3L0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0gusACgkQJNaLcl1U
h9DH5Qf+J72YfvUWtVgi4IA0eW3JrXE6n5BBML8P3P2IhD8dm5ldpr1wLEBrwuq6
sYg+kfO/8rllR0CPAncnktNJWzgW764lqSgZczl8xTLrHOnO8edW7aRBcm/Pb480
FP5S4Iud0s0ueHhwwu8F1w2Nwjvr4PIlkGb19pi59+SZAGzAiCkaYK2pa0x+N7Mn
KXyk3S9qf8JlLmtwzZLWgksJb0Cdz/DwhOBMJoqgvhM6t022mGUkePgMGyv23Ato
io+aub9uLk7nyiMoo8DLtC5mne9S7oU7jS/j0LCJdyJIJNO/vIsa18JYEPy6CxqR
z2auSoa0BXh9s5O3BDCumqZ5LW/OcA==
=Hv0S
-----END PGP SIGNATURE-----

--OYsxV2iGVwCNs3L0--
