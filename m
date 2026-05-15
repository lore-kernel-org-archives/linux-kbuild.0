Received: from mout.freenet.de (mout.freenet.de [194.97.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12166305665;
	Fri, 15 May 2026 22:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.97.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778882772; cv=none; b=DaoGJnGN5TtsF4tFpuRMTSTerXl+1q4ragd67tyA05uVPFRKvM8jCcrDwFLQ0pVmaHfwJkf1lr6yW5DVHYbVIAr+BpEaaVt90OZ1rdKmz6QdlJhZimeudn1j1NaT5I+iIf+zscHVoEDT45ulWVB3x5UIqzpx+lfJmQrizvQ26o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778882772; c=relaxed/simple;
	bh=zvUDuRWvul/5im05VbzCe+Nae5YHV5BRIeR1Hxm/I7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a7ZPHf0C5qBM3tY3H8YN5wnYcelE+9hnC/jQm+IcySY8qZiK1qicP3O3hKpsZWdkYPvOjmMOMTupXVACk7USjcWsLyDVTZnOBttNhJNEGTnEaZthrBffT9mLhcFFPWG8pzrabEoacRyHFRcxxi6d33TbNJ8pnA+A9U5Jubbs25Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=Twg+HMgv; arc=none smtp.client-ip=194.97.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="Twg+HMgv"
Received: from [2001:748:400:2319::5] (helo=sub8.mail.fnrz.de)
	by mout3.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port 25) (Exim 4.98.2 #2)
	id 1wO0aU-0000000AO7A-0SDV;
	Sat, 16 May 2026 00:00:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=O3g36qipdoRGf2hzETG4MKZKefZgIeS375pfaHXD9L0=; b=Twg+HMgvIQFVkk+F7k0mblIy4u
	PN3N6LvaZ5tt/HOeShocOj1mSBXUQAOH8LH2UKjIZMjj27OAYfQeIWlimCT6jQe9GqaJSsOKzPU+y
	hzHbXzMaN468RjuJV3vnBEPlRLYNU/35Ozs9y0XErPea+f4zWZDcH4GVUNCuudy2+zCODm4+RcEDq
	JcK4Z9rEdA3DwoZneizwLPjvSo4IfH9zxxPdmphODk7DmiVLDDNcqBMSTjeHLiHAkd9Kfi7z1m/bZ
	qV0tUTL7UporAUsqjcgF2vLYfWAe+OLVK0h+gn0EH4M3iKIwAK1BtRnSF7HEhxT1zvkks7P1WIsgJ
	Ol8oXHSg==;
Received: from [2a02:8071:a85:f020:8513:7574:4d87:3ae0] (port=54290 helo=einstein)
	by sub8.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (port 465) (Exim 4.96 #2)
	id 1wO0aT-000XI6-2z;
	Sat, 16 May 2026 00:00:54 +0200
From: =?UTF-8?q?Viktor=20J=C3=A4gersk=C3=BCpper?= <viktor_jaegerskuepper@freenet.de>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: =?UTF-8?q?Viktor=20J=C3=A4gersk=C3=BCpper?= <viktor_jaegerskuepper@freenet.de>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning scheme
Date: Fri, 15 May 2026 23:58:45 +0200
Message-ID: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 17788824536F68932021F5O
X-Scan-TS: Sat, 16 May 2026 00:00:53 +0200

The package versioning scheme does not enable smooth upgrades from "rc"
releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
because pacman considers that a downgrade due to the underscore in
pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
package version comparison used by pacman. Package versions which are
derived from said releases (e.g. built from git revisions) are
similarly affected. Fix this by modifying pkgver in order to remove the
hyphen from kernel versions containing "-rcN", where N is a
non-negative integer.

Acked-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>
---
v1 -> v2:
- make the substitution more restrictive
- enhance commit message accordingly
- add Acked-by tag

v1: https://lore.kernel.org/linux-kbuild/20260513231745.51780-1-viktor_jaegerskuepper@freenet.de/

BTW this also works for something like "5.10.248-rt143-rc1" which is a
recent example of an "rc" release of a realtime kernel.

 scripts/package/PKGBUILD | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 452374d63c24..1213c8e04671 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
 	pkgname+=("${pkgbase}-${pkg}")
 done
 
-pkgver="${KERNELRELEASE//-/_}"
+pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"
 # The PKGBUILD is evaluated multiple times.
 # Running scripts/build-version from here would introduce inconsistencies.
 pkgrel="${KBUILD_REVISION}"

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731

Best regards,
Viktor
-- 
2.54.0
