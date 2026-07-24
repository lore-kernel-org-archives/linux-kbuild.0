Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EB31F984;
	Fri, 24 Jul 2026 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923238; cv=none; b=gdPD+D+oxiAGEnOiFrmNrWsPYZ7mZVdR6dBH0XjVtrrp8Kk5lkJKqYoBxtQhOm3xuOBrb7wuEnBbx/GhBpg+XRgnH0cD2Cy6necg8faALrUrC/52n3fOS9tP8LdRWhS/O5vk9ZlIR9EWEK1aQsxFcOSCV9/j/EH4Ay1HAwbhasY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923238; c=relaxed/simple;
	bh=UoSI0cUAFDrYJsX/UX1/4P+IHmy9LVK8fVUXyiiV7+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1iZxxXfnANxERD2YLb8asu2qgBB83ohLc5FGlU6IC6NgZZhIfYcLUrxAbi5B/NdABZwBjmRd+sC+i4NhDVRiPvTgRBCNMcIc7ttJmOH6HCpawP4E9Jxwz3yITkJ5s3SWCRSR+iuzGV7Dsv4EUAKCK2s7IB6aBXMPU5+t3lV0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QIc7Idz3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QIc7Idz3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=eCUa0hxhoHPCcwDa7WiYpKDpbFwSed5gK1xKTJ30cYA=; b=QIc7Idz3TjxzEeHYaMaMmWtjsH
	0JD1BYhuahVtM0v/07mCbxsRgnQPi0/FXNO6ipXZu3TLxSdIGcKVj68Eo4F295e3B4uHybwU4ToSu
	bR5vP3N4AgPOpryGbl8e6mirJp4a9eoDoFC+J0HnLhE0BzhVuSENT+iyNtUONgZnafRuuTBRn/B/Y
	sHiAMvPtL9ifGQClYoKU94q1P9Tru8ccxzIQ0oR+7vZ9vv/IEa+gzmva9ze12n+nbMUGiy1yv+5vU
	zeBp6EIWdfXIho09T0r3L2DO9fUAwtMP6UEp8y+euuip7jZn4fnSmF4V7Mv0+WEIjEckpc4ewItKW
	UQRknjUw==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wnM4N-0057cp-QU; Fri, 24 Jul 2026 22:00:32 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 24 Jul 2026 17:00:13 -0300
Subject: [PATCH RFC 3/4] x86: Use common syscall table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-tonyk-syscall_table-v1-3-9c53188423da@igalia.com>
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

Use common syscall table and drop the shared numbers from the x86 tables.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/x86/entry/syscalls/Makefile       | 15 ++++++++-------
 arch/x86/entry/syscalls/syscall_32.tbl | 30 ------------------------------
 arch/x86/entry/syscalls/syscall_64.tbl | 30 ------------------------------
 3 files changed, 8 insertions(+), 67 deletions(-)

diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index eca5d6eff132..f4bdad7fea13 100644
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
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis) --common-tbl $< $@
 
 quiet_cmd_hypercalls = HYPERCALLS $@
       cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<, $(real-prereqs))
 
-$(uapi)/unistd_32.h: abis := i386
+$(uapi)/unistd_32.h: abis := common,i386,memfd_secret
 $(uapi)/unistd_32.h: $(syscall32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(out)/unistd_32_ia32.h: abis := i386
+$(out)/unistd_32_ia32.h: abis := common,i386,memfd_secret
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
 
@@ -47,10 +48,10 @@ $(out)/unistd_64_x32.h: prefix := x32_
 $(out)/unistd_64_x32.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(out)/syscalls_32.h: abis := i386
+$(out)/syscalls_32.h: abis := common,i386,memfd_secret
 $(out)/syscalls_32.h: $(syscall32) $(systbl) FORCE
 	$(call if_changed,systbl)
-$(out)/syscalls_64.h: abis := common,64
+$(out)/syscalls_64.h: abis := common,64,memfd_secret
 $(out)/syscalls_64.h: $(syscall64) $(systbl) FORCE
 	$(call if_changed,systbl)
 $(out)/syscalls_x32.h: abis := common,x32
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index f832ebd2d79b..77678941163d 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -447,33 +447,3 @@
 439	i386	faccessat2		sys_faccessat2
 440	i386	process_madvise		sys_process_madvise
 441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
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
index 524155d655da..915aa5a78132 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -366,36 +366,6 @@
 439	common	faccessat2		sys_faccessat2
 440	common	process_madvise		sys_process_madvise
 441	common	epoll_pwait2		sys_epoll_pwait2
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

