Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5B37105A
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149075; cv=none; b=TWHeMCes1XKTwTjHJxuxHmfWcX4sdvkclFBg+w2s6EKzQEkGyCuEBaLsIFfVcaa662+4ye/MasHW/FkxwTl/XcKJk3wSDmcjQKpi7VF86JaXhfZNx3szMIRdIQaLqc9yRzkNh13ak0QZmdHuvHKHR8HMLHVGYII9TyhIHmVodsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149075; c=relaxed/simple;
	bh=xAJs71cM9DprpLBpYEnHv4Bf8KdOTtbO7D6SI9MMQgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cH6BBG4PuRZj3N9By10kmzDxbWR/yG/EuK468tqvUqS6xsVoBxKpmBJIDaGbDFmkGghAdsNdvW0HvEqU3tolWC6vPiWVdSY5c/uaTeeW5/dUXkXvYRaXCOKSJZ+QEuZSD4AIM+OXLHyptNOcvhKzcGrF5CZ72M2DgoHiCCiGSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaIhcAK5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaIhcAK5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29435425e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149073; x=1792753873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnuW/OOXaqHlbXOfdHIcI88XLuBIeupcknQAWrpkOY4=;
        b=QaIhcAK5ERBOayGZ1Ssz2EFGMUSIN+fQz+Y/lXeqAKvGSUKRGCiM2lY6eDpyKxgoGS
         3puANXrAlVZOJFVUvD2ewNTb7tBrhcm4++8DsK3+JpkYunI6jDFrJtQ5aImGwdm1vpcT
         7TBKT1cunK8nEX19kRTwRkQWz2nxp62Rw2aWKHxr0JmlStkVD90/tGH6EtSBGWNExTST
         /JnCR2EXD+5ERfHKofnsiYmo/S4sKG8J1pabRhGb9AOsaUcDDVaaaO6Z5noKKQikCNnq
         met54fFkT/gGHLMUMjRyqZ0lUR8ba4AJqXOgi+RBPsw+j6jn1MROIEn5XlI0X9CUoPR5
         mpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149073; x=1792753873;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnuW/OOXaqHlbXOfdHIcI88XLuBIeupcknQAWrpkOY4=;
        b=wVfb5OjPN5UQYpcb51T/8hSU3e2w7LxD9ye+npAtgJEb2Zsjo5zTinP23RLfm3ITQK
         jfP8lOzGU+osgVRO95at0p9Q4DOgQWomhDDq7ogoJFSdWtdF6zzv5WG63QSASEXSq9SY
         CShxEPRYcvl1xNRW0C3SYMc7HBafx8XVPkkLFc3X17JLTgPqfqsdVVGJvEuhgKiAeldC
         unEO6cCF1RPMMWTrbrpVjL91CLGd1b6rwCvVkj/AobkZAB/YbmKrhwtQZFlGuRw8WErX
         4ZPtBnn5OjaGuWEaLQn3tv+5DaR3CwP+JLMMrGZX/27ztNQUZ2r4yQIlLCxE839FN7j9
         4iOg==
X-Gm-Message-State: AFq9FYI/j93piRqhsrYRVyeTpvBjFFBfofgIcDPPgVyxhsZmJLJOsWiL
	qIseoIovhTlbLgjcCayd+EjE3XlAUaYuMG5LnBcjLDZSzRQUQXW2u7Li
X-Gm-Gg: AYBFou1V//Cj4LWleAPFwFg/hC+o4vyruTbuzyJ/ZY1mAoGrV/UsXDy8iWLaHoLeRdz
	ouR4DSdjdVtBBDPo/U3foFEKKrJ0gYhgkK/yDVuezJZ1g4NFqy9O49Ffa8ResiPGGBOpTPkYrwa
	k9Zs9NOCtn48o3GKmRfwzL7CglFH8MOh0BAxhmZhzFmEhCN1bUfn7nX75Gv8hb+KV2IkWAIgEcs
	bhVY8nBR+BvRW4VFoslExHI/6Pvqt77373Q60jseWLCThzc67pkBp1iaC0Q0Aq9caJcd0DDVy4Z
	QFJSGcAHj94Z9yG7TZkX7PTxfPL2RCwSfk5Wk6pLf9IicvN25lUIztsL7iZuCJ39qa5SH5S4Bis
	EpGHBEdro2e55/cQoEpz8BlftXgY3OT0AymQLgPqeml0J/xDj00hdVpJg1gUYyzW5ynmfwdE0FN
	FBg9yrD4AkTGHgHomzPvMrcQXSTJ5rN1MshquUlj/K7xHEmDTF/boXPZgpzwPv9Clpw8XN/+hEV
	kQubJBqBDk=
X-Received: by 2002:a05:600d:13:b0:4a1:c6a2:5566 with SMTP id 5b1f17b1804b1-4a1c6a25769mr57893665e9.26.1792149072417;
        Fri, 16 Oct 2026 04:11:12 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c575esm3928308f8f.10.2026.10.16.04.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:11:11 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH] kbuild: depmod: fallback to /boot/System.map-KERNELRELEASE
Date: Fri, 16 Oct 2026 13:11:06 +0200
Message-Id: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When installing external modules (M=...) against packaged kernel headers
such as linux-headers built via 'make bindeb-pkg', ${objtree}/System.map
is absent because System.map is located in:
/boot/System.map-${KERNELRELEASE}

Currently, scripts/depmod.sh only checks ${objtree}/System.map and skips
running depmod with a warning, leaving newly installed out-of-tree
modules unindexed in modules.dep.

Fall back to ${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE} when
${objtree}/System.map is not readable so that depmod runs properly
during external module installation.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 scripts/depmod.sh | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/depmod.sh b/scripts/depmod.sh
index 3c34fecac..d6d1b9547 100755
--- a/scripts/depmod.sh
+++ b/scripts/depmod.sh
@@ -12,9 +12,14 @@ KERNELRELEASE=$1
 
 : ${DEPMOD:=depmod}
 
-if ! test -r "${objtree}/System.map" ; then
-	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
-	exit 0
+system_map="${objtree}/System.map"
+if ! test -r "${system_map}" ; then
+	if test -r "${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}" ; then
+		system_map="${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}"
+	else
+		echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
+		exit 0
+	fi
 fi
 
 # legacy behavior: "depmod" in /sbin, no /sbin in PATH
@@ -25,7 +30,7 @@ if [ -z $(command -v $DEPMOD) ]; then
 	exit 0
 fi
 
-set -- -ae -F "${objtree}/System.map"
+set -- -ae -F "${system_map}"
 if test -n "$INSTALL_MOD_PATH"; then
 	set -- "$@" -b "$INSTALL_MOD_PATH"
 fi
-- 
2.39.5

