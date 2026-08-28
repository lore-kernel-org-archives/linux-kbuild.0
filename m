Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2E3CB2D2;
	Fri, 28 Aug 2026 04:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892730; cv=none; b=P0aKwv8YR1PDqX0PodX/niRP8FxtQbFjjoD8A2iF+Qj9kndoNMEahUMd5Cf4nPeCdObqYJIdiTPZvZFb62ltI1Nz2v7O4ZIOcIFtaveEXVnpoA3uHfAGeN20F9GGyiyDK6lr/blACz8ZE5nTluagKXAHyf83Bl3mKMQgd3EIOUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892730; c=relaxed/simple;
	bh=qWztlRwzMp0eC2vV1a7ZtSRKJ/oNH+JGaEQpizwVGGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u15RQB8exUNNkiwt/DLYkp67VLYbqDs3zX+Ou2MrstpQzmugrfFX3vYtzCaxvXwBZwKEnbBmub9UxPLHtt2haO7YRuXNQyMPIYslKv0U+8TYBLdwncjhCxYfj8wDJNziWiYT817jhlhwHdVhgM56kmUoiRBN12/hi/DCAvQ5ipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfRm0PQH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfRm0PQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FE11F00A3A;
	Fri, 28 Aug 2026 04:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892725;
	bh=vNjsHB30KZpNjM4w2L4yDqFztf6tF3EEy9YfZGXC5gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gfRm0PQHvH1SUw4fG+k3MrYGgdzh4mCYV1p/e/Q7jD0zCK7BLA0otkjTYE9c7fW2q
	 nUkcU8cswHUitBinZ3N9w39zqm74l4dk98XJ7I3VFuNArZ8t4O+2Ugpzd+GdJQfCPR
	 BqcNtEYYdRIXN8Sl5RyTp1l43va9dguyDgZG5x9rO3yBCMjtfSD/H2PjvGmwef82Vw
	 5rxnGMU1VOGhfSD+3VXGmwA/Egd9CWVjfkuMJT2/NqCQBAHL8FVbCcJvDKK7mCkXVW
	 s0zjKb2pPNuGEAaQtVqas4yPcZTT7nwhrZsua9HjcLMI/qHrfZMHIo0zIxltb979fZ
	 4gyTfTzQON1zA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH 11/27] LoongArch: Annotate reboot and kexec paths as returnable
Date: Thu, 27 Aug 2026 21:51:40 -0700
Message-ID: <37c0dbd58e99fe79d4cfa0aa9e6c31690c78a279.1787890035.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787890035.git.jpoimboe@kernel.org>
References: <cover.1787890035.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running objtool on LoongArch vmlinux.o shows the following warnings:

  vmlinux.o: warning: objtool: __do_sys_reboot+0x188: kernel_restart() is missing __noreturn in .c/.h
  vmlinux.o: warning: objtool: hw_failure_emergency_action_func+0x74: kernel_restart() is missing __noreturn in .c/.h
  vmlinux.o: warning: objtool: hibernate+0x3cc: kernel_halt() is missing __noreturn in .c/.h
  vmlinux.o: warning: objtool: kernel_kexec+0xbc: machine_kexec() is missing __noreturn in .c/.h
  vmlinux.o: warning: objtool: restart_poweroff_do_poweroff+0x1c: machine_restart() is missing __noreturn in .c/.h

The problem is that the generic declarations of the above functions are
not declared noreturn.

But marking them __noreturn wouldn't be straightforward given the
inconsistent behaviors they have across the arches:

  - In many cases they don't return, but the compiler doesn't have
    visibility to that for various reasons including inline asm and
    indirect calls to noreturn functions (which objtool is currently not
    equipped to deal with).

  - In some cases they even *do* return, e.g. x86 machine_exec(), arm64
    machine_power_off(), and hexagon machine_restart().

In lieu of undertaking such a large cleanup, fix the above warnings with
a few annotations so objtool doesn't consider them noreturn, consistent
with their call sites.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/loongarch/kernel/machine_kexec.c | 2 ++
 arch/loongarch/kernel/reset.c         | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index 1883cae93bc31..e40b6767df24e 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -16,6 +16,7 @@
 #include <linux/reboot.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
+#include <linux/annotate.h>
 
 #include <asm/bootinfo.h>
 #include <asm/cacheflush.h>
@@ -296,3 +297,4 @@ void machine_kexec(struct kimage *image)
 
 	kexec_reboot();
 }
+ANNOTATE_IGNORE_NORETURN(machine_kexec);
diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/reset.c
index de8fa5a8a825c..89ee0edcf58d2 100644
--- a/arch/loongarch/kernel/reset.c
+++ b/arch/loongarch/kernel/reset.c
@@ -11,6 +11,7 @@
 #include <linux/reboot.h>
 #include <linux/delay.h>
 #include <linux/console.h>
+#include <linux/annotate.h>
 
 #include <acpi/reboot.h>
 #include <asm/idle.h>
@@ -36,6 +37,7 @@ void machine_halt(void)
 		__asm__ __volatile__("idle 0" : : : "memory");
 	}
 }
+ANNOTATE_IGNORE_NORETURN(machine_halt);
 
 void machine_power_off(void)
 {
@@ -56,6 +58,7 @@ void machine_power_off(void)
 		__asm__ __volatile__("idle 0" : : : "memory");
 	}
 }
+ANNOTATE_IGNORE_NORETURN(machine_power_off);
 
 void machine_restart(char *command)
 {
@@ -77,3 +80,4 @@ void machine_restart(char *command)
 		__asm__ __volatile__("idle 0" : : : "memory");
 	}
 }
+ANNOTATE_IGNORE_NORETURN(machine_restart);
-- 
2.55.0

