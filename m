Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698803403E8;
	Fri, 24 Jul 2026 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923237; cv=none; b=j0IXXyHyYFKPOJrZkNmG16mY1Wn9LcNM52b+lPcgyyMMjr0J/SPNk1NN8ls5U6cOiyLiGVQQDVzg1+ZRJwbypszXgi8oU85jkiGifmS/PHfAaAJEJH/QZK4D2mXn/3TJIHLPR3FBPuTSVdLFiTlqUDpH+M9z7siFBzRgykuwPbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923237; c=relaxed/simple;
	bh=DwwSiNMO9pgR1zGX2MA+hvLGOAHCs3t/mwrvip7y238=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMtb+la0G8mIckfO0x7+hcQ5rWlRukfzPPq11LtUlKOTKqcVlZ3My3WLp/VB2jEduATMD+rg1gUqz339gJufx248mRYh2LR8C6qXv4iZnM9veSDI45uxeGDrgbn7Qt0qUQilD61TAn/cLYyGwry9+ale5nebTk2gC8vGLTBkU74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=KixWr+zb; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="KixWr+zb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=idCVsME+eWmn8Qc70QsEZkQ2WrYTAHHlo6V9KysOIVg=; b=KixWr+zb83wJrG8pzJZeoSelbc
	ou/envzkAIVZzAi/iXlIrt2O0aA4okWAXhW8cLAeFRVMEM/9EgMruR4Jy6MELoQDIfdc4o+6voBxb
	isLmAnkqFixsJkMfVUv3XQfmnHIYqQ6OHoad4g2iCyXXhAms4VeMtPkhGso2L/CFXLdVV2YGEXOxl
	6StFH+4P6K7ufygbzEQytew5+1P6QPvc6ssGCBG4QtJI1RYYGg8tDgmsvHcysyY257sc5Lt8f80BX
	+s0TON4LsZvJrxfyFFPEgUrRtgzWQieKeHCqTbFNum2x+hr308Zi1B6/yDVFaVAyA3CtX2RD2K5eE
	8VUYUXYg==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wnM4H-0057cp-Rn; Fri, 24 Jul 2026 22:00:26 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 24 Jul 2026 17:00:11 -0300
Subject: [PATCH RFC 1/4] syscalls: Create unified partial table for all
 archs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-tonyk-syscall_table-v1-1-9c53188423da@igalia.com>
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

To take advantage of the subset of syscall numbers that are guaranteed to
be shared, create a new table and adapt generation scripts to use it. In
that way, every new syscall can be added to a single file.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 scripts/syscall_common.tbl | 34 ++++++++++++++++++++++++++++
 scripts/syscallhdr.sh      | 55 +++++++++++++++++++++++++++++++++++-----------
 scripts/syscalltbl.sh      | 26 +++++++++++++++++-----
 3 files changed, 97 insertions(+), 18 deletions(-)

diff --git a/scripts/syscall_common.tbl b/scripts/syscall_common.tbl
new file mode 100644
index 000000000000..97ea46ea8d56
--- /dev/null
+++ b/scripts/syscall_common.tbl
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#
+# syscall numbers shared by architectures
+
+442	common	mount_setattr			sys_mount_setattr
+443	common	quotactl_fd			sys_quotactl_fd
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
+447	memfd_secret	memfd_secret			sys_memfd_secret
+448	common	process_mrelease		sys_process_mrelease
+449	common	futex_waitv			sys_futex_waitv
+450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	cachestat			sys_cachestat
+452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
+454	common	futex_wake			sys_futex_wake
+455	common	futex_wait			sys_futex_wait
+456	common	futex_requeue			sys_futex_requeue
+457	common	statmount			sys_statmount
+458	common	listmount			sys_listmount
+459	common	lsm_get_self_attr		sys_lsm_get_self_attr
+460	common	lsm_set_self_attr		sys_lsm_set_self_attr
+461	common	lsm_list_modules		sys_lsm_list_modules
+462	common	mseal				sys_mseal
+463	common	setxattrat			sys_setxattrat
+464	common	getxattrat			sys_getxattrat
+465	common	listxattrat			sys_listxattrat
+466	common	removexattrat			sys_removexattrat
+467	common	open_tree_attr			sys_open_tree_attr
+468	common	file_getattr			sys_file_getattr
+469	common	file_setattr			sys_file_setattr
+470	common	listns				sys_listns
+471	common	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index 22e34cd46b9b..77934a2d0f51 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -26,6 +26,7 @@ usage() {
 	echo >&2 "  --emit-nr          Emit the macro of the number of syscalls (__NR_syscalls)"
 	echo >&2 "  --offset OFFSET    The offset of syscall numbers"
 	echo >&2 "  --prefix PREFIX    The prefix to the macro like __NR_<PREFIX><NAME>"
+	echo >&2 "  --common-tbl       Use the common number table"
 	exit 1
 }
 
@@ -34,6 +35,9 @@ abis=
 emit_nr=
 offset=
 prefix=
+common_tbl=
+max=0
+COMMON_TBL_PATH="../scripts/syscall_common.tbl"
 
 while [ $# -gt 0 ]
 do
@@ -50,6 +54,9 @@ do
 	--prefix)
 		prefix=$2
 		shift 2;;
+	--common-tbl)
+		common_tbl=1
+		shift 1;;
 	-*)
 		echo "$1: unknown option" >&2
 		usage;;
@@ -69,13 +76,32 @@ guard=_UAPI_ASM_$(basename "$outfile" |
 	sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
 	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g')
 
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$infile" | {
+emit_start_guard() {
 	echo "#ifndef $guard"
 	echo "#define $guard"
 	echo
+}
+
+# emit_nr(prefix, nr)
+emit_nr() {
+	local nr=$1
+	local prefix=$2
+	echo
+	echo "#ifdef __KERNEL__"
+	echo "#define __NR_${prefix}syscalls $nr"
+	echo "#endif"
+}
+
+emit_end_guard() {
+	echo
+	echo "#endif /* $guard */"
+}
 
-	max=0
-	while read nr abi name native compat ; do
+# gen_hdr(infile)
+gen_hdr() {
+	input=$1
+
+	while read nr abi name native compat; do
 
 		max=$nr
 
@@ -84,15 +110,18 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$infile" | {
 		fi
 
 		echo "#define __NR_$prefix$name $nr"
-	done
 
-	if [ -n "$emit_nr" ]; then
-		echo
-		echo "#ifdef __KERNEL__"
-		echo "#define __NR_${prefix}syscalls $(($max + 1))"
-		echo "#endif"
-	fi
+	done < <(grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$input")
+}
 
-	echo
-	echo "#endif /* $guard */"
-} > "$outfile"
+emit_start_guard > $outfile
+
+gen_hdr $infile >> $outfile
+
+if [ -n "$common_tbl" ]; then
+	gen_hdr $COMMON_TBL_PATH  >> "$outfile"
+fi
+
+emit_nr $(($max + 1)) $prefix >> $outfile
+
+emit_end_guard >> $outfile
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index 6a903b87a7c2..30441cf88ead 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -23,11 +23,14 @@ usage() {
 	echo >&2
 	echo >&2 "options:"
 	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --common-tbl       Use the common syscall number table"
 	exit 1
 }
 
 # default unless specified by options
 abis=
+common_tbl=
+COMMON_TBL_PATH="../scripts/syscall_common.tbl"
 
 while [ $# -gt 0 ]
 do
@@ -35,6 +38,9 @@ do
 	--abis)
 		abis=$(echo "($2)" | tr ',' '|')
 		shift 2;;
+	--common-tbl)
+		common_tbl=1
+		shift 1;;
 	-*)
 		echo "$1: unknown option" >&2
 		usage;;
@@ -52,12 +58,14 @@ outfile="$2"
 
 nxt=0
 
-grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | {
+# gen_tbl(infile)
+gen_tbl() {
+	input=$1
 
 	while read nr abi name native compat noreturn; do
 
 		if [ $nxt -gt $nr ]; then
-			echo "error: $infile: syscall table is not sorted or duplicates the same syscall number" >&2
+			echo "error: $input: syscall table is not sorted or duplicates the same syscall number" >&2
 			exit 1
 		fi
 
@@ -72,7 +80,7 @@ grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | {
 
 		if [ -n "$noreturn" ]; then
 			if [ "$noreturn" != "noreturn" ]; then
-				echo "error: $infile: invalid string \"$noreturn\" in 'noreturn' column"
+				echo "error: $input: invalid string \"$noreturn\" in 'noreturn' column"
 				exit 1
 			fi
 			if [ -n "$compat" ]; then
@@ -88,5 +96,13 @@ grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | {
 			echo "__SYSCALL($nr, sys_ni_syscall)"
 		fi
 		nxt=$((nr + 1))
-	done
-} > "$outfile"
+
+	done < <(grep -E "^[0-9]+[[:space:]]+$abis" "$input")
+
+}
+
+gen_tbl $infile  > "$outfile"
+
+if [ -n "$common_tbl" ]; then
+	gen_tbl $COMMON_TBL_PATH >> "$outfile"
+fi

-- 
2.55.0

