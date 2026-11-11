Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794375775;
	b=nPTbIU7uvRrTE8M9ef7PBQsQSp/zs/BZrt0Pznx+T+Y62XyZ0QqNbhFC/6l2gvYQ2cnu
	 wD/DI639BXLG/bw9W/OyDxccwKynm73ZkGwqhxIdcZCtL5ouDI9W78pyxkHyF5n04pHjS
	 3SPb2ZWZ4kQY+Pyt86EUQS5TYnl9pZSJc6nLfra0Tupzb+Lw7f7+bDzx4r4AKKdTvfWFg
	 wUcz5Wmpow/rp0Gq/C/RSY6++FXUda6H40C/pgwMyEhj6VB6QbvDf0JN9aYdgledIuWoS
	 3Fhhu7WKTH8tFeL7OLyi/1NuXIkH9HjKoFmWI4rwVHInSUJRaUGhRC7duYKbtgBTu8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375775;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nORocrAayItrBzyQnIC82VLVgHUTeYt27rYJZ4ki2bg=;
	b=CmoIn6m8cGtFLfbTR/A93UhhSZtcrJTMKWwD5Oqvn9ybNN7re99fm/3znWlyOqjoZuwh
	 DYlZe8WzuL+AmQjpR+PRHCuq/xwmCMG5bVtzCOeMZsZ3dh4u9hrSr3Gf7hvC8f04586ap
	 38+kSKsbUDIXzYQ02XJ9NfWn5C9g9/eId2zahXXEsnpL3IQae6TN0qXhNy1KPXF+Vmcw0
	 hal60OXARv+8iTjEs92wrZP+2KkrJHB6CyuHB0t6v6VmUzAe6/tZO062bp4S/pYi2Z+G2
	 c09VmNjpm7vK2L3AKZosvJJMWBlfz8Cc7XX+wncwjvERH/Sdx0afBAaFPDmN+xNf28w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDGfmDVJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8224D606A31C;
	Wed, 11 Nov 2026 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDGfmDVJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD711F0089F;
	Wed, 11 Nov 2026 05:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794375775;
	bh=nORocrAayItrBzyQnIC82VLVgHUTeYt27rYJZ4ki2bg=;
	h=From:Subject:Date:To:Cc;
	b=JDGfmDVJ+hex/qOsctXp7GyByz7YHo7fs1BeF6Q9+rBnzTH9/zxobfEAYDngXnZCl
	 hpc/ZHulZggoFozOnyby/57FnTzBYci6oYZta5NksFvZH6CmQeRKH7wAWG/YqSB2Ss
	 +RDHECahClpspPZ5H6SaiF+mH7ZR92Zisi1WUQIIXj7WuH1q5XgJHJNkvYEq1rCAHB
	 HnYfpPnGj2eXe7cGrkYeL8YVog8Uwv2zRinHrSJhEUDJMwox6gHrpnoDDuK66LvGV+
	 Up0c6cpiDeBbpUM9PtWHELrAWs9cKetLnYsh6kE/vrxaaMcskpD5D1Zg2vfjhDy8QR
	 34gRGCDzOtEeA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/4] scripts/Kconfig.toolchain: Document minimum supported
 versions for dynamic checks
Date: Tue, 10 Nov 2026 23:42:39 -0600
Message-Id: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBCF4auUWTuQaakVryIu0mRSp0pSMmkRS
 u9u1OUH7/07KGdhhWuzQ+ZNVFKsoFMD7mHjxCi+GlrTnonI4NOlGGTCktKrLiTiunhbWNFfxq6
 nbjC2D1D/S+Yg71/7dv9b13FmV75BOI4P1EV+DH0AAAA=
X-Change-ID: 20261110-kconfig-toolchain-updates-d8b351370a5f
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=nathan@kernel.org;
 h=from:subject:message-id; bh=xzuUcXk4zdCkNBnPsLRFjsTKL6wCPr7JTtKujp6wM9s=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfGMKdg4obC6/N022/dPDzFq0Pmx493ro6es2ChgVnd
 6vdOOi9taOUhUGMi0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBMpHURI8P226kM+zvOvmLn
 sGblvCMel/uCdcPi/PbjKm9KHtdJn9Zh+B9lO2nST9/29TfYvWemLNP6yZd+a3HCjQqhyNBJ0n7
 PfvIAAA==
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
patches. The first cleans up CONFIG_CC_HAS_NO_PROFILE_FN_ATTR since it
is always 'y'. The second cleans up '-fno-addrsig' handling, as this is
an always supported clang option for a clang specific feature. The third
unifies the GCC specific "no allow store data races" flag.

I tried to add some commentary when the option was unsupported by a
particular implementation but I am on the fence about whether that is
actually useful or not, especially since they might go stale if the
other implementation starts supporting them. However, I included it
anyways since compiler_attributes.h can have the same problem and folks
can check before removing or adjusting the option. If people don't like
it, I am fine with dropping them and only documenting the supported
versions.

---
Nathan Chancellor (4):
      scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
      scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
      scripts/Kconfig.toolchain: Clean up '-fno-allow-store-data-races' handling
      scripts/Kconfig.toolchain: Document minimum supported versions for dynamic checks

 Makefile                  |  5 -----
 kernel/gcov/Kconfig       |  1 -
 scripts/Kconfig.toolchain | 45 ++++++++++++++++++++++++++++++++++++---------
 3 files changed, 36 insertions(+), 15 deletions(-)
---
base-commit: 7f705c0ad1c7cab3d8de99a3a67937bc82fc8481
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261110-kconfig-toolchain-updates-d8b351370a5f

Best regards,
--  
Cheers,
Nathan

