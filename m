Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444742;
	b=AoOaR6g338SZew0HabRdKSU1851bR+dwAB9fXPE9o4TlB3JHEonaffT5jjmRDpzS2CV5
	 v5lCo4JLnTWRocnEhpmInY3De/w3Z+VH6OQLIFXa8WS+DF0wHz5nJAPmAr7OLhXp7kK4w
	 1RAlyWyCyr4sM/oUMbZwYEJGGte3G7R+uxX6ThMFgzYtiOqFxFYYkmI3B5L4Y/G7JgQYY
	 ge8m19mmSuMpyK6Z0tUKYwe6wEI3Xf2GlP5dh/COfECiqDw/EBZMJZ5LSRv/AWoUhUmnx
	 JgRLh0ddUe6y0sjDHgBEv4eWGBIxKkEYmD6pbQUsIFIvXgD26TMI3M1mwlJbSVB+ZNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444742;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=M8p9U5YUl7XRjpDZvELGryIMEn/c6aaLierezHTKrsg=;
	b=yHqADIkaDTFCktltvkTO/koxXsVxvJ2vU1yQ1Vn3/rVsJhrixiwOiIkD4C+IeQ6l8NMr
	 Oj3UUDoLlm2vemqhR9VdExQGgQu9MgX50FkCTWqK4n0f1pYrGXJzABPQ31bpf0w72uRZu
	 59M4wxmCUlb/wqzenvYBv0T6h/0iAhRLn/c36ZdfrDRPWNFkjDqvpYoLNTPC0JH/oHP0K
	 ffWxuObSolmGOmqNSZB7yil6OZA+QdmwWUXWM99oQ3emOG5XOjCH+uAizsf3jZQSiDrgq
	 Ij82jD4dFCpFA7cWMLZfLM8YyWB7mX2a3VMxcot5+gtzIun1ouhQjYzJ4ETYMH80Cag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7ZHJc0r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07DB606A321;
	Thu, 12 Nov 2026 00:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7ZHJc0r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700C81F00A05;
	Thu, 12 Nov 2026 00:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444742;
	bh=M8p9U5YUl7XRjpDZvELGryIMEn/c6aaLierezHTKrsg=;
	h=From:Subject:Date:To:Cc;
	b=c7ZHJc0rronvY8pdiQ8zA8N4BJ878Hh3jDYy8GUGmFgGF9afYd5fScMrwk/NilyPn
	 MiCl8A2wxxGoY85iB/yPbu48d4wIZ1NTg59cT8sDG/5ngafXgq4KHOzxypVGtIYxPK
	 hD5zORY7Bd5SbDySgC5UFXtm/AzsdundJGKaik5k8GQNhuV53Qrjj57WO3Qg3vSHpX
	 NYv7ldVN+4y4KxoGKAcYGrAtfJErldAlynX3li1Dj67Uh0gcHbMhWG10YSdu+vN91Q
	 EogYN11XFB2bW807yEr5AvImlWpqklF1hiNb3WhH7cQAbnSRpxA306TIPZalhMFa/n
	 mvXBQWxa+iOgg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 0/6] scripts/Kconfig.toolchain: Document minimum
 supported versions for dynamic checks
Date: Wed, 11 Nov 2026 17:52:02 -0700
Message-Id: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/42NQQ6CMBBFr0JmbU1bpCor72FYAJ3CCGlJW4iGc
 HcLXsDlS95/f4WAnjBAma3gcaFAziaQpwzavrYdMtKJQXKphBCcDa2zhjoWnRuTQZbNk64jBqZ
 vTV6I/MrrwkDaTx4NvY/2s/pxmJsXtnEP7kZPITr/Oc4XsXv//CyCcab0xTQqV/LO8TGgtzien
 e+g2rbtC0Di1NHVAAAA
X-Change-ID: 20261110-kconfig-toolchain-updates-d8b351370a5f
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org, 
 Linus Torvalds <torvalds@linuxfoundation.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304; i=nathan@kernel.org;
 h=from:subject:message-id; bh=KpWmlGRL4B8AFmuY7jIVXfoaYmrX6nkloXtdA6hM7eA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfefelxj7kPv3fbXWyx4ZmuQWTHpk6uSh8WOa2JsC5+
 v/+Xm3OjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRp/8YGVb+kdmS45jy06Pu
 +8wpm960Pr4ZK+W+xDrfyJHv8+Rbn9Yz/E+c4mj+4575na/q0xyzb9ezWJZ/0OjTmam0kEVq7UR
 2O0YA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

Now that we have a fairly unified location for compiler and linker
feature checks in scripts/Kconfig.toolchain, we should make it easy to
clean up the checks as they become obsolete through minimum supported
version bumps by documenting when they were first supported. I somewhat
modeled this after the documentation in compiler_attributes.h but I did
not want it to be as verbose.

In doing this archaeology, I developed a few prerequisite clean up
patches, mostly around removing code that is practically dead through
minimum versions or adjusting options that are only supported in one
compiler. See the individual patches for the details.

---
Changes in v2:
- Fix versions for a few entries (Julian)
- Add patch fixing check for asm goto with tied outputs in riscv code
- Add patch eliminating check for asm goto with tied outputs, as all
  compilers that properly support asm goto with outputs will have
  support for tied outputs
- Add links to tools where feature is supported/changed to make future
  auditing easier
- Adjust comment format to be a little more succinct
- Reword commit messages accordingly
- Link to v1: https://patch.msgid.link/20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org

---
Nathan Chancellor (6):
      scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
      scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
      scripts/Kconfig.toolchain: Clean up '-fno-allow-store-data-races' handling
      riscv: checksum: Fix CC_HAS_ASM_GOTO_TIED_OUTPUT check
      Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
      scripts/Kconfig.toolchain: Document minimum supported versions for dynamic checks

 Makefile                       |  5 ---
 arch/riscv/lib/csum.c          |  4 +--
 arch/x86/include/asm/uaccess.h | 82 ++++++++++++++++++++----------------------
 kernel/gcov/Kconfig            |  1 -
 scripts/Kconfig.toolchain      | 80 +++++++++++++++++++++++++++++++++--------
 5 files changed, 107 insertions(+), 65 deletions(-)
---
base-commit: 7f705c0ad1c7cab3d8de99a3a67937bc82fc8481
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261110-kconfig-toolchain-updates-d8b351370a5f

Best regards,
--  
Cheers,
Nathan

