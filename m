Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA38A38E8DC;
	Fri, 24 Jul 2026 20:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923238; cv=none; b=lQHOtMP0MjQL/ADdTAQEV/rkBDE4WnwByq0o+DgkzEpRZdn/Mugy10E/LPTpDyEB1YCbtGL1qbUghraNbHlp1JizQH64VKEZFbhq7OqyyN0bWmFWxw5WCnXyIDkAUt2h+1Vj6ndHMpJHurw1rtVg6MHa22gOdpcRaAQ4yHpBOIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923238; c=relaxed/simple;
	bh=6PJ/JG+JjqilDnvURZOLt8wxaDRYBKLd9zFBm3RJE70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTpBZwyf04eHQtKSDliH5oXKJoMP6TleIqpU5n0hUW4bJ48vS+CTH2iuqZ15pzmSRluy8iPJ+fn3lFaDrkpunpA/aUs6DVIJXsOzVFI/XROWu5FlibBORYeKSo567ev6Mpf1oUaxYuahF5xbLVYhkAiXGvwzhpKCUPz/ERs82hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Q0Dp5ENe; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Q0Dp5ENe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=9fPzu3f1R0q8tlLxJg59Ll4X1FClUIGSZZggwiTEhGM=; b=Q0Dp5ENeJaswHJdyDXhLwDeXCT
	UGOMvgaqPBnDkyLITRLuLrOWZOf/Q9IMIhKEruCeP3Asc6b1JJh6cGN8+Z4kYMqHMJmuitthjTmjU
	PFqNc8YMRp+I1ZScM69ua9wKJsAwEMHi+2n4CUOd8YU0hfMopVDrJ7kTff3LkqeVebDH1lOKJgFdQ
	FDLgLIVh98hK1KiGt9rg49LS3Z41ZdwSFNfhQlsNmZ9qQp22QrQlcJyr8tSBihqfSz4QpbPIHw9e8
	pDbJjKjP+Ap6npKYk9pZOE0f4z1Dfbnr0X6U3kXcbtSP0Mi8dK1ls8sNaZWivimkUR4yTpVHDyq6J
	qfVOkcvA==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wnM4K-0057cp-RI; Fri, 24 Jul 2026 22:00:29 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 24 Jul 2026 17:00:12 -0300
Subject: [PATCH RFC 2/4] syscalls: Add support for x86_x32 for the common
 syscall table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-tonyk-syscall_table-v1-2-9c53188423da@igalia.com>
References: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
In-Reply-To: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
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
index 77934a2d0f51..b68492946d6f 100755
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

