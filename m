Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DFB3A6F16;
	Fri,  7 Aug 2026 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131314; cv=none; b=e3uR48MHIHJXimUTYmpDCLB5Ckk7/54UKSQq7rWK3RiMBbV/C0JcJwMerrVIVBiMgoW29ltMdzW7pvr5fJJuV/yuUn4NjjVDtjBSBcGb3xrEGRGuEQUZWFIGQ5e4stl+iQgZKyaIVUrDiPEgTFTZI4BuFU99vTP3JDYwfhiA5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131314; c=relaxed/simple;
	bh=fD+3Z9tt3V15DOL3OMZrFCX2oWSv9yKxY8yakwCTpLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1au0gnO3lJV/yt4GDKe6IAGeKWIkd+Z/8ti/xEyB1J/1bLr03RvP760W7KEpeW7z/cg6w6Addf4lcN7ZLsc88o6AClc9C/JBKpxQ8Qb+cEG+QEllAQStd+wYVWcq0t1zAk6VvVzP2iZzLmgz2/5VgzkPpA4z1mg7y79bthiJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=gh046El8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="gh046El8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=O87e91JgaNhiLG3KGPm8YZ1P81S73kyDNHAyaVFLQlE=; b=gh046El8kquRqn8V7GD9A6UKNM
	/f5pc6iYkVw3u5ZhS8ZrJkb6xuOHNhjmEgDQZXbPOPkLeud8aFkmqLqOLW6w6dzV68HdfM80Ic/0X
	jh9Xdf5ASokYD+Rwa1vGJyzCyu4JAhd4PO8xWo41Uh7fRCHvidzQ1TDcEzzBZfAJwcS3p0UAYAx9a
	xNd7tL+rU0vOetA7d/LWMbG7xKrIU86R7blsDOlmhRMeS+IRYYxTXVf9h2l0O+jgZ3ry/u9Muj3oe
	Q/mnLs4HQx9Sb+R+Kq1gXaqAGj6nXJNsb09agvPrQ1Qg1DoAIKcfE9QnKn6BKFU2tZ94R0V4kmmD5
	AGdc5bjA==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wsQLR-00Fa08-09; Fri, 07 Aug 2026 21:35:05 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 07 Aug 2026 16:34:35 -0300
Subject: [PATCH RFC v3 8/8] mips: Use the common syscall table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-tonyk-syscall_table-v3-8-7c45a23c50b5@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
In-Reply-To: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

Syscall numbers from 403 are shared with all architectures, so move the
toolchain to use the common syscall table and remove duplicated code.

The generated files are not exactly the same as before, but they have no
functional changes:

 - for O32 ABI, the syscall table would have entries like
 __SYSCALL_WITH_COMPAT(403, sys_clock_gettime, sys_clock_gettime)
 which is equivalent to the new entry __SYSCALL(403, sys_clock_gettime)

 - for N32 ABI, the syscall table would have entries like
 __SYSCALL(413, compat_sys_pselect6_time64), which is equivalent to
 __SYSCALL_WITH_COMPAT(413, sys_pselect6, compat_sys_pselect6_time64)
 given the new __SYSCALL_WITH_COMPAT() definition for N32.

The generated syscall table for N64 is exactly the same.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/mips/kernel/scall64-n32.S            |  1 +
 arch/mips/kernel/syscalls/Makefile        | 22 +++++++---
 arch/mips/kernel/syscalls/syscall_n32.tbl | 68 -------------------------------
 arch/mips/kernel/syscalls/syscall_n64.tbl | 48 ----------------------
 arch/mips/kernel/syscalls/syscall_o32.tbl | 68 -------------------------------
 5 files changed, 18 insertions(+), 189 deletions(-)

diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
index 97788859238c..ddf81e379464 100644
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@ -102,6 +102,7 @@ not_n32_scall:
 
 	END(handle_sysn32)
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, compat)
 #define __SYSCALL(nr, entry)	PTR_WD entry
 	.type	sysn32_call_table, @object
 EXPORT(sysn32_call_table)
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 69adc21483ed..9748d053d665 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -7,18 +7,22 @@ $(shell mkdir -p $(uapi) $(kapi))
 syshdr := $(srctree)/scripts/syscallhdr.sh
 sysnr := $(srctree)/scripts/syscallnr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
+systbl_common := $(srctree)/scripts/syscall_common.tbl
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux $< $@
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux \
+		   --common-tbl $(systbl_common) \
+		   --abis $(abis_$*) $< $@
 
 quiet_cmd_sysnr = SYSNR   $@
       cmd_sysnr = $(CONFIG_SHELL) $(sysnr) \
 		  --prefix $(sysnr_pfx_$(basetarget))_Linux_ \
-		  --abis $(sysnr_abis_$(basetarget)) \
-		  $< $@
+		   --abis $(abis_$*) $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
+		   --common-tbl $(systbl_common) \
+		   --abis $(abis_$*) $(no_compat_$*) $< $@
 
 $(uapi)/unistd_%.h: $(src)/syscall_%.tbl $(syshdr) FORCE
 	$(call if_changed,syshdr)
@@ -27,7 +31,15 @@ sysnr_pfx_unistd_nr_n32 := N32
 sysnr_pfx_unistd_nr_n64 := 64
 sysnr_pfx_unistd_nr_o32 := O32
 
-$(kapi)/unistd_nr_%.h: $(src)/syscall_%.tbl $(sysnr) FORCE
+abis := common,__cln3
+
+abis_n32 := $(abis),32,n32
+abis_o32 := $(abis),32,o32
+abis_n64 := $(abis),64,n64
+
+no_compat_n64 := --no-compat
+
+$(kapi)/unistd_nr_%.h: $(systbl_common) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
 $(kapi)/syscall_table_%.h: $(src)/syscall_%.tbl $(systbl) FORCE
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 7430714e2b8f..b3ba69c3c9c3 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -342,71 +342,3 @@
 331	n32	rseq				sys_rseq
 332	n32	io_pgetevents			compat_sys_io_pgetevents
 # 333 through 402 are unassigned to sync up with generic numbers
-403	n32	clock_gettime64			sys_clock_gettime
-404	n32	clock_settime64			sys_clock_settime
-405	n32	clock_adjtime64			sys_clock_adjtime
-406	n32	clock_getres_time64		sys_clock_getres
-407	n32	clock_nanosleep_time64		sys_clock_nanosleep
-408	n32	timer_gettime64			sys_timer_gettime
-409	n32	timer_settime64			sys_timer_settime
-410	n32	timerfd_gettime64		sys_timerfd_gettime
-411	n32	timerfd_settime64		sys_timerfd_settime
-412	n32	utimensat_time64		sys_utimensat
-413	n32	pselect6_time64			compat_sys_pselect6_time64
-414	n32	ppoll_time64			compat_sys_ppoll_time64
-416	n32	io_pgetevents_time64		compat_sys_io_pgetevents_time64
-417	n32	recvmmsg_time64			compat_sys_recvmmsg_time64
-418	n32	mq_timedsend_time64		sys_mq_timedsend
-419	n32	mq_timedreceive_time64		sys_mq_timedreceive
-420	n32	semtimedop_time64		sys_semtimedop
-421	n32	rt_sigtimedwait_time64		compat_sys_rt_sigtimedwait_time64
-422	n32	futex_time64			sys_futex
-423	n32	sched_rr_get_interval_time64	sys_sched_rr_get_interval
-424	n32	pidfd_send_signal		sys_pidfd_send_signal
-425	n32	io_uring_setup			sys_io_uring_setup
-426	n32	io_uring_enter			sys_io_uring_enter
-427	n32	io_uring_register		sys_io_uring_register
-428	n32	open_tree			sys_open_tree
-429	n32	move_mount			sys_move_mount
-430	n32	fsopen				sys_fsopen
-431	n32	fsconfig			sys_fsconfig
-432	n32	fsmount				sys_fsmount
-433	n32	fspick				sys_fspick
-434	n32	pidfd_open			sys_pidfd_open
-435	n32	clone3				__sys_clone3
-436	n32	close_range			sys_close_range
-437	n32	openat2				sys_openat2
-438	n32	pidfd_getfd			sys_pidfd_getfd
-439	n32	faccessat2			sys_faccessat2
-440	n32	process_madvise			sys_process_madvise
-441	n32	epoll_pwait2			compat_sys_epoll_pwait2
-442	n32	mount_setattr			sys_mount_setattr
-443	n32	quotactl_fd			sys_quotactl_fd
-444	n32	landlock_create_ruleset		sys_landlock_create_ruleset
-445	n32	landlock_add_rule		sys_landlock_add_rule
-446	n32	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	n32	process_mrelease		sys_process_mrelease
-449	n32	futex_waitv			sys_futex_waitv
-450	n32	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	n32	cachestat			sys_cachestat
-452	n32	fchmodat2			sys_fchmodat2
-453	n32	map_shadow_stack		sys_map_shadow_stack
-454	n32	futex_wake			sys_futex_wake
-455	n32	futex_wait			sys_futex_wait
-456	n32	futex_requeue			sys_futex_requeue
-457	n32	statmount			sys_statmount
-458	n32	listmount			sys_listmount
-459	n32	lsm_get_self_attr		sys_lsm_get_self_attr
-460	n32	lsm_set_self_attr		sys_lsm_set_self_attr
-461	n32	lsm_list_modules		sys_lsm_list_modules
-462	n32	mseal				sys_mseal
-463	n32	setxattrat			sys_setxattrat
-464	n32	getxattrat			sys_getxattrat
-465	n32	listxattrat			sys_listxattrat
-466	n32	removexattrat			sys_removexattrat
-467	n32	open_tree_attr			sys_open_tree_attr
-468	n32	file_getattr			sys_file_getattr
-469	n32	file_setattr			sys_file_setattr
-470	n32	listns				sys_listns
-471	n32	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 630aab9e5425..36c537c0d9f3 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -338,51 +338,3 @@
 327	n64	rseq				sys_rseq
 328	n64	io_pgetevents			sys_io_pgetevents
 # 329 through 423 are reserved to sync up with other architectures
-424	n64	pidfd_send_signal		sys_pidfd_send_signal
-425	n64	io_uring_setup			sys_io_uring_setup
-426	n64	io_uring_enter			sys_io_uring_enter
-427	n64	io_uring_register		sys_io_uring_register
-428	n64	open_tree			sys_open_tree
-429	n64	move_mount			sys_move_mount
-430	n64	fsopen				sys_fsopen
-431	n64	fsconfig			sys_fsconfig
-432	n64	fsmount				sys_fsmount
-433	n64	fspick				sys_fspick
-434	n64	pidfd_open			sys_pidfd_open
-435	n64	clone3				__sys_clone3
-436	n64	close_range			sys_close_range
-437	n64	openat2				sys_openat2
-438	n64	pidfd_getfd			sys_pidfd_getfd
-439	n64	faccessat2			sys_faccessat2
-440	n64	process_madvise			sys_process_madvise
-441	n64	epoll_pwait2			sys_epoll_pwait2
-442	n64	mount_setattr			sys_mount_setattr
-443	n64	quotactl_fd			sys_quotactl_fd
-444	n64	landlock_create_ruleset		sys_landlock_create_ruleset
-445	n64	landlock_add_rule		sys_landlock_add_rule
-446	n64	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	n64	process_mrelease		sys_process_mrelease
-449	n64	futex_waitv			sys_futex_waitv
-450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	n64	cachestat			sys_cachestat
-452	n64	fchmodat2			sys_fchmodat2
-453	n64	map_shadow_stack		sys_map_shadow_stack
-454	n64	futex_wake			sys_futex_wake
-455	n64	futex_wait			sys_futex_wait
-456	n64	futex_requeue			sys_futex_requeue
-457	n64	statmount			sys_statmount
-458	n64	listmount			sys_listmount
-459	n64	lsm_get_self_attr		sys_lsm_get_self_attr
-460	n64	lsm_set_self_attr		sys_lsm_set_self_attr
-461	n64	lsm_list_modules		sys_lsm_list_modules
-462	n64	mseal				sys_mseal
-463	n64	setxattrat			sys_setxattrat
-464	n64	getxattrat			sys_getxattrat
-465	n64	listxattrat			sys_listxattrat
-466	n64	removexattrat			sys_removexattrat
-467	n64	open_tree_attr			sys_open_tree_attr
-468	n64	file_getattr			sys_file_getattr
-469	n64	file_setattr			sys_file_setattr
-470	n64	listns				sys_listns
-471	n64	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 128653112284..070d7f7dd1aa 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -391,71 +391,3 @@
 400	o32	msgsnd				sys_msgsnd			compat_sys_msgsnd
 401	o32	msgrcv				sys_msgrcv			compat_sys_msgrcv
 402	o32	msgctl				sys_msgctl			compat_sys_msgctl
-403	o32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
-404	o32	clock_settime64			sys_clock_settime		sys_clock_settime
-405	o32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
-406	o32	clock_getres_time64		sys_clock_getres		sys_clock_getres
-407	o32	clock_nanosleep_time64		sys_clock_nanosleep		sys_clock_nanosleep
-408	o32	timer_gettime64			sys_timer_gettime		sys_timer_gettime
-409	o32	timer_settime64			sys_timer_settime		sys_timer_settime
-410	o32	timerfd_gettime64		sys_timerfd_gettime		sys_timerfd_gettime
-411	o32	timerfd_settime64		sys_timerfd_settime		sys_timerfd_settime
-412	o32	utimensat_time64		sys_utimensat			sys_utimensat
-413	o32	pselect6_time64			sys_pselect6			compat_sys_pselect6_time64
-414	o32	ppoll_time64			sys_ppoll			compat_sys_ppoll_time64
-416	o32	io_pgetevents_time64		sys_io_pgetevents		compat_sys_io_pgetevents_time64
-417	o32	recvmmsg_time64			sys_recvmmsg			compat_sys_recvmmsg_time64
-418	o32	mq_timedsend_time64		sys_mq_timedsend		sys_mq_timedsend
-419	o32	mq_timedreceive_time64		sys_mq_timedreceive		sys_mq_timedreceive
-420	o32	semtimedop_time64		sys_semtimedop			sys_semtimedop
-421	o32	rt_sigtimedwait_time64		sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait_time64
-422	o32	futex_time64			sys_futex			sys_futex
-423	o32	sched_rr_get_interval_time64	sys_sched_rr_get_interval	sys_sched_rr_get_interval
-424	o32	pidfd_send_signal		sys_pidfd_send_signal
-425	o32	io_uring_setup			sys_io_uring_setup
-426	o32	io_uring_enter			sys_io_uring_enter
-427	o32	io_uring_register		sys_io_uring_register
-428	o32	open_tree			sys_open_tree
-429	o32	move_mount			sys_move_mount
-430	o32	fsopen				sys_fsopen
-431	o32	fsconfig			sys_fsconfig
-432	o32	fsmount				sys_fsmount
-433	o32	fspick				sys_fspick
-434	o32	pidfd_open			sys_pidfd_open
-435	o32	clone3				__sys_clone3
-436	o32	close_range			sys_close_range
-437	o32	openat2				sys_openat2
-438	o32	pidfd_getfd			sys_pidfd_getfd
-439	o32	faccessat2			sys_faccessat2
-440	o32	process_madvise			sys_process_madvise
-441	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
-442	o32	mount_setattr			sys_mount_setattr
-443	o32	quotactl_fd			sys_quotactl_fd
-444	o32	landlock_create_ruleset		sys_landlock_create_ruleset
-445	o32	landlock_add_rule		sys_landlock_add_rule
-446	o32	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	o32	process_mrelease		sys_process_mrelease
-449	o32	futex_waitv			sys_futex_waitv
-450	o32	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	o32	cachestat			sys_cachestat
-452	o32	fchmodat2			sys_fchmodat2
-453	o32	map_shadow_stack		sys_map_shadow_stack
-454	o32	futex_wake			sys_futex_wake
-455	o32	futex_wait			sys_futex_wait
-456	o32	futex_requeue			sys_futex_requeue
-457	o32	statmount			sys_statmount
-458	o32	listmount			sys_listmount
-459	o32	lsm_get_self_attr		sys_lsm_get_self_attr
-460	o32	lsm_set_self_attr		sys_lsm_set_self_attr
-461	o32	lsm_list_modules		sys_lsm_list_modules
-462	o32	mseal				sys_mseal
-463	o32	setxattrat			sys_setxattrat
-464	o32	getxattrat			sys_getxattrat
-465	o32	listxattrat			sys_listxattrat
-466	o32	removexattrat			sys_removexattrat
-467	o32	open_tree_attr			sys_open_tree_attr
-468	o32	file_getattr			sys_file_getattr
-469	o32	file_setattr			sys_file_setattr
-470	o32	listns				sys_listns
-471	o32	rseq_slice_yield		sys_rseq_slice_yield

-- 
2.55.0

