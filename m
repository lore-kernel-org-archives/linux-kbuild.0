Received: from mout.freenet.de (mout.freenet.de [194.97.196.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031211459FA;
	Wed, 13 May 2026 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.97.196.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714424; cv=none; b=rLuIOjDcIaqFUODt0AL65hgJtgbKdsamZIoE+PQHLUPsekfPJFuVs4VuO4lweMb9fADJEM5kDGE9wMs+ZYJLe7fFIyZO2JbhzLmFu9qlox6SKuXHt5CmKUquVi3ZIsYRtByqklicwvRjIoT6NKhN2StNa39qa+RPTm0GttuNrTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714424; c=relaxed/simple;
	bh=IZ2IrZsIPzlWZefd17MYjYiQUCX9p8wxUFk0/+rsJMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iN5+lY3PEqLsEkZIH3yELbARhaXGSQoLa40Uz063SpfPSo+IFHofoO1KF6OfM//RJbTlHXpdi9+9kKPF6nWQdS7u8Np+iIbug2KmTcbIGeG2JMo9qQIckMiH4tCmeqLONOQ0hYWqphFmm7tlZDuFLVcM34hxoXN9/RNY1xWAW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=IEw74ey6; arc=none smtp.client-ip=194.97.196.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="IEw74ey6"
Received: from [2001:748:400:1319::5] (helo=sub7.mail.fnrz.de)
	by mout1.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port 25) (Exim 4.98.2 #2)
	id 1wNIsA-0000000DTRA-160m;
	Thu, 14 May 2026 01:20:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=A9MyNYBU4nN2pJdTo/OBoee4omBI9iNGtPz7t0rpd2A=; b=IEw74ey6/haqlOQBXkKMAT3OSK
	Tqp4Q2MbAy9IhsNr9FrZqPwRfdGU7IjCDqAIvv8ZqMwol3VJb4Rf+2GHP/kGGFNPB9yQnx/NxDgHA
	2AcR570N8nZlDRYvCGmn/xwfrossGI2RshPCBvzeyxvqVoTO5TLBxnTI4knUEq9UZWTyRSLI6ZDCr
	6znSUJspiRyaunaW6he/dEDnXegHwXovzPSFxodWQi1L9CQa/A8LQYkPPNK/9b7O4ww2zhVnaPUhN
	UZkLndpY+v3WPmjiYwC6dpKc4GBgSc/h/ScMzC1T2oZKoqMsuImYjC3QSwLZwyWN2w/1GByKSAUgc
	WkziWo3A==;
Received: from [2a02:8071:a85:f020:1cd2:ea20:ef58:f08c] (port=49706 helo=einstein)
	by sub7.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (port 465) (Exim 4.96 #2)
	id 1wNIsA-00DQDo-0J;
	Thu, 14 May 2026 01:20:14 +0200
From: =?UTF-8?q?Viktor=20J=C3=A4gersk=C3=BCpper?= <viktor_jaegerskuepper@freenet.de>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: =?UTF-8?q?Viktor=20J=C3=A4gersk=C3=BCpper?= <viktor_jaegerskuepper@freenet.de>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning scheme
Date: Thu, 14 May 2026 01:17:29 +0200
Message-ID: <20260513231745.51780-1-viktor_jaegerskuepper@freenet.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 1778714414F369F8B55949O
X-Scan-TS: Thu, 14 May 2026 01:20:14 +0200

The package versioning scheme does not enable smooth upgrades from "rc"
releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
because pacman considers that a downgrade due to the underscore in
pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
package version comparison used by pacman. Package versions which are
derived from said releases (e.g. built from git revisions) are
similarly affected. Fix this by modifying pkgver in order to remove the
hyphen from kernel versions containing "-rc".

Signed-off-by: Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>
---
 scripts/package/PKGBUILD | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 452374d63c24..fe629074b4e8 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
 	pkgname+=("${pkgbase}-${pkg}")
 done
 
-pkgver="${KERNELRELEASE//-/_}"
+pkgver="$(echo "${KERNELRELEASE}" | sed 's/-rc/rc/;s/-/_/g')"
 # The PKGBUILD is evaluated multiple times.
 # Running scripts/build-version from here would introduce inconsistencies.
 pkgrel="${KBUILD_REVISION}"

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731

Best regards,
Viktor
-- 
2.54.0
