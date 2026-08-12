Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC32F6931;
	Wed, 12 Aug 2026 03:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505620; cv=none; b=N5g0Ix86NwkhRps3UOa1h9LVlg+8Zi0dFBAyKegtP5Xk1+CWzpK9S/m5/VUv5GvPle/cc4ULdNAmeTr70VbZgG5GGlgZlm67GOU/aKbQXYRCzP9ez1crFmMc6vy/WazK2fqS6NTV12QeHs0o7pY3Vo+y3EeaYu1mUYnBk0W2DaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505620; c=relaxed/simple;
	bh=m58BadBz9O2Nf+HBNqAaL6E6vbn5WP/8CuMeDCdHCNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8MsYqsARcOjF02WRiyzq9pzHBOrVwsDvRPqi/K/zMKL+0gDFv691tYVzjb3mOoX4t6Yi6GKuF9539nb8uy66d0K0orD8QI8gEhnMMpNZ/VLXH9Gb7HFEwQftOBlPZKPhbyrbayKh67k2PPS8pOhFMNgdmm1L6dAoquOX9Pj9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=iqWbeWp/; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="iqWbeWp/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=G0bZP3zl9N3irQQMQpNGB7+eMYExz5g6W3Q7yNpAUbQ=; b=iqWbeWp/r1aT2I1sP0i6MwbVZ5
	dQ8rbLQTR6ictjzBjrM2AarehmAPNF7Y1urb3uFJmNocXZAQBtBVty5ZfIx2GJvQPyMjVWrjw3arP
	0yvoxE/kmwhsiyYNWWT8KqWdg86nKgVTEpJ51mEfoBnkzHhS7RDLBOruJHqZ2BcbezOyRxMslst5P
	jrCoTK+T5fhU+PH5+kBudQoLt5fkPZ6kII/vDa98Kz4bd0uIME6iiyGUjkleP4+f/NOw1SJ5kS9qT
	ObARlOX29fXLLYjtJXgusb0HeNAv03J55vb62G7Dk/LP/04OclogZlX3yNlFnpIJxf0vGFR/wdOI+
	Dy176GJw==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtziW-00HTm1-Ed; Wed, 12 Aug 2026 05:33:24 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 00:33:05 -0300
Subject: [PATCH v4 09/12] mips: Use the common syscall table
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v4-9-748d0229ad40@igalia.com>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

Syscall numbers from 403 are shared with all architectures, so move the
toolchain to use the common syscall table and remove duplicated code.

To help with that, merge n32 and n64 syscall tables in a single one, taking
advantage of the shared numbers.

The generated files are not exactly the same as before, but they have no
functional changes:

 - For O32 ABI, the syscall table would have entries like
 __SYSCALL_WITH_COMPAT(403, sys_clock_gettime, sys_clock_gettime)
 which is equivalent to the new entry __SYSCALL(403, sys_clock_gettime)

 - For N32 ABI, the syscall table would have entries like
 __SYSCALL(413, compat_sys_pselect6_time64), which is equivalent to
 __SYSCALL_WITH_COMPAT(413, sys_pselect6, compat_sys_pselect6_time64)
 given the new __SYSCALL_WITH_COMPAT() definition for N32.

 - The above applies for N64 ABI as well.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/mips/kernel/scall64-n32.S            |   1 +
 arch/mips/kernel/scall64-n64.S            |   2 +
 arch/mips/kernel/syscalls/Makefile        |  19 +-
 arch/mips/kernel/syscalls/syscall_n.tbl   | 464 ++++++++++++++++++++++++++++++
 arch/mips/kernel/syscalls/syscall_n32.tbl | 412 --------------------------
 arch/mips/kernel/syscalls/syscall_n64.tbl | 388 -------------------------
 arch/mips/kernel/syscalls/syscall_o32.tbl |  68 -----
 7 files changed, 481 insertions(+), 873 deletions(-)

diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
index 97788859238c..b35541f0cff9 100644
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@ -102,6 +102,7 @@ not_n32_scall:
 
 	END(handle_sysn32)
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
 #define __SYSCALL(nr, entry)	PTR_WD entry
 	.type	sysn32_call_table, @object
 EXPORT(sysn32_call_table)
diff --git a/arch/mips/kernel/scall64-n64.S b/arch/mips/kernel/scall64-n64.S
index be11ea5cc67e..2d5fca6085ff 100644
--- a/arch/mips/kernel/scall64-n64.S
+++ b/arch/mips/kernel/scall64-n64.S
@@ -109,6 +109,8 @@ illegal_syscall:
 	j	n64_syscall_exit
 	END(handle_sys64)
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
+
 #define __SYSCALL(nr, entry)	PTR_WD entry
 	.align	3
 	.type	sys_call_table, @object
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 96f6eab29dd4..b76fb814e75e 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -7,9 +7,12 @@ $(shell mkdir -p $(uapi) $(kapi))
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
@@ -17,7 +20,9 @@ quiet_cmd_sysnr = SYSNR   $@
 		  --abis $(abis_$*) $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
+		   --common-tbl $(systbl_common) \
+		   --abis $(abis_$*) $(src_$*) $@
 
 $(uapi)/unistd_%.h: $(src)/syscall_%.tbl $(syshdr) FORCE
 	$(call if_changed,syshdr)
@@ -26,16 +31,20 @@ sysnr_pfx_unistd_nr_n32 := N32
 sysnr_pfx_unistd_nr_n64 := 64
 sysnr_pfx_unistd_nr_o32 := O32
 
-abis := common
+abis := common,__clone3
 
 abis_n32 := $(abis),32
 abis_o32 := $(abis),32
 abis_n64 := $(abis),64
 
-$(kapi)/unistd_nr_%.h: $(src)/syscall_%.tbl $(sysnr) FORCE
+src_n32 := $(src)/syscall_n.tbl
+src_n64 := $(src)/syscall_n.tbl
+src_o32 := $(src)/syscall_o32.tbl
+
+$(kapi)/unistd_nr_%.h: $(systbl_common) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
-$(kapi)/syscall_table_%.h: $(src)/syscall_%.tbl $(systbl) FORCE
+$(kapi)/syscall_table_%.h: $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_n32.h			\
diff --git a/arch/mips/kernel/syscalls/syscall_n.tbl b/arch/mips/kernel/syscalls/syscall_n.tbl
new file mode 100644
index 000000000000..e3d278f715b7
--- /dev/null
+++ b/arch/mips/kernel/syscalls/syscall_n.tbl
@@ -0,0 +1,464 @@
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#
+# system call numbers and entry vectors for mips for common and n64.
+#
+# The format is:
+# <number> <abi> <name> <entry point> <compat entry point>
+#
+# The <abi> is "32", "64" or "common" for this file.
+#
+0	common 	read				sys_read
+1	common 	write				sys_write
+2	common 	open				sys_open
+3	common 	close				sys_close
+4	common 	stat				sys_newstat
+5	common 	fstat				sys_newfstat
+6	common 	lstat				sys_newlstat
+7	common 	poll				sys_poll
+8	common 	lseek				sys_lseek
+9	common 	mmap				sys_mips_mmap
+10	common 	mprotect			sys_mprotect
+11	common 	munmap				sys_munmap
+12	common 	brk				sys_brk
+13	common	rt_sigaction			sys_rt_sigaction	compat_sys_rt_sigaction
+14	common	rt_sigprocmask			sys_rt_sigprocmask	compat_sys_rt_sigprocmask
+15	common	ioctl				sys_ioctl		compat_sys_ioctl
+16	common	pread64				sys_pread64
+17	common	pwrite64			sys_pwrite64
+18	common	readv				sys_readv
+19	common	writev				sys_writev
+20	common	access				sys_access
+21	common	pipe				sysm_pipe
+22	common	_newselect			sys_select		compat_sys_select
+23	common	sched_yield			sys_sched_yield
+24	common	mremap				sys_mremap
+25	common	msync				sys_msync
+26	common	mincore				sys_mincore
+27	common	madvise				sys_madvise
+28	common	shmget				sys_shmget
+29	common	shmat				sys_shmat
+30	common	shmctl				sys_old_shmctl		compat_sys_old_shmctl
+31	common	dup				sys_dup
+32	common	dup2				sys_dup2
+33	common	pause				sys_pause
+34	common	nanosleep			sys_nanosleep		sys_nanosleep_time32
+35	common	getitimer			sys_getitimer		compat_sys_getitimer
+36	common	setitimer			sys_setitimer		compat_setitimer
+37	common	alarm				sys_alarm
+38	common	getpid				sys_getpid
+39	common	sendfile			sys_sendfile64		compat_sys_sendfile
+40	common	socket				sys_socket
+41	common	connect				sys_connect
+42	common	accept				sys_accept
+43	common	sendto				sys_sendto
+44	common	recvfrom			sys_recvfrom		compat_sys_recvfrom
+45	common	sendmsg				sys_sendmsg		compat_sys_sendmsg
+46	common	recvmsg				sys_recvmsg		compat_sys_recvmsg
+47	common	shutdown			sys_shutdown
+48	common	bind				sys_bind
+49	common	listen				sys_listen
+50	common	getsockname			sys_getsockname
+51	common	getpeername			sys_getpeername
+52	common	socketpair			sys_socketpair
+53	common	setsockopt			sys_setsockopt
+54	common	getsockopt			sys_getsockopt
+55	common	clone				__sys_clone
+56	common	fork				__sys_fork
+57	common	execve				sys_execve		compat_sys_execve
+58	common	exit				sys_exit
+59	common	wait4				sys_wait4		compat_sys_wait4
+60	common	kill				sys_kill
+61	common	uname				sys_newuname
+62	common	semget				sys_semget
+63	common	semop				sys_semop
+64	common	semctl				sys_old_semctl		compat_sys_old_semctl
+65	common	shmdt				sys_shmdt
+66	common	msgget				sys_msgget
+67	common	msgsnd				sys_msgsnd		compat_sys_msgsnd
+68	common	msgrcv				sys_msgrcv		compat_sys_msgrcv
+69	common	msgctl				sys_old_msgctl		compat_sys_old_msgctl
+70	common	fcntl				sys_fcntl		compat_sys_fcntl
+71	common	flock				sys_flock
+72	common	fsync				sys_fsync
+73	common	fdatasync			sys_fdatasync
+74	common	truncate			sys_truncate
+75	common	ftruncate			sys_ftruncate
+76	common	getdents			sys_getdents		compat_sys_getdents
+77	common	getcwd				sys_getcwd
+78	common	chdir				sys_chdir
+79	common	fchdir				sys_fchdir
+80	common	rename				sys_rename
+81	common	mkdir				sys_mkdir
+82	common	rmdir				sys_rmdir
+83	common	creat				sys_creat
+84	common	link				sys_link
+85	common	unlink				sys_unlink
+86	common	symlink				sys_symlink
+87	common	readlink			sys_readlink
+88	common	chmod				sys_chmod
+89	common	fchmod				sys_fchmod
+90	common	chown				sys_chown
+91	common	fchown				sys_fchown
+92	common	lchown				sys_lchown
+93	common	umask				sys_umask
+94	common	gettimeofday			sys_gettimeofday	compat_sys_gettimeofday
+95	common	getrlimit			sys_getrlimit		compat_sys_getrlimit
+96	common	getrusage			sys_getrusage		compat_sys_getrusage
+97	common	sysinfo				sys_sysinfo		compat_sys_sysinfo
+98	common	times				sys_times		compat_sys_times
+99	common	ptrace				sys_ptrace		compat_sys_ptrace
+100	common	getuid				sys_getuid
+101	common	syslog				sys_syslog
+102	common	getgid				sys_getgid
+103	common	setuid				sys_setuid
+104	common	setgid				sys_setgid
+105	common	geteuid				sys_geteuid
+106	common	getegid				sys_getegid
+107	common	setpgid				sys_setpgid
+108	common	getppid				sys_getppid
+109	common	getpgrp				sys_getpgrp
+110	common	setsid				sys_setsid
+111	common	setreuid			sys_setreuid
+112	common	setregid			sys_setregid
+113	common	getgroups			sys_getgroups
+114	common	setgroups			sys_setgroups
+115	common	setresuid			sys_setresuid
+116	common	getresuid			sys_getresuid
+117	common	setresgid			sys_setresgid
+118	common	getresgid			sys_getresgid
+119	common	getpgid				sys_getpgid
+120	common	setfsuid			sys_setfsuid
+121	common	setfsgid			sys_setfsgid
+122	common	getsid				sys_getsid
+123	common	capget				sys_capget
+124	common	capset				sys_capset
+125	common	rt_sigpending			sys_rt_sigpending	compat_sys_rt_sigpending
+126	common	rt_sigtimedwait			sys_rt_sigtimedwait_time	compat_sys_rt_sigtimedwait_time32
+127	common	rt_sigqueueinfo			sys_rt_sigqueueinfo	compat_sys_rt_sigqueueinfo
+128	common	rt_sigsuspend			sys_rt_sigsuspend	compat_sys_rt_sigsuspend
+129	common	sigaltstack			sys_sigaltstack		compat_sys_sigaltstack
+130	common	utime				sys_utime		sys_utime32
+131	common	mknod				sys_mknod
+132	common	personality			sys_personality		sys_32_personality
+133	common	ustat				sys_usta		compat_sys_usta
+134	common	statfs				sys_statfs		compat_sys_statfs
+135	common	fstatfs				sys_fstatfs		compat_sys_fstatfs
+136	common	sysfs				sys_sysfs
+137	common	getpriority			sys_getpriority
+138	common	setpriority			sys_setpriority
+139	common	sched_setparam			sys_sched_setparam
+140	common	sched_getparam			sys_sched_getparam
+141	common	sched_setscheduler		sys_sched_setscheduler
+142	common	sched_getscheduler		sys_sched_getscheduler
+143	common	sched_get_priority_max		sys_sched_get_priority_max
+144	common	sched_get_priority_min		sys_sched_get_priority_min
+145	common	sched_rr_get_interval		sys_sched_rr_get_interval	sys_sched_rr_get_interval_time32
+146	common	mlock				sys_mlock
+147	common	munlock				sys_munlock
+148	common	mlockall			sys_mlockall
+149	common	munlockall			sys_munlockall
+150	common	vhangup				sys_vhangup
+151	common	pivot_root			sys_pivot_root
+152	common	_sysctl				sys_ni_syscall
+153	common	prctl				sys_prctl
+154	common	adjtimex			sys_adjtimex		sys_adjtimex_time32
+155	common	setrlimit			sys_setrlimit		compat_sys_setrlimit
+156	common	chroot				sys_chroot
+157	common	sync				sys_sync
+158	common	acct				sys_acct
+159	common	settimeofday			sys_settimeofday	compat_sys_settimeofday
+160	common	mount				sys_mount
+161	common	umount2				sys_umount
+162	common	swapon				sys_swapon
+163	common	swapoff				sys_swapoff
+164	common	reboot				sys_reboot
+165	common	sethostname			sys_sethostname
+166	common	setdomainname			sys_setdomainname
+167	common	create_module			sys_ni_syscall
+168	common	init_module			sys_init_module
+169	common	delete_module			sys_delete_module
+170	common	get_kernel_syms			sys_ni_syscall
+171	common	query_module			sys_ni_syscall
+172	common	quotactl			sys_quotactl
+173	common	nfsservctl			sys_ni_syscall
+174	common	getpmsg				sys_ni_syscall
+175	common	putpmsg				sys_ni_syscall
+176	common	afs_syscall			sys_ni_syscall
+# 177 reserved for security
+177	common	reserved177			sys_ni_syscall
+178	common	gettid				sys_gettid
+179	common	readahead			sys_readahead
+180	common	setxattr			sys_setxattr
+181	common	lsetxattr			sys_lsetxattr
+182	common	fsetxattr			sys_fsetxattr
+183	common	getxattr			sys_getxattr
+184	common	lgetxattr			sys_lgetxattr
+185	common	fgetxattr			sys_fgetxattr
+186	common	listxattr			sys_listxattr
+187	common	llistxattr			sys_llistxattr
+188	common	flistxattr			sys_flistxattr
+189	common	removexattr			sys_removexattr
+190	common	lremovexattr			sys_lremovexattr
+191	common	fremovexattr			sys_fremovexattr
+192	common	tkill				sys_tkill
+193	common	reserved193			sys_ni_syscall
+194	common	futex				sys_futex		sys_futex_time32
+195	common	sched_setaffinity		sys_sched_setaffinity	compat_sys_sched_setaffinity
+196	common	sched_getaffinity		sys_sched_getaffinity	compat_sys_sched_getaffinity
+197	common	cacheflush			sys_cacheflush
+198	common	cachectl			sys_cachectl
+199	common	sysmips				__sys_sysmips
+200	common	io_setup			sys_io_setup		compat_sys_io_setup
+201	common	io_destroy			sys_io_destroy
+202	common	io_getevents			sys_io_getevents	sys_io_getevents_time32
+203	common	io_submit			sys_io_submit		compat_sys_io_submit
+204	common	io_cancel			sys_io_cancel
+205	common	exit_group			sys_exit_group
+206	common	lookup_dcookie			sys_ni_syscall
+207	common	epoll_create			sys_epoll_create
+208	common	epoll_ctl			sys_epoll_ctl
+209	common	epoll_wait			sys_epoll_wait
+210	common	remap_file_pages		sys_remap_file_pages
+211	common	rt_sigreturn			sys_rt_sigreturn	sysn32_rt_sigreturn
+
+# n32 specific syscalls
+212	32	fcntl64				compat_sys_fcntl64
+213	32	set_tid_address			sys_set_tid_address
+214	32	restart_syscall			sys_restart_syscall
+215	32	semtimedop			sys_semtimedop_time32
+216	32	fadvise64			sys_fadvise64_64
+217	32	statfs64			compat_sys_statfs64
+218	32	fstatfs64			compat_sys_fstatfs64
+219	32	sendfile64			sys_sendfile64
+220	32	timer_create			compat_sys_timer_create
+221	32	timer_settime			sys_timer_settime32
+222	32	timer_gettime			sys_timer_gettime32
+223	32	timer_getoverrun		sys_timer_getoverrun
+224	32	timer_delete			sys_timer_delete
+225	32	clock_settime			sys_clock_settime32
+226	32	clock_gettime			sys_clock_gettime32
+227	32	clock_getres			sys_clock_getres_time32
+228	32	clock_nanosleep			sys_clock_nanosleep_time32
+229	32	tgkill				sys_tgkill
+230	32	utimes				sys_utimes_time32
+231	32	mbind				sys_mbind
+232	32	get_mempolicy			sys_get_mempolicy
+233	32	set_mempolicy			sys_set_mempolicy
+234	32	mq_open				sys_mq_open	compat_sys_mq_open
+235	32	mq_unlink			sys_mq_unlink
+236	32	mq_timedsend			sys_mq_timedsend_time32
+237	32	mq_timedreceive			sys_mq_timedreceive_time32
+238	32	mq_notify			compat_sys_mq_notify
+239	32	mq_getsetattr			compat_sys_mq_getsetattr
+240	32	vserver				sys_ni_syscall
+241	32	waitid				compat_sys_waitid
+# 242 was sys_setaltroot
+243	32	add_key				sys_add_key
+244	32	request_key			sys_request_key
+245	32	keyctl				compat_sys_keyctl
+246	32	set_thread_area			sys_set_thread_area
+247	32	inotify_init			sys_inotify_init
+248	32	inotify_add_watch		sys_inotify_add_watch
+249	32	inotify_rm_watch		sys_inotify_rm_watch
+250	32	migrate_pages			sys_migrate_pages
+251	32	openat				sys_openat
+252	32	mkdirat				sys_mkdirat
+253	32	mknodat				sys_mknodat
+254	32	fchownat			sys_fchownat
+255	32	futimesat			sys_futimesat_time32
+256	32	newfstatat			sys_newfstatat
+257	32	unlinkat			sys_unlinkat
+258	32	renameat			sys_renameat
+259	32	linkat				sys_linkat
+260	32	symlinkat			sys_symlinkat
+261	32	readlinkat			sys_readlinkat
+262	32	fchmodat			sys_fchmodat
+263	32	faccessat			sys_faccessat
+264	32	pselect6			compat_sys_pselect6_time32
+265	32	ppoll				compat_sys_ppoll_time32
+266	32	unshare				sys_unshare
+267	32	splice				sys_splice
+268	32	sync_file_range			sys_sync_file_range
+269	32	tee				sys_tee
+270	32	vmsplice			sys_vmsplice
+271	32	move_pages			sys_move_pages
+272	32	set_robust_list			compat_sys_set_robust_list
+273	32	get_robust_list			compat_sys_get_robust_list
+274	32	kexec_load			compat_sys_kexec_load
+275	32	getcpu				sys_getcpu
+276	32	epoll_pwait			compat_sys_epoll_pwait
+277	32	ioprio_set			sys_ioprio_set
+278	32	ioprio_get			sys_ioprio_get
+279	32	utimensat			sys_utimensat_time32
+280	32	signalfd			compat_sys_signalfd
+281	32	timerfd				sys_ni_syscall
+282	32	eventfd				sys_eventfd
+283	32	fallocate			sys_fallocate
+284	32	timerfd_create			sys_timerfd_create
+285	32	timerfd_gettime			sys_timerfd_gettime32
+286	32	timerfd_settime			sys_timerfd_settime32
+287	32	signalfd4			compat_sys_signalfd4
+288	32	eventfd2			sys_eventfd2
+289	32	epoll_create1			sys_epoll_create1
+290	32	dup3				sys_dup3
+291	32	pipe2				sys_pipe2
+292	32	inotify_init1			sys_inotify_init1
+293	32	preadv				compat_sys_preadv
+294	32	pwritev				compat_sys_pwritev
+295	32	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo compat_sys_rt_tgsigqueueinfo
+296	32	perf_event_open			sys_perf_event_open
+297	32	accept4				sys_accept4
+298	32	recvmmsg			compat_sys_recvmmsg_time32
+299	32	getdents64			sys_getdents64
+300	32	fanotify_init			sys_fanotify_init
+301	32	fanotify_mark			sys_fanotify_mark
+302	32	prlimit64			sys_prlimit64
+303	32	name_to_handle_at		sys_name_to_handle_at
+304	32	open_by_handle_at		sys_open_by_handle_at
+305	32	clock_adjtime			sys_clock_adjtime32
+306	32	syncfs				sys_syncfs
+307	32	sendmmsg			compat_sys_sendmmsg
+308	32	setns				sys_setns
+309	32	process_vm_readv		sys_process_vm_readv
+310	32	process_vm_writev		sys_process_vm_writev
+311	32	kcmp				sys_kcmp
+312	32	finit_module			sys_finit_module
+313	32	sched_setattr			sys_sched_setattr
+314	32	sched_getattr			sys_sched_getattr
+315	32	renameat2			sys_renameat2
+316	32	seccomp				sys_seccomp
+317	32	getrandom			sys_getrandom
+318	32	memfd_create			sys_memfd_create
+319	32	bpf				sys_bpf
+320	32	execveat			compat_sys_execveat
+321	32	userfaultfd			sys_userfaultfd
+322	32	membarrier			sys_membarrier
+323	32	mlock2				sys_mlock2
+324	32	copy_file_range			sys_copy_file_range
+325	32	preadv2				compat_sys_preadv2
+326	32	pwritev2			compat_sys_pwritev2
+327	32	pkey_mprotect			sys_pkey_mprotect
+328	32	pkey_alloc			sys_pkey_alloc
+329	32	pkey_free			sys_pkey_free
+330	32	statx				sys_statx
+331	32	rseq				sys_rseq
+332	32	io_pgetevents			compat_sys_io_pgetevents
+
+# n64 specific syscalls
+212	64	set_tid_address			sys_set_tid_address
+213	64	restart_syscall			sys_restart_syscall
+214	64	semtimedop			sys_semtimedop
+215	64	fadvise64			sys_fadvise64_64
+216	64	timer_create			sys_timer_create
+217	64	timer_settime			sys_timer_settime
+218	64	timer_gettime			sys_timer_gettime
+219	64	timer_getoverrun		sys_timer_getoverrun
+220	64	timer_delete			sys_timer_delete
+221	64	clock_settime			sys_clock_settime
+222	64	clock_gettime			sys_clock_gettime
+223	64	clock_getres			sys_clock_getres
+224	64	clock_nanosleep			sys_clock_nanosleep
+225	64	tgkill				sys_tgkill
+226	64	utimes				sys_utimes
+227	64	mbind				sys_mbind
+228	64	get_mempolicy			sys_get_mempolicy
+229	64	set_mempolicy			sys_set_mempolicy
+230	64	mq_open				sys_mq_open
+231	64	mq_unlink			sys_mq_unlink
+232	64	mq_timedsend			sys_mq_timedsend
+233	64	mq_timedreceive			sys_mq_timedreceive
+234	64	mq_notify			sys_mq_notify
+235	64	mq_getsetattr			sys_mq_getsetattr
+236	64	vserver				sys_ni_syscall
+237	64	waitid				sys_waitid
+# 238 was sys_setaltroot
+239	64	add_key				sys_add_key
+240	64	request_key			sys_request_key
+241	64	keyctl				sys_keyctl
+242	64	set_thread_area			sys_set_thread_area
+243	64	inotify_init			sys_inotify_init
+244	64	inotify_add_watch		sys_inotify_add_watch
+245	64	inotify_rm_watch		sys_inotify_rm_watch
+246	64	migrate_pages			sys_migrate_pages
+247	64	openat				sys_openat
+248	64	mkdirat				sys_mkdirat
+249	64	mknodat				sys_mknodat
+250	64	fchownat			sys_fchownat
+251	64	futimesat			sys_futimesat
+252	64	newfstatat			sys_newfstatat
+253	64	unlinkat			sys_unlinkat
+254	64	renameat			sys_renameat
+255	64	linkat				sys_linkat
+256	64	symlinkat			sys_symlinkat
+257	64	readlinkat			sys_readlinkat
+258	64	fchmodat			sys_fchmodat
+259	64	faccessat			sys_faccessat
+260	64	pselect6			sys_pselect6
+261	64	ppoll				sys_ppoll
+262	64	unshare				sys_unshare
+263	64	splice				sys_splice
+264	64	sync_file_range			sys_sync_file_range
+265	64	tee				sys_tee
+266	64	vmsplice			sys_vmsplice
+267	64	move_pages			sys_move_pages
+268	64	set_robust_list			sys_set_robust_list
+269	64	get_robust_list			sys_get_robust_list
+270	64	kexec_load			sys_kexec_load
+271	64	getcpu				sys_getcpu
+272	64	epoll_pwait			sys_epoll_pwait
+273	64	ioprio_set			sys_ioprio_set
+274	64	ioprio_get			sys_ioprio_get
+275	64	utimensat			sys_utimensat
+276	64	signalfd			sys_signalfd
+277	64	timerfd				sys_ni_syscall
+278	64	eventfd				sys_eventfd
+279	64	fallocate			sys_fallocate
+280	64	timerfd_create			sys_timerfd_create
+281	64	timerfd_gettime			sys_timerfd_gettime
+282	64	timerfd_settime			sys_timerfd_settime
+283	64	signalfd4			sys_signalfd4
+284	64	eventfd2			sys_eventfd2
+285	64	epoll_create1			sys_epoll_create1
+286	64	dup3				sys_dup3
+287	64	pipe2				sys_pipe2
+288	64	inotify_init1			sys_inotify_init1
+289	64	preadv				sys_preadv
+290	64	pwritev				sys_pwritev
+291	64	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo
+292	64	perf_event_open			sys_perf_event_open
+293	64	accept4				sys_accept4
+294	64	recvmmsg			sys_recvmmsg
+295	64	fanotify_init			sys_fanotify_init
+296	64	fanotify_mark			sys_fanotify_mark
+297	64	prlimit64			sys_prlimit64
+298	64	name_to_handle_at		sys_name_to_handle_at
+299	64	open_by_handle_at		sys_open_by_handle_at
+300	64	clock_adjtime			sys_clock_adjtime
+301	64	syncfs				sys_syncfs
+302	64	sendmmsg			sys_sendmmsg
+303	64	setns				sys_setns
+304	64	process_vm_readv		sys_process_vm_readv
+305	64	process_vm_writev		sys_process_vm_writev
+306	64	kcmp				sys_kcmp
+307	64	finit_module			sys_finit_module
+308	64	getdents64			sys_getdents64
+309	64	sched_setattr			sys_sched_setattr
+310	64	sched_getattr			sys_sched_getattr
+311	64	renameat2			sys_renameat2
+312	64	seccomp				sys_seccomp
+313	64	getrandom			sys_getrandom
+314	64	memfd_create			sys_memfd_create
+315	64	bpf				sys_bpf
+316	64	execveat			sys_execveat
+317	64	userfaultfd			sys_userfaultfd
+318	64	membarrier			sys_membarrier
+319	64	mlock2				sys_mlock2
+320	64	copy_file_range			sys_copy_file_range
+321	64	preadv2				sys_preadv2
+322	64	pwritev2			sys_pwritev2
+323	64	pkey_mprotect			sys_pkey_mprotect
+324	64	pkey_alloc			sys_pkey_alloc
+325	64	pkey_free			sys_pkey_free
+326	64	statx				sys_statx
+327	64	rseq				sys_rseq
+328	64	io_pgetevents			sys_io_pgetevents
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
deleted file mode 100644
index 32faa1361282..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ /dev/null
@@ -1,412 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
-#
-# system call numbers and entry vectors for mips
-#
-# The format is:
-# <number> <abi> <name> <entry point> <compat entry point>
-#
-# The <abi> is always "32" for this file.
-#
-0	32	read				sys_read
-1	32	write				sys_write
-2	32	open				sys_open
-3	32	close				sys_close
-4	32	stat				sys_newstat
-5	32	fstat				sys_newfstat
-6	32	lstat				sys_newlstat
-7	32	poll				sys_poll
-8	32	lseek				sys_lseek
-9	32	mmap				sys_mips_mmap
-10	32	mprotect			sys_mprotect
-11	32	munmap				sys_munmap
-12	32	brk				sys_brk
-13	32	rt_sigaction			compat_sys_rt_sigaction
-14	32	rt_sigprocmask			compat_sys_rt_sigprocmask
-15	32	ioctl				compat_sys_ioctl
-16	32	pread64				sys_pread64
-17	32	pwrite64			sys_pwrite64
-18	32	readv				sys_readv
-19	32	writev				sys_writev
-20	32	access				sys_access
-21	32	pipe				sysm_pipe
-22	32	_newselect			compat_sys_select
-23	32	sched_yield			sys_sched_yield
-24	32	mremap				sys_mremap
-25	32	msync				sys_msync
-26	32	mincore				sys_mincore
-27	32	madvise				sys_madvise
-28	32	shmget				sys_shmget
-29	32	shmat				sys_shmat
-30	32	shmctl				compat_sys_old_shmctl
-31	32	dup				sys_dup
-32	32	dup2				sys_dup2
-33	32	pause				sys_pause
-34	32	nanosleep			sys_nanosleep_time32
-35	32	getitimer			compat_sys_getitimer
-36	32	setitimer			compat_sys_setitimer
-37	32	alarm				sys_alarm
-38	32	getpid				sys_getpid
-39	32	sendfile			compat_sys_sendfile
-40	32	socket				sys_socket
-41	32	connect				sys_connect
-42	32	accept				sys_accept
-43	32	sendto				sys_sendto
-44	32	recvfrom			compat_sys_recvfrom
-45	32	sendmsg				compat_sys_sendmsg
-46	32	recvmsg				compat_sys_recvmsg
-47	32	shutdown			sys_shutdown
-48	32	bind				sys_bind
-49	32	listen				sys_listen
-50	32	getsockname			sys_getsockname
-51	32	getpeername			sys_getpeername
-52	32	socketpair			sys_socketpair
-53	32	setsockopt			sys_setsockopt
-54	32	getsockopt			sys_getsockopt
-55	32	clone				__sys_clone
-56	32	fork				__sys_fork
-57	32	execve				compat_sys_execve
-58	32	exit				sys_exit
-59	32	wait4				compat_sys_wait4
-60	32	kill				sys_kill
-61	32	uname				sys_newuname
-62	32	semget				sys_semget
-63	32	semop				sys_semop
-64	32	semctl				compat_sys_old_semctl
-65	32	shmdt				sys_shmdt
-66	32	msgget				sys_msgget
-67	32	msgsnd				compat_sys_msgsnd
-68	32	msgrcv				compat_sys_msgrcv
-69	32	msgctl				compat_sys_old_msgctl
-70	32	fcntl				compat_sys_fcntl
-71	32	flock				sys_flock
-72	32	fsync				sys_fsync
-73	32	fdatasync			sys_fdatasync
-74	32	truncate			sys_truncate
-75	32	ftruncate			sys_ftruncate
-76	32	getdents			compat_sys_getdents
-77	32	getcwd				sys_getcwd
-78	32	chdir				sys_chdir
-79	32	fchdir				sys_fchdir
-80	32	rename				sys_rename
-81	32	mkdir				sys_mkdir
-82	32	rmdir				sys_rmdir
-83	32	creat				sys_creat
-84	32	link				sys_link
-85	32	unlink				sys_unlink
-86	32	symlink				sys_symlink
-87	32	readlink			sys_readlink
-88	32	chmod				sys_chmod
-89	32	fchmod				sys_fchmod
-90	32	chown				sys_chown
-91	32	fchown				sys_fchown
-92	32	lchown				sys_lchown
-93	32	umask				sys_umask
-94	32	gettimeofday			compat_sys_gettimeofday
-95	32	getrlimit			compat_sys_getrlimit
-96	32	getrusage			compat_sys_getrusage
-97	32	sysinfo				compat_sys_sysinfo
-98	32	times				compat_sys_times
-99	32	ptrace				compat_sys_ptrace
-100	32	getuid				sys_getuid
-101	32	syslog				sys_syslog
-102	32	getgid				sys_getgid
-103	32	setuid				sys_setuid
-104	32	setgid				sys_setgid
-105	32	geteuid				sys_geteuid
-106	32	getegid				sys_getegid
-107	32	setpgid				sys_setpgid
-108	32	getppid				sys_getppid
-109	32	getpgrp				sys_getpgrp
-110	32	setsid				sys_setsid
-111	32	setreuid			sys_setreuid
-112	32	setregid			sys_setregid
-113	32	getgroups			sys_getgroups
-114	32	setgroups			sys_setgroups
-115	32	setresuid			sys_setresuid
-116	32	getresuid			sys_getresuid
-117	32	setresgid			sys_setresgid
-118	32	getresgid			sys_getresgid
-119	32	getpgid				sys_getpgid
-120	32	setfsuid			sys_setfsuid
-121	32	setfsgid			sys_setfsgid
-122	32	getsid				sys_getsid
-123	32	capget				sys_capget
-124	32	capset				sys_capset
-125	32	rt_sigpending			compat_sys_rt_sigpending
-126	32	rt_sigtimedwait			compat_sys_rt_sigtimedwait_time32
-127	32	rt_sigqueueinfo			compat_sys_rt_sigqueueinfo
-128	32	rt_sigsuspend			compat_sys_rt_sigsuspend
-129	32	sigaltstack			compat_sys_sigaltstack
-130	32	utime				sys_utime32
-131	32	mknod				sys_mknod
-132	32	personality			sys_32_personality
-133	32	ustat				compat_sys_ustat
-134	32	statfs				compat_sys_statfs
-135	32	fstatfs				compat_sys_fstatfs
-136	32	sysfs				sys_sysfs
-137	32	getpriority			sys_getpriority
-138	32	setpriority			sys_setpriority
-139	32	sched_setparam			sys_sched_setparam
-140	32	sched_getparam			sys_sched_getparam
-141	32	sched_setscheduler		sys_sched_setscheduler
-142	32	sched_getscheduler		sys_sched_getscheduler
-143	32	sched_get_priority_max		sys_sched_get_priority_max
-144	32	sched_get_priority_min		sys_sched_get_priority_min
-145	32	sched_rr_get_interval		sys_sched_rr_get_interval_time32
-146	32	mlock				sys_mlock
-147	32	munlock				sys_munlock
-148	32	mlockall			sys_mlockall
-149	32	munlockall			sys_munlockall
-150	32	vhangup				sys_vhangup
-151	32	pivot_root			sys_pivot_root
-152	32	_sysctl				sys_ni_syscall
-153	32	prctl				sys_prctl
-154	32	adjtimex			sys_adjtimex_time32
-155	32	setrlimit			compat_sys_setrlimit
-156	32	chroot				sys_chroot
-157	32	sync				sys_sync
-158	32	acct				sys_acct
-159	32	settimeofday			compat_sys_settimeofday
-160	32	mount				sys_mount
-161	32	umount2				sys_umount
-162	32	swapon				sys_swapon
-163	32	swapoff				sys_swapoff
-164	32	reboot				sys_reboot
-165	32	sethostname			sys_sethostname
-166	32	setdomainname			sys_setdomainname
-167	32	create_module			sys_ni_syscall
-168	32	init_module			sys_init_module
-169	32	delete_module			sys_delete_module
-170	32	get_kernel_syms			sys_ni_syscall
-171	32	query_module			sys_ni_syscall
-172	32	quotactl			sys_quotactl
-173	32	nfsservctl			sys_ni_syscall
-174	32	getpmsg				sys_ni_syscall
-175	32	putpmsg				sys_ni_syscall
-176	32	afs_syscall			sys_ni_syscall
-# 177 reserved for security
-177	32	reserved177			sys_ni_syscall
-178	32	gettid				sys_gettid
-179	32	readahead			sys_readahead
-180	32	setxattr			sys_setxattr
-181	32	lsetxattr			sys_lsetxattr
-182	32	fsetxattr			sys_fsetxattr
-183	32	getxattr			sys_getxattr
-184	32	lgetxattr			sys_lgetxattr
-185	32	fgetxattr			sys_fgetxattr
-186	32	listxattr			sys_listxattr
-187	32	llistxattr			sys_llistxattr
-188	32	flistxattr			sys_flistxattr
-189	32	removexattr			sys_removexattr
-190	32	lremovexattr			sys_lremovexattr
-191	32	fremovexattr			sys_fremovexattr
-192	32	tkill				sys_tkill
-193	32	reserved193			sys_ni_syscall
-194	32	futex				sys_futex_time32
-195	32	sched_setaffinity		compat_sys_sched_setaffinity
-196	32	sched_getaffinity		compat_sys_sched_getaffinity
-197	32	cacheflush			sys_cacheflush
-198	32	cachectl			sys_cachectl
-199	32	sysmips				__sys_sysmips
-200	32	io_setup			compat_sys_io_setup
-201	32	io_destroy			sys_io_destroy
-202	32	io_getevents			sys_io_getevents_time32
-203	32	io_submit			compat_sys_io_submit
-204	32	io_cancel			sys_io_cancel
-205	32	exit_group			sys_exit_group
-206	32	lookup_dcookie			sys_ni_syscall
-207	32	epoll_create			sys_epoll_create
-208	32	epoll_ctl			sys_epoll_ctl
-209	32	epoll_wait			sys_epoll_wait
-210	32	remap_file_pages		sys_remap_file_pages
-211	32	rt_sigreturn			sysn32_rt_sigreturn
-212	32	fcntl64				compat_sys_fcntl64
-213	32	set_tid_address			sys_set_tid_address
-214	32	restart_syscall			sys_restart_syscall
-215	32	semtimedop			sys_semtimedop_time32
-216	32	fadvise64			sys_fadvise64_64
-217	32	statfs64			compat_sys_statfs64
-218	32	fstatfs64			compat_sys_fstatfs64
-219	32	sendfile64			sys_sendfile64
-220	32	timer_create			compat_sys_timer_create
-221	32	timer_settime			sys_timer_settime32
-222	32	timer_gettime			sys_timer_gettime32
-223	32	timer_getoverrun		sys_timer_getoverrun
-224	32	timer_delete			sys_timer_delete
-225	32	clock_settime			sys_clock_settime32
-226	32	clock_gettime			sys_clock_gettime32
-227	32	clock_getres			sys_clock_getres_time32
-228	32	clock_nanosleep			sys_clock_nanosleep_time32
-229	32	tgkill				sys_tgkill
-230	32	utimes				sys_utimes_time32
-231	32	mbind				sys_mbind
-232	32	get_mempolicy			sys_get_mempolicy
-233	32	set_mempolicy			sys_set_mempolicy
-234	32	mq_open				compat_sys_mq_open
-235	32	mq_unlink			sys_mq_unlink
-236	32	mq_timedsend			sys_mq_timedsend_time32
-237	32	mq_timedreceive			sys_mq_timedreceive_time32
-238	32	mq_notify			compat_sys_mq_notify
-239	32	mq_getsetattr			compat_sys_mq_getsetattr
-240	32	vserver				sys_ni_syscall
-241	32	waitid				compat_sys_waitid
-# 242 was sys_setaltroot
-243	32	add_key				sys_add_key
-244	32	request_key			sys_request_key
-245	32	keyctl				compat_sys_keyctl
-246	32	set_thread_area			sys_set_thread_area
-247	32	inotify_init			sys_inotify_init
-248	32	inotify_add_watch		sys_inotify_add_watch
-249	32	inotify_rm_watch		sys_inotify_rm_watch
-250	32	migrate_pages			sys_migrate_pages
-251	32	openat				sys_openat
-252	32	mkdirat				sys_mkdirat
-253	32	mknodat				sys_mknodat
-254	32	fchownat			sys_fchownat
-255	32	futimesat			sys_futimesat_time32
-256	32	newfstatat			sys_newfstatat
-257	32	unlinkat			sys_unlinkat
-258	32	renameat			sys_renameat
-259	32	linkat				sys_linkat
-260	32	symlinkat			sys_symlinkat
-261	32	readlinkat			sys_readlinkat
-262	32	fchmodat			sys_fchmodat
-263	32	faccessat			sys_faccessat
-264	32	pselect6			compat_sys_pselect6_time32
-265	32	ppoll				compat_sys_ppoll_time32
-266	32	unshare				sys_unshare
-267	32	splice				sys_splice
-268	32	sync_file_range			sys_sync_file_range
-269	32	tee				sys_tee
-270	32	vmsplice			sys_vmsplice
-271	32	move_pages			sys_move_pages
-272	32	set_robust_list			compat_sys_set_robust_list
-273	32	get_robust_list			compat_sys_get_robust_list
-274	32	kexec_load			compat_sys_kexec_load
-275	32	getcpu				sys_getcpu
-276	32	epoll_pwait			compat_sys_epoll_pwait
-277	32	ioprio_set			sys_ioprio_set
-278	32	ioprio_get			sys_ioprio_get
-279	32	utimensat			sys_utimensat_time32
-280	32	signalfd			compat_sys_signalfd
-281	32	timerfd				sys_ni_syscall
-282	32	eventfd				sys_eventfd
-283	32	fallocate			sys_fallocate
-284	32	timerfd_create			sys_timerfd_create
-285	32	timerfd_gettime			sys_timerfd_gettime32
-286	32	timerfd_settime			sys_timerfd_settime32
-287	32	signalfd4			compat_sys_signalfd4
-288	32	eventfd2			sys_eventfd2
-289	32	epoll_create1			sys_epoll_create1
-290	32	dup3				sys_dup3
-291	32	pipe2				sys_pipe2
-292	32	inotify_init1			sys_inotify_init1
-293	32	preadv				compat_sys_preadv
-294	32	pwritev				compat_sys_pwritev
-295	32	rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
-296	32	perf_event_open			sys_perf_event_open
-297	32	accept4				sys_accept4
-298	32	recvmmsg			compat_sys_recvmmsg_time32
-299	32	getdents64			sys_getdents64
-300	32	fanotify_init			sys_fanotify_init
-301	32	fanotify_mark			sys_fanotify_mark
-302	32	prlimit64			sys_prlimit64
-303	32	name_to_handle_at		sys_name_to_handle_at
-304	32	open_by_handle_at		sys_open_by_handle_at
-305	32	clock_adjtime			sys_clock_adjtime32
-306	32	syncfs				sys_syncfs
-307	32	sendmmsg			compat_sys_sendmmsg
-308	32	setns				sys_setns
-309	32	process_vm_readv		sys_process_vm_readv
-310	32	process_vm_writev		sys_process_vm_writev
-311	32	kcmp				sys_kcmp
-312	32	finit_module			sys_finit_module
-313	32	sched_setattr			sys_sched_setattr
-314	32	sched_getattr			sys_sched_getattr
-315	32	renameat2			sys_renameat2
-316	32	seccomp				sys_seccomp
-317	32	getrandom			sys_getrandom
-318	32	memfd_create			sys_memfd_create
-319	32	bpf				sys_bpf
-320	32	execveat			compat_sys_execveat
-321	32	userfaultfd			sys_userfaultfd
-322	32	membarrier			sys_membarrier
-323	32	mlock2				sys_mlock2
-324	32	copy_file_range			sys_copy_file_range
-325	32	preadv2				compat_sys_preadv2
-326	32	pwritev2			compat_sys_pwritev2
-327	32	pkey_mprotect			sys_pkey_mprotect
-328	32	pkey_alloc			sys_pkey_alloc
-329	32	pkey_free			sys_pkey_free
-330	32	statx				sys_statx
-331	32	rseq				sys_rseq
-332	32	io_pgetevents			compat_sys_io_pgetevents
-# 333 through 402 are unassigned to sync up with generic numbers
-403	32	clock_gettime64			sys_clock_gettime
-404	32	clock_settime64			sys_clock_settime
-405	32	clock_adjtime64			sys_clock_adjtime
-406	32	clock_getres_time64		sys_clock_getres
-407	32	clock_nanosleep_time64		sys_clock_nanosleep
-408	32	timer_gettime64			sys_timer_gettime
-409	32	timer_settime64			sys_timer_settime
-410	32	timerfd_gettime64		sys_timerfd_gettime
-411	32	timerfd_settime64		sys_timerfd_settime
-412	32	utimensat_time64		sys_utimensat
-413	32	pselect6_time64			compat_sys_pselect6_time64
-414	32	ppoll_time64			compat_sys_ppoll_time64
-416	32	io_pgetevents_time64		compat_sys_io_pgetevents_time64
-417	32	recvmmsg_time64			compat_sys_recvmmsg_time64
-418	32	mq_timedsend_time64		sys_mq_timedsend
-419	32	mq_timedreceive_time64		sys_mq_timedreceive
-420	32	semtimedop_time64		sys_semtimedop
-421	32	rt_sigtimedwait_time64		compat_sys_rt_sigtimedwait_time64
-422	32	futex_time64			sys_futex
-423	32	sched_rr_get_interval_time64	sys_sched_rr_get_interval
-424	32	pidfd_send_signal		sys_pidfd_send_signal
-425	32	io_uring_setup			sys_io_uring_setup
-426	32	io_uring_enter			sys_io_uring_enter
-427	32	io_uring_register		sys_io_uring_register
-428	32	open_tree			sys_open_tree
-429	32	move_mount			sys_move_mount
-430	32	fsopen				sys_fsopen
-431	32	fsconfig			sys_fsconfig
-432	32	fsmount				sys_fsmount
-433	32	fspick				sys_fspick
-434	32	pidfd_open			sys_pidfd_open
-435	32	clone3				__sys_clone3
-436	32	close_range			sys_close_range
-437	32	openat2				sys_openat2
-438	32	pidfd_getfd			sys_pidfd_getfd
-439	32	faccessat2			sys_faccessat2
-440	32	process_madvise			sys_process_madvise
-441	32	epoll_pwait2			compat_sys_epoll_pwait2
-442	32	mount_setattr			sys_mount_setattr
-443	32	quotactl_fd			sys_quotactl_fd
-444	32	landlock_create_ruleset		sys_landlock_create_ruleset
-445	32	landlock_add_rule		sys_landlock_add_rule
-446	32	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	32	process_mrelease		sys_process_mrelease
-449	32	futex_waitv			sys_futex_waitv
-450	32	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	32	cachestat			sys_cachestat
-452	32	fchmodat2			sys_fchmodat2
-453	32	map_shadow_stack		sys_map_shadow_stack
-454	32	futex_wake			sys_futex_wake
-455	32	futex_wait			sys_futex_wait
-456	32	futex_requeue			sys_futex_requeue
-457	32	statmount			sys_statmount
-458	32	listmount			sys_listmount
-459	32	lsm_get_self_attr		sys_lsm_get_self_attr
-460	32	lsm_set_self_attr		sys_lsm_set_self_attr
-461	32	lsm_list_modules		sys_lsm_list_modules
-462	32	mseal				sys_mseal
-463	32	setxattrat			sys_setxattrat
-464	32	getxattrat			sys_getxattrat
-465	32	listxattrat			sys_listxattrat
-466	32	removexattrat			sys_removexattrat
-467	32	open_tree_attr			sys_open_tree_attr
-468	32	file_getattr			sys_file_getattr
-469	32	file_setattr			sys_file_setattr
-470	32	listns				sys_listns
-471	32	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
deleted file mode 100644
index 4bb530387824..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ /dev/null
@@ -1,388 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
-#
-# system call numbers and entry vectors for mips
-#
-# The format is:
-# <number> <abi> <name> <entry point>
-#
-# The <abi> is always "64" for this file.
-#
-0	64	read				sys_read
-1	64	write				sys_write
-2	64	open				sys_open
-3	64	close				sys_close
-4	64	stat				sys_newstat
-5	64	fstat				sys_newfstat
-6	64	lstat				sys_newlstat
-7	64	poll				sys_poll
-8	64	lseek				sys_lseek
-9	64	mmap				sys_mips_mmap
-10	64	mprotect			sys_mprotect
-11	64	munmap				sys_munmap
-12	64	brk				sys_brk
-13	64	rt_sigaction			sys_rt_sigaction
-14	64	rt_sigprocmask			sys_rt_sigprocmask
-15	64	ioctl				sys_ioctl
-16	64	pread64				sys_pread64
-17	64	pwrite64			sys_pwrite64
-18	64	readv				sys_readv
-19	64	writev				sys_writev
-20	64	access				sys_access
-21	64	pipe				sysm_pipe
-22	64	_newselect			sys_select
-23	64	sched_yield			sys_sched_yield
-24	64	mremap				sys_mremap
-25	64	msync				sys_msync
-26	64	mincore				sys_mincore
-27	64	madvise				sys_madvise
-28	64	shmget				sys_shmget
-29	64	shmat				sys_shmat
-30	64	shmctl				sys_old_shmctl
-31	64	dup				sys_dup
-32	64	dup2				sys_dup2
-33	64	pause				sys_pause
-34	64	nanosleep			sys_nanosleep
-35	64	getitimer			sys_getitimer
-36	64	setitimer			sys_setitimer
-37	64	alarm				sys_alarm
-38	64	getpid				sys_getpid
-39	64	sendfile			sys_sendfile64
-40	64	socket				sys_socket
-41	64	connect				sys_connect
-42	64	accept				sys_accept
-43	64	sendto				sys_sendto
-44	64	recvfrom			sys_recvfrom
-45	64	sendmsg				sys_sendmsg
-46	64	recvmsg				sys_recvmsg
-47	64	shutdown			sys_shutdown
-48	64	bind				sys_bind
-49	64	listen				sys_listen
-50	64	getsockname			sys_getsockname
-51	64	getpeername			sys_getpeername
-52	64	socketpair			sys_socketpair
-53	64	setsockopt			sys_setsockopt
-54	64	getsockopt			sys_getsockopt
-55	64	clone				__sys_clone
-56	64	fork				__sys_fork
-57	64	execve				sys_execve
-58	64	exit				sys_exit
-59	64	wait4				sys_wait4
-60	64	kill				sys_kill
-61	64	uname				sys_newuname
-62	64	semget				sys_semget
-63	64	semop				sys_semop
-64	64	semctl				sys_old_semctl
-65	64	shmdt				sys_shmdt
-66	64	msgget				sys_msgget
-67	64	msgsnd				sys_msgsnd
-68	64	msgrcv				sys_msgrcv
-69	64	msgctl				sys_old_msgctl
-70	64	fcntl				sys_fcntl
-71	64	flock				sys_flock
-72	64	fsync				sys_fsync
-73	64	fdatasync			sys_fdatasync
-74	64	truncate			sys_truncate
-75	64	ftruncate			sys_ftruncate
-76	64	getdents			sys_getdents
-77	64	getcwd				sys_getcwd
-78	64	chdir				sys_chdir
-79	64	fchdir				sys_fchdir
-80	64	rename				sys_rename
-81	64	mkdir				sys_mkdir
-82	64	rmdir				sys_rmdir
-83	64	creat				sys_creat
-84	64	link				sys_link
-85	64	unlink				sys_unlink
-86	64	symlink				sys_symlink
-87	64	readlink			sys_readlink
-88	64	chmod				sys_chmod
-89	64	fchmod				sys_fchmod
-90	64	chown				sys_chown
-91	64	fchown				sys_fchown
-92	64	lchown				sys_lchown
-93	64	umask				sys_umask
-94	64	gettimeofday			sys_gettimeofday
-95	64	getrlimit			sys_getrlimit
-96	64	getrusage			sys_getrusage
-97	64	sysinfo				sys_sysinfo
-98	64	times				sys_times
-99	64	ptrace				sys_ptrace
-100	64	getuid				sys_getuid
-101	64	syslog				sys_syslog
-102	64	getgid				sys_getgid
-103	64	setuid				sys_setuid
-104	64	setgid				sys_setgid
-105	64	geteuid				sys_geteuid
-106	64	getegid				sys_getegid
-107	64	setpgid				sys_setpgid
-108	64	getppid				sys_getppid
-109	64	getpgrp				sys_getpgrp
-110	64	setsid				sys_setsid
-111	64	setreuid			sys_setreuid
-112	64	setregid			sys_setregid
-113	64	getgroups			sys_getgroups
-114	64	setgroups			sys_setgroups
-115	64	setresuid			sys_setresuid
-116	64	getresuid			sys_getresuid
-117	64	setresgid			sys_setresgid
-118	64	getresgid			sys_getresgid
-119	64	getpgid				sys_getpgid
-120	64	setfsuid			sys_setfsuid
-121	64	setfsgid			sys_setfsgid
-122	64	getsid				sys_getsid
-123	64	capget				sys_capget
-124	64	capset				sys_capset
-125	64	rt_sigpending			sys_rt_sigpending
-126	64	rt_sigtimedwait			sys_rt_sigtimedwait
-127	64	rt_sigqueueinfo			sys_rt_sigqueueinfo
-128	64	rt_sigsuspend			sys_rt_sigsuspend
-129	64	sigaltstack			sys_sigaltstack
-130	64	utime				sys_utime
-131	64	mknod				sys_mknod
-132	64	personality			sys_personality
-133	64	ustat				sys_ustat
-134	64	statfs				sys_statfs
-135	64	fstatfs				sys_fstatfs
-136	64	sysfs				sys_sysfs
-137	64	getpriority			sys_getpriority
-138	64	setpriority			sys_setpriority
-139	64	sched_setparam			sys_sched_setparam
-140	64	sched_getparam			sys_sched_getparam
-141	64	sched_setscheduler		sys_sched_setscheduler
-142	64	sched_getscheduler		sys_sched_getscheduler
-143	64	sched_get_priority_max		sys_sched_get_priority_max
-144	64	sched_get_priority_min		sys_sched_get_priority_min
-145	64	sched_rr_get_interval		sys_sched_rr_get_interval
-146	64	mlock				sys_mlock
-147	64	munlock				sys_munlock
-148	64	mlockall			sys_mlockall
-149	64	munlockall			sys_munlockall
-150	64	vhangup				sys_vhangup
-151	64	pivot_root			sys_pivot_root
-152	64	_sysctl				sys_ni_syscall
-153	64	prctl				sys_prctl
-154	64	adjtimex			sys_adjtimex
-155	64	setrlimit			sys_setrlimit
-156	64	chroot				sys_chroot
-157	64	sync				sys_sync
-158	64	acct				sys_acct
-159	64	settimeofday			sys_settimeofday
-160	64	mount				sys_mount
-161	64	umount2				sys_umount
-162	64	swapon				sys_swapon
-163	64	swapoff				sys_swapoff
-164	64	reboot				sys_reboot
-165	64	sethostname			sys_sethostname
-166	64	setdomainname			sys_setdomainname
-167	64	create_module			sys_ni_syscall
-168	64	init_module			sys_init_module
-169	64	delete_module			sys_delete_module
-170	64	get_kernel_syms			sys_ni_syscall
-171	64	query_module			sys_ni_syscall
-172	64	quotactl			sys_quotactl
-173	64	nfsservctl			sys_ni_syscall
-174	64	getpmsg				sys_ni_syscall
-175	64	putpmsg				sys_ni_syscall
-176	64	afs_syscall			sys_ni_syscall
-# 177 reserved for security
-177	64	reserved177			sys_ni_syscall
-178	64	gettid				sys_gettid
-179	64	readahead			sys_readahead
-180	64	setxattr			sys_setxattr
-181	64	lsetxattr			sys_lsetxattr
-182	64	fsetxattr			sys_fsetxattr
-183	64	getxattr			sys_getxattr
-184	64	lgetxattr			sys_lgetxattr
-185	64	fgetxattr			sys_fgetxattr
-186	64	listxattr			sys_listxattr
-187	64	llistxattr			sys_llistxattr
-188	64	flistxattr			sys_flistxattr
-189	64	removexattr			sys_removexattr
-190	64	lremovexattr			sys_lremovexattr
-191	64	fremovexattr			sys_fremovexattr
-192	64	tkill				sys_tkill
-193	64	reserved193			sys_ni_syscall
-194	64	futex				sys_futex
-195	64	sched_setaffinity		sys_sched_setaffinity
-196	64	sched_getaffinity		sys_sched_getaffinity
-197	64	cacheflush			sys_cacheflush
-198	64	cachectl			sys_cachectl
-199	64	sysmips				__sys_sysmips
-200	64	io_setup			sys_io_setup
-201	64	io_destroy			sys_io_destroy
-202	64	io_getevents			sys_io_getevents
-203	64	io_submit			sys_io_submit
-204	64	io_cancel			sys_io_cancel
-205	64	exit_group			sys_exit_group
-206	64	lookup_dcookie			sys_ni_syscall
-207	64	epoll_create			sys_epoll_create
-208	64	epoll_ctl			sys_epoll_ctl
-209	64	epoll_wait			sys_epoll_wait
-210	64	remap_file_pages		sys_remap_file_pages
-211	64	rt_sigreturn			sys_rt_sigreturn
-212	64	set_tid_address			sys_set_tid_address
-213	64	restart_syscall			sys_restart_syscall
-214	64	semtimedop			sys_semtimedop
-215	64	fadvise64			sys_fadvise64_64
-216	64	timer_create			sys_timer_create
-217	64	timer_settime			sys_timer_settime
-218	64	timer_gettime			sys_timer_gettime
-219	64	timer_getoverrun		sys_timer_getoverrun
-220	64	timer_delete			sys_timer_delete
-221	64	clock_settime			sys_clock_settime
-222	64	clock_gettime			sys_clock_gettime
-223	64	clock_getres			sys_clock_getres
-224	64	clock_nanosleep			sys_clock_nanosleep
-225	64	tgkill				sys_tgkill
-226	64	utimes				sys_utimes
-227	64	mbind				sys_mbind
-228	64	get_mempolicy			sys_get_mempolicy
-229	64	set_mempolicy			sys_set_mempolicy
-230	64	mq_open				sys_mq_open
-231	64	mq_unlink			sys_mq_unlink
-232	64	mq_timedsend			sys_mq_timedsend
-233	64	mq_timedreceive			sys_mq_timedreceive
-234	64	mq_notify			sys_mq_notify
-235	64	mq_getsetattr			sys_mq_getsetattr
-236	64	vserver				sys_ni_syscall
-237	64	waitid				sys_waitid
-# 238 was sys_setaltroot
-239	64	add_key				sys_add_key
-240	64	request_key			sys_request_key
-241	64	keyctl				sys_keyctl
-242	64	set_thread_area			sys_set_thread_area
-243	64	inotify_init			sys_inotify_init
-244	64	inotify_add_watch		sys_inotify_add_watch
-245	64	inotify_rm_watch		sys_inotify_rm_watch
-246	64	migrate_pages			sys_migrate_pages
-247	64	openat				sys_openat
-248	64	mkdirat				sys_mkdirat
-249	64	mknodat				sys_mknodat
-250	64	fchownat			sys_fchownat
-251	64	futimesat			sys_futimesat
-252	64	newfstatat			sys_newfstatat
-253	64	unlinkat			sys_unlinkat
-254	64	renameat			sys_renameat
-255	64	linkat				sys_linkat
-256	64	symlinkat			sys_symlinkat
-257	64	readlinkat			sys_readlinkat
-258	64	fchmodat			sys_fchmodat
-259	64	faccessat			sys_faccessat
-260	64	pselect6			sys_pselect6
-261	64	ppoll				sys_ppoll
-262	64	unshare				sys_unshare
-263	64	splice				sys_splice
-264	64	sync_file_range			sys_sync_file_range
-265	64	tee				sys_tee
-266	64	vmsplice			sys_vmsplice
-267	64	move_pages			sys_move_pages
-268	64	set_robust_list			sys_set_robust_list
-269	64	get_robust_list			sys_get_robust_list
-270	64	kexec_load			sys_kexec_load
-271	64	getcpu				sys_getcpu
-272	64	epoll_pwait			sys_epoll_pwait
-273	64	ioprio_set			sys_ioprio_set
-274	64	ioprio_get			sys_ioprio_get
-275	64	utimensat			sys_utimensat
-276	64	signalfd			sys_signalfd
-277	64	timerfd				sys_ni_syscall
-278	64	eventfd				sys_eventfd
-279	64	fallocate			sys_fallocate
-280	64	timerfd_create			sys_timerfd_create
-281	64	timerfd_gettime			sys_timerfd_gettime
-282	64	timerfd_settime			sys_timerfd_settime
-283	64	signalfd4			sys_signalfd4
-284	64	eventfd2			sys_eventfd2
-285	64	epoll_create1			sys_epoll_create1
-286	64	dup3				sys_dup3
-287	64	pipe2				sys_pipe2
-288	64	inotify_init1			sys_inotify_init1
-289	64	preadv				sys_preadv
-290	64	pwritev				sys_pwritev
-291	64	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo
-292	64	perf_event_open			sys_perf_event_open
-293	64	accept4				sys_accept4
-294	64	recvmmsg			sys_recvmmsg
-295	64	fanotify_init			sys_fanotify_init
-296	64	fanotify_mark			sys_fanotify_mark
-297	64	prlimit64			sys_prlimit64
-298	64	name_to_handle_at		sys_name_to_handle_at
-299	64	open_by_handle_at		sys_open_by_handle_at
-300	64	clock_adjtime			sys_clock_adjtime
-301	64	syncfs				sys_syncfs
-302	64	sendmmsg			sys_sendmmsg
-303	64	setns				sys_setns
-304	64	process_vm_readv		sys_process_vm_readv
-305	64	process_vm_writev		sys_process_vm_writev
-306	64	kcmp				sys_kcmp
-307	64	finit_module			sys_finit_module
-308	64	getdents64			sys_getdents64
-309	64	sched_setattr			sys_sched_setattr
-310	64	sched_getattr			sys_sched_getattr
-311	64	renameat2			sys_renameat2
-312	64	seccomp				sys_seccomp
-313	64	getrandom			sys_getrandom
-314	64	memfd_create			sys_memfd_create
-315	64	bpf				sys_bpf
-316	64	execveat			sys_execveat
-317	64	userfaultfd			sys_userfaultfd
-318	64	membarrier			sys_membarrier
-319	64	mlock2				sys_mlock2
-320	64	copy_file_range			sys_copy_file_range
-321	64	preadv2				sys_preadv2
-322	64	pwritev2			sys_pwritev2
-323	64	pkey_mprotect			sys_pkey_mprotect
-324	64	pkey_alloc			sys_pkey_alloc
-325	64	pkey_free			sys_pkey_free
-326	64	statx				sys_statx
-327	64	rseq				sys_rseq
-328	64	io_pgetevents			sys_io_pgetevents
-# 329 through 423 are reserved to sync up with other architectures
-424	64	pidfd_send_signal		sys_pidfd_send_signal
-425	64	io_uring_setup			sys_io_uring_setup
-426	64	io_uring_enter			sys_io_uring_enter
-427	64	io_uring_register		sys_io_uring_register
-428	64	open_tree			sys_open_tree
-429	64	move_mount			sys_move_mount
-430	64	fsopen				sys_fsopen
-431	64	fsconfig			sys_fsconfig
-432	64	fsmount				sys_fsmount
-433	64	fspick				sys_fspick
-434	64	pidfd_open			sys_pidfd_open
-435	64	clone3				__sys_clone3
-436	64	close_range			sys_close_range
-437	64	openat2				sys_openat2
-438	64	pidfd_getfd			sys_pidfd_getfd
-439	64	faccessat2			sys_faccessat2
-440	64	process_madvise			sys_process_madvise
-441	64	epoll_pwait2			sys_epoll_pwait2
-442	64	mount_setattr			sys_mount_setattr
-443	64	quotactl_fd			sys_quotactl_fd
-444	64	landlock_create_ruleset		sys_landlock_create_ruleset
-445	64	landlock_add_rule		sys_landlock_add_rule
-446	64	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	64	process_mrelease		sys_process_mrelease
-449	64	futex_waitv			sys_futex_waitv
-450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	64	cachestat			sys_cachestat
-452	64	fchmodat2			sys_fchmodat2
-453	64	map_shadow_stack		sys_map_shadow_stack
-454	64	futex_wake			sys_futex_wake
-455	64	futex_wait			sys_futex_wait
-456	64	futex_requeue			sys_futex_requeue
-457	64	statmount			sys_statmount
-458	64	listmount			sys_listmount
-459	64	lsm_get_self_attr		sys_lsm_get_self_attr
-460	64	lsm_set_self_attr		sys_lsm_set_self_attr
-461	64	lsm_list_modules		sys_lsm_list_modules
-462	64	mseal				sys_mseal
-463	64	setxattrat			sys_setxattrat
-464	64	getxattrat			sys_getxattrat
-465	64	listxattrat			sys_listxattrat
-466	64	removexattrat			sys_removexattrat
-467	64	open_tree_attr			sys_open_tree_attr
-468	64	file_getattr			sys_file_getattr
-469	64	file_setattr			sys_file_setattr
-470	64	listns				sys_listns
-471	64	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index ae547f217104..62011bb1bd95 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -391,71 +391,3 @@
 400	32	msgsnd				sys_msgsnd			compat_sys_msgsnd
 401	32	msgrcv				sys_msgrcv			compat_sys_msgrcv
 402	32	msgctl				sys_msgctl			compat_sys_msgctl
-403	32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
-404	32	clock_settime64			sys_clock_settime		sys_clock_settime
-405	32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
-406	32	clock_getres_time64		sys_clock_getres		sys_clock_getres
-407	32	clock_nanosleep_time64		sys_clock_nanosleep		sys_clock_nanosleep
-408	32	timer_gettime64			sys_timer_gettime		sys_timer_gettime
-409	32	timer_settime64			sys_timer_settime		sys_timer_settime
-410	32	timerfd_gettime64		sys_timerfd_gettime		sys_timerfd_gettime
-411	32	timerfd_settime64		sys_timerfd_settime		sys_timerfd_settime
-412	32	utimensat_time64		sys_utimensat			sys_utimensat
-413	32	pselect6_time64			sys_pselect6			compat_sys_pselect6_time64
-414	32	ppoll_time64			sys_ppoll			compat_sys_ppoll_time64
-416	32	io_pgetevents_time64		sys_io_pgetevents		compat_sys_io_pgetevents_time64
-417	32	recvmmsg_time64			sys_recvmmsg			compat_sys_recvmmsg_time64
-418	32	mq_timedsend_time64		sys_mq_timedsend		sys_mq_timedsend
-419	32	mq_timedreceive_time64		sys_mq_timedreceive		sys_mq_timedreceive
-420	32	semtimedop_time64		sys_semtimedop			sys_semtimedop
-421	32	rt_sigtimedwait_time64		sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait_time64
-422	32	futex_time64			sys_futex			sys_futex
-423	32	sched_rr_get_interval_time64	sys_sched_rr_get_interval	sys_sched_rr_get_interval
-424	32	pidfd_send_signal		sys_pidfd_send_signal
-425	32	io_uring_setup			sys_io_uring_setup
-426	32	io_uring_enter			sys_io_uring_enter
-427	32	io_uring_register		sys_io_uring_register
-428	32	open_tree			sys_open_tree
-429	32	move_mount			sys_move_mount
-430	32	fsopen				sys_fsopen
-431	32	fsconfig			sys_fsconfig
-432	32	fsmount				sys_fsmount
-433	32	fspick				sys_fspick
-434	32	pidfd_open			sys_pidfd_open
-435	32	clone3				__sys_clone3
-436	32	close_range			sys_close_range
-437	32	openat2				sys_openat2
-438	32	pidfd_getfd			sys_pidfd_getfd
-439	32	faccessat2			sys_faccessat2
-440	32	process_madvise			sys_process_madvise
-441	32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
-442	32	mount_setattr			sys_mount_setattr
-443	32	quotactl_fd			sys_quotactl_fd
-444	32	landlock_create_ruleset		sys_landlock_create_ruleset
-445	32	landlock_add_rule		sys_landlock_add_rule
-446	32	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	32	process_mrelease		sys_process_mrelease
-449	32	futex_waitv			sys_futex_waitv
-450	32	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	32	cachestat			sys_cachestat
-452	32	fchmodat2			sys_fchmodat2
-453	32	map_shadow_stack		sys_map_shadow_stack
-454	32	futex_wake			sys_futex_wake
-455	32	futex_wait			sys_futex_wait
-456	32	futex_requeue			sys_futex_requeue
-457	32	statmount			sys_statmount
-458	32	listmount			sys_listmount
-459	32	lsm_get_self_attr		sys_lsm_get_self_attr
-460	32	lsm_set_self_attr		sys_lsm_set_self_attr
-461	32	lsm_list_modules		sys_lsm_list_modules
-462	32	mseal				sys_mseal
-463	32	setxattrat			sys_setxattrat
-464	32	getxattrat			sys_getxattrat
-465	32	listxattrat			sys_listxattrat
-466	32	removexattrat			sys_removexattrat
-467	32	open_tree_attr			sys_open_tree_attr
-468	32	file_getattr			sys_file_getattr
-469	32	file_setattr			sys_file_setattr
-470	32	listns				sys_listns
-471	32	rseq_slice_yield		sys_rseq_slice_yield

-- 
2.55.0

