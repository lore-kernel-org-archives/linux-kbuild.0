Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97030DD2F;
	Wed, 12 Aug 2026 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505615; cv=none; b=qIFWHLvzio4uaGt0N4HAz1jL24TozlyJTPWJgxoRswKoYAMK9sfiOeo587Yeza3S/sAbaCavq4HKhMrcCwNy3H+7VdDaFqNsCId7ma2NP6Mboe7BKKezWXYHd1P70Y+tXygjCPLdPclIwqXX2POAAeBqjcgIzXdRPNav7h8jwPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505615; c=relaxed/simple;
	bh=jqR2rxHeCm2XBkgKcHSIkNOnRw7Yyp4YJ9JzfGTHddo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PB5yCyJKyihEmyfVx2PMwU+cxgH8/jQzhqYsyuy9AKRDC+GPADyzOIOSf5dJwKU5/+PRta224bmfFTDtFhVJsTgv46mOtIhwtlrAUVn4iY0P28l0NSnOKjd1pwQ7m32kUqxZUbys/V4z51EIN1Jg+mtFlLeyaFGH5rV0DonW84I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZEwxfV8+; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZEwxfV8+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=Q16BvfTCl5o4ESOhnbuX5LX4onuMK2D7Gs+JM5Y3I80=; b=ZEwxfV8+ZW1Q38kqwSMYtuzw3G
	svOVgrHzaEzVbfZqOiGyiAno08WD7afDVt4Gbm6RLgojYzmnHCn+LJj7LecgGJmkcFU66Gul4sfF1
	CwuATCJ5K64eG5P3uTUmfn6dYept1tIaxlMqlqc4VZbVSd8qO5mAu+hG/6H2XepAEJcgO1uSgiwHj
	kiMMHu5jezd1fH1JqsbQKHb4LHIxQ5JxUTKBEksSrb9OLxe0ntFC/xT9CKbpbbIQneTKZYsk/ch64
	2GGPCZvqgvMxhCoKDkMLspNT+TDKJnT4DeXBBveC5auIxnRKW6W8H7YU6Compr1I/yzPMa6PYyTIt
	LbpwPt7w==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtziY-00HTm1-Oy; Wed, 12 Aug 2026 05:33:26 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 00:33:06 -0300
Subject: [PATCH v4 10/12] syscalls: Add an option for offsetting the common
 table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v4-10-748d0229ad40@igalia.com>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

To better support architectures that doesn't share the same syscall
numbers, but have them in the same sequence, add an new option to offset
the common syscall table numbers by a value. This make it possible to reuse
the common syscall table for alpha.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 scripts/syscallhdr.sh | 21 ++++++++++++++-------
 scripts/syscalltbl.sh | 17 ++++++++++++++---
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index 54e09d3e686c..0e095dac9db2 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -16,17 +16,18 @@
 set -e
 
 usage() {
-	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET] [--prefix PREFIX] [--common-tbl PATH] INFILE OUTFILE" >&2
+	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET] [--prefix PREFIX] [--common-tbl PATH] [--common-offset OFFSET] INFILE OUTFILE" >&2
 	echo >&2
 	echo >&2 "  INFILE    input syscall table"
 	echo >&2 "  OUTFILE   output header file"
 	echo >&2
 	echo >&2 "options:"
-	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
-	echo >&2 "  --emit-nr          Emit the macro of the number of syscalls (__NR_syscalls)"
-	echo >&2 "  --offset OFFSET    The offset of syscall numbers"
-	echo >&2 "  --prefix PREFIX    The prefix to the macro like __NR_<PREFIX><NAME>"
-	echo >&2 "  --common-tbl PATH  Use the common number table"
+	echo >&2 "  --abis ABIS             ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --emit-nr               Emit the macro of the number of syscalls (__NR_syscalls)"
+	echo >&2 "  --offset OFFSET         The offset of syscall numbers"
+	echo >&2 "  --prefix PREFIX         The prefix to the macro like __NR_<PREFIX><NAME>"
+	echo >&2 "  --common-tbl PATH       Use the common number table"
+	echo >&2 "  --common-offset OFFSET  Apply an offset for the numbers of the common table"
 	exit 1
 }
 
@@ -34,6 +35,7 @@ usage() {
 abis=
 emit_nr=
 offset=
+common_offset=
 prefix=
 common_tbl=
 common_tbl_path=
@@ -57,6 +59,9 @@ do
 		common_tbl=1
 		common_tbl_path=$2
 		shift 2;;
+	--common-offset)
+		common_offset=$2
+		shift 2;;
 	-*)
 		echo "$1: unknown option" >&2
 		usage;;
@@ -107,7 +112,7 @@ gen_hdr() {
 		max=$nr
 
 		if [ -n "$offset" ]; then
-			nr="($offset + $nr)"
+			nr=$((nr + offset))
 		fi
 
 		echo "#define __NR_$prefix$name $nr"
@@ -120,7 +125,9 @@ emit_start_guard > $outfile
 gen_hdr $infile >> $outfile
 
 if [ -n "$common_tbl" ]; then
+	offset=$common_offset
 	gen_hdr $common_tbl_path  >> "$outfile"
+	unset offset
 fi
 
 if [ -n "$emit_nr" ]; then
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index 91c135143b22..c00f848b5b66 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -16,14 +16,15 @@
 set -e
 
 usage() {
-	echo >&2 "usage: $0 [--abis ABIS] [--common-tbl PATH] INFILE OUTFILE" >&2
+	echo >&2 "usage: $0 [--abis ABIS] [--common-tbl PATH] [--common-offset OFFSET] INFILE OUTFILE" >&2
 	echo >&2
 	echo >&2 "  INFILE    input syscall table"
 	echo >&2 "  OUTFILE   output header file"
 	echo >&2
 	echo >&2 "options:"
-	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
-	echo >&2 "  --common-tbl PATH  Use the common syscall number table"
+	echo >&2 "  --abis ABIS             ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --common-tbl PATH       Use the common syscall number table"
+	echo >&2 "  --common-offset OFFSET  Apply an offset for the numbers of the common table"
 	exit 1
 }
 
@@ -31,6 +32,7 @@ usage() {
 abis=
 common_tbl=
 common_tbl_path=
+common_offset=
 
 while [ $# -gt 0 ]
 do
@@ -42,6 +44,9 @@ do
 		common_tbl=1
 		common_tbl_path=$2
 		shift 2;;
+	--common-offset)
+		common_offset=$2
+		shift 2;;
 	-*)
 		echo "$1: unknown option" >&2
 		usage;;
@@ -65,6 +70,10 @@ gen_tbl() {
 
 	while read nr abi name native compat noreturn; do
 
+		if [ -n "$offset" ]; then
+			nr=$((nr + offset))
+		fi
+
 		if [ $nxt -gt $nr ]; then
 			echo "error: $input: syscall table is not sorted or duplicates the same syscall number" >&2
 			exit 1
@@ -105,5 +114,7 @@ gen_tbl() {
 gen_tbl $infile  > "$outfile"
 
 if [ -n "$common_tbl" ]; then
+	offset=$common_offset
 	gen_tbl $common_tbl_path >> "$outfile"
+	unset offset
 fi

-- 
2.55.0

