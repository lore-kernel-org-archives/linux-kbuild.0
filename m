Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A5845000;
	Sat, 15 Aug 2026 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821347; cv=none; b=Zw35Y29MgQn3ocB7evaGW6M3Cx/hcIHEIfWak1oZyBHhhno5fih6BKDKyAi9Xi9xNXCXuvK6WkWEpvDRJowUrewyKpmrA3qs4dlz4Q+O20ZCQimotEsmztoukHHTBAXIOdtw8Z2MC7L0kIYW7CW4mBNGASZUmdp3niBt3Vvjv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821347; c=relaxed/simple;
	bh=Ri9an3elSKgP/MLKFimIITL23yBLMVAshQS5rKkn9WM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ryi7nt8wuacV8d+rIKEPXC1UbU48IS/YgsF2hpvRirLeBzMcmwfUT60nPDLH8q664uFvla3D8+/zbbywxvryh5J3B8uGeWS0pZ5DymJFLxILIpTClN+GjxehXnrSubqKOLya7i2kHOB9ETLlWr1WIwNFvMGByI58NJydxoV+6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8wgdkLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8wgdkLz"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 22B101F000E9;
	Sat, 15 Aug 2026 19:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786821345;
	bh=M0ivvrBMFLkRgM77e4Uue97QeXb55ofiKiyUxo04XLo=;
	h=Date:From:To:Cc:Subject;
	b=E8wgdkLz4F9e3UFZ7ZROKXn2PpVmVc8ZSfXnw1vdpbdE1m8q0ltxB7JyP9biAvLB7
	 fJKV9ul+kv2Dktwq6eUntagTKxnVknSbh13fBwZ0Giy93bY1maj3kxI7iGV63r2Tf6
	 YdkDh83B/GdFA04Zfd8aP4JrVqqVncxQ1JeGUmMnMzMLCXY76WmnqNl64QJOX0hUd1
	 OpqLdcdDD0BUjnVULtrHieDiE/57s3hxOQJS5te+x5ctjBX72guu1/hPImTtx0GNQ1
	 dRfi43cxHrL5avsigNn1NKJPMS5GtXUm/SdQOWy/5662EqPz9ka2hcbtDSqCu01DKm
	 nkfZ9z9uyROIw==
Date: Sat, 15 Aug 2026 21:15:38 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	Breno Leitao <leitao@debian.org>, Elsie Heck <its@elc.moe>,
	Gustavo Luiz Duarte <gustavold@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Julian Braha <julianbraha@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Martin Weiss <Martin.weiss2410@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Huang <sef1548@gmail.com>, Nicolas Schier <n.schier@fritz.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robertus Diawan Chris <robertusdchris@gmail.com>,
	Rong Zhang <i@rong.moe>, Sergei Litvin <litvindev@gmail.com>,
	Simon Glass <sjg@chromium.org>, Thomas Huth <thuth@redhat.com>,
	Xi Ruoyao <xry111@xry111.site>, Yuntao Wang <yuntao.wang@linux.dev>
Subject: [GIT PULL] Kbuild and Kconfig updates for 7.3
Message-ID: <aoC62sXUrC5okGsd@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	Breno Leitao <leitao@debian.org>, Elsie Heck <its@elc.moe>,
	Gustavo Luiz Duarte <gustavold@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Julian Braha <julianbraha@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Martin Weiss <Martin.weiss2410@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Huang <sef1548@gmail.com>,
	Peter Collingbourne <pcc@google.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robertus Diawan Chris <robertusdchris@gmail.com>,
	Rong Zhang <i@rong.moe>, Sergei Litvin <litvindev@gmail.com>,
	Simon Glass <sjg@chromium.org>, Thomas Huth <thuth@redhat.com>,
	Xi Ruoyao <xry111@xry111.site>, Yuntao Wang <yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="frAejL4U7TYiDwWt"
Content-Disposition: inline


--frAejL4U7TYiDwWt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull these changes to Kbuild and Kconfig for v7.3.

All changes have been in -next for several cycles without reported problems.

Thanks and kind regards,
Nicolas



The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbu=
ild-7.3-1

for you to fetch changes up to d900723d78adec229996aefbab0dcaa66a177b77:

  modpost: use mod_warn() and mod_error(), clean up logging (2026-08-15 21:=
01:51 +0200)

----------------------------------------------------------------
Kbuild/Kconfig updates for 7.3

Kbuild updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  * Use --force-group-allocation when linking modules

    Have the linker resolve the COMDAT groups and place their members as
    regular sections instead of possibly leaving multiple copies in the
    resulting modules and unnecessary group metadata.

  * UAPI header files: Canonicalize __ASSEMBLER__ / __ASSEMBLY__ mixed
    use to __ASSEMBLER__

    There is an ongoing effort to change __ASSEMBLY__ to __ASSEMBLER__
    treewide.  For consistency, UAPI headers are normalised to use
    __ASSEMBLER__ only.  Normalisation is done in two subsequent patches
    to simplify a revert in the unexpected case of a regression report.

  * link-vmlinux.sh: Improve detection of third pass requirement

  * modpost: Canonicalize format of warnings and errors

  * Minor changes:
    - Remove srctree path from CHECK output
    - Set the initial value of subdir-rustflags-y
    - Remove broken and unused modules.builtin(.modinfo) targets from
      the top-level Makefile
    - Add symbol size for kallsyms symbols that can change size
    - modpost: Prevent leak when early return no suffix .o in
      read_symbols()
    - scripts/config: Update usage of POSIX sed
    - 'make tags': Add support for rust source files and prevent binary
      files from being analysed
    - Several spelling mistakes and rephrasing

Kconfig updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  * Add Julian Braha as Kconfig reviewer

  * Fix submenu rendering of negative dependencies

  * Minor changes:
    - merge_config.sh: Keep temp file in the output dir
    - Abort rather than loop for ever on EOF


----------------------------------------------------------------
Andr=E9 Draszik (2):
      kallsyms: add symbol size for kallsyms symbols that can change size
      kbuild: link-vmlinux.sh: improve detection of third pass requirement

Ben Dooks (1):
      kbuild: remove srctree path from CHECK output

Bhaskar Chowdhury (1):
      usr: Correct a spelling by changing a letter

Elsie Heck (1):
      fixdep: make gendered language gender-neutral

Gustavo Luiz Duarte (1):
      scripts: kconfig: merge_config.sh: keep temp file in the output dir

Jani Nikula (2):
      modpost: add module as parameter to modpost_log()
      modpost: use mod_warn() and mod_error(), clean up logging

Julian Braha (3):
      MAINTAINERS: add Julian Braha as Kconfig reviewer
      kconfig: fix minor typos in comments
      kconfig: fix submenu rendering of negative dependencies

Martin Weiss (1):
      scripts: fix spelling mistakes

Petr Pavlu (1):
      kbuild: Use --force-group-allocation when linking modules

Robertus Diawan Chris (1):
      modpost: prevent leak when early return no suffix .o in read_symbols()

Rong Zhang (2):
      scripts/config: Use POSIX standard ERE (-E) in sed
      scripts/config: Use in-place editing (-i) in sed portably

Sergei Litvin (2):
      scripts/tags.sh: Prevent binary files appearing in cscope.files
      scripts/tags.sh: Add support for rust source files

Simon Glass (1):
      kconfig: abort rather than loop for ever on EOF

Thomas Huth (1):
      scripts: headers_install.sh: Normalize __ASSEMBLY__ to __ASSEMBLER__

Thomas Wei=DFschuh (1):
      scripts: headers_install.sh: Normalize __ASSEMBLER__ to __ASSEMBLY__

Yuntao Wang (2):
      kbuild: set the initial value of subdir-rustflags-y
      kbuild: fix modules.builtin(.modinfo) targets in the top-level Makefi=
le

 MAINTAINERS                         |   1 +
 Makefile                            |   8 ++-
 arch/arm64/include/asm/module.lds.h |  13 ----
 scripts/Makefile.build              |   5 +-
 scripts/basic/fixdep.c              |  10 +--
 scripts/config                      |  44 ++++++++------
 scripts/headers_install.sh          |   1 +
 scripts/kallsyms.c                  |   4 ++
 scripts/kconfig/conf.c              |  17 ++++++
 scripts/kconfig/expr.c              |  33 ++++++++++
 scripts/kconfig/expr.h              |   5 +-
 scripts/kconfig/menu.c              |  10 +++
 scripts/kconfig/merge_config.sh     |   2 +-
 scripts/link-vmlinux.sh             |  22 ++++++-
 scripts/mod/modpost.c               | 118 ++++++++++++++++++--------------=
----
 scripts/mod/modpost.h               |   8 +--
 scripts/tags.sh                     |  42 ++++++++++---
 usr/initramfs_data.S                |   2 +-
 18 files changed, 225 insertions(+), 120 deletions(-)

--=20
Nicolas

--frAejL4U7TYiDwWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmqAutkACgkQB1IKcBYm
EmlaihAAhqttUh3YAGsUtXqqf4Mmb7OKAhafhWYqCQQjHFHU4eywsqs3v3iBlc5K
rS9s9EDUIzBwFtN4xaZT5lDCAHzmN42CI0cIBl5IQ7EqfYZUOJu9C/axZx9n0lv9
jP4Uv2PoKpJ+SFFCMQKN+MVPFiNYYK6L+XE0wwXRIv9YtPPBXXRQ83c8qPzb9x3r
feOfyoMAHV7x9Zp8wDfctY5jSU+njE77Vc5nTkQgyDndMolJSZqeeU3E6p+CldZ+
xIiARoX6MKO5QUeRkkBtPZ5mTkJk5F/R6o5aBhXPXL/CW46LJE2FtLHXOxjWAesu
sEb0WiEc6+PGjE3dhZWubx4gbVZUzvQnMaROWcZY2DFl1PZuG51Qm5oUYOXs0Fnz
s/OAygnptgLBs/ryMiVBcmjjt8U/v5gzoLH9+k1mQ4mXbw5wofy8UH9rl2rvTWA7
//JeIDK1d2h0cTsaixpd6hOpMLMCFNy4RqbYgcUp8Qhy8Le1Tvj8a6WYHtYZvkkC
YpKCUr9YXs7Qpp5JHi43nT4ltqrIp5Eqt9I5NNeM44/gomX2P9AfZuPviM5IaaX2
XBB8bvGsQWQV32LPpixuASmYBsI0ICsHHN+IZ86liWhC/W98JW18XOPcYyfe2s9h
UbGMa8uoy9aQxeSmge1CEn+MMZMoMHQS3tj673LbG4zhPQcJMq8=
=USYt
-----END PGP SIGNATURE-----

--frAejL4U7TYiDwWt--
