Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD53AE193;
	Fri, 24 Jul 2026 20:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923239; cv=none; b=QBCKe9+pOl0ujTgaWibmxsjh2Kr71qLuaA7VWMRF1L7YRtfUxcc/GyX//2cdiqoX6jR27tF4loVwTLgExY5e+bCMx5Wa939Z+XcovpAdAteh9phtMfQ5ZMM5xT4cF6z2uNYLrG0TxN9xXQCjHmsAUH/K3ARLRiTmdf0q8g81wVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923239; c=relaxed/simple;
	bh=rsa+pqhrmGV4izQTEEpgy9rm16cZmbZj5NJOx5epuIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQXIODsjcHNl8kLjOn/X26gq7aM0kxKVBzsNi0vJlc2y7sjsdLk5tJdzcyHeAnMBuI/eCmjrMLklfR9VUhOR5km6MxticeBCPb+uVM6P7IJWfM7ksprS72IY5+C2wSaaCpSddvOLJIPeLDyDRu9PDgiAh2ZKCNJRQjVrMQbJbPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=NyEF4KFa; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="NyEF4KFa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=C9Plr5f/tU39r4klK3uyI7ED84ZM36RVTfvOWkOJeNA=; b=NyEF4KFaCCQN2BY5c+rVewN1dT
	ECa9WBZSznOph0LD9HMJcggzhb2O5Uv1spq73ky9zFAytCv7vP/3DwCf43icBr6uSyxyKAd6ZXHKq
	3Ob0wplVpCmfSqOnlVshUi93DMgXXN0vIgQvW0HSPM56nx6gTURQeJ3pxX+opDHCvxafA2Qet5sNs
	9V0YhJSpA+k6ukRWis+m/t6GeVKWYjxnS3K7yUCJCqrYN/UvGuxdIW7DzvgdzGtLQQD4CjmOZc3ea
	ArMSXGmaiAPMFUwTPs6lczxH13EZsVwoQwFKQLhe1cnVgAuW0hvOP9ce5XRvdufsBoc5cMgH2OaTL
	oLGgUdoA==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wnM4Q-0057cp-Pl; Fri, 24 Jul 2026 22:00:35 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 24 Jul 2026 17:00:14 -0300
Subject: [PATCH RFC 4/4] scripts/syscall.tbl: Use the common table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-tonyk-syscall_table-v1-4-9c53188423da@igalia.com>
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

Use the common syscall number table and drop the shared numbers from the
table.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/arm64/tools/syscall_32.tbl | 30 ------------------------------
 scripts/Makefile.asm-headers    |  4 ++--
 scripts/syscall.tbl             | 30 ------------------------------
 3 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/tools/syscall_32.tbl b/arch/arm64/tools/syscall_32.tbl
index 62d93d88e0fe..98315dee6d0b 100644
--- a/arch/arm64/tools/syscall_32.tbl
+++ b/arch/arm64/tools/syscall_32.tbl
@@ -453,33 +453,3 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
-442	common	mount_setattr			sys_mount_setattr
-443	common	quotactl_fd			sys_quotactl_fd
-444	common	landlock_create_ruleset		sys_landlock_create_ruleset
-445	common	landlock_add_rule		sys_landlock_add_rule
-446	common	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	common	process_mrelease		sys_process_mrelease
-449	common	futex_waitv			sys_futex_waitv
-450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	common	cachestat			sys_cachestat
-452	common	fchmodat2			sys_fchmodat2
-453	common	map_shadow_stack		sys_map_shadow_stack
-454	common	futex_wake			sys_futex_wake
-455	common	futex_wait			sys_futex_wait
-456	common	futex_requeue			sys_futex_requeue
-457	common	statmount			sys_statmount
-458	common	listmount			sys_listmount
-459	common	lsm_get_self_attr		sys_lsm_get_self_attr
-460	common	lsm_set_self_attr		sys_lsm_set_self_attr
-461	common	lsm_list_modules		sys_lsm_list_modules
-462	common	mseal				sys_mseal
-463	common	setxattrat			sys_setxattrat
-464	common	getxattrat			sys_getxattrat
-465	common	listxattrat			sys_listxattrat
-466	common	removexattrat			sys_removexattrat
-467	common	open_tree_attr			sys_open_tree_attr
-468	common	file_getattr			sys_file_getattr
-469	common	file_setattr			sys_file_setattr
-470	common	listns				sys_listns
-471	common	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index 8a4856e74180..995171dab2ca 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -58,14 +58,14 @@ quiet_cmd_remove = REMOVE  $(unwanted)
       cmd_remove = rm -f $(unwanted)
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) \
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --common-tbl \
 		   $(if $(syshdr-args-$*),$(syshdr-args-$*),$(syshdr-args)) \
 		   $(if $(syscall_compat),--prefix "compat$*_") \
 		   --abis $(subst $(space),$(comma),$(strip $(syscall_abis_$*))) \
 		   $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) --common-tbl \
 		   $(if $(systbl-args-$*),$(systbl-args-$*),$(systbl-args)) \
 		   --abis $(subst $(space),$(comma),$(strip $(syscall_abis_$*))) \
 		   $< $@
diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 7a42b32b6577..8f0c4a1678d7 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -382,33 +382,3 @@
 439	common	faccessat2			sys_faccessat2
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
-442	common	mount_setattr			sys_mount_setattr
-443	common	quotactl_fd			sys_quotactl_fd
-444	common	landlock_create_ruleset		sys_landlock_create_ruleset
-445	common	landlock_add_rule		sys_landlock_add_rule
-446	common	landlock_restrict_self		sys_landlock_restrict_self
-447	memfd_secret	memfd_secret		sys_memfd_secret
-448	common	process_mrelease		sys_process_mrelease
-449	common	futex_waitv			sys_futex_waitv
-450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	common	cachestat			sys_cachestat
-452	common	fchmodat2			sys_fchmodat2
-453	common	map_shadow_stack		sys_map_shadow_stack
-454	common	futex_wake			sys_futex_wake
-455	common	futex_wait			sys_futex_wait
-456	common	futex_requeue			sys_futex_requeue
-457	common	statmount			sys_statmount
-458	common	listmount			sys_listmount
-459	common	lsm_get_self_attr		sys_lsm_get_self_attr
-460	common	lsm_set_self_attr		sys_lsm_set_self_attr
-461	common	lsm_list_modules		sys_lsm_list_modules
-462	common	mseal				sys_mseal
-463	common	setxattrat			sys_setxattrat
-464	common	getxattrat			sys_getxattrat
-465	common	listxattrat			sys_listxattrat
-466	common	removexattrat			sys_removexattrat
-467	common	open_tree_attr			sys_open_tree_attr
-468	common	file_getattr			sys_file_getattr
-469	common	file_setattr			sys_file_setattr
-470	common	listns				sys_listns
-471	common	rseq_slice_yield		sys_rseq_slice_yield

-- 
2.55.0

