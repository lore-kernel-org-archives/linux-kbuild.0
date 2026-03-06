Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57595395DBC
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814805; cv=none; b=H420uMy2GrSzbmu0NNWUJWpOIZ43YAz2L+IDwv8+WOhP+chdEf6+rDkNzfMoBLM6gUzxfGiAbFlGOHwaCJFZQYvbuq4adRIIdi66g61Bqu1p8RWINacr42GdgXWiuqEQRZ+hNXPXAlpOjDK1shy+ElCFpJTFNasr1szGAyAaLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814805; c=relaxed/simple;
	bh=ZI0O09pwHqrPFtmEavAOA2eKkiwpAFpEzW3UPFLThsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pVyq3ZB59HOPsIYJUNIQEXQw2uzLL4alnoS3ZAweZOxidq+6tH6X3D/bFk/+3eEU388kkBvYcFmXby7HepVKQf4llZc+KftHxtyMCejSS+cnGAIVg9+6yozFHRnA4cSTpThNrwdmF//Dd2G2D2rRthtOJG8HtQPcdAhVUl2eCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8tY8Nxr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8tY8Nxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348ADC2BC86;
	Fri,  6 Mar 2026 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772814805;
	bh=ZI0O09pwHqrPFtmEavAOA2eKkiwpAFpEzW3UPFLThsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E8tY8Nxr9xvwvHx2xuk7SXt6CWtRjWpNd4rSI7fvlrL33ijs/E2q3seUWvVr77Ng2
	 BRdzPVpqKFszwAEj+8YnPUfTC9Rt6ybjc7oPl7CI3dKjhGMAwQV+swTFmovxOf6dT7
	 7LT2fAgw8wEVdnaY7JxYVgoV/cljP7MWPGbqtbNd34rmtm+vDKSFE5VojteuqoM9jh
	 GK4bvbOTM189tC3VYWmZejXAotIizSW/6K2ucvge5aku5otg+HL4E+88hm1/xfrDIM
	 eHBBRd0Bti3eKEHzX8PaoFaet88q7pOnEKW+RAafOXO1dr6S8A6WzTnJKq4x/DCjJu
	 Nb96A7nFBZOuw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	libabigail@sourceware.org
Subject: [PATCH 2/3] check-uapi: honor ${CROSS_COMPILE} setting
Date: Fri,  6 Mar 2026 17:33:08 +0100
Message-Id: <20260306163309.2015837-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260306163309.2015837-1-arnd@kernel.org>
References: <20260306163309.2015837-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When ${CROSS_COMPILE} is set, but ${CC} is not set, the logic in
check-uapi.sh is different from the top-level Makefile, which defaults
to using the cross gcc. This leads to using the native gcc instead of the
cross version, resulting in unexpected false-positive and false-negative
output.

Use the same logic here that we use in Kbuild for consistency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/check-uapi.sh | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/check-uapi.sh b/scripts/check-uapi.sh
index 9fa45cbdecc2..e4d120eb09e3 100755
--- a/scripts/check-uapi.sh
+++ b/scripts/check-uapi.sh
@@ -33,9 +33,10 @@ Options:
     -v             Verbose operation (print more information about each header being checked).
 
 Environmental args:
-    ABIDIFF  Custom path to abidiff binary
-    CC       C compiler (default is "gcc")
-    ARCH     Target architecture for the UAPI check (default is host arch)
+    ABIDIFF        Custom path to abidiff binary
+    CROSS_COMPILE  Toolchain prefix for compiler
+    CC             C compiler (default is "\${CROSS_COMPILE}gcc")
+    ARCH           Target architecture for the UAPI check (default is host arch)
 
 Exit codes:
     $SUCCESS) Success
@@ -198,7 +199,7 @@ do_compile() {
 run_make_headers_install() {
 	local -r ref="$1"
 	local -r install_dir="$(get_header_tree "$ref")"
-	make -j "$MAX_THREADS" ARCH="$ARCH" INSTALL_HDR_PATH="$install_dir" \
+	make -j "$MAX_THREADS" CROSS_COMPILE="${CROSS_COMPILE}" ARCH="$ARCH" INSTALL_HDR_PATH="$install_dir" \
 		headers_install > /dev/null
 }
 
@@ -407,7 +408,7 @@ min_version_is_satisfied() {
 # Make sure we have the tools we need and the arguments make sense
 check_deps() {
 	ABIDIFF="${ABIDIFF:-abidiff}"
-	CC="${CC:-gcc}"
+	CC="${CC:-${CROSS_COMPILE}gcc}"
 	ARCH="${ARCH:-$(uname -m)}"
 	if [ "$ARCH" = "x86_64" ]; then
 		ARCH="x86"
-- 
2.39.5

