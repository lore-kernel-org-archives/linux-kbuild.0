Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6A2F1FC7;
	Tue, 28 Jul 2026 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206850; cv=none; b=cyij1ERA+YB3tg83YAq1FaovB4j/ZoSysz3p00U/ZrmOodj55rh7Fx7pONOi3KUqOb+2Yq4D4U9H6MGKxlAycibbzTDOg2WDMb4chjYq0mxdS/McURskyzwO9LjTBIU6p3e4jvj5p9viXvuZnhJy+62oa9EJ91Qb9AYQrhQbQJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206850; c=relaxed/simple;
	bh=2085KEGP8U4DRppgUktmElmRXRa+UOzBEvh7tTGIGeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaJyS8ZKrF7ubvYldZWd09IG/FsT7f8DSURGAywK/ndkRI0s8VdPXd9QtC1qazQ0zaHfD48A6Ei5L67EDFfyyb1nvoNjADm2iNhOhqySPdhFxkaF2yKWZWCjeJReQ9GXGlTSKFraPQStCUKiaZhqx+m0WIsXxQYxgmH1hRs6ncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=F5HBFYO8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="F5HBFYO8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=GNdCQ1wrmSJ2F4UfR+ERflxNdGguXzAWi3qYJCb0WFw=; b=F5HBFYO8ACqOMuMIzxdVrmHP0j
	8HTcMK+1KjHkDiV3Ix/aT59xaba7mZr71gAt1gssgyUHSttbZVBCYlrLFXhAQ4ZGvfcPHkZB29nFX
	Ka6JrbRzXDz2h7PSMQmm4xGJbPxprkIY4IAehqmTyM5Vuw+7xq2cEjDPq1t+atn8ia/5tNSNuomkt
	FkMLnpV2wwoEfqQmR/1VEcTk7XQJk94uW/bZQztQsfGxw6ZWsLmHPuhsRbaW19E7PnVeUvm/mchsF
	SGMt3MmiB9C0PfKOTNyMrBsKJ2edOWxMldcMyadY4ySQtu8h4i4gryD/JD/NrWTHsFsd/nfAG8rPT
	Rre7UI1g==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1woXqk-006nKh-4U; Tue, 28 Jul 2026 04:47:22 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Mon, 27 Jul 2026 23:47:04 -0300
Subject: [PATCH RFC v2 3/4] x86: Use common syscall table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-tonyk-syscall_table-v2-3-95d4f1ee471f@igalia.com>
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

Use common syscall table and drop the shared numbers from the x86 tables.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/x86/entry/syscalls/Makefile       | 16 ++++----
 arch/x86/entry/syscalls/syscall_32.tbl | 68 ----------------------------------
 arch/x86/entry/syscalls/syscall_64.tbl | 48 ------------------------
 3 files changed, 9 insertions(+), 123 deletions(-)

diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index eca5d6eff132..8dbf625c8e5f 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -15,30 +15,31 @@ prefix :=
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --abis $(abis) --emit-nr \
+      		--common-tbl \
 		$(if $(offset),--offset $(offset)) \
 		$(if $(prefix),--prefix $(prefix)) \
 		$< $@
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis) $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis) --common-tbl $(no-compat) $< $@
 
 quiet_cmd_hypercalls = HYPERCALLS $@
       cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<, $(real-prereqs))
 
-$(uapi)/unistd_32.h: abis := i386
+$(uapi)/unistd_32.h: abis := common,i386,memfd_secret,32
 $(uapi)/unistd_32.h: $(syscall32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(out)/unistd_32_ia32.h: abis := i386
+$(out)/unistd_32_ia32.h: abis := common,i386,memfd_secret,32
 $(out)/unistd_32_ia32.h: prefix := ia32_
 $(out)/unistd_32_ia32.h: $(syscall32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(uapi)/unistd_x32.h: abis := common,x32
+$(uapi)/unistd_x32.h: abis := common,x32,memfd_secret
 $(uapi)/unistd_x32.h: offset := __X32_SYSCALL_BIT
 $(uapi)/unistd_x32.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(uapi)/unistd_64.h: abis := common,64
+$(uapi)/unistd_64.h: abis := common,64,memfd_secret
 $(uapi)/unistd_64.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
@@ -47,10 +48,11 @@ $(out)/unistd_64_x32.h: prefix := x32_
 $(out)/unistd_64_x32.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(out)/syscalls_32.h: abis := i386
+$(out)/syscalls_32.h: abis := common,i386,memfd_secret,32
 $(out)/syscalls_32.h: $(syscall32) $(systbl) FORCE
 	$(call if_changed,systbl)
-$(out)/syscalls_64.h: abis := common,64
+$(out)/syscalls_64.h: abis := common,64,memfd_secret
+$(out)/syscalls_64.h: no-compat:= --no-compat
 $(out)/syscalls_64.h: $(syscall64) $(systbl) FORCE
 	$(call if_changed,systbl)
 $(out)/syscalls_x32.h: abis := common,x32
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index f832ebd2d79b..dfb1c75d72d6 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -409,71 +409,3 @@
 400	i386	msgsnd			sys_msgsnd    			compat_sys_msgsnd
 401	i386	msgrcv			sys_msgrcv    			compat_sys_msgrcv
 402	i386	msgctl			sys_msgctl    			compat_sys_msgctl
-403	i386	clock_gettime64		sys_clock_gettime
-404	i386	clock_settime64		sys_clock_settime
-405	i386	clock_adjtime64		sys_clock_adjtime
-406	i386	clock_getres_time64	sys_clock_getres
-407	i386	clock_nanosleep_time64	sys_clock_nanosleep
-408	i386	timer_gettime64		sys_timer_gettime
-409	i386	timer_settime64		sys_timer_settime
-410	i386	timerfd_gettime64	sys_timerfd_gettime
-411	i386	timerfd_settime64	sys_timerfd_settime
-412	i386	utimensat_time64	sys_utimensat
-413	i386	pselect6_time64		sys_pselect6			compat_sys_pselect6_time64
-414	i386	ppoll_time64		sys_ppoll			compat_sys_ppoll_time64
-416	i386	io_pgetevents_time64	sys_io_pgetevents		compat_sys_io_pgetevents_time64
-417	i386	recvmmsg_time64		sys_recvmmsg			compat_sys_recvmmsg_time64
-418	i386	mq_timedsend_time64	sys_mq_timedsend
-419	i386	mq_timedreceive_time64	sys_mq_timedreceive
-420	i386	semtimedop_time64	sys_semtimedop
-421	i386	rt_sigtimedwait_time64	sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait_time64
-422	i386	futex_time64		sys_futex
-423	i386	sched_rr_get_interval_time64	sys_sched_rr_get_interval
-424	i386	pidfd_send_signal	sys_pidfd_send_signal
-425	i386	io_uring_setup		sys_io_uring_setup
-426	i386	io_uring_enter		sys_io_uring_enter
-427	i386	io_uring_register	sys_io_uring_register
-428	i386	open_tree		sys_open_tree
-429	i386	move_mount		sys_move_mount
-430	i386	fsopen			sys_fsopen
-431	i386	fsconfig		sys_fsconfig
-432	i386	fsmount			sys_fsmount
-433	i386	fspick			sys_fspick
-434	i386	pidfd_open		sys_pidfd_open
-435	i386	clone3			sys_clone3
-436	i386	close_range		sys_close_range
-437	i386	openat2			sys_openat2
-438	i386	pidfd_getfd		sys_pidfd_getfd
-439	i386	faccessat2		sys_faccessat2
-440	i386	process_madvise		sys_process_madvise
-441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
-442	i386	mount_setattr		sys_mount_setattr
-443	i386	quotactl_fd		sys_quotactl_fd
-444	i386	landlock_create_ruleset	sys_landlock_create_ruleset
-445	i386	landlock_add_rule	sys_landlock_add_rule
-446	i386	landlock_restrict_self	sys_landlock_restrict_self
-447	i386	memfd_secret		sys_memfd_secret
-448	i386	process_mrelease	sys_process_mrelease
-449	i386	futex_waitv		sys_futex_waitv
-450	i386	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	i386	cachestat		sys_cachestat
-452	i386	fchmodat2		sys_fchmodat2
-453	i386	map_shadow_stack	sys_map_shadow_stack
-454	i386	futex_wake		sys_futex_wake
-455	i386	futex_wait		sys_futex_wait
-456	i386	futex_requeue		sys_futex_requeue
-457	i386	statmount		sys_statmount
-458	i386	listmount		sys_listmount
-459	i386	lsm_get_self_attr	sys_lsm_get_self_attr
-460	i386	lsm_set_self_attr	sys_lsm_set_self_attr
-461	i386	lsm_list_modules	sys_lsm_list_modules
-462	i386	mseal 			sys_mseal
-463	i386	setxattrat		sys_setxattrat
-464	i386	getxattrat		sys_getxattrat
-465	i386	listxattrat		sys_listxattrat
-466	i386	removexattrat		sys_removexattrat
-467	i386	open_tree_attr		sys_open_tree_attr
-468	i386	file_getattr		sys_file_getattr
-469	i386	file_setattr		sys_file_setattr
-470	i386	listns			sys_listns
-471	i386	rseq_slice_yield	sys_rseq_slice_yield
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index 524155d655da..cd94c00c2cc5 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -348,54 +348,6 @@
 336	common	uprobe			sys_uprobe
 # don't use numbers 387 through 423, add new calls after the last
 # 'common' entry
-424	common	pidfd_send_signal	sys_pidfd_send_signal
-425	common	io_uring_setup		sys_io_uring_setup
-426	common	io_uring_enter		sys_io_uring_enter
-427	common	io_uring_register	sys_io_uring_register
-428	common	open_tree		sys_open_tree
-429	common	move_mount		sys_move_mount
-430	common	fsopen			sys_fsopen
-431	common	fsconfig		sys_fsconfig
-432	common	fsmount			sys_fsmount
-433	common	fspick			sys_fspick
-434	common	pidfd_open		sys_pidfd_open
-435	common	clone3			sys_clone3
-436	common	close_range		sys_close_range
-437	common	openat2			sys_openat2
-438	common	pidfd_getfd		sys_pidfd_getfd
-439	common	faccessat2		sys_faccessat2
-440	common	process_madvise		sys_process_madvise
-441	common	epoll_pwait2		sys_epoll_pwait2
-442	common	mount_setattr		sys_mount_setattr
-443	common	quotactl_fd		sys_quotactl_fd
-444	common	landlock_create_ruleset	sys_landlock_create_ruleset
-445	common	landlock_add_rule	sys_landlock_add_rule
-446	common	landlock_restrict_self	sys_landlock_restrict_self
-447	common	memfd_secret		sys_memfd_secret
-448	common	process_mrelease	sys_process_mrelease
-449	common	futex_waitv		sys_futex_waitv
-450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
-451	common	cachestat		sys_cachestat
-452	common	fchmodat2		sys_fchmodat2
-453	common	map_shadow_stack	sys_map_shadow_stack
-454	common	futex_wake		sys_futex_wake
-455	common	futex_wait		sys_futex_wait
-456	common	futex_requeue		sys_futex_requeue
-457	common	statmount		sys_statmount
-458	common	listmount		sys_listmount
-459	common	lsm_get_self_attr	sys_lsm_get_self_attr
-460	common	lsm_set_self_attr	sys_lsm_set_self_attr
-461	common	lsm_list_modules	sys_lsm_list_modules
-462 	common  mseal			sys_mseal
-463	common	setxattrat		sys_setxattrat
-464	common	getxattrat		sys_getxattrat
-465	common	listxattrat		sys_listxattrat
-466	common	removexattrat		sys_removexattrat
-467	common	open_tree_attr		sys_open_tree_attr
-468	common	file_getattr		sys_file_getattr
-469	common	file_setattr		sys_file_setattr
-470	common	listns			sys_listns
-471	common	rseq_slice_yield	sys_rseq_slice_yield
 
 #
 # Due to a historical design error, certain syscalls are numbered differently

-- 
2.55.0

