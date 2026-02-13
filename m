Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7552505B2;
	Fri, 13 Feb 2026 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770965120; cv=none; b=KBoWcDqY7n9U/dG7OvTJMRvLyaIUfu6WwGLsO/CCtZ2jPujesVshSIS9PcIh+qOwWZPTx4Vb3CRTrIG8dRIhH312smWxeUKovNpFqOjMmEf+kbc8PgHfxNNHTmTOsrAxraxf76lSDI13TuTAtO5HwKXLyoE1P41I+p1aekiWkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770965120; c=relaxed/simple;
	bh=6J35rRRigU8xE8JpO0UJ8nD7n7Rc/gRlu+sFTRGORyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KhPpumwhbbvUuUYc73wSD4cTup2fFxBdnjqMlJxsW40lBwxtqg2wMvHF9vILinieys6/dXkxS3uXvea1KiTnFZUA0XEmM+HX+ERYs+/uDgv+JsySFQqewXeRy69cP0LLaq3fW+Rqw2eE5wL4z2QNMSdCWlNR5NhjxOs9Ae4wOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws2OhZZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws2OhZZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42212C116C6;
	Fri, 13 Feb 2026 06:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770965120;
	bh=6J35rRRigU8xE8JpO0UJ8nD7n7Rc/gRlu+sFTRGORyQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Ws2OhZZ9DBc5gq+7vU8LG08UxFyPLnQdQXJiaxE18AR1nsgBL0mBCaIu3HLPE0cPq
	 x3WJ67lmIxg0WZZejRRSbm5xQN1w3XNDpVMCySNmjJBb0D1VRtLN2zMxo3yCGIrBrG
	 aOi4Tmm8kZh0z/5y4uRhTbOp5xfRk1c8ar/Jmwf9gCZ7v6R1edj/y4BAu0dD9mLFf/
	 M8825xtzGyWvlZYQZSslWxvfOW59ap4D8sNKRF2WgmYt9Jcs//wxaTdizgLrKhIeXD
	 4nsbXKlyK49ftBq/FA85pkWTB7GyY5lS2hBDAlKP7VwgUUmQB0QQQmn8jbdUXjt0pz
	 52hs5OmEXCJ3Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 13 Feb 2026 01:45:13 -0500
Subject: [PATCH] kbuild: rpm-pkg: Fix manual debuginfo generation when
 using .src.rpm
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-fix-debuginfo-srcrpm-pkg-v1-1-45cd0c0501b9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqEMAwAvyI5b6Ct2gW/InvQGGuQrSVFEcS/W
 zwOzMwFmVU4Q1ddoHxIli0WsJ8KaBliYJSpMDjjvHG2xllOnHjcg8R5w6yk6Y9pDeja2hNZ8qb
 5QsmTcnHfdf+77wfSY2InagAAAA==
X-Change-ID: 20260213-fix-debuginfo-srcrpm-pkg-2536cc1c6047
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Lukas Herbolt <lukas@herbolt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6J35rRRigU8xE8JpO0UJ8nD7n7Rc/gRlu+sFTRGORyQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJl9J+qaWFgUmuvWb+v/2Jcdw9LaX3E15/Nd81ueAhe/R
 t37KSbWUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaySZKR4cWto7+Kb03Re1K0
 Zjnrzy0Xrk2ren62kiv03cNjhc8UFpcyMryJEZupVHZs3nkvvp1ftsyx65E3e6rz0SRvUYxdkrX
 dHj4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package
manually") added uses of OBJCOPY and READELF, variables from Kbuild.
These variables are defined and work properly when using the binrpm-pkg
target because rpmbuild is run within Kbuild. However, these variables
are not defined when building from a source RPM package generated with
the srcrpm-pkg target, breaking the build when generating the debug info
subpackage.

Define a default value for these variables so that these commands
respect the value from Kbuild but continue to work when built from a
source RPM package.

Cc: stable@vger.kernel.org
Fixes: 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package manually")
Reported-by: Lukas Herbolt <lukas@herbolt.com>
Closes: https://lore.kernel.org/20260212135855.147906-2-lukas@herbolt.com/
Tested-by: Lukas Herbolt <lukas@herbolt.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/package/kernel.spec | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index af682a705477..bccf58bdd45f 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -148,11 +148,11 @@ echo /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > %{buildroot}/debuginf
 while read -r mod; do
 	mod="${mod%.o}.ko"
 	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
-	buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+	buildid=$("${READELF:-readelf}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
 	link="%{buildroot}/usr/lib/debug/.build-id/${buildid}.debug"
 
 	mkdir -p "${dbg%/*}" "${link%/*}"
-	"${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
+	"${OBJCOPY:-objcopy}" --only-keep-debug "${mod}" "${dbg}"
 	ln -sf --relative "${dbg}" "${link}"
 
 	echo "${dbg#%{buildroot}}" >> %{buildroot}/debuginfo.list

---
base-commit: d59d7292d8b2f3123450e0ba573da6072fd869ef
change-id: 20260213-fix-debuginfo-srcrpm-pkg-2536cc1c6047

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

