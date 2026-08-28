Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929303A7F78;
	Fri, 28 Aug 2026 04:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892720; cv=none; b=f2BdjvQFtTNCsQUMfzxmeeBHTWSbRe2C8bCg9dh4Ms/6I3o4sEHFiOVbMbFo4iJQuqJBp/jHDs9TQqssB1HWZHmv305JOXq6+Xlfpyx/GOsnxGXF1H9C2o7XalghwymCrz5u7jNvGiixwuhRM5e+WMNSEReabT9aDXZtAAhb3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892720; c=relaxed/simple;
	bh=I490kfot+nYjm1ZsJTCBXUOebN7mdyLtiKCx5v2ySP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwyaaJ0lHYQlehN1qOe4fVhoqzvrtPi795s4hZNKc5Owqxz0rafgPS3mnsVtde0QZsTZ2gzPmFENvonXLE6SU18FXXbXcT2XPznIY7TPgrrfrzDR+lNL97Yq709vpG8jFcqmt2iyoTBp9tXHzeK+lIf4yo50gUdntpoZtD9ZgN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFYoS5E7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFYoS5E7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125C21F00ADB;
	Fri, 28 Aug 2026 04:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892719;
	bh=ZOSyF4oqdNPgQOrMJKe0tteJI7Nmop2u6Eo0cUbsbpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OFYoS5E7HMFmet3G27+lKQ9vwwdIIuFZAudWLniRRagjMsW8H0H9dDZNcanl6NgYL
	 G2S36c5+hbjcPB11TA/O9pbp1RSAjFJV6J4xmB4rLDxmHALgAc4a0wLdRlWIR4WGRs
	 +AU5QiqzaAepCSlBE1cTASeA/azkFwl82/DD/ggYGIHztrUJX0/Tx6mszHpzvM8764
	 hnqtlfUjwM245kx//29jyp2o/cljujWpFleLz3vH2J2ZDLm0fYmRRn4TU1ewamxRBH
	 uhxf8F8lh7VhHOnbC4Hdfi8q7C6rwxIHS4RMeUxZkq82hI7gr1K7tKTrhMbA3GgwWo
	 LkZ9/pzqzaspg==
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
Subject: [PATCH 01/27] objtool: Remove obsolete noreturns.h entries
Date: Thu, 27 Aug 2026 21:51:30 -0700
Message-ID: <074584dd38a6d610f64b401a2376dde773a6f6bf.1787890035.git.jpoimboe@kernel.org>
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

Remove some obsolete noreturns.h entries: bcachefs is no longer in-tree,
kthread_exit() is a macro, and rust_begin_unwind() is only called by its
mangled name.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/noreturns.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index 14f8ab653449c..08d441b8895cb 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -18,9 +18,6 @@ NORETURN(__x64_sys_exit)
 NORETURN(__x64_sys_exit_group)
 NORETURN(acpi_processor_ffh_play_dead)
 NORETURN(arch_cpu_idle_dead)
-NORETURN(bch2_trans_in_restart_error)
-NORETURN(bch2_trans_restart_error)
-NORETURN(bch2_trans_unlocked_or_in_restart_error)
 NORETURN(cpu_bringup_and_idle)
 NORETURN(cpu_startup_entry)
 NORETURN(do_exit)
@@ -30,7 +27,6 @@ NORETURN(ex_handler_msr_mce)
 NORETURN(hlt_play_dead)
 NORETURN(hv_ghcb_terminate)
 NORETURN(kthread_complete_and_exit)
-NORETURN(kthread_exit)
 NORETURN(kunit_try_catch_throw)
 NORETURN(machine_real_restart)
 NORETURN(make_task_dead)
@@ -43,7 +39,6 @@ NORETURN(vpanic)
 NORETURN(panic_smp_self_stop)
 NORETURN(rest_init)
 NORETURN(rewind_stack_and_make_dead)
-NORETURN(rust_begin_unwind)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
 NORETURN(start_kernel)
-- 
2.55.0

