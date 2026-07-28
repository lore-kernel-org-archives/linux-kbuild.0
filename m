Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B22F25F3;
	Tue, 28 Jul 2026 02:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206851; cv=none; b=APalxiNEHh2yxWIxGp9On5Sm95/E0V/uKeMaLisAjmChpTUu1tjTu34YdbN5f1/DtcbKDWbtpcqJjcQf6gtkKhASP09cFai5tQBaLWIGiW9YnrEA3uMW9L3b37cS6EsaK9BCCafLq3hCStuTJrDwegnxFKkBPsXpquZSAKgWPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206851; c=relaxed/simple;
	bh=mMLFoyF69/l0NrLAQB+rXObRQBdCTG6Dnzk9rjezpHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmGXICMAo+XIlZBAy1GbYdLUhUKDcV6dQ+mdXmE+RxYTTMg8FddPfGqarg9IPa56LdeLcF/h1AARKefwY+sYrcgU8YpXuYRYJgU0xh1NHZ9ejy0tW9OBtuMZIJysEuuRLFaQTV2mz0bZdlPuss3M+xYEpB5McC71nOSvhvRBxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ktLmUOVs; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ktLmUOVs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=+PSkVF5NVnIwd1cZb5FukG90wkH/DjHsAHi+0DlvZTk=; b=ktLmUOVskdzw3LiOCerN+b4ihg
	9E9rXiU5QgZPPhQkKcaCuvWM1LT16B/zoHvLGf2nmVuWFLmUZEWRjBzVuIrPzKHZtaT7DcziEVmYo
	WoW3RQTrDu+EW6CBTT9WPiM88euiUrm3ErcTOK9w+UC4NxoLcfS59OvuT7gcuHbh2QJgHrA2pp+aG
	VE3M/wibhyijEitpmcf0ztZ07+FOYj0RFwY+nUorUgXhVwSrDaSvHHFA7anTCyRpQIKZ38Oj/JV+K
	S39MXE0HA3Iynw8L8PX93PY4woMgGQNznNit7n+F5CmSWhB3NTca7Ce5PMyEPoBLNUQkUdX+bnpQi
	q10s9nsA==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1woXqh-006nKh-5r; Tue, 28 Jul 2026 04:47:19 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Mon, 27 Jul 2026 23:47:03 -0300
Subject: [PATCH RFC v2 2/4] syscalls: Add support for x86_x32 for the
 common syscall table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-tonyk-syscall_table-v2-2-95d4f1ee471f@igalia.com>
References: <20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com>
In-Reply-To: <20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

x86_x32 has a peculiar ordering: first, goes the x86 syscalls. Then, the
shared syscall numbers from the common table, and finally the x86_x32
syscall numbers. Adapt syscallhdr.sh script to take this into account.

Let's hope that x32 is deprecated before the syscall table reaches syscall
512, to avoid making the shared table more confusing.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 scripts/syscallhdr.sh | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index 0fc3e8dfc7e5..06372006509e 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -72,6 +72,12 @@ fi
 infile="$1"
 outfile="$2"
 
+is_x32=
+
+if [[ "$abis" == *"x32"* ]]; then
+	is_x32=1
+fi
+
 guard=_UAPI_ASM_$(basename "$outfile" |
 	sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
 	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g')
@@ -116,10 +122,32 @@ gen_hdr() {
 
 emit_start_guard > $outfile
 
-gen_hdr $infile >> $outfile
+# x32 has a special ordering. We need to get first the common numbers from x86
+# table, then the common numbers from scripts/syscall_common.tbl and finally the
+# x32 numbers
+if [ -n "$is_x32" ]; then
+
+	abis="${abis//x32|/}"
+	abis="${abis//|x32/}"
+	abis="${abis//x32/}"
+
+	if [[ $abis != "()" ]]; then
+		gen_hdr $infile >> $outfile
+
+		if [ -n "$common_tbl" ]; then
+			gen_hdr $COMMON_TBL_PATH  >> "$outfile"
+		fi
+	fi
+
+	abis="(x32)"
+
+	gen_hdr $infile >> "$outfile"
+else
+	gen_hdr $infile >> $outfile
 
-if [ -n "$common_tbl" ]; then
-	gen_hdr $COMMON_TBL_PATH  >> "$outfile"
+	if [ -n "$common_tbl" ]; then
+		gen_hdr $COMMON_TBL_PATH  >> "$outfile"
+	fi
 fi
 
 emit_nr $(($max + 1)) $prefix >> $outfile

-- 
2.55.0

