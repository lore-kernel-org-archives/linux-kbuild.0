Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC73C37E5DE;
	Wed, 12 Aug 2026 03:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505619; cv=none; b=RtDUOTzFyPWY6siq3/xTubCSQmH96BNbPQa733P0VbXXjK+sCtmNGdUK/5LBbSm4+FkStpSMsmYUuJUYxUd7Ww3lav8j5662zWzJkM2ZTP6MR0Bbhy27aDDsRbPt63fdZsMigLuuVsBTzEKBfODzp/hrGeLcfULpwllAGCwd9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505619; c=relaxed/simple;
	bh=ynkoCWvIiM06uOaAEsBnt8tIYN0tG9OkaiG+bgclHaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmmTuY8NdfqICt8c5egfIDydt82x5eE7EFu9h3UlPTj8GIu0YroXKDRoTNJaObD4+4bGIHPnp+bu8JSKKpuxnK8lV2RzPNVuoZdrfUQ0NdgH6mhBDAY+3+NyQg3F4ul8Co0lgB5VgG1BrmDD9QK/mHstik7/+tKFQVG8hT97zOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=cF4eu4hn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cF4eu4hn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=ZXcMChxkewCkdbksyrQFGqEOLgM/kF2w2BoHGOnMYVU=; b=cF4eu4hn1sNFAnao2xu47mGHj9
	rJKUpnTVbGa3V7Y89mo0P7EXyVRSX45ahn2X7h+m4im1cQwk+4JDJZNUf2lOZ2AsgsmCIU7cQsyVJ
	EmuBH6XFeDhEmU+NsHVWofA+GYXSBw6jCRNj3MCVi2gDsKsmIKbNONy1FwnLoto5YYl0bH6Cnr/qZ
	LB/MWEtcAMTd/+Xs9vSTlRMaAMHRNEl5pr9Z0aDx2WxNgLwQ43PAUYwI8xkcuscP6kEOAKHoiXJ72
	/PNvOzrra2e87X/2gDO8hv8BzzIvdRmJNm2TqA3o1+z5Wj7mwlIBJh2UAgJN0U8b4TelczZIUAjp7
	QIvtVPSw==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtzid-00HTm1-DC; Wed, 12 Aug 2026 05:33:31 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 00:33:08 -0300
Subject: [PATCH v4 12/12] alpha: Use the common syscall table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v4-12-748d0229ad40@igalia.com>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

Remove some of the duplicated code by using the common syscall number
table.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/alpha/kernel/syscalls/Makefile    | 10 +++++--
 arch/alpha/kernel/syscalls/syscall.tbl | 48 ----------------------------------
 arch/alpha/kernel/systbls.S            |  1 +
 scripts/syscall_common.tbl             |  1 +
 4 files changed, 10 insertions(+), 50 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/syscalls/Makefile
index b265e4bc16c2..62ca5553a59c 100644
--- a/arch/alpha/kernel/syscalls/Makefile
+++ b/arch/alpha/kernel/syscalls/Makefile
@@ -7,12 +7,18 @@ $(shell mkdir -p $(uapi) $(kapi))
 syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/scripts/syscallhdr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
+systbl_common := $(srctree)/scripts/syscall_common.tbl
+abis := common,alpha
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr \
+		   --common-tbl $(systbl_common) --common-offset 110 \
+		   --abis $(abis) $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
+		   --common-tbl $(systbl_common) --common-offset 110 \
+		   --abis $(abis) $< $@
 
 $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 25180953c3c1..4441bc596317 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -463,51 +463,3 @@
 532	common	getppid				sys_getppid
 # all other architectures have common numbers for new syscall, alpha
 # is the exception.
-534	common	pidfd_send_signal		sys_pidfd_send_signal
-535	common	io_uring_setup			sys_io_uring_setup
-536	common	io_uring_enter			sys_io_uring_enter
-537	common	io_uring_register		sys_io_uring_register
-538	common	open_tree			sys_open_tree
-539	common	move_mount			sys_move_mount
-540	common	fsopen				sys_fsopen
-541	common	fsconfig			sys_fsconfig
-542	common	fsmount				sys_fsmount
-543	common	fspick				sys_fspick
-544	common	pidfd_open			sys_pidfd_open
-545	common	clone3				alpha_clone3
-546	common	close_range			sys_close_range
-547	common	openat2				sys_openat2
-548	common	pidfd_getfd			sys_pidfd_getfd
-549	common	faccessat2			sys_faccessat2
-550	common	process_madvise			sys_process_madvise
-551	common	epoll_pwait2			sys_epoll_pwait2
-552	common	mount_setattr			sys_mount_setattr
-553	common	quotactl_fd			sys_quotactl_fd
-554	common	landlock_create_ruleset		sys_landlock_create_ruleset
-555	common	landlock_add_rule		sys_landlock_add_rule
-556	common	landlock_restrict_self		sys_landlock_restrict_self
-# 557 reserved for memfd_secret
-558	common	process_mrelease		sys_process_mrelease
-559	common  futex_waitv                     sys_futex_waitv
-560	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-561	common	cachestat			sys_cachestat
-562	common	fchmodat2			sys_fchmodat2
-563	common	map_shadow_stack		sys_map_shadow_stack
-564	common	futex_wake			sys_futex_wake
-565	common	futex_wait			sys_futex_wait
-566	common	futex_requeue			sys_futex_requeue
-567	common	statmount			sys_statmount
-568	common	listmount			sys_listmount
-569	common	lsm_get_self_attr		sys_lsm_get_self_attr
-570	common	lsm_set_self_attr		sys_lsm_set_self_attr
-571	common	lsm_list_modules		sys_lsm_list_modules
-572	common  mseal				sys_mseal
-573	common	setxattrat			sys_setxattrat
-574	common	getxattrat			sys_getxattrat
-575	common	listxattrat			sys_listxattrat
-576	common	removexattrat			sys_removexattrat
-577	common	open_tree_attr			sys_open_tree_attr
-578	common	file_getattr			sys_file_getattr
-579	common	file_setattr			sys_file_setattr
-580	common	listns				sys_listns
-581	common	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 68f3e4f329eb..9a67d29f7818 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -7,6 +7,7 @@
 
 #include <asm/unistd.h>
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
 #define __SYSCALL(nr, entry) .quad entry
 	.data
 	.align 3
diff --git a/scripts/syscall_common.tbl b/scripts/syscall_common.tbl
index 81e326a8172f..2fcc3b8f53a5 100644
--- a/scripts/syscall_common.tbl
+++ b/scripts/syscall_common.tbl
@@ -45,6 +45,7 @@
 434	common	pidfd_open			sys_pidfd_open
 435	clone3	clone3				sys_clone3
 435	__clone3	clone3			__sys_clone3
+435     alpha  	clone3                          alpha_clone3
 436	common	close_range			sys_close_range
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd

-- 
2.55.0

