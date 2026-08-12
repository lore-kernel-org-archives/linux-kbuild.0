Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAEB358372;
	Wed, 12 Aug 2026 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505623; cv=none; b=M9CwLXDqe9VXidVgNrDAKWvyUntiBUZTFVxKVyrcXvJkVp5UK/Jj5B1991OjqN1UKRE0M4GdF+XuYZQrYVcH1iuETQ5xRY49vPvePnW77I+mfNnzGyo+m2BebEXCXOkjTMkwLlVjKDhjUk6PIZBUNTFDNYY30kTe0zoepurh/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505623; c=relaxed/simple;
	bh=VRQoEd/A0ttQPp+qjATdXR8Mh0UttLbAyLJp7jlnkbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWKf4zzHxeakATdjZJkKHHrEaSpfvcCO/R/bjQ5Pe3ZmpmVKFG+KDXJCBdcsKuaQKDeJX0sx3cVG/D8/mVyTFaweQ8TsIQOzfW0RnbupENu6U7QRxQaSg0RarNPnhdH31Y9r9pxg49xfZmSgSL24O0dtBS4QesL91mR50oXuX68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=cZ86e3Mh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cZ86e3Mh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=SiFZlRU/2VhK0sdhTdLXdz9b3WUmBR7e7G/irnlbHVE=; b=cZ86e3MhdY6k0eYEWgSHi49/r7
	QydqDS0MCRIqJEpfMzHtDKUYh4aXzsQi64HcvNLapvdqn9/aGVDzizZ/ueb+vlw/vOjqQ5ES7THlI
	Aa4Szmfr5OSiYIZ2HZsyC6wpkXl3GBVxyDbcW1FlDwaKnDVBd2dh2xT+SH3dIu7o/KHSafXTR/y9x
	UjukHxOu8LHwbkuuPaOuT2S2sSp69/V4zQRVzSY52SfvigpitNzfK8Tfr6kCygev8V2MI+/59Z3T4
	GIFUSvGen4adxIbvmoSmdpHwAHiCMfy9vllGyWo/FBfhEgGt209dJNrC+RHexRanVSOd/gqEZm103
	pZs/NF7w==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtziT-00HTm1-Mu; Wed, 12 Aug 2026 05:33:22 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 00:33:04 -0300
Subject: [PATCH v4 08/12] mips: Get rid of custom mips ABIs for syscall
 tables
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v4-8-748d0229ad40@igalia.com>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

Get rid of the mips exclusive ABIs for the syscall tables and replace them
with the common ABI names, replacing n32 and o32 with 32 and n64 with 64.

No functional change happens, but it simplifies and helps to unify the
tables.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/mips/kernel/syscalls/Makefile        |   9 +-
 arch/mips/kernel/syscalls/syscall_n32.tbl | 800 +++++++++++++--------------
 arch/mips/kernel/syscalls/syscall_n64.tbl | 750 ++++++++++++-------------
 arch/mips/kernel/syscalls/syscall_o32.tbl | 892 +++++++++++++++---------------
 4 files changed, 1228 insertions(+), 1223 deletions(-)

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 69adc21483ed..96f6eab29dd4 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -14,8 +14,7 @@ quiet_cmd_syshdr = SYSHDR  $@
 quiet_cmd_sysnr = SYSNR   $@
       cmd_sysnr = $(CONFIG_SHELL) $(sysnr) \
 		  --prefix $(sysnr_pfx_$(basetarget))_Linux_ \
-		  --abis $(sysnr_abis_$(basetarget)) \
-		  $< $@
+		  --abis $(abis_$*) $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
@@ -27,6 +26,12 @@ sysnr_pfx_unistd_nr_n32 := N32
 sysnr_pfx_unistd_nr_n64 := 64
 sysnr_pfx_unistd_nr_o32 := O32
 
+abis := common
+
+abis_n32 := $(abis),32
+abis_o32 := $(abis),32
+abis_n64 := $(abis),64
+
 $(kapi)/unistd_nr_%.h: $(src)/syscall_%.tbl $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 7430714e2b8f..32faa1361282 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -5,408 +5,408 @@
 # The format is:
 # <number> <abi> <name> <entry point> <compat entry point>
 #
-# The <abi> is always "n32" for this file.
+# The <abi> is always "32" for this file.
 #
-0	n32	read				sys_read
-1	n32	write				sys_write
-2	n32	open				sys_open
-3	n32	close				sys_close
-4	n32	stat				sys_newstat
-5	n32	fstat				sys_newfstat
-6	n32	lstat				sys_newlstat
-7	n32	poll				sys_poll
-8	n32	lseek				sys_lseek
-9	n32	mmap				sys_mips_mmap
-10	n32	mprotect			sys_mprotect
-11	n32	munmap				sys_munmap
-12	n32	brk				sys_brk
-13	n32	rt_sigaction			compat_sys_rt_sigaction
-14	n32	rt_sigprocmask			compat_sys_rt_sigprocmask
-15	n32	ioctl				compat_sys_ioctl
-16	n32	pread64				sys_pread64
-17	n32	pwrite64			sys_pwrite64
-18	n32	readv				sys_readv
-19	n32	writev				sys_writev
-20	n32	access				sys_access
-21	n32	pipe				sysm_pipe
-22	n32	_newselect			compat_sys_select
-23	n32	sched_yield			sys_sched_yield
-24	n32	mremap				sys_mremap
-25	n32	msync				sys_msync
-26	n32	mincore				sys_mincore
-27	n32	madvise				sys_madvise
-28	n32	shmget				sys_shmget
-29	n32	shmat				sys_shmat
-30	n32	shmctl				compat_sys_old_shmctl
-31	n32	dup				sys_dup
-32	n32	dup2				sys_dup2
-33	n32	pause				sys_pause
-34	n32	nanosleep			sys_nanosleep_time32
-35	n32	getitimer			compat_sys_getitimer
-36	n32	setitimer			compat_sys_setitimer
-37	n32	alarm				sys_alarm
-38	n32	getpid				sys_getpid
-39	n32	sendfile			compat_sys_sendfile
-40	n32	socket				sys_socket
-41	n32	connect				sys_connect
-42	n32	accept				sys_accept
-43	n32	sendto				sys_sendto
-44	n32	recvfrom			compat_sys_recvfrom
-45	n32	sendmsg				compat_sys_sendmsg
-46	n32	recvmsg				compat_sys_recvmsg
-47	n32	shutdown			sys_shutdown
-48	n32	bind				sys_bind
-49	n32	listen				sys_listen
-50	n32	getsockname			sys_getsockname
-51	n32	getpeername			sys_getpeername
-52	n32	socketpair			sys_socketpair
-53	n32	setsockopt			sys_setsockopt
-54	n32	getsockopt			sys_getsockopt
-55	n32	clone				__sys_clone
-56	n32	fork				__sys_fork
-57	n32	execve				compat_sys_execve
-58	n32	exit				sys_exit
-59	n32	wait4				compat_sys_wait4
-60	n32	kill				sys_kill
-61	n32	uname				sys_newuname
-62	n32	semget				sys_semget
-63	n32	semop				sys_semop
-64	n32	semctl				compat_sys_old_semctl
-65	n32	shmdt				sys_shmdt
-66	n32	msgget				sys_msgget
-67	n32	msgsnd				compat_sys_msgsnd
-68	n32	msgrcv				compat_sys_msgrcv
-69	n32	msgctl				compat_sys_old_msgctl
-70	n32	fcntl				compat_sys_fcntl
-71	n32	flock				sys_flock
-72	n32	fsync				sys_fsync
-73	n32	fdatasync			sys_fdatasync
-74	n32	truncate			sys_truncate
-75	n32	ftruncate			sys_ftruncate
-76	n32	getdents			compat_sys_getdents
-77	n32	getcwd				sys_getcwd
-78	n32	chdir				sys_chdir
-79	n32	fchdir				sys_fchdir
-80	n32	rename				sys_rename
-81	n32	mkdir				sys_mkdir
-82	n32	rmdir				sys_rmdir
-83	n32	creat				sys_creat
-84	n32	link				sys_link
-85	n32	unlink				sys_unlink
-86	n32	symlink				sys_symlink
-87	n32	readlink			sys_readlink
-88	n32	chmod				sys_chmod
-89	n32	fchmod				sys_fchmod
-90	n32	chown				sys_chown
-91	n32	fchown				sys_fchown
-92	n32	lchown				sys_lchown
-93	n32	umask				sys_umask
-94	n32	gettimeofday			compat_sys_gettimeofday
-95	n32	getrlimit			compat_sys_getrlimit
-96	n32	getrusage			compat_sys_getrusage
-97	n32	sysinfo				compat_sys_sysinfo
-98	n32	times				compat_sys_times
-99	n32	ptrace				compat_sys_ptrace
-100	n32	getuid				sys_getuid
-101	n32	syslog				sys_syslog
-102	n32	getgid				sys_getgid
-103	n32	setuid				sys_setuid
-104	n32	setgid				sys_setgid
-105	n32	geteuid				sys_geteuid
-106	n32	getegid				sys_getegid
-107	n32	setpgid				sys_setpgid
-108	n32	getppid				sys_getppid
-109	n32	getpgrp				sys_getpgrp
-110	n32	setsid				sys_setsid
-111	n32	setreuid			sys_setreuid
-112	n32	setregid			sys_setregid
-113	n32	getgroups			sys_getgroups
-114	n32	setgroups			sys_setgroups
-115	n32	setresuid			sys_setresuid
-116	n32	getresuid			sys_getresuid
-117	n32	setresgid			sys_setresgid
-118	n32	getresgid			sys_getresgid
-119	n32	getpgid				sys_getpgid
-120	n32	setfsuid			sys_setfsuid
-121	n32	setfsgid			sys_setfsgid
-122	n32	getsid				sys_getsid
-123	n32	capget				sys_capget
-124	n32	capset				sys_capset
-125	n32	rt_sigpending			compat_sys_rt_sigpending
-126	n32	rt_sigtimedwait			compat_sys_rt_sigtimedwait_time32
-127	n32	rt_sigqueueinfo			compat_sys_rt_sigqueueinfo
-128	n32	rt_sigsuspend			compat_sys_rt_sigsuspend
-129	n32	sigaltstack			compat_sys_sigaltstack
-130	n32	utime				sys_utime32
-131	n32	mknod				sys_mknod
-132	n32	personality			sys_32_personality
-133	n32	ustat				compat_sys_ustat
-134	n32	statfs				compat_sys_statfs
-135	n32	fstatfs				compat_sys_fstatfs
-136	n32	sysfs				sys_sysfs
-137	n32	getpriority			sys_getpriority
-138	n32	setpriority			sys_setpriority
-139	n32	sched_setparam			sys_sched_setparam
-140	n32	sched_getparam			sys_sched_getparam
-141	n32	sched_setscheduler		sys_sched_setscheduler
-142	n32	sched_getscheduler		sys_sched_getscheduler
-143	n32	sched_get_priority_max		sys_sched_get_priority_max
-144	n32	sched_get_priority_min		sys_sched_get_priority_min
-145	n32	sched_rr_get_interval		sys_sched_rr_get_interval_time32
-146	n32	mlock				sys_mlock
-147	n32	munlock				sys_munlock
-148	n32	mlockall			sys_mlockall
-149	n32	munlockall			sys_munlockall
-150	n32	vhangup				sys_vhangup
-151	n32	pivot_root			sys_pivot_root
-152	n32	_sysctl				sys_ni_syscall
-153	n32	prctl				sys_prctl
-154	n32	adjtimex			sys_adjtimex_time32
-155	n32	setrlimit			compat_sys_setrlimit
-156	n32	chroot				sys_chroot
-157	n32	sync				sys_sync
-158	n32	acct				sys_acct
-159	n32	settimeofday			compat_sys_settimeofday
-160	n32	mount				sys_mount
-161	n32	umount2				sys_umount
-162	n32	swapon				sys_swapon
-163	n32	swapoff				sys_swapoff
-164	n32	reboot				sys_reboot
-165	n32	sethostname			sys_sethostname
-166	n32	setdomainname			sys_setdomainname
-167	n32	create_module			sys_ni_syscall
-168	n32	init_module			sys_init_module
-169	n32	delete_module			sys_delete_module
-170	n32	get_kernel_syms			sys_ni_syscall
-171	n32	query_module			sys_ni_syscall
-172	n32	quotactl			sys_quotactl
-173	n32	nfsservctl			sys_ni_syscall
-174	n32	getpmsg				sys_ni_syscall
-175	n32	putpmsg				sys_ni_syscall
-176	n32	afs_syscall			sys_ni_syscall
+0	32	read				sys_read
+1	32	write				sys_write
+2	32	open				sys_open
+3	32	close				sys_close
+4	32	stat				sys_newstat
+5	32	fstat				sys_newfstat
+6	32	lstat				sys_newlstat
+7	32	poll				sys_poll
+8	32	lseek				sys_lseek
+9	32	mmap				sys_mips_mmap
+10	32	mprotect			sys_mprotect
+11	32	munmap				sys_munmap
+12	32	brk				sys_brk
+13	32	rt_sigaction			compat_sys_rt_sigaction
+14	32	rt_sigprocmask			compat_sys_rt_sigprocmask
+15	32	ioctl				compat_sys_ioctl
+16	32	pread64				sys_pread64
+17	32	pwrite64			sys_pwrite64
+18	32	readv				sys_readv
+19	32	writev				sys_writev
+20	32	access				sys_access
+21	32	pipe				sysm_pipe
+22	32	_newselect			compat_sys_select
+23	32	sched_yield			sys_sched_yield
+24	32	mremap				sys_mremap
+25	32	msync				sys_msync
+26	32	mincore				sys_mincore
+27	32	madvise				sys_madvise
+28	32	shmget				sys_shmget
+29	32	shmat				sys_shmat
+30	32	shmctl				compat_sys_old_shmctl
+31	32	dup				sys_dup
+32	32	dup2				sys_dup2
+33	32	pause				sys_pause
+34	32	nanosleep			sys_nanosleep_time32
+35	32	getitimer			compat_sys_getitimer
+36	32	setitimer			compat_sys_setitimer
+37	32	alarm				sys_alarm
+38	32	getpid				sys_getpid
+39	32	sendfile			compat_sys_sendfile
+40	32	socket				sys_socket
+41	32	connect				sys_connect
+42	32	accept				sys_accept
+43	32	sendto				sys_sendto
+44	32	recvfrom			compat_sys_recvfrom
+45	32	sendmsg				compat_sys_sendmsg
+46	32	recvmsg				compat_sys_recvmsg
+47	32	shutdown			sys_shutdown
+48	32	bind				sys_bind
+49	32	listen				sys_listen
+50	32	getsockname			sys_getsockname
+51	32	getpeername			sys_getpeername
+52	32	socketpair			sys_socketpair
+53	32	setsockopt			sys_setsockopt
+54	32	getsockopt			sys_getsockopt
+55	32	clone				__sys_clone
+56	32	fork				__sys_fork
+57	32	execve				compat_sys_execve
+58	32	exit				sys_exit
+59	32	wait4				compat_sys_wait4
+60	32	kill				sys_kill
+61	32	uname				sys_newuname
+62	32	semget				sys_semget
+63	32	semop				sys_semop
+64	32	semctl				compat_sys_old_semctl
+65	32	shmdt				sys_shmdt
+66	32	msgget				sys_msgget
+67	32	msgsnd				compat_sys_msgsnd
+68	32	msgrcv				compat_sys_msgrcv
+69	32	msgctl				compat_sys_old_msgctl
+70	32	fcntl				compat_sys_fcntl
+71	32	flock				sys_flock
+72	32	fsync				sys_fsync
+73	32	fdatasync			sys_fdatasync
+74	32	truncate			sys_truncate
+75	32	ftruncate			sys_ftruncate
+76	32	getdents			compat_sys_getdents
+77	32	getcwd				sys_getcwd
+78	32	chdir				sys_chdir
+79	32	fchdir				sys_fchdir
+80	32	rename				sys_rename
+81	32	mkdir				sys_mkdir
+82	32	rmdir				sys_rmdir
+83	32	creat				sys_creat
+84	32	link				sys_link
+85	32	unlink				sys_unlink
+86	32	symlink				sys_symlink
+87	32	readlink			sys_readlink
+88	32	chmod				sys_chmod
+89	32	fchmod				sys_fchmod
+90	32	chown				sys_chown
+91	32	fchown				sys_fchown
+92	32	lchown				sys_lchown
+93	32	umask				sys_umask
+94	32	gettimeofday			compat_sys_gettimeofday
+95	32	getrlimit			compat_sys_getrlimit
+96	32	getrusage			compat_sys_getrusage
+97	32	sysinfo				compat_sys_sysinfo
+98	32	times				compat_sys_times
+99	32	ptrace				compat_sys_ptrace
+100	32	getuid				sys_getuid
+101	32	syslog				sys_syslog
+102	32	getgid				sys_getgid
+103	32	setuid				sys_setuid
+104	32	setgid				sys_setgid
+105	32	geteuid				sys_geteuid
+106	32	getegid				sys_getegid
+107	32	setpgid				sys_setpgid
+108	32	getppid				sys_getppid
+109	32	getpgrp				sys_getpgrp
+110	32	setsid				sys_setsid
+111	32	setreuid			sys_setreuid
+112	32	setregid			sys_setregid
+113	32	getgroups			sys_getgroups
+114	32	setgroups			sys_setgroups
+115	32	setresuid			sys_setresuid
+116	32	getresuid			sys_getresuid
+117	32	setresgid			sys_setresgid
+118	32	getresgid			sys_getresgid
+119	32	getpgid				sys_getpgid
+120	32	setfsuid			sys_setfsuid
+121	32	setfsgid			sys_setfsgid
+122	32	getsid				sys_getsid
+123	32	capget				sys_capget
+124	32	capset				sys_capset
+125	32	rt_sigpending			compat_sys_rt_sigpending
+126	32	rt_sigtimedwait			compat_sys_rt_sigtimedwait_time32
+127	32	rt_sigqueueinfo			compat_sys_rt_sigqueueinfo
+128	32	rt_sigsuspend			compat_sys_rt_sigsuspend
+129	32	sigaltstack			compat_sys_sigaltstack
+130	32	utime				sys_utime32
+131	32	mknod				sys_mknod
+132	32	personality			sys_32_personality
+133	32	ustat				compat_sys_ustat
+134	32	statfs				compat_sys_statfs
+135	32	fstatfs				compat_sys_fstatfs
+136	32	sysfs				sys_sysfs
+137	32	getpriority			sys_getpriority
+138	32	setpriority			sys_setpriority
+139	32	sched_setparam			sys_sched_setparam
+140	32	sched_getparam			sys_sched_getparam
+141	32	sched_setscheduler		sys_sched_setscheduler
+142	32	sched_getscheduler		sys_sched_getscheduler
+143	32	sched_get_priority_max		sys_sched_get_priority_max
+144	32	sched_get_priority_min		sys_sched_get_priority_min
+145	32	sched_rr_get_interval		sys_sched_rr_get_interval_time32
+146	32	mlock				sys_mlock
+147	32	munlock				sys_munlock
+148	32	mlockall			sys_mlockall
+149	32	munlockall			sys_munlockall
+150	32	vhangup				sys_vhangup
+151	32	pivot_root			sys_pivot_root
+152	32	_sysctl				sys_ni_syscall
+153	32	prctl				sys_prctl
+154	32	adjtimex			sys_adjtimex_time32
+155	32	setrlimit			compat_sys_setrlimit
+156	32	chroot				sys_chroot
+157	32	sync				sys_sync
+158	32	acct				sys_acct
+159	32	settimeofday			compat_sys_settimeofday
+160	32	mount				sys_mount
+161	32	umount2				sys_umount
+162	32	swapon				sys_swapon
+163	32	swapoff				sys_swapoff
+164	32	reboot				sys_reboot
+165	32	sethostname			sys_sethostname
+166	32	setdomainname			sys_setdomainname
+167	32	create_module			sys_ni_syscall
+168	32	init_module			sys_init_module
+169	32	delete_module			sys_delete_module
+170	32	get_kernel_syms			sys_ni_syscall
+171	32	query_module			sys_ni_syscall
+172	32	quotactl			sys_quotactl
+173	32	nfsservctl			sys_ni_syscall
+174	32	getpmsg				sys_ni_syscall
+175	32	putpmsg				sys_ni_syscall
+176	32	afs_syscall			sys_ni_syscall
 # 177 reserved for security
-177	n32	reserved177			sys_ni_syscall
-178	n32	gettid				sys_gettid
-179	n32	readahead			sys_readahead
-180	n32	setxattr			sys_setxattr
-181	n32	lsetxattr			sys_lsetxattr
-182	n32	fsetxattr			sys_fsetxattr
-183	n32	getxattr			sys_getxattr
-184	n32	lgetxattr			sys_lgetxattr
-185	n32	fgetxattr			sys_fgetxattr
-186	n32	listxattr			sys_listxattr
-187	n32	llistxattr			sys_llistxattr
-188	n32	flistxattr			sys_flistxattr
-189	n32	removexattr			sys_removexattr
-190	n32	lremovexattr			sys_lremovexattr
-191	n32	fremovexattr			sys_fremovexattr
-192	n32	tkill				sys_tkill
-193	n32	reserved193			sys_ni_syscall
-194	n32	futex				sys_futex_time32
-195	n32	sched_setaffinity		compat_sys_sched_setaffinity
-196	n32	sched_getaffinity		compat_sys_sched_getaffinity
-197	n32	cacheflush			sys_cacheflush
-198	n32	cachectl			sys_cachectl
-199	n32	sysmips				__sys_sysmips
-200	n32	io_setup			compat_sys_io_setup
-201	n32	io_destroy			sys_io_destroy
-202	n32	io_getevents			sys_io_getevents_time32
-203	n32	io_submit			compat_sys_io_submit
-204	n32	io_cancel			sys_io_cancel
-205	n32	exit_group			sys_exit_group
-206	n32	lookup_dcookie			sys_ni_syscall
-207	n32	epoll_create			sys_epoll_create
-208	n32	epoll_ctl			sys_epoll_ctl
-209	n32	epoll_wait			sys_epoll_wait
-210	n32	remap_file_pages		sys_remap_file_pages
-211	n32	rt_sigreturn			sysn32_rt_sigreturn
-212	n32	fcntl64				compat_sys_fcntl64
-213	n32	set_tid_address			sys_set_tid_address
-214	n32	restart_syscall			sys_restart_syscall
-215	n32	semtimedop			sys_semtimedop_time32
-216	n32	fadvise64			sys_fadvise64_64
-217	n32	statfs64			compat_sys_statfs64
-218	n32	fstatfs64			compat_sys_fstatfs64
-219	n32	sendfile64			sys_sendfile64
-220	n32	timer_create			compat_sys_timer_create
-221	n32	timer_settime			sys_timer_settime32
-222	n32	timer_gettime			sys_timer_gettime32
-223	n32	timer_getoverrun		sys_timer_getoverrun
-224	n32	timer_delete			sys_timer_delete
-225	n32	clock_settime			sys_clock_settime32
-226	n32	clock_gettime			sys_clock_gettime32
-227	n32	clock_getres			sys_clock_getres_time32
-228	n32	clock_nanosleep			sys_clock_nanosleep_time32
-229	n32	tgkill				sys_tgkill
-230	n32	utimes				sys_utimes_time32
-231	n32	mbind				sys_mbind
-232	n32	get_mempolicy			sys_get_mempolicy
-233	n32	set_mempolicy			sys_set_mempolicy
-234	n32	mq_open				compat_sys_mq_open
-235	n32	mq_unlink			sys_mq_unlink
-236	n32	mq_timedsend			sys_mq_timedsend_time32
-237	n32	mq_timedreceive			sys_mq_timedreceive_time32
-238	n32	mq_notify			compat_sys_mq_notify
-239	n32	mq_getsetattr			compat_sys_mq_getsetattr
-240	n32	vserver				sys_ni_syscall
-241	n32	waitid				compat_sys_waitid
+177	32	reserved177			sys_ni_syscall
+178	32	gettid				sys_gettid
+179	32	readahead			sys_readahead
+180	32	setxattr			sys_setxattr
+181	32	lsetxattr			sys_lsetxattr
+182	32	fsetxattr			sys_fsetxattr
+183	32	getxattr			sys_getxattr
+184	32	lgetxattr			sys_lgetxattr
+185	32	fgetxattr			sys_fgetxattr
+186	32	listxattr			sys_listxattr
+187	32	llistxattr			sys_llistxattr
+188	32	flistxattr			sys_flistxattr
+189	32	removexattr			sys_removexattr
+190	32	lremovexattr			sys_lremovexattr
+191	32	fremovexattr			sys_fremovexattr
+192	32	tkill				sys_tkill
+193	32	reserved193			sys_ni_syscall
+194	32	futex				sys_futex_time32
+195	32	sched_setaffinity		compat_sys_sched_setaffinity
+196	32	sched_getaffinity		compat_sys_sched_getaffinity
+197	32	cacheflush			sys_cacheflush
+198	32	cachectl			sys_cachectl
+199	32	sysmips				__sys_sysmips
+200	32	io_setup			compat_sys_io_setup
+201	32	io_destroy			sys_io_destroy
+202	32	io_getevents			sys_io_getevents_time32
+203	32	io_submit			compat_sys_io_submit
+204	32	io_cancel			sys_io_cancel
+205	32	exit_group			sys_exit_group
+206	32	lookup_dcookie			sys_ni_syscall
+207	32	epoll_create			sys_epoll_create
+208	32	epoll_ctl			sys_epoll_ctl
+209	32	epoll_wait			sys_epoll_wait
+210	32	remap_file_pages		sys_remap_file_pages
+211	32	rt_sigreturn			sysn32_rt_sigreturn
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
+234	32	mq_open				compat_sys_mq_open
+235	32	mq_unlink			sys_mq_unlink
+236	32	mq_timedsend			sys_mq_timedsend_time32
+237	32	mq_timedreceive			sys_mq_timedreceive_time32
+238	32	mq_notify			compat_sys_mq_notify
+239	32	mq_getsetattr			compat_sys_mq_getsetattr
+240	32	vserver				sys_ni_syscall
+241	32	waitid				compat_sys_waitid
 # 242 was sys_setaltroot
-243	n32	add_key				sys_add_key
-244	n32	request_key			sys_request_key
-245	n32	keyctl				compat_sys_keyctl
-246	n32	set_thread_area			sys_set_thread_area
-247	n32	inotify_init			sys_inotify_init
-248	n32	inotify_add_watch		sys_inotify_add_watch
-249	n32	inotify_rm_watch		sys_inotify_rm_watch
-250	n32	migrate_pages			sys_migrate_pages
-251	n32	openat				sys_openat
-252	n32	mkdirat				sys_mkdirat
-253	n32	mknodat				sys_mknodat
-254	n32	fchownat			sys_fchownat
-255	n32	futimesat			sys_futimesat_time32
-256	n32	newfstatat			sys_newfstatat
-257	n32	unlinkat			sys_unlinkat
-258	n32	renameat			sys_renameat
-259	n32	linkat				sys_linkat
-260	n32	symlinkat			sys_symlinkat
-261	n32	readlinkat			sys_readlinkat
-262	n32	fchmodat			sys_fchmodat
-263	n32	faccessat			sys_faccessat
-264	n32	pselect6			compat_sys_pselect6_time32
-265	n32	ppoll				compat_sys_ppoll_time32
-266	n32	unshare				sys_unshare
-267	n32	splice				sys_splice
-268	n32	sync_file_range			sys_sync_file_range
-269	n32	tee				sys_tee
-270	n32	vmsplice			sys_vmsplice
-271	n32	move_pages			sys_move_pages
-272	n32	set_robust_list			compat_sys_set_robust_list
-273	n32	get_robust_list			compat_sys_get_robust_list
-274	n32	kexec_load			compat_sys_kexec_load
-275	n32	getcpu				sys_getcpu
-276	n32	epoll_pwait			compat_sys_epoll_pwait
-277	n32	ioprio_set			sys_ioprio_set
-278	n32	ioprio_get			sys_ioprio_get
-279	n32	utimensat			sys_utimensat_time32
-280	n32	signalfd			compat_sys_signalfd
-281	n32	timerfd				sys_ni_syscall
-282	n32	eventfd				sys_eventfd
-283	n32	fallocate			sys_fallocate
-284	n32	timerfd_create			sys_timerfd_create
-285	n32	timerfd_gettime			sys_timerfd_gettime32
-286	n32	timerfd_settime			sys_timerfd_settime32
-287	n32	signalfd4			compat_sys_signalfd4
-288	n32	eventfd2			sys_eventfd2
-289	n32	epoll_create1			sys_epoll_create1
-290	n32	dup3				sys_dup3
-291	n32	pipe2				sys_pipe2
-292	n32	inotify_init1			sys_inotify_init1
-293	n32	preadv				compat_sys_preadv
-294	n32	pwritev				compat_sys_pwritev
-295	n32	rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
-296	n32	perf_event_open			sys_perf_event_open
-297	n32	accept4				sys_accept4
-298	n32	recvmmsg			compat_sys_recvmmsg_time32
-299	n32	getdents64			sys_getdents64
-300	n32	fanotify_init			sys_fanotify_init
-301	n32	fanotify_mark			sys_fanotify_mark
-302	n32	prlimit64			sys_prlimit64
-303	n32	name_to_handle_at		sys_name_to_handle_at
-304	n32	open_by_handle_at		sys_open_by_handle_at
-305	n32	clock_adjtime			sys_clock_adjtime32
-306	n32	syncfs				sys_syncfs
-307	n32	sendmmsg			compat_sys_sendmmsg
-308	n32	setns				sys_setns
-309	n32	process_vm_readv		sys_process_vm_readv
-310	n32	process_vm_writev		sys_process_vm_writev
-311	n32	kcmp				sys_kcmp
-312	n32	finit_module			sys_finit_module
-313	n32	sched_setattr			sys_sched_setattr
-314	n32	sched_getattr			sys_sched_getattr
-315	n32	renameat2			sys_renameat2
-316	n32	seccomp				sys_seccomp
-317	n32	getrandom			sys_getrandom
-318	n32	memfd_create			sys_memfd_create
-319	n32	bpf				sys_bpf
-320	n32	execveat			compat_sys_execveat
-321	n32	userfaultfd			sys_userfaultfd
-322	n32	membarrier			sys_membarrier
-323	n32	mlock2				sys_mlock2
-324	n32	copy_file_range			sys_copy_file_range
-325	n32	preadv2				compat_sys_preadv2
-326	n32	pwritev2			compat_sys_pwritev2
-327	n32	pkey_mprotect			sys_pkey_mprotect
-328	n32	pkey_alloc			sys_pkey_alloc
-329	n32	pkey_free			sys_pkey_free
-330	n32	statx				sys_statx
-331	n32	rseq				sys_rseq
-332	n32	io_pgetevents			compat_sys_io_pgetevents
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
+295	32	rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
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
+403	32	clock_gettime64			sys_clock_gettime
+404	32	clock_settime64			sys_clock_settime
+405	32	clock_adjtime64			sys_clock_adjtime
+406	32	clock_getres_time64		sys_clock_getres
+407	32	clock_nanosleep_time64		sys_clock_nanosleep
+408	32	timer_gettime64			sys_timer_gettime
+409	32	timer_settime64			sys_timer_settime
+410	32	timerfd_gettime64		sys_timerfd_gettime
+411	32	timerfd_settime64		sys_timerfd_settime
+412	32	utimensat_time64		sys_utimensat
+413	32	pselect6_time64			compat_sys_pselect6_time64
+414	32	ppoll_time64			compat_sys_ppoll_time64
+416	32	io_pgetevents_time64		compat_sys_io_pgetevents_time64
+417	32	recvmmsg_time64			compat_sys_recvmmsg_time64
+418	32	mq_timedsend_time64		sys_mq_timedsend
+419	32	mq_timedreceive_time64		sys_mq_timedreceive
+420	32	semtimedop_time64		sys_semtimedop
+421	32	rt_sigtimedwait_time64		compat_sys_rt_sigtimedwait_time64
+422	32	futex_time64			sys_futex
+423	32	sched_rr_get_interval_time64	sys_sched_rr_get_interval
+424	32	pidfd_send_signal		sys_pidfd_send_signal
+425	32	io_uring_setup			sys_io_uring_setup
+426	32	io_uring_enter			sys_io_uring_enter
+427	32	io_uring_register		sys_io_uring_register
+428	32	open_tree			sys_open_tree
+429	32	move_mount			sys_move_mount
+430	32	fsopen				sys_fsopen
+431	32	fsconfig			sys_fsconfig
+432	32	fsmount				sys_fsmount
+433	32	fspick				sys_fspick
+434	32	pidfd_open			sys_pidfd_open
+435	32	clone3				__sys_clone3
+436	32	close_range			sys_close_range
+437	32	openat2				sys_openat2
+438	32	pidfd_getfd			sys_pidfd_getfd
+439	32	faccessat2			sys_faccessat2
+440	32	process_madvise			sys_process_madvise
+441	32	epoll_pwait2			compat_sys_epoll_pwait2
+442	32	mount_setattr			sys_mount_setattr
+443	32	quotactl_fd			sys_quotactl_fd
+444	32	landlock_create_ruleset		sys_landlock_create_ruleset
+445	32	landlock_add_rule		sys_landlock_add_rule
+446	32	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
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
+448	32	process_mrelease		sys_process_mrelease
+449	32	futex_waitv			sys_futex_waitv
+450	32	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	32	cachestat			sys_cachestat
+452	32	fchmodat2			sys_fchmodat2
+453	32	map_shadow_stack		sys_map_shadow_stack
+454	32	futex_wake			sys_futex_wake
+455	32	futex_wait			sys_futex_wait
+456	32	futex_requeue			sys_futex_requeue
+457	32	statmount			sys_statmount
+458	32	listmount			sys_listmount
+459	32	lsm_get_self_attr		sys_lsm_get_self_attr
+460	32	lsm_set_self_attr		sys_lsm_set_self_attr
+461	32	lsm_list_modules		sys_lsm_list_modules
+462	32	mseal				sys_mseal
+463	32	setxattrat			sys_setxattrat
+464	32	getxattrat			sys_getxattrat
+465	32	listxattrat			sys_listxattrat
+466	32	removexattrat			sys_removexattrat
+467	32	open_tree_attr			sys_open_tree_attr
+468	32	file_getattr			sys_file_getattr
+469	32	file_setattr			sys_file_setattr
+470	32	listns				sys_listns
+471	32	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 630aab9e5425..4bb530387824 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -5,384 +5,384 @@
 # The format is:
 # <number> <abi> <name> <entry point>
 #
-# The <abi> is always "n64" for this file.
+# The <abi> is always "64" for this file.
 #
-0	n64	read				sys_read
-1	n64	write				sys_write
-2	n64	open				sys_open
-3	n64	close				sys_close
-4	n64	stat				sys_newstat
-5	n64	fstat				sys_newfstat
-6	n64	lstat				sys_newlstat
-7	n64	poll				sys_poll
-8	n64	lseek				sys_lseek
-9	n64	mmap				sys_mips_mmap
-10	n64	mprotect			sys_mprotect
-11	n64	munmap				sys_munmap
-12	n64	brk				sys_brk
-13	n64	rt_sigaction			sys_rt_sigaction
-14	n64	rt_sigprocmask			sys_rt_sigprocmask
-15	n64	ioctl				sys_ioctl
-16	n64	pread64				sys_pread64
-17	n64	pwrite64			sys_pwrite64
-18	n64	readv				sys_readv
-19	n64	writev				sys_writev
-20	n64	access				sys_access
-21	n64	pipe				sysm_pipe
-22	n64	_newselect			sys_select
-23	n64	sched_yield			sys_sched_yield
-24	n64	mremap				sys_mremap
-25	n64	msync				sys_msync
-26	n64	mincore				sys_mincore
-27	n64	madvise				sys_madvise
-28	n64	shmget				sys_shmget
-29	n64	shmat				sys_shmat
-30	n64	shmctl				sys_old_shmctl
-31	n64	dup				sys_dup
-32	n64	dup2				sys_dup2
-33	n64	pause				sys_pause
-34	n64	nanosleep			sys_nanosleep
-35	n64	getitimer			sys_getitimer
-36	n64	setitimer			sys_setitimer
-37	n64	alarm				sys_alarm
-38	n64	getpid				sys_getpid
-39	n64	sendfile			sys_sendfile64
-40	n64	socket				sys_socket
-41	n64	connect				sys_connect
-42	n64	accept				sys_accept
-43	n64	sendto				sys_sendto
-44	n64	recvfrom			sys_recvfrom
-45	n64	sendmsg				sys_sendmsg
-46	n64	recvmsg				sys_recvmsg
-47	n64	shutdown			sys_shutdown
-48	n64	bind				sys_bind
-49	n64	listen				sys_listen
-50	n64	getsockname			sys_getsockname
-51	n64	getpeername			sys_getpeername
-52	n64	socketpair			sys_socketpair
-53	n64	setsockopt			sys_setsockopt
-54	n64	getsockopt			sys_getsockopt
-55	n64	clone				__sys_clone
-56	n64	fork				__sys_fork
-57	n64	execve				sys_execve
-58	n64	exit				sys_exit
-59	n64	wait4				sys_wait4
-60	n64	kill				sys_kill
-61	n64	uname				sys_newuname
-62	n64	semget				sys_semget
-63	n64	semop				sys_semop
-64	n64	semctl				sys_old_semctl
-65	n64	shmdt				sys_shmdt
-66	n64	msgget				sys_msgget
-67	n64	msgsnd				sys_msgsnd
-68	n64	msgrcv				sys_msgrcv
-69	n64	msgctl				sys_old_msgctl
-70	n64	fcntl				sys_fcntl
-71	n64	flock				sys_flock
-72	n64	fsync				sys_fsync
-73	n64	fdatasync			sys_fdatasync
-74	n64	truncate			sys_truncate
-75	n64	ftruncate			sys_ftruncate
-76	n64	getdents			sys_getdents
-77	n64	getcwd				sys_getcwd
-78	n64	chdir				sys_chdir
-79	n64	fchdir				sys_fchdir
-80	n64	rename				sys_rename
-81	n64	mkdir				sys_mkdir
-82	n64	rmdir				sys_rmdir
-83	n64	creat				sys_creat
-84	n64	link				sys_link
-85	n64	unlink				sys_unlink
-86	n64	symlink				sys_symlink
-87	n64	readlink			sys_readlink
-88	n64	chmod				sys_chmod
-89	n64	fchmod				sys_fchmod
-90	n64	chown				sys_chown
-91	n64	fchown				sys_fchown
-92	n64	lchown				sys_lchown
-93	n64	umask				sys_umask
-94	n64	gettimeofday			sys_gettimeofday
-95	n64	getrlimit			sys_getrlimit
-96	n64	getrusage			sys_getrusage
-97	n64	sysinfo				sys_sysinfo
-98	n64	times				sys_times
-99	n64	ptrace				sys_ptrace
-100	n64	getuid				sys_getuid
-101	n64	syslog				sys_syslog
-102	n64	getgid				sys_getgid
-103	n64	setuid				sys_setuid
-104	n64	setgid				sys_setgid
-105	n64	geteuid				sys_geteuid
-106	n64	getegid				sys_getegid
-107	n64	setpgid				sys_setpgid
-108	n64	getppid				sys_getppid
-109	n64	getpgrp				sys_getpgrp
-110	n64	setsid				sys_setsid
-111	n64	setreuid			sys_setreuid
-112	n64	setregid			sys_setregid
-113	n64	getgroups			sys_getgroups
-114	n64	setgroups			sys_setgroups
-115	n64	setresuid			sys_setresuid
-116	n64	getresuid			sys_getresuid
-117	n64	setresgid			sys_setresgid
-118	n64	getresgid			sys_getresgid
-119	n64	getpgid				sys_getpgid
-120	n64	setfsuid			sys_setfsuid
-121	n64	setfsgid			sys_setfsgid
-122	n64	getsid				sys_getsid
-123	n64	capget				sys_capget
-124	n64	capset				sys_capset
-125	n64	rt_sigpending			sys_rt_sigpending
-126	n64	rt_sigtimedwait			sys_rt_sigtimedwait
-127	n64	rt_sigqueueinfo			sys_rt_sigqueueinfo
-128	n64	rt_sigsuspend			sys_rt_sigsuspend
-129	n64	sigaltstack			sys_sigaltstack
-130	n64	utime				sys_utime
-131	n64	mknod				sys_mknod
-132	n64	personality			sys_personality
-133	n64	ustat				sys_ustat
-134	n64	statfs				sys_statfs
-135	n64	fstatfs				sys_fstatfs
-136	n64	sysfs				sys_sysfs
-137	n64	getpriority			sys_getpriority
-138	n64	setpriority			sys_setpriority
-139	n64	sched_setparam			sys_sched_setparam
-140	n64	sched_getparam			sys_sched_getparam
-141	n64	sched_setscheduler		sys_sched_setscheduler
-142	n64	sched_getscheduler		sys_sched_getscheduler
-143	n64	sched_get_priority_max		sys_sched_get_priority_max
-144	n64	sched_get_priority_min		sys_sched_get_priority_min
-145	n64	sched_rr_get_interval		sys_sched_rr_get_interval
-146	n64	mlock				sys_mlock
-147	n64	munlock				sys_munlock
-148	n64	mlockall			sys_mlockall
-149	n64	munlockall			sys_munlockall
-150	n64	vhangup				sys_vhangup
-151	n64	pivot_root			sys_pivot_root
-152	n64	_sysctl				sys_ni_syscall
-153	n64	prctl				sys_prctl
-154	n64	adjtimex			sys_adjtimex
-155	n64	setrlimit			sys_setrlimit
-156	n64	chroot				sys_chroot
-157	n64	sync				sys_sync
-158	n64	acct				sys_acct
-159	n64	settimeofday			sys_settimeofday
-160	n64	mount				sys_mount
-161	n64	umount2				sys_umount
-162	n64	swapon				sys_swapon
-163	n64	swapoff				sys_swapoff
-164	n64	reboot				sys_reboot
-165	n64	sethostname			sys_sethostname
-166	n64	setdomainname			sys_setdomainname
-167	n64	create_module			sys_ni_syscall
-168	n64	init_module			sys_init_module
-169	n64	delete_module			sys_delete_module
-170	n64	get_kernel_syms			sys_ni_syscall
-171	n64	query_module			sys_ni_syscall
-172	n64	quotactl			sys_quotactl
-173	n64	nfsservctl			sys_ni_syscall
-174	n64	getpmsg				sys_ni_syscall
-175	n64	putpmsg				sys_ni_syscall
-176	n64	afs_syscall			sys_ni_syscall
+0	64	read				sys_read
+1	64	write				sys_write
+2	64	open				sys_open
+3	64	close				sys_close
+4	64	stat				sys_newstat
+5	64	fstat				sys_newfstat
+6	64	lstat				sys_newlstat
+7	64	poll				sys_poll
+8	64	lseek				sys_lseek
+9	64	mmap				sys_mips_mmap
+10	64	mprotect			sys_mprotect
+11	64	munmap				sys_munmap
+12	64	brk				sys_brk
+13	64	rt_sigaction			sys_rt_sigaction
+14	64	rt_sigprocmask			sys_rt_sigprocmask
+15	64	ioctl				sys_ioctl
+16	64	pread64				sys_pread64
+17	64	pwrite64			sys_pwrite64
+18	64	readv				sys_readv
+19	64	writev				sys_writev
+20	64	access				sys_access
+21	64	pipe				sysm_pipe
+22	64	_newselect			sys_select
+23	64	sched_yield			sys_sched_yield
+24	64	mremap				sys_mremap
+25	64	msync				sys_msync
+26	64	mincore				sys_mincore
+27	64	madvise				sys_madvise
+28	64	shmget				sys_shmget
+29	64	shmat				sys_shmat
+30	64	shmctl				sys_old_shmctl
+31	64	dup				sys_dup
+32	64	dup2				sys_dup2
+33	64	pause				sys_pause
+34	64	nanosleep			sys_nanosleep
+35	64	getitimer			sys_getitimer
+36	64	setitimer			sys_setitimer
+37	64	alarm				sys_alarm
+38	64	getpid				sys_getpid
+39	64	sendfile			sys_sendfile64
+40	64	socket				sys_socket
+41	64	connect				sys_connect
+42	64	accept				sys_accept
+43	64	sendto				sys_sendto
+44	64	recvfrom			sys_recvfrom
+45	64	sendmsg				sys_sendmsg
+46	64	recvmsg				sys_recvmsg
+47	64	shutdown			sys_shutdown
+48	64	bind				sys_bind
+49	64	listen				sys_listen
+50	64	getsockname			sys_getsockname
+51	64	getpeername			sys_getpeername
+52	64	socketpair			sys_socketpair
+53	64	setsockopt			sys_setsockopt
+54	64	getsockopt			sys_getsockopt
+55	64	clone				__sys_clone
+56	64	fork				__sys_fork
+57	64	execve				sys_execve
+58	64	exit				sys_exit
+59	64	wait4				sys_wait4
+60	64	kill				sys_kill
+61	64	uname				sys_newuname
+62	64	semget				sys_semget
+63	64	semop				sys_semop
+64	64	semctl				sys_old_semctl
+65	64	shmdt				sys_shmdt
+66	64	msgget				sys_msgget
+67	64	msgsnd				sys_msgsnd
+68	64	msgrcv				sys_msgrcv
+69	64	msgctl				sys_old_msgctl
+70	64	fcntl				sys_fcntl
+71	64	flock				sys_flock
+72	64	fsync				sys_fsync
+73	64	fdatasync			sys_fdatasync
+74	64	truncate			sys_truncate
+75	64	ftruncate			sys_ftruncate
+76	64	getdents			sys_getdents
+77	64	getcwd				sys_getcwd
+78	64	chdir				sys_chdir
+79	64	fchdir				sys_fchdir
+80	64	rename				sys_rename
+81	64	mkdir				sys_mkdir
+82	64	rmdir				sys_rmdir
+83	64	creat				sys_creat
+84	64	link				sys_link
+85	64	unlink				sys_unlink
+86	64	symlink				sys_symlink
+87	64	readlink			sys_readlink
+88	64	chmod				sys_chmod
+89	64	fchmod				sys_fchmod
+90	64	chown				sys_chown
+91	64	fchown				sys_fchown
+92	64	lchown				sys_lchown
+93	64	umask				sys_umask
+94	64	gettimeofday			sys_gettimeofday
+95	64	getrlimit			sys_getrlimit
+96	64	getrusage			sys_getrusage
+97	64	sysinfo				sys_sysinfo
+98	64	times				sys_times
+99	64	ptrace				sys_ptrace
+100	64	getuid				sys_getuid
+101	64	syslog				sys_syslog
+102	64	getgid				sys_getgid
+103	64	setuid				sys_setuid
+104	64	setgid				sys_setgid
+105	64	geteuid				sys_geteuid
+106	64	getegid				sys_getegid
+107	64	setpgid				sys_setpgid
+108	64	getppid				sys_getppid
+109	64	getpgrp				sys_getpgrp
+110	64	setsid				sys_setsid
+111	64	setreuid			sys_setreuid
+112	64	setregid			sys_setregid
+113	64	getgroups			sys_getgroups
+114	64	setgroups			sys_setgroups
+115	64	setresuid			sys_setresuid
+116	64	getresuid			sys_getresuid
+117	64	setresgid			sys_setresgid
+118	64	getresgid			sys_getresgid
+119	64	getpgid				sys_getpgid
+120	64	setfsuid			sys_setfsuid
+121	64	setfsgid			sys_setfsgid
+122	64	getsid				sys_getsid
+123	64	capget				sys_capget
+124	64	capset				sys_capset
+125	64	rt_sigpending			sys_rt_sigpending
+126	64	rt_sigtimedwait			sys_rt_sigtimedwait
+127	64	rt_sigqueueinfo			sys_rt_sigqueueinfo
+128	64	rt_sigsuspend			sys_rt_sigsuspend
+129	64	sigaltstack			sys_sigaltstack
+130	64	utime				sys_utime
+131	64	mknod				sys_mknod
+132	64	personality			sys_personality
+133	64	ustat				sys_ustat
+134	64	statfs				sys_statfs
+135	64	fstatfs				sys_fstatfs
+136	64	sysfs				sys_sysfs
+137	64	getpriority			sys_getpriority
+138	64	setpriority			sys_setpriority
+139	64	sched_setparam			sys_sched_setparam
+140	64	sched_getparam			sys_sched_getparam
+141	64	sched_setscheduler		sys_sched_setscheduler
+142	64	sched_getscheduler		sys_sched_getscheduler
+143	64	sched_get_priority_max		sys_sched_get_priority_max
+144	64	sched_get_priority_min		sys_sched_get_priority_min
+145	64	sched_rr_get_interval		sys_sched_rr_get_interval
+146	64	mlock				sys_mlock
+147	64	munlock				sys_munlock
+148	64	mlockall			sys_mlockall
+149	64	munlockall			sys_munlockall
+150	64	vhangup				sys_vhangup
+151	64	pivot_root			sys_pivot_root
+152	64	_sysctl				sys_ni_syscall
+153	64	prctl				sys_prctl
+154	64	adjtimex			sys_adjtimex
+155	64	setrlimit			sys_setrlimit
+156	64	chroot				sys_chroot
+157	64	sync				sys_sync
+158	64	acct				sys_acct
+159	64	settimeofday			sys_settimeofday
+160	64	mount				sys_mount
+161	64	umount2				sys_umount
+162	64	swapon				sys_swapon
+163	64	swapoff				sys_swapoff
+164	64	reboot				sys_reboot
+165	64	sethostname			sys_sethostname
+166	64	setdomainname			sys_setdomainname
+167	64	create_module			sys_ni_syscall
+168	64	init_module			sys_init_module
+169	64	delete_module			sys_delete_module
+170	64	get_kernel_syms			sys_ni_syscall
+171	64	query_module			sys_ni_syscall
+172	64	quotactl			sys_quotactl
+173	64	nfsservctl			sys_ni_syscall
+174	64	getpmsg				sys_ni_syscall
+175	64	putpmsg				sys_ni_syscall
+176	64	afs_syscall			sys_ni_syscall
 # 177 reserved for security
-177	n64	reserved177			sys_ni_syscall
-178	n64	gettid				sys_gettid
-179	n64	readahead			sys_readahead
-180	n64	setxattr			sys_setxattr
-181	n64	lsetxattr			sys_lsetxattr
-182	n64	fsetxattr			sys_fsetxattr
-183	n64	getxattr			sys_getxattr
-184	n64	lgetxattr			sys_lgetxattr
-185	n64	fgetxattr			sys_fgetxattr
-186	n64	listxattr			sys_listxattr
-187	n64	llistxattr			sys_llistxattr
-188	n64	flistxattr			sys_flistxattr
-189	n64	removexattr			sys_removexattr
-190	n64	lremovexattr			sys_lremovexattr
-191	n64	fremovexattr			sys_fremovexattr
-192	n64	tkill				sys_tkill
-193	n64	reserved193			sys_ni_syscall
-194	n64	futex				sys_futex
-195	n64	sched_setaffinity		sys_sched_setaffinity
-196	n64	sched_getaffinity		sys_sched_getaffinity
-197	n64	cacheflush			sys_cacheflush
-198	n64	cachectl			sys_cachectl
-199	n64	sysmips				__sys_sysmips
-200	n64	io_setup			sys_io_setup
-201	n64	io_destroy			sys_io_destroy
-202	n64	io_getevents			sys_io_getevents
-203	n64	io_submit			sys_io_submit
-204	n64	io_cancel			sys_io_cancel
-205	n64	exit_group			sys_exit_group
-206	n64	lookup_dcookie			sys_ni_syscall
-207	n64	epoll_create			sys_epoll_create
-208	n64	epoll_ctl			sys_epoll_ctl
-209	n64	epoll_wait			sys_epoll_wait
-210	n64	remap_file_pages		sys_remap_file_pages
-211	n64	rt_sigreturn			sys_rt_sigreturn
-212	n64	set_tid_address			sys_set_tid_address
-213	n64	restart_syscall			sys_restart_syscall
-214	n64	semtimedop			sys_semtimedop
-215	n64	fadvise64			sys_fadvise64_64
-216	n64	timer_create			sys_timer_create
-217	n64	timer_settime			sys_timer_settime
-218	n64	timer_gettime			sys_timer_gettime
-219	n64	timer_getoverrun		sys_timer_getoverrun
-220	n64	timer_delete			sys_timer_delete
-221	n64	clock_settime			sys_clock_settime
-222	n64	clock_gettime			sys_clock_gettime
-223	n64	clock_getres			sys_clock_getres
-224	n64	clock_nanosleep			sys_clock_nanosleep
-225	n64	tgkill				sys_tgkill
-226	n64	utimes				sys_utimes
-227	n64	mbind				sys_mbind
-228	n64	get_mempolicy			sys_get_mempolicy
-229	n64	set_mempolicy			sys_set_mempolicy
-230	n64	mq_open				sys_mq_open
-231	n64	mq_unlink			sys_mq_unlink
-232	n64	mq_timedsend			sys_mq_timedsend
-233	n64	mq_timedreceive			sys_mq_timedreceive
-234	n64	mq_notify			sys_mq_notify
-235	n64	mq_getsetattr			sys_mq_getsetattr
-236	n64	vserver				sys_ni_syscall
-237	n64	waitid				sys_waitid
+177	64	reserved177			sys_ni_syscall
+178	64	gettid				sys_gettid
+179	64	readahead			sys_readahead
+180	64	setxattr			sys_setxattr
+181	64	lsetxattr			sys_lsetxattr
+182	64	fsetxattr			sys_fsetxattr
+183	64	getxattr			sys_getxattr
+184	64	lgetxattr			sys_lgetxattr
+185	64	fgetxattr			sys_fgetxattr
+186	64	listxattr			sys_listxattr
+187	64	llistxattr			sys_llistxattr
+188	64	flistxattr			sys_flistxattr
+189	64	removexattr			sys_removexattr
+190	64	lremovexattr			sys_lremovexattr
+191	64	fremovexattr			sys_fremovexattr
+192	64	tkill				sys_tkill
+193	64	reserved193			sys_ni_syscall
+194	64	futex				sys_futex
+195	64	sched_setaffinity		sys_sched_setaffinity
+196	64	sched_getaffinity		sys_sched_getaffinity
+197	64	cacheflush			sys_cacheflush
+198	64	cachectl			sys_cachectl
+199	64	sysmips				__sys_sysmips
+200	64	io_setup			sys_io_setup
+201	64	io_destroy			sys_io_destroy
+202	64	io_getevents			sys_io_getevents
+203	64	io_submit			sys_io_submit
+204	64	io_cancel			sys_io_cancel
+205	64	exit_group			sys_exit_group
+206	64	lookup_dcookie			sys_ni_syscall
+207	64	epoll_create			sys_epoll_create
+208	64	epoll_ctl			sys_epoll_ctl
+209	64	epoll_wait			sys_epoll_wait
+210	64	remap_file_pages		sys_remap_file_pages
+211	64	rt_sigreturn			sys_rt_sigreturn
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
 # 238 was sys_setaltroot
-239	n64	add_key				sys_add_key
-240	n64	request_key			sys_request_key
-241	n64	keyctl				sys_keyctl
-242	n64	set_thread_area			sys_set_thread_area
-243	n64	inotify_init			sys_inotify_init
-244	n64	inotify_add_watch		sys_inotify_add_watch
-245	n64	inotify_rm_watch		sys_inotify_rm_watch
-246	n64	migrate_pages			sys_migrate_pages
-247	n64	openat				sys_openat
-248	n64	mkdirat				sys_mkdirat
-249	n64	mknodat				sys_mknodat
-250	n64	fchownat			sys_fchownat
-251	n64	futimesat			sys_futimesat
-252	n64	newfstatat			sys_newfstatat
-253	n64	unlinkat			sys_unlinkat
-254	n64	renameat			sys_renameat
-255	n64	linkat				sys_linkat
-256	n64	symlinkat			sys_symlinkat
-257	n64	readlinkat			sys_readlinkat
-258	n64	fchmodat			sys_fchmodat
-259	n64	faccessat			sys_faccessat
-260	n64	pselect6			sys_pselect6
-261	n64	ppoll				sys_ppoll
-262	n64	unshare				sys_unshare
-263	n64	splice				sys_splice
-264	n64	sync_file_range			sys_sync_file_range
-265	n64	tee				sys_tee
-266	n64	vmsplice			sys_vmsplice
-267	n64	move_pages			sys_move_pages
-268	n64	set_robust_list			sys_set_robust_list
-269	n64	get_robust_list			sys_get_robust_list
-270	n64	kexec_load			sys_kexec_load
-271	n64	getcpu				sys_getcpu
-272	n64	epoll_pwait			sys_epoll_pwait
-273	n64	ioprio_set			sys_ioprio_set
-274	n64	ioprio_get			sys_ioprio_get
-275	n64	utimensat			sys_utimensat
-276	n64	signalfd			sys_signalfd
-277	n64	timerfd				sys_ni_syscall
-278	n64	eventfd				sys_eventfd
-279	n64	fallocate			sys_fallocate
-280	n64	timerfd_create			sys_timerfd_create
-281	n64	timerfd_gettime			sys_timerfd_gettime
-282	n64	timerfd_settime			sys_timerfd_settime
-283	n64	signalfd4			sys_signalfd4
-284	n64	eventfd2			sys_eventfd2
-285	n64	epoll_create1			sys_epoll_create1
-286	n64	dup3				sys_dup3
-287	n64	pipe2				sys_pipe2
-288	n64	inotify_init1			sys_inotify_init1
-289	n64	preadv				sys_preadv
-290	n64	pwritev				sys_pwritev
-291	n64	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo
-292	n64	perf_event_open			sys_perf_event_open
-293	n64	accept4				sys_accept4
-294	n64	recvmmsg			sys_recvmmsg
-295	n64	fanotify_init			sys_fanotify_init
-296	n64	fanotify_mark			sys_fanotify_mark
-297	n64	prlimit64			sys_prlimit64
-298	n64	name_to_handle_at		sys_name_to_handle_at
-299	n64	open_by_handle_at		sys_open_by_handle_at
-300	n64	clock_adjtime			sys_clock_adjtime
-301	n64	syncfs				sys_syncfs
-302	n64	sendmmsg			sys_sendmmsg
-303	n64	setns				sys_setns
-304	n64	process_vm_readv		sys_process_vm_readv
-305	n64	process_vm_writev		sys_process_vm_writev
-306	n64	kcmp				sys_kcmp
-307	n64	finit_module			sys_finit_module
-308	n64	getdents64			sys_getdents64
-309	n64	sched_setattr			sys_sched_setattr
-310	n64	sched_getattr			sys_sched_getattr
-311	n64	renameat2			sys_renameat2
-312	n64	seccomp				sys_seccomp
-313	n64	getrandom			sys_getrandom
-314	n64	memfd_create			sys_memfd_create
-315	n64	bpf				sys_bpf
-316	n64	execveat			sys_execveat
-317	n64	userfaultfd			sys_userfaultfd
-318	n64	membarrier			sys_membarrier
-319	n64	mlock2				sys_mlock2
-320	n64	copy_file_range			sys_copy_file_range
-321	n64	preadv2				sys_preadv2
-322	n64	pwritev2			sys_pwritev2
-323	n64	pkey_mprotect			sys_pkey_mprotect
-324	n64	pkey_alloc			sys_pkey_alloc
-325	n64	pkey_free			sys_pkey_free
-326	n64	statx				sys_statx
-327	n64	rseq				sys_rseq
-328	n64	io_pgetevents			sys_io_pgetevents
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
+424	64	pidfd_send_signal		sys_pidfd_send_signal
+425	64	io_uring_setup			sys_io_uring_setup
+426	64	io_uring_enter			sys_io_uring_enter
+427	64	io_uring_register		sys_io_uring_register
+428	64	open_tree			sys_open_tree
+429	64	move_mount			sys_move_mount
+430	64	fsopen				sys_fsopen
+431	64	fsconfig			sys_fsconfig
+432	64	fsmount				sys_fsmount
+433	64	fspick				sys_fspick
+434	64	pidfd_open			sys_pidfd_open
+435	64	clone3				__sys_clone3
+436	64	close_range			sys_close_range
+437	64	openat2				sys_openat2
+438	64	pidfd_getfd			sys_pidfd_getfd
+439	64	faccessat2			sys_faccessat2
+440	64	process_madvise			sys_process_madvise
+441	64	epoll_pwait2			sys_epoll_pwait2
+442	64	mount_setattr			sys_mount_setattr
+443	64	quotactl_fd			sys_quotactl_fd
+444	64	landlock_create_ruleset		sys_landlock_create_ruleset
+445	64	landlock_add_rule		sys_landlock_add_rule
+446	64	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
-448	n64	process_mrelease		sys_process_mrelease
-449	n64	futex_waitv			sys_futex_waitv
+448	64	process_mrelease		sys_process_mrelease
+449	64	futex_waitv			sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
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
+451	64	cachestat			sys_cachestat
+452	64	fchmodat2			sys_fchmodat2
+453	64	map_shadow_stack		sys_map_shadow_stack
+454	64	futex_wake			sys_futex_wake
+455	64	futex_wait			sys_futex_wait
+456	64	futex_requeue			sys_futex_requeue
+457	64	statmount			sys_statmount
+458	64	listmount			sys_listmount
+459	64	lsm_get_self_attr		sys_lsm_get_self_attr
+460	64	lsm_set_self_attr		sys_lsm_set_self_attr
+461	64	lsm_list_modules		sys_lsm_list_modules
+462	64	mseal				sys_mseal
+463	64	setxattrat			sys_setxattrat
+464	64	getxattrat			sys_getxattrat
+465	64	listxattrat			sys_listxattrat
+466	64	removexattrat			sys_removexattrat
+467	64	open_tree_attr			sys_open_tree_attr
+468	64	file_getattr			sys_file_getattr
+469	64	file_setattr			sys_file_setattr
+470	64	listns				sys_listns
+471	64	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 128653112284..ae547f217104 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -5,457 +5,457 @@
 # The format is:
 # <number> <abi> <name> <entry point> <compat entry point>
 #
-# The <abi> is always "o32" for this file.
+# The <abi> is always "32" for this file.
 #
-0	o32	syscall				sys_syscall			sys32_syscall
-1	o32	exit				sys_exit
-2	o32	fork				__sys_fork
-3	o32	read				sys_read
-4	o32	write				sys_write
-5	o32	open				sys_open			compat_sys_open
-6	o32	close				sys_close
-7	o32	waitpid				sys_waitpid
-8	o32	creat				sys_creat
-9	o32	link				sys_link
-10	o32	unlink				sys_unlink
-11	o32	execve				sys_execve			compat_sys_execve
-12	o32	chdir				sys_chdir
-13	o32	time				sys_time32
-14	o32	mknod				sys_mknod
-15	o32	chmod				sys_chmod
-16	o32	lchown				sys_lchown
-17	o32	break				sys_ni_syscall
+0	32	syscall				sys_syscall			sys32_syscall
+1	32	exit				sys_exit
+2	32	fork				__sys_fork
+3	32	read				sys_read
+4	32	write				sys_write
+5	32	open				sys_open			compat_sys_open
+6	32	close				sys_close
+7	32	waitpid				sys_waitpid
+8	32	creat				sys_creat
+9	32	link				sys_link
+10	32	unlink				sys_unlink
+11	32	execve				sys_execve			compat_sys_execve
+12	32	chdir				sys_chdir
+13	32	time				sys_time32
+14	32	mknod				sys_mknod
+15	32	chmod				sys_chmod
+16	32	lchown				sys_lchown
+17	32	break				sys_ni_syscall
 # 18 was sys_stat
-18	o32	unused18			sys_ni_syscall
-19	o32	lseek				sys_lseek			compat_sys_lseek
-20	o32	getpid				sys_getpid
-21	o32	mount				sys_mount
-22	o32	umount				sys_oldumount
-23	o32	setuid				sys_setuid
-24	o32	getuid				sys_getuid
-25	o32	stime				sys_stime32
-26	o32	ptrace				sys_ptrace			compat_sys_ptrace
-27	o32	alarm				sys_alarm
+18	32	unused18			sys_ni_syscall
+19	32	lseek				sys_lseek			compat_sys_lseek
+20	32	getpid				sys_getpid
+21	32	mount				sys_mount
+22	32	umount				sys_oldumount
+23	32	setuid				sys_setuid
+24	32	getuid				sys_getuid
+25	32	stime				sys_stime32
+26	32	ptrace				sys_ptrace			compat_sys_ptrace
+27	32	alarm				sys_alarm
 # 28 was sys_fstat
-28	o32	unused28			sys_ni_syscall
-29	o32	pause				sys_pause
-30	o32	utime				sys_utime32
-31	o32	stty				sys_ni_syscall
-32	o32	gtty				sys_ni_syscall
-33	o32	access				sys_access
-34	o32	nice				sys_nice
-35	o32	ftime				sys_ni_syscall
-36	o32	sync				sys_sync
-37	o32	kill				sys_kill
-38	o32	rename				sys_rename
-39	o32	mkdir				sys_mkdir
-40	o32	rmdir				sys_rmdir
-41	o32	dup				sys_dup
-42	o32	pipe				sysm_pipe
-43	o32	times				sys_times			compat_sys_times
-44	o32	prof				sys_ni_syscall
-45	o32	brk				sys_brk
-46	o32	setgid				sys_setgid
-47	o32	getgid				sys_getgid
-48	o32	signal				sys_ni_syscall
-49	o32	geteuid				sys_geteuid
-50	o32	getegid				sys_getegid
-51	o32	acct				sys_acct
-52	o32	umount2				sys_umount
-53	o32	lock				sys_ni_syscall
-54	o32	ioctl				sys_ioctl			compat_sys_ioctl
-55	o32	fcntl				sys_fcntl			compat_sys_fcntl
-56	o32	mpx				sys_ni_syscall
-57	o32	setpgid				sys_setpgid
-58	o32	ulimit				sys_ni_syscall
-59	o32	unused59			sys_olduname
-60	o32	umask				sys_umask
-61	o32	chroot				sys_chroot
-62	o32	ustat				sys_ustat			compat_sys_ustat
-63	o32	dup2				sys_dup2
-64	o32	getppid				sys_getppid
-65	o32	getpgrp				sys_getpgrp
-66	o32	setsid				sys_setsid
-67	o32	sigaction			sys_sigaction			sys_32_sigaction
-68	o32	sgetmask			sys_sgetmask
-69	o32	ssetmask			sys_ssetmask
-70	o32	setreuid			sys_setreuid
-71	o32	setregid			sys_setregid
-72	o32	sigsuspend			sys_sigsuspend			sys32_sigsuspend
-73	o32	sigpending			sys_sigpending			compat_sys_sigpending
-74	o32	sethostname			sys_sethostname
-75	o32	setrlimit			sys_setrlimit			compat_sys_setrlimit
-76	o32	getrlimit			sys_getrlimit			compat_sys_getrlimit
-77	o32	getrusage			sys_getrusage			compat_sys_getrusage
-78	o32	gettimeofday			sys_gettimeofday		compat_sys_gettimeofday
-79	o32	settimeofday			sys_settimeofday		compat_sys_settimeofday
-80	o32	getgroups			sys_getgroups
-81	o32	setgroups			sys_setgroups
+28	32	unused28			sys_ni_syscall
+29	32	pause				sys_pause
+30	32	utime				sys_utime32
+31	32	stty				sys_ni_syscall
+32	32	gtty				sys_ni_syscall
+33	32	access				sys_access
+34	32	nice				sys_nice
+35	32	ftime				sys_ni_syscall
+36	32	sync				sys_sync
+37	32	kill				sys_kill
+38	32	rename				sys_rename
+39	32	mkdir				sys_mkdir
+40	32	rmdir				sys_rmdir
+41	32	dup				sys_dup
+42	32	pipe				sysm_pipe
+43	32	times				sys_times			compat_sys_times
+44	32	prof				sys_ni_syscall
+45	32	brk				sys_brk
+46	32	setgid				sys_setgid
+47	32	getgid				sys_getgid
+48	32	signal				sys_ni_syscall
+49	32	geteuid				sys_geteuid
+50	32	getegid				sys_getegid
+51	32	acct				sys_acct
+52	32	umount2				sys_umount
+53	32	lock				sys_ni_syscall
+54	32	ioctl				sys_ioctl			compat_sys_ioctl
+55	32	fcntl				sys_fcntl			compat_sys_fcntl
+56	32	mpx				sys_ni_syscall
+57	32	setpgid				sys_setpgid
+58	32	ulimit				sys_ni_syscall
+59	32	unused59			sys_olduname
+60	32	umask				sys_umask
+61	32	chroot				sys_chroot
+62	32	ustat				sys_ustat			compat_sys_ustat
+63	32	dup2				sys_dup2
+64	32	getppid				sys_getppid
+65	32	getpgrp				sys_getpgrp
+66	32	setsid				sys_setsid
+67	32	sigaction			sys_sigaction			sys_32_sigaction
+68	32	sgetmask			sys_sgetmask
+69	32	ssetmask			sys_ssetmask
+70	32	setreuid			sys_setreuid
+71	32	setregid			sys_setregid
+72	32	sigsuspend			sys_sigsuspend			sys32_sigsuspend
+73	32	sigpending			sys_sigpending			compat_sys_sigpending
+74	32	sethostname			sys_sethostname
+75	32	setrlimit			sys_setrlimit			compat_sys_setrlimit
+76	32	getrlimit			sys_getrlimit			compat_sys_getrlimit
+77	32	getrusage			sys_getrusage			compat_sys_getrusage
+78	32	gettimeofday			sys_gettimeofday		compat_sys_gettimeofday
+79	32	settimeofday			sys_settimeofday		compat_sys_settimeofday
+80	32	getgroups			sys_getgroups
+81	32	setgroups			sys_setgroups
 # 82 was old_select
-82	o32	reserved82			sys_ni_syscall
-83	o32	symlink				sys_symlink
+82	32	reserved82			sys_ni_syscall
+83	32	symlink				sys_symlink
 # 84 was sys_lstat
-84	o32	unused84			sys_ni_syscall
-85	o32	readlink			sys_readlink
-86	o32	uselib				sys_uselib
-87	o32	swapon				sys_swapon
-88	o32	reboot				sys_reboot
-89	o32	readdir				sys_old_readdir			compat_sys_old_readdir
-90	o32	mmap				sys_mips_mmap
-91	o32	munmap				sys_munmap
-92	o32	truncate			sys_truncate			compat_sys_truncate
-93	o32	ftruncate			sys_ftruncate			compat_sys_ftruncate
-94	o32	fchmod				sys_fchmod
-95	o32	fchown				sys_fchown
-96	o32	getpriority			sys_getpriority
-97	o32	setpriority			sys_setpriority
-98	o32	profil				sys_ni_syscall
-99	o32	statfs				sys_statfs			compat_sys_statfs
-100	o32	fstatfs				sys_fstatfs			compat_sys_fstatfs
-101	o32	ioperm				sys_ni_syscall
-102	o32	socketcall			sys_socketcall			compat_sys_socketcall
-103	o32	syslog				sys_syslog
-104	o32	setitimer			sys_setitimer			compat_sys_setitimer
-105	o32	getitimer			sys_getitimer			compat_sys_getitimer
-106	o32	stat				sys_newstat			compat_sys_newstat
-107	o32	lstat				sys_newlstat			compat_sys_newlstat
-108	o32	fstat				sys_newfstat			compat_sys_newfstat
-109	o32	unused109			sys_uname
-110	o32	iopl				sys_ni_syscall
-111	o32	vhangup				sys_vhangup
-112	o32	idle				sys_ni_syscall
-113	o32	vm86				sys_ni_syscall
-114	o32	wait4				sys_wait4			compat_sys_wait4
-115	o32	swapoff				sys_swapoff
-116	o32	sysinfo				sys_sysinfo			compat_sys_sysinfo
-117	o32	ipc				sys_ipc				compat_sys_ipc
-118	o32	fsync				sys_fsync
-119	o32	sigreturn			sys_sigreturn			sys32_sigreturn
-120	o32	clone				__sys_clone
-121	o32	setdomainname			sys_setdomainname
-122	o32	uname				sys_newuname
-123	o32	modify_ldt			sys_ni_syscall
-124	o32	adjtimex			sys_adjtimex_time32
-125	o32	mprotect			sys_mprotect
-126	o32	sigprocmask			sys_sigprocmask			compat_sys_sigprocmask
-127	o32	create_module			sys_ni_syscall
-128	o32	init_module			sys_init_module
-129	o32	delete_module			sys_delete_module
-130	o32	get_kernel_syms			sys_ni_syscall
-131	o32	quotactl			sys_quotactl
-132	o32	getpgid				sys_getpgid
-133	o32	fchdir				sys_fchdir
-134	o32	bdflush				sys_ni_syscall
-135	o32	sysfs				sys_sysfs
-136	o32	personality			sys_personality			sys_32_personality
-137	o32	afs_syscall			sys_ni_syscall
-138	o32	setfsuid			sys_setfsuid
-139	o32	setfsgid			sys_setfsgid
-140	o32	_llseek				sys_llseek			sys_32_llseek
-141	o32	getdents			sys_getdents			compat_sys_getdents
-142	o32	_newselect			sys_select			compat_sys_select
-143	o32	flock				sys_flock
-144	o32	msync				sys_msync
-145	o32	readv				sys_readv
-146	o32	writev				sys_writev
-147	o32	cacheflush			sys_cacheflush
-148	o32	cachectl			sys_cachectl
-149	o32	sysmips				__sys_sysmips
-150	o32	unused150			sys_ni_syscall
-151	o32	getsid				sys_getsid
-152	o32	fdatasync			sys_fdatasync
-153	o32	_sysctl				sys_ni_syscall
-154	o32	mlock				sys_mlock
-155	o32	munlock				sys_munlock
-156	o32	mlockall			sys_mlockall
-157	o32	munlockall			sys_munlockall
-158	o32	sched_setparam			sys_sched_setparam
-159	o32	sched_getparam			sys_sched_getparam
-160	o32	sched_setscheduler		sys_sched_setscheduler
-161	o32	sched_getscheduler		sys_sched_getscheduler
-162	o32	sched_yield			sys_sched_yield
-163	o32	sched_get_priority_max		sys_sched_get_priority_max
-164	o32	sched_get_priority_min		sys_sched_get_priority_min
-165	o32	sched_rr_get_interval		sys_sched_rr_get_interval_time32
-166	o32	nanosleep			sys_nanosleep_time32
-167	o32	mremap				sys_mremap
-168	o32	accept				sys_accept
-169	o32	bind				sys_bind
-170	o32	connect				sys_connect
-171	o32	getpeername			sys_getpeername
-172	o32	getsockname			sys_getsockname
-173	o32	getsockopt			sys_getsockopt			sys_getsockopt
-174	o32	listen				sys_listen
-175	o32	recv				sys_recv			compat_sys_recv
-176	o32	recvfrom			sys_recvfrom			compat_sys_recvfrom
-177	o32	recvmsg				sys_recvmsg			compat_sys_recvmsg
-178	o32	send				sys_send
-179	o32	sendmsg				sys_sendmsg			compat_sys_sendmsg
-180	o32	sendto				sys_sendto
-181	o32	setsockopt			sys_setsockopt			sys_setsockopt
-182	o32	shutdown			sys_shutdown
-183	o32	socket				sys_socket
-184	o32	socketpair			sys_socketpair
-185	o32	setresuid			sys_setresuid
-186	o32	getresuid			sys_getresuid
-187	o32	query_module			sys_ni_syscall
-188	o32	poll				sys_poll
-189	o32	nfsservctl			sys_ni_syscall
-190	o32	setresgid			sys_setresgid
-191	o32	getresgid			sys_getresgid
-192	o32	prctl				sys_prctl
-193	o32	rt_sigreturn			sys_rt_sigreturn		sys32_rt_sigreturn
-194	o32	rt_sigaction			sys_rt_sigaction		compat_sys_rt_sigaction
-195	o32	rt_sigprocmask			sys_rt_sigprocmask		compat_sys_rt_sigprocmask
-196	o32	rt_sigpending			sys_rt_sigpending		compat_sys_rt_sigpending
-197	o32	rt_sigtimedwait			sys_rt_sigtimedwait_time32	compat_sys_rt_sigtimedwait_time32
-198	o32	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
-199	o32	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
-200	o32	pread64				sys_pread64			sys_32_pread
-201	o32	pwrite64			sys_pwrite64			sys_32_pwrite
-202	o32	chown				sys_chown
-203	o32	getcwd				sys_getcwd
-204	o32	capget				sys_capget
-205	o32	capset				sys_capset
-206	o32	sigaltstack			sys_sigaltstack			compat_sys_sigaltstack
-207	o32	sendfile			sys_sendfile			compat_sys_sendfile
-208	o32	getpmsg				sys_ni_syscall
-209	o32	putpmsg				sys_ni_syscall
-210	o32	mmap2				sys_mips_mmap2
-211	o32	truncate64			sys_truncate64			sys_32_truncate64
-212	o32	ftruncate64			sys_ftruncate64			sys_32_ftruncate64
-213	o32	stat64				sys_stat64			sys_newstat
-214	o32	lstat64				sys_lstat64			sys_newlstat
-215	o32	fstat64				sys_fstat64			sys_newfstat
-216	o32	pivot_root			sys_pivot_root
-217	o32	mincore				sys_mincore
-218	o32	madvise				sys_madvise
-219	o32	getdents64			sys_getdents64
-220	o32	fcntl64				sys_fcntl64			compat_sys_fcntl64
-221	o32	reserved221			sys_ni_syscall
-222	o32	gettid				sys_gettid
-223	o32	readahead			sys_readahead			sys32_readahead
-224	o32	setxattr			sys_setxattr
-225	o32	lsetxattr			sys_lsetxattr
-226	o32	fsetxattr			sys_fsetxattr
-227	o32	getxattr			sys_getxattr
-228	o32	lgetxattr			sys_lgetxattr
-229	o32	fgetxattr			sys_fgetxattr
-230	o32	listxattr			sys_listxattr
-231	o32	llistxattr			sys_llistxattr
-232	o32	flistxattr			sys_flistxattr
-233	o32	removexattr			sys_removexattr
-234	o32	lremovexattr			sys_lremovexattr
-235	o32	fremovexattr			sys_fremovexattr
-236	o32	tkill				sys_tkill
-237	o32	sendfile64			sys_sendfile64
-238	o32	futex				sys_futex_time32
-239	o32	sched_setaffinity		sys_sched_setaffinity		compat_sys_sched_setaffinity
-240	o32	sched_getaffinity		sys_sched_getaffinity		compat_sys_sched_getaffinity
-241	o32	io_setup			sys_io_setup			compat_sys_io_setup
-242	o32	io_destroy			sys_io_destroy
-243	o32	io_getevents			sys_io_getevents_time32
-244	o32	io_submit			sys_io_submit			compat_sys_io_submit
-245	o32	io_cancel			sys_io_cancel
-246	o32	exit_group			sys_exit_group
-247	o32	lookup_dcookie			sys_ni_syscall
-248	o32	epoll_create			sys_epoll_create
-249	o32	epoll_ctl			sys_epoll_ctl
-250	o32	epoll_wait			sys_epoll_wait
-251	o32	remap_file_pages		sys_remap_file_pages
-252	o32	set_tid_address			sys_set_tid_address
-253	o32	restart_syscall			sys_restart_syscall
-254	o32	fadvise64			sys_fadvise64_64		sys32_fadvise64_64
-255	o32	statfs64			sys_statfs64			compat_sys_statfs64
-256	o32	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
-257	o32	timer_create			sys_timer_create		compat_sys_timer_create
-258	o32	timer_settime			sys_timer_settime32
-259	o32	timer_gettime			sys_timer_gettime32
-260	o32	timer_getoverrun		sys_timer_getoverrun
-261	o32	timer_delete			sys_timer_delete
-262	o32	clock_settime			sys_clock_settime32
-263	o32	clock_gettime			sys_clock_gettime32
-264	o32	clock_getres			sys_clock_getres_time32
-265	o32	clock_nanosleep			sys_clock_nanosleep_time32
-266	o32	tgkill				sys_tgkill
-267	o32	utimes				sys_utimes_time32
-268	o32	mbind				sys_mbind
-269	o32	get_mempolicy			sys_get_mempolicy
-270	o32	set_mempolicy			sys_set_mempolicy
-271	o32	mq_open				sys_mq_open			compat_sys_mq_open
-272	o32	mq_unlink			sys_mq_unlink
-273	o32	mq_timedsend			sys_mq_timedsend_time32
-274	o32	mq_timedreceive			sys_mq_timedreceive_time32
-275	o32	mq_notify			sys_mq_notify			compat_sys_mq_notify
-276	o32	mq_getsetattr			sys_mq_getsetattr		compat_sys_mq_getsetattr
-277	o32	vserver				sys_ni_syscall
-278	o32	waitid				sys_waitid			compat_sys_waitid
+84	32	unused84			sys_ni_syscall
+85	32	readlink			sys_readlink
+86	32	uselib				sys_uselib
+87	32	swapon				sys_swapon
+88	32	reboot				sys_reboot
+89	32	readdir				sys_old_readdir			compat_sys_old_readdir
+90	32	mmap				sys_mips_mmap
+91	32	munmap				sys_munmap
+92	32	truncate			sys_truncate			compat_sys_truncate
+93	32	ftruncate			sys_ftruncate			compat_sys_ftruncate
+94	32	fchmod				sys_fchmod
+95	32	fchown				sys_fchown
+96	32	getpriority			sys_getpriority
+97	32	setpriority			sys_setpriority
+98	32	profil				sys_ni_syscall
+99	32	statfs				sys_statfs			compat_sys_statfs
+100	32	fstatfs				sys_fstatfs			compat_sys_fstatfs
+101	32	ioperm				sys_ni_syscall
+102	32	socketcall			sys_socketcall			compat_sys_socketcall
+103	32	syslog				sys_syslog
+104	32	setitimer			sys_setitimer			compat_sys_setitimer
+105	32	getitimer			sys_getitimer			compat_sys_getitimer
+106	32	stat				sys_newstat			compat_sys_newstat
+107	32	lstat				sys_newlstat			compat_sys_newlstat
+108	32	fstat				sys_newfstat			compat_sys_newfstat
+109	32	unused109			sys_uname
+110	32	iopl				sys_ni_syscall
+111	32	vhangup				sys_vhangup
+112	32	idle				sys_ni_syscall
+113	32	vm86				sys_ni_syscall
+114	32	wait4				sys_wait4			compat_sys_wait4
+115	32	swapoff				sys_swapoff
+116	32	sysinfo				sys_sysinfo			compat_sys_sysinfo
+117	32	ipc				sys_ipc				compat_sys_ipc
+118	32	fsync				sys_fsync
+119	32	sigreturn			sys_sigreturn			sys32_sigreturn
+120	32	clone				__sys_clone
+121	32	setdomainname			sys_setdomainname
+122	32	uname				sys_newuname
+123	32	modify_ldt			sys_ni_syscall
+124	32	adjtimex			sys_adjtimex_time32
+125	32	mprotect			sys_mprotect
+126	32	sigprocmask			sys_sigprocmask			compat_sys_sigprocmask
+127	32	create_module			sys_ni_syscall
+128	32	init_module			sys_init_module
+129	32	delete_module			sys_delete_module
+130	32	get_kernel_syms			sys_ni_syscall
+131	32	quotactl			sys_quotactl
+132	32	getpgid				sys_getpgid
+133	32	fchdir				sys_fchdir
+134	32	bdflush				sys_ni_syscall
+135	32	sysfs				sys_sysfs
+136	32	personality			sys_personality			sys_32_personality
+137	32	afs_syscall			sys_ni_syscall
+138	32	setfsuid			sys_setfsuid
+139	32	setfsgid			sys_setfsgid
+140	32	_llseek				sys_llseek			sys_32_llseek
+141	32	getdents			sys_getdents			compat_sys_getdents
+142	32	_newselect			sys_select			compat_sys_select
+143	32	flock				sys_flock
+144	32	msync				sys_msync
+145	32	readv				sys_readv
+146	32	writev				sys_writev
+147	32	cacheflush			sys_cacheflush
+148	32	cachectl			sys_cachectl
+149	32	sysmips				__sys_sysmips
+150	32	unused150			sys_ni_syscall
+151	32	getsid				sys_getsid
+152	32	fdatasync			sys_fdatasync
+153	32	_sysctl				sys_ni_syscall
+154	32	mlock				sys_mlock
+155	32	munlock				sys_munlock
+156	32	mlockall			sys_mlockall
+157	32	munlockall			sys_munlockall
+158	32	sched_setparam			sys_sched_setparam
+159	32	sched_getparam			sys_sched_getparam
+160	32	sched_setscheduler		sys_sched_setscheduler
+161	32	sched_getscheduler		sys_sched_getscheduler
+162	32	sched_yield			sys_sched_yield
+163	32	sched_get_priority_max		sys_sched_get_priority_max
+164	32	sched_get_priority_min		sys_sched_get_priority_min
+165	32	sched_rr_get_interval		sys_sched_rr_get_interval_time32
+166	32	nanosleep			sys_nanosleep_time32
+167	32	mremap				sys_mremap
+168	32	accept				sys_accept
+169	32	bind				sys_bind
+170	32	connect				sys_connect
+171	32	getpeername			sys_getpeername
+172	32	getsockname			sys_getsockname
+173	32	getsockopt			sys_getsockopt			sys_getsockopt
+174	32	listen				sys_listen
+175	32	recv				sys_recv			compat_sys_recv
+176	32	recvfrom			sys_recvfrom			compat_sys_recvfrom
+177	32	recvmsg				sys_recvmsg			compat_sys_recvmsg
+178	32	send				sys_send
+179	32	sendmsg				sys_sendmsg			compat_sys_sendmsg
+180	32	sendto				sys_sendto
+181	32	setsockopt			sys_setsockopt			sys_setsockopt
+182	32	shutdown			sys_shutdown
+183	32	socket				sys_socket
+184	32	socketpair			sys_socketpair
+185	32	setresuid			sys_setresuid
+186	32	getresuid			sys_getresuid
+187	32	query_module			sys_ni_syscall
+188	32	poll				sys_poll
+189	32	nfsservctl			sys_ni_syscall
+190	32	setresgid			sys_setresgid
+191	32	getresgid			sys_getresgid
+192	32	prctl				sys_prctl
+193	32	rt_sigreturn			sys_rt_sigreturn		sys32_rt_sigreturn
+194	32	rt_sigaction			sys_rt_sigaction		compat_sys_rt_sigaction
+195	32	rt_sigprocmask			sys_rt_sigprocmask		compat_sys_rt_sigprocmask
+196	32	rt_sigpending			sys_rt_sigpending		compat_sys_rt_sigpending
+197	32	rt_sigtimedwait			sys_rt_sigtimedwait_time32	compat_sys_rt_sigtimedwait_time32
+198	32	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
+199	32	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
+200	32	pread64				sys_pread64			sys_32_pread
+201	32	pwrite64			sys_pwrite64			sys_32_pwrite
+202	32	chown				sys_chown
+203	32	getcwd				sys_getcwd
+204	32	capget				sys_capget
+205	32	capset				sys_capset
+206	32	sigaltstack			sys_sigaltstack			compat_sys_sigaltstack
+207	32	sendfile			sys_sendfile			compat_sys_sendfile
+208	32	getpmsg				sys_ni_syscall
+209	32	putpmsg				sys_ni_syscall
+210	32	mmap2				sys_mips_mmap2
+211	32	truncate64			sys_truncate64			sys_32_truncate64
+212	32	ftruncate64			sys_ftruncate64			sys_32_ftruncate64
+213	32	stat64				sys_stat64			sys_newstat
+214	32	lstat64				sys_lstat64			sys_newlstat
+215	32	fstat64				sys_fstat64			sys_newfstat
+216	32	pivot_root			sys_pivot_root
+217	32	mincore				sys_mincore
+218	32	madvise				sys_madvise
+219	32	getdents64			sys_getdents64
+220	32	fcntl64				sys_fcntl64			compat_sys_fcntl64
+221	32	reserved221			sys_ni_syscall
+222	32	gettid				sys_gettid
+223	32	readahead			sys_readahead			sys32_readahead
+224	32	setxattr			sys_setxattr
+225	32	lsetxattr			sys_lsetxattr
+226	32	fsetxattr			sys_fsetxattr
+227	32	getxattr			sys_getxattr
+228	32	lgetxattr			sys_lgetxattr
+229	32	fgetxattr			sys_fgetxattr
+230	32	listxattr			sys_listxattr
+231	32	llistxattr			sys_llistxattr
+232	32	flistxattr			sys_flistxattr
+233	32	removexattr			sys_removexattr
+234	32	lremovexattr			sys_lremovexattr
+235	32	fremovexattr			sys_fremovexattr
+236	32	tkill				sys_tkill
+237	32	sendfile64			sys_sendfile64
+238	32	futex				sys_futex_time32
+239	32	sched_setaffinity		sys_sched_setaffinity		compat_sys_sched_setaffinity
+240	32	sched_getaffinity		sys_sched_getaffinity		compat_sys_sched_getaffinity
+241	32	io_setup			sys_io_setup			compat_sys_io_setup
+242	32	io_destroy			sys_io_destroy
+243	32	io_getevents			sys_io_getevents_time32
+244	32	io_submit			sys_io_submit			compat_sys_io_submit
+245	32	io_cancel			sys_io_cancel
+246	32	exit_group			sys_exit_group
+247	32	lookup_dcookie			sys_ni_syscall
+248	32	epoll_create			sys_epoll_create
+249	32	epoll_ctl			sys_epoll_ctl
+250	32	epoll_wait			sys_epoll_wait
+251	32	remap_file_pages		sys_remap_file_pages
+252	32	set_tid_address			sys_set_tid_address
+253	32	restart_syscall			sys_restart_syscall
+254	32	fadvise64			sys_fadvise64_64		sys32_fadvise64_64
+255	32	statfs64			sys_statfs64			compat_sys_statfs64
+256	32	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
+257	32	timer_create			sys_timer_create		compat_sys_timer_create
+258	32	timer_settime			sys_timer_settime32
+259	32	timer_gettime			sys_timer_gettime32
+260	32	timer_getoverrun		sys_timer_getoverrun
+261	32	timer_delete			sys_timer_delete
+262	32	clock_settime			sys_clock_settime32
+263	32	clock_gettime			sys_clock_gettime32
+264	32	clock_getres			sys_clock_getres_time32
+265	32	clock_nanosleep			sys_clock_nanosleep_time32
+266	32	tgkill				sys_tgkill
+267	32	utimes				sys_utimes_time32
+268	32	mbind				sys_mbind
+269	32	get_mempolicy			sys_get_mempolicy
+270	32	set_mempolicy			sys_set_mempolicy
+271	32	mq_open				sys_mq_open			compat_sys_mq_open
+272	32	mq_unlink			sys_mq_unlink
+273	32	mq_timedsend			sys_mq_timedsend_time32
+274	32	mq_timedreceive			sys_mq_timedreceive_time32
+275	32	mq_notify			sys_mq_notify			compat_sys_mq_notify
+276	32	mq_getsetattr			sys_mq_getsetattr		compat_sys_mq_getsetattr
+277	32	vserver				sys_ni_syscall
+278	32	waitid				sys_waitid			compat_sys_waitid
 # 279 was sys_setaltroot
-280	o32	add_key				sys_add_key
-281	o32	request_key			sys_request_key
-282	o32	keyctl				sys_keyctl			compat_sys_keyctl
-283	o32	set_thread_area			sys_set_thread_area
-284	o32	inotify_init			sys_inotify_init
-285	o32	inotify_add_watch		sys_inotify_add_watch
-286	o32	inotify_rm_watch		sys_inotify_rm_watch
-287	o32	migrate_pages			sys_migrate_pages
-288	o32	openat				sys_openat			compat_sys_openat
-289	o32	mkdirat				sys_mkdirat
-290	o32	mknodat				sys_mknodat
-291	o32	fchownat			sys_fchownat
-292	o32	futimesat			sys_futimesat_time32
-293	o32	fstatat64			sys_fstatat64			sys_newfstatat
-294	o32	unlinkat			sys_unlinkat
-295	o32	renameat			sys_renameat
-296	o32	linkat				sys_linkat
-297	o32	symlinkat			sys_symlinkat
-298	o32	readlinkat			sys_readlinkat
-299	o32	fchmodat			sys_fchmodat
-300	o32	faccessat			sys_faccessat
-301	o32	pselect6			sys_pselect6_time32		compat_sys_pselect6_time32
-302	o32	ppoll				sys_ppoll_time32		compat_sys_ppoll_time32
-303	o32	unshare				sys_unshare
-304	o32	splice				sys_splice
-305	o32	sync_file_range			sys_sync_file_range		sys32_sync_file_range
-306	o32	tee				sys_tee
-307	o32	vmsplice			sys_vmsplice
-308	o32	move_pages			sys_move_pages
-309	o32	set_robust_list			sys_set_robust_list		compat_sys_set_robust_list
-310	o32	get_robust_list			sys_get_robust_list		compat_sys_get_robust_list
-311	o32	kexec_load			sys_kexec_load			compat_sys_kexec_load
-312	o32	getcpu				sys_getcpu
-313	o32	epoll_pwait			sys_epoll_pwait			compat_sys_epoll_pwait
-314	o32	ioprio_set			sys_ioprio_set
-315	o32	ioprio_get			sys_ioprio_get
-316	o32	utimensat			sys_utimensat_time32
-317	o32	signalfd			sys_signalfd			compat_sys_signalfd
-318	o32	timerfd				sys_ni_syscall
-319	o32	eventfd				sys_eventfd
-320	o32	fallocate			sys_fallocate			sys32_fallocate
-321	o32	timerfd_create			sys_timerfd_create
-322	o32	timerfd_gettime			sys_timerfd_gettime32
-323	o32	timerfd_settime			sys_timerfd_settime32
-324	o32	signalfd4			sys_signalfd4			compat_sys_signalfd4
-325	o32	eventfd2			sys_eventfd2
-326	o32	epoll_create1			sys_epoll_create1
-327	o32	dup3				sys_dup3
-328	o32	pipe2				sys_pipe2
-329	o32	inotify_init1			sys_inotify_init1
-330	o32	preadv				sys_preadv			compat_sys_preadv
-331	o32	pwritev				sys_pwritev			compat_sys_pwritev
-332	o32	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
-333	o32	perf_event_open			sys_perf_event_open
-334	o32	accept4				sys_accept4
-335	o32	recvmmsg			sys_recvmmsg_time32		compat_sys_recvmmsg_time32
-336	o32	fanotify_init			sys_fanotify_init
-337	o32	fanotify_mark			sys_fanotify_mark		compat_sys_fanotify_mark
-338	o32	prlimit64			sys_prlimit64
-339	o32	name_to_handle_at		sys_name_to_handle_at
-340	o32	open_by_handle_at		sys_open_by_handle_at		compat_sys_open_by_handle_at
-341	o32	clock_adjtime			sys_clock_adjtime32
-342	o32	syncfs				sys_syncfs
-343	o32	sendmmsg			sys_sendmmsg			compat_sys_sendmmsg
-344	o32	setns				sys_setns
-345	o32	process_vm_readv		sys_process_vm_readv
-346	o32	process_vm_writev		sys_process_vm_writev
-347	o32	kcmp				sys_kcmp
-348	o32	finit_module			sys_finit_module
-349	o32	sched_setattr			sys_sched_setattr
-350	o32	sched_getattr			sys_sched_getattr
-351	o32	renameat2			sys_renameat2
-352	o32	seccomp				sys_seccomp
-353	o32	getrandom			sys_getrandom
-354	o32	memfd_create			sys_memfd_create
-355	o32	bpf				sys_bpf
-356	o32	execveat			sys_execveat			compat_sys_execveat
-357	o32	userfaultfd			sys_userfaultfd
-358	o32	membarrier			sys_membarrier
-359	o32	mlock2				sys_mlock2
-360	o32	copy_file_range			sys_copy_file_range
-361	o32	preadv2				sys_preadv2			compat_sys_preadv2
-362	o32	pwritev2			sys_pwritev2			compat_sys_pwritev2
-363	o32	pkey_mprotect			sys_pkey_mprotect
-364	o32	pkey_alloc			sys_pkey_alloc
-365	o32	pkey_free			sys_pkey_free
-366	o32	statx				sys_statx
-367	o32	rseq				sys_rseq
-368	o32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
+280	32	add_key				sys_add_key
+281	32	request_key			sys_request_key
+282	32	keyctl				sys_keyctl			compat_sys_keyctl
+283	32	set_thread_area			sys_set_thread_area
+284	32	inotify_init			sys_inotify_init
+285	32	inotify_add_watch		sys_inotify_add_watch
+286	32	inotify_rm_watch		sys_inotify_rm_watch
+287	32	migrate_pages			sys_migrate_pages
+288	32	openat				sys_openat			compat_sys_openat
+289	32	mkdirat				sys_mkdirat
+290	32	mknodat				sys_mknodat
+291	32	fchownat			sys_fchownat
+292	32	futimesat			sys_futimesat_time32
+293	32	fstatat64			sys_fstatat64			sys_newfstatat
+294	32	unlinkat			sys_unlinkat
+295	32	renameat			sys_renameat
+296	32	linkat				sys_linkat
+297	32	symlinkat			sys_symlinkat
+298	32	readlinkat			sys_readlinkat
+299	32	fchmodat			sys_fchmodat
+300	32	faccessat			sys_faccessat
+301	32	pselect6			sys_pselect6_time32		compat_sys_pselect6_time32
+302	32	ppoll				sys_ppoll_time32		compat_sys_ppoll_time32
+303	32	unshare				sys_unshare
+304	32	splice				sys_splice
+305	32	sync_file_range			sys_sync_file_range		sys32_sync_file_range
+306	32	tee				sys_tee
+307	32	vmsplice			sys_vmsplice
+308	32	move_pages			sys_move_pages
+309	32	set_robust_list			sys_set_robust_list		compat_sys_set_robust_list
+310	32	get_robust_list			sys_get_robust_list		compat_sys_get_robust_list
+311	32	kexec_load			sys_kexec_load			compat_sys_kexec_load
+312	32	getcpu				sys_getcpu
+313	32	epoll_pwait			sys_epoll_pwait			compat_sys_epoll_pwait
+314	32	ioprio_set			sys_ioprio_set
+315	32	ioprio_get			sys_ioprio_get
+316	32	utimensat			sys_utimensat_time32
+317	32	signalfd			sys_signalfd			compat_sys_signalfd
+318	32	timerfd				sys_ni_syscall
+319	32	eventfd				sys_eventfd
+320	32	fallocate			sys_fallocate			sys32_fallocate
+321	32	timerfd_create			sys_timerfd_create
+322	32	timerfd_gettime			sys_timerfd_gettime32
+323	32	timerfd_settime			sys_timerfd_settime32
+324	32	signalfd4			sys_signalfd4			compat_sys_signalfd4
+325	32	eventfd2			sys_eventfd2
+326	32	epoll_create1			sys_epoll_create1
+327	32	dup3				sys_dup3
+328	32	pipe2				sys_pipe2
+329	32	inotify_init1			sys_inotify_init1
+330	32	preadv				sys_preadv			compat_sys_preadv
+331	32	pwritev				sys_pwritev			compat_sys_pwritev
+332	32	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo		compat_sys_rt_tgsigqueueinfo
+333	32	perf_event_open			sys_perf_event_open
+334	32	accept4				sys_accept4
+335	32	recvmmsg			sys_recvmmsg_time32		compat_sys_recvmmsg_time32
+336	32	fanotify_init			sys_fanotify_init
+337	32	fanotify_mark			sys_fanotify_mark		compat_sys_fanotify_mark
+338	32	prlimit64			sys_prlimit64
+339	32	name_to_handle_at		sys_name_to_handle_at
+340	32	open_by_handle_at		sys_open_by_handle_at		compat_sys_open_by_handle_at
+341	32	clock_adjtime			sys_clock_adjtime32
+342	32	syncfs				sys_syncfs
+343	32	sendmmsg			sys_sendmmsg			compat_sys_sendmmsg
+344	32	setns				sys_setns
+345	32	process_vm_readv		sys_process_vm_readv
+346	32	process_vm_writev		sys_process_vm_writev
+347	32	kcmp				sys_kcmp
+348	32	finit_module			sys_finit_module
+349	32	sched_setattr			sys_sched_setattr
+350	32	sched_getattr			sys_sched_getattr
+351	32	renameat2			sys_renameat2
+352	32	seccomp				sys_seccomp
+353	32	getrandom			sys_getrandom
+354	32	memfd_create			sys_memfd_create
+355	32	bpf				sys_bpf
+356	32	execveat			sys_execveat			compat_sys_execveat
+357	32	userfaultfd			sys_userfaultfd
+358	32	membarrier			sys_membarrier
+359	32	mlock2				sys_mlock2
+360	32	copy_file_range			sys_copy_file_range
+361	32	preadv2				sys_preadv2			compat_sys_preadv2
+362	32	pwritev2			sys_pwritev2			compat_sys_pwritev2
+363	32	pkey_mprotect			sys_pkey_mprotect
+364	32	pkey_alloc			sys_pkey_alloc
+365	32	pkey_free			sys_pkey_free
+366	32	statx				sys_statx
+367	32	rseq				sys_rseq
+368	32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
 # room for arch specific calls
-393	o32	semget				sys_semget
-394	o32	semctl				sys_semctl			compat_sys_semctl
-395	o32	shmget				sys_shmget
-396	o32	shmctl				sys_shmctl			compat_sys_shmctl
-397	o32	shmat				sys_shmat			compat_sys_shmat
-398	o32	shmdt				sys_shmdt
-399	o32	msgget				sys_msgget
-400	o32	msgsnd				sys_msgsnd			compat_sys_msgsnd
-401	o32	msgrcv				sys_msgrcv			compat_sys_msgrcv
-402	o32	msgctl				sys_msgctl			compat_sys_msgctl
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
+393	32	semget				sys_semget
+394	32	semctl				sys_semctl			compat_sys_semctl
+395	32	shmget				sys_shmget
+396	32	shmctl				sys_shmctl			compat_sys_shmctl
+397	32	shmat				sys_shmat			compat_sys_shmat
+398	32	shmdt				sys_shmdt
+399	32	msgget				sys_msgget
+400	32	msgsnd				sys_msgsnd			compat_sys_msgsnd
+401	32	msgrcv				sys_msgrcv			compat_sys_msgrcv
+402	32	msgctl				sys_msgctl			compat_sys_msgctl
+403	32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
+404	32	clock_settime64			sys_clock_settime		sys_clock_settime
+405	32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
+406	32	clock_getres_time64		sys_clock_getres		sys_clock_getres
+407	32	clock_nanosleep_time64		sys_clock_nanosleep		sys_clock_nanosleep
+408	32	timer_gettime64			sys_timer_gettime		sys_timer_gettime
+409	32	timer_settime64			sys_timer_settime		sys_timer_settime
+410	32	timerfd_gettime64		sys_timerfd_gettime		sys_timerfd_gettime
+411	32	timerfd_settime64		sys_timerfd_settime		sys_timerfd_settime
+412	32	utimensat_time64		sys_utimensat			sys_utimensat
+413	32	pselect6_time64			sys_pselect6			compat_sys_pselect6_time64
+414	32	ppoll_time64			sys_ppoll			compat_sys_ppoll_time64
+416	32	io_pgetevents_time64		sys_io_pgetevents		compat_sys_io_pgetevents_time64
+417	32	recvmmsg_time64			sys_recvmmsg			compat_sys_recvmmsg_time64
+418	32	mq_timedsend_time64		sys_mq_timedsend		sys_mq_timedsend
+419	32	mq_timedreceive_time64		sys_mq_timedreceive		sys_mq_timedreceive
+420	32	semtimedop_time64		sys_semtimedop			sys_semtimedop
+421	32	rt_sigtimedwait_time64		sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait_time64
+422	32	futex_time64			sys_futex			sys_futex
+423	32	sched_rr_get_interval_time64	sys_sched_rr_get_interval	sys_sched_rr_get_interval
+424	32	pidfd_send_signal		sys_pidfd_send_signal
+425	32	io_uring_setup			sys_io_uring_setup
+426	32	io_uring_enter			sys_io_uring_enter
+427	32	io_uring_register		sys_io_uring_register
+428	32	open_tree			sys_open_tree
+429	32	move_mount			sys_move_mount
+430	32	fsopen				sys_fsopen
+431	32	fsconfig			sys_fsconfig
+432	32	fsmount				sys_fsmount
+433	32	fspick				sys_fspick
+434	32	pidfd_open			sys_pidfd_open
+435	32	clone3				__sys_clone3
+436	32	close_range			sys_close_range
+437	32	openat2				sys_openat2
+438	32	pidfd_getfd			sys_pidfd_getfd
+439	32	faccessat2			sys_faccessat2
+440	32	process_madvise			sys_process_madvise
+441	32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
+442	32	mount_setattr			sys_mount_setattr
+443	32	quotactl_fd			sys_quotactl_fd
+444	32	landlock_create_ruleset		sys_landlock_create_ruleset
+445	32	landlock_add_rule		sys_landlock_add_rule
+446	32	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
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
+448	32	process_mrelease		sys_process_mrelease
+449	32	futex_waitv			sys_futex_waitv
+450	32	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	32	cachestat			sys_cachestat
+452	32	fchmodat2			sys_fchmodat2
+453	32	map_shadow_stack		sys_map_shadow_stack
+454	32	futex_wake			sys_futex_wake
+455	32	futex_wait			sys_futex_wait
+456	32	futex_requeue			sys_futex_requeue
+457	32	statmount			sys_statmount
+458	32	listmount			sys_listmount
+459	32	lsm_get_self_attr		sys_lsm_get_self_attr
+460	32	lsm_set_self_attr		sys_lsm_set_self_attr
+461	32	lsm_list_modules		sys_lsm_list_modules
+462	32	mseal				sys_mseal
+463	32	setxattrat			sys_setxattrat
+464	32	getxattrat			sys_getxattrat
+465	32	listxattrat			sys_listxattrat
+466	32	removexattrat			sys_removexattrat
+467	32	open_tree_attr			sys_open_tree_attr
+468	32	file_getattr			sys_file_getattr
+469	32	file_setattr			sys_file_setattr
+470	32	listns				sys_listns
+471	32	rseq_slice_yield		sys_rseq_slice_yield

-- 
2.55.0

