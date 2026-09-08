Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A43BED27;
	Tue,  8 Sep 2026 20:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899675; cv=none; b=QLfSsc+qe/YoriZMb3PAeDeOZ3pKMtu+PcHEPx16MLf4fkH4ADmQJYGPp2wORlLZGgDAENL6eCpNHT4ndSJ8r/ocetr5MAcugOXIVBTMVhSbEplSmlBhF2TLU1mHz5uaWZ2mQsnyeQncHhBoIfy5IP8D95z9yIxoWs04AkzNbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899675; c=relaxed/simple;
	bh=qWztlRwzMp0eC2vV1a7ZtSRKJ/oNH+JGaEQpizwVGGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbbvxfKxHdPZslVN5hiZ1ELSiiPBYygz3OTG+BtLqlo7TpZA5Pt6UzIPI4YRad/8F3hiKhuqb5rAPnnqVZ7RkUq5blw6kCWmoOjhvvKcag5W3gQ3hZsxX6UggEliO/EM0yInyuoNcluP1MzXbcj+cE/ZnpKW3R8/uzdbmP7cKf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+Ze780G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+Ze780G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7AA1F00AC4;
	Tue,  8 Sep 2026 20:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899673;
	bh=vNjsHB30KZpNjM4w2L4yDqFztf6tF3EEy9YfZGXC5gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K+Ze780GznkJn2lLX1zUwyZBbY6UqitmlUAh4Dzap8eqCuCdnx2DGH2NUUwup9xvX
	 qOlWmnexMiHbCfQkPU/Oexg3nOjXVc+hICUb3+kRO80jNm60hsBHQKUYwtjwqEXNRX
	 HsJi7P4uOJhHBwos/kWc+Zk9mUBD+plHRAqOSF8TvP2ug4c9sk5h5kP5sRn31ysGAt
	 spPqbFJmcWkfxgOKrcD7fZ9pONf0HkMswHwq6mFHjLymhU9qr19o6LlPfgHJQ73Out
	 3QHlEtN0+HvPH8k8V1612Q+KQId8jzoenzKs+k8iw3z6zFAalrzn0AviT8Xh7LjPdS
	 IkmLcOGTzBrUA==
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
Subject: [PATCH v2 11/27] LoongArch: Annotate reboot and kexec paths as returnable
Date: Tue,  8 Sep 2026 13:33:23 -0700
Message-ID: <0d3a29d394bf1d2448294b9a68e4ace80a403c06.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788899473.git.jpoimboe@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
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

