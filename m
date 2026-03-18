Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D994344DBE;
	Wed, 18 Mar 2026 20:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866552; cv=none; b=dTiJkPsnqmkrZuFmSlFQnN/HI+M6UkHCCruSv4ju6Q6gQGN7IsgzFG5jV7q0e1ilS4fAQx0KFiBIJqzxFNa5cNXHbrlvRvfjP0Pn5d+icPzwDmJBUB/2jKfCHyaqlPb6BXrqVWiXLtroCvgUN/dQ76JP2OZyhCtUA72A7oA5CtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866552; c=relaxed/simple;
	bh=3zFZbY9O8992+JPAYu0NYx5XHwpa0N2XdZLfINrqK8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pDLHLpGbwk4622mxeV5UjjEMi/Vb8CYTKWHYlufhsDfa+1M02HtK3tf4/lSjtnkxtGAf6yC/qJGwAkenDGqxo5m1pWHEXt7er5FpyPZ+u/nrsscLchHKB2ZB9ENWmEno/yIJc3VrZ43EqvGZGe6DlyN7x0aCXXpXhT6z0GIf6Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=r26s9H8Q; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="r26s9H8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773866245;
	bh=3zFZbY9O8992+JPAYu0NYx5XHwpa0N2XdZLfINrqK8g=;
	h=From:Date:Subject:To:Cc:From;
	b=r26s9H8Q8mcFEZ0olMqYP3sK088taHreb0k5gSHxDUWk/SF54aYxth/JQZEPvk2if
	 HcSwRIDG8Ifm7HWPcv/tvQUkUECHdoSOCvw1Lm7bWMlt59I9PPNwI1q/6jcbGtjYpD
	 xQtpHtRnXvhb7oW1z7LTfSHXixqADEA1eTFywBow=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 18 Mar 2026 21:37:20 +0100
Subject: [PATCH] kbuild: pacman-pkg: package unstripped vDSO libraries
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnBewVdT5K2OHaKOG1SrNFEH8d
 4vHd3knKEdhhTY7IfIuKktIMK8M+onCyCguGWxuq7wwDf66TbzDlfqZAu5OF5Sgf/IeDTWG3mX
 d2ZogBWvkQY4n/3yv6wbGvDEgbAAAAA==
X-Change-ID: 20260318-kbuild-pacman-vdso-install-1a81a947b27a
To: Christian Heusel <christian@heusel.eu>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866245; l=1272;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=3zFZbY9O8992+JPAYu0NYx5XHwpa0N2XdZLfINrqK8g=;
 b=W7Le8ucD+qwJoXXlTfi17e6j+E1Z3Y4txPEtguxYE2Cx0lFGQynZGD2EQ1BSnABhxS13Foa6/
 4c6aI3AC8OJBee84vXmW69NxgfBFKiPB3I178OFA4j44BYwU8jE+uK2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The unstripped vDSO files are useful for debugging.
They are provided in the upstream 'linux-headers' package.

Also package them as part of 'make pacman-pkg'.
Make them part of the '-debug' package, as they fit there best.
This differs from the upstream package as that has no '-debug' variant.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
In my opinion the same would be useful for debian and rpm packages.
Maybe we should have install-extmod-debug, similar to
install-extmod-build, to centralize these.
---
 scripts/package/PKGBUILD | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 452374d63c24..b1d0c8a9f030 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -121,6 +121,9 @@ _package-debug(){
 	install -Dt "${debugdir}" -m644 vmlinux
 	mkdir -p "${builddir}"
 	ln -sr "${debugdir}/vmlinux" "${builddir}/vmlinux"
+
+	echo "Installing unstripped vDSO(s)..."
+	${MAKE} INSTALL_MOD_PATH="${pkgdir}/usr" vdso_install
 }
 
 for _p in "${pkgname[@]}"; do

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260318-kbuild-pacman-vdso-install-1a81a947b27a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

