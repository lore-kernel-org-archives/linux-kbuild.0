Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3370274B46;
	Sat, 12 Sep 2026 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237478; cv=none; b=PAXb0dhl1EYflIw31A0BAQtxKYqMAEtEL6BL/fmZNekr5tJtyTY7urr+7QeuX8gYv3TVWMPgOJrWwKvArJGgGQ9u/a+nQya+tYthj9offvRnzqWDeT2z8KAGXAgudGYXQxwZ2jrhCKlEWXgHDuM/2XKojRpZvHqW5PqSlBk874g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237478; c=relaxed/simple;
	bh=5rC995MdmoB+yKLD+R2X/lH3ILpMwKyWTIc715LNsks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwrZda6X6KPNiGn3tiyVDEhAzrniOXWdVPp4SjHYeh43hgMmj7I5dN1VmE0hxO0r4nuDjkFXzG7EjWfNxhWuC6SQRxOoupHFyqTvsdZf8fruiNWhmYMG4dgC9jc29JjsePDFTJKoDSkzYVqVL7Rx2xf29MeG0DdxIaBYfOXkZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaBtt1Rj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaBtt1Rj"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4B87F1F000FF;
	Sat, 12 Sep 2026 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789237476;
	bh=pIuND4CNHBGiKKz4oPug/98DKr1QZI9IOqwPBeb3o9g=;
	h=Date:From:To:Cc:Subject;
	b=VaBtt1RjsRoVE8nEiLOAXYbDHIytILZeoMGSI37kPctaYkQhjlPwVdWVJMxC/2/XT
	 zoXWpKrvl2MY572YoSX0lKBV0eFT893etFf0Rf04ulrYbZr0lWaf42fSkMCeE7MeWP
	 uWktdJCdLzwgAvRjjfuCg+p+E1y8ypJelwzruf3MqIa97RJ9xkemqU5FKv/+DNPbDW
	 DK6V8yLI3fV8zzAQydIQFUUTUzPRCKksI7gRpc18/jK1Jg/RFqkRv1D/mqkTZDc9Qh
	 EHe1RDPhA11y5jtu/RFlGVHn+PiJIhLb/+KKN7dD1HIQnF9tlW9d+s5oRQq0FGVr13
	 nFpbi3XXAv2Rg==
Date: Sat, 12 Sep 2026 20:24:30 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Vlad Poenaru <vlad.wing@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.3 #1
Message-ID: <aqWY3gsP1nBj7EjT@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Vlad Poenaru <vlad.wing@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7aVJ2Rd2q2H/kann"
Content-Disposition: inline


--7aVJ2Rd2q2H/kann
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please consider pulling these four Kbuild fixes for 7.3.

The first one fixes a build race, the second one fixes builds on stable
branches.

The last two are low-hanging fruits from Lorenzo's recent kbuild speed-up p=
atch
set that fix older symbol leakages; they qualify for kbuild-fixes scarcely,=
 but
in order to accelerate the patch set incorporation it would be great if you=
'd
take these, too.

Thanks and kind regards,
Nicolas



The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git t=
ags/kbuild-fixes-7.3-1

for you to fetch changes up to 59351365ac271b5e0eb180f211c531476a36221f:

  scripts/mksysmap: fix escape of '$' in the __pi_ pattern (2026-09-12 20:0=
1:19 +0200)

----------------------------------------------------------------
First round of Kbuild fixes for 7.3

 - kbuild: don't delete in-flight filechk temporaries in asm-headers

   A rule for generating header files was changed from using make
   $(wildcard) fnglob to 'find' instead; as 'find' finds "hidden" files
   by default, temporary files from Kbuild's 'filechk', used for
   generating asm header files, may get deleted and break header file
   generating.

 - scripts/sorttable: Mark long_size as __maybe_unused

   Fix builds with clang-23 or newer on trees w/o commit b055f4c431e3
   ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]");
   targetting for backport to stable kernels < 6.19.

 - scripts/mksysmap: drop the MODULE_INFO() symbols from kallsyms

   Update regexp to remove kallsyms entries from kernel binary, saves
   about 32 KiB of bzImage.

 - scripts/mksysmap: fix escape of '$' in the __pi_ pattern

   Prevent arm64 PIE namespace local symbols from appearing System.map
   and /proc/kallsyms.

Cc: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>
Cc: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
Cc: Vlad Poenaru <vlad.wing@gmail.com>

----------------------------------------------------------------
Lorenzo Stoakes (ARM) (2):
      scripts/mksysmap: drop the MODULE_INFO() symbols from kallsyms
      scripts/mksysmap: fix escape of '$' in the __pi_ pattern

Nathan Chancellor (1):
      scripts/sorttable: Mark long_size as __maybe_unused

Vlad Poenaru (1):
      kbuild: don't delete in-flight filechk temporaries in asm-headers

 scripts/Makefile.asm-headers | 2 +-
 scripts/mksysmap             | 4 ++--
 scripts/sorttable.c          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

--=20
Nicolas

--7aVJ2Rd2q2H/kann
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmqlmNoACgkQB1IKcBYm
EmmbPw//ehl/+0Awtxafhx4lQU69K8rlqOhC/KcLt957hhzzWRqY7sKZ8FilaDUp
TS6AUxAor0mgYKAi2AAJXG53FyedyTHZqbCQsszmpAROz6FWT22OKkQIfo3mMWeP
P/4Z++BV7+cPUPeZhxFM41XKkogDYvw1SQXNIm8Uie9nCVnRNFTTJ0YwsUipxGhj
emaU2gyRw2HdBO0x7puGYtPKjuEE/BwFuWMg95Bnr9cBZN+aKiWpN//P/eB9cHHq
vG3ANlODek1htwArcVIYa6vnU8lNLB0CK2f/sw6qjaSGHxm2y0YjGTjw7ZOCvDDs
SCDY6l873PZgnfQc6Q7RtX4P/RpLh+xmMS5rEanPdBWvwDIy/tl29uGelbJboruO
8TNEIbMC2LvQSoAGnjMUd0+zqwuTM2fa/yyMs/cY82epGMN71JSmRVIj+8vusyDt
+5mb7/1XbbQabjzc1ffwASCSJSyQlEhN1KOsoLtbFx+mli1p2IQyh/lU9ls/DP99
Z2ApFi1OaMPHPl+/U4GNq6KFn1JgEoFq+DW7jfzN7iyW/SxHYqJHIW6G+LtrU07I
vOm+Tgbi+XSYspC0Q9xymWZbJc7GkfkKhfUBRMLlGUVLCghZEydLBEydOzk/miSA
Yt5RG/cP+nJwqA+8ZgabvfHCje6BlHv+b35mZOnJLbqMxY7IojA=
=Lo4h
-----END PGP SIGNATURE-----

--7aVJ2Rd2q2H/kann--
