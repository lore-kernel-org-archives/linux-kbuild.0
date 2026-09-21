Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E91D3E00A1;
	Mon, 21 Sep 2026 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029898; cv=none; b=JjNUfnrhsqMqW701AovLtWV/k0/pgek5HLuzpB0LB3HVSZurzi+6wwV5x1uCs2ua2zz99tEtgUskoHXc2mLuhJG5s4n1F/Est+87DgT2Stw5jKdOfgRd4v0JsUeqH+vhcBDOep8IqhgEEetUQGpd5yhEoML3imZySZ7I+YpSDwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029898; c=relaxed/simple;
	bh=iIXlzKNIFZPYaIoTsB1MNXPOdSXQa85fbbIi5YQsFsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vxb33xF75aAWD8vb4fHZIK3kUljcwIa//n0X6Hgb1f85bKReNqg8LsheEiSlJAGlEkmaFDOaTHkhxHwt3bZwjZBoD4V6GE5mdqRGnGsiR1nUyFSJ0Ss6JlAeDHhVfa/mSWAZ8s+OwIZxFbPvmlqenq/tE5E2kw7sLHLSCl6WZdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhH7FLjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhH7FLjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937AA1F00898;
	Mon, 21 Sep 2026 22:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029897;
	bh=auUSf0YXYS+TpoY9s5L91kbbp6WvyGUk3krzfxmQOVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hhH7FLjmbs8Xw9qOeP8koxZcNqensiT9qwsRp14Ytr16M6zrgvnQbwspqPv3oWMCH
	 aepfmbzs1OUpGNo1OUOZWWX7Pom/dBF9sxtqXcb0TJ8Xaz005oYY6MwW1pCXMMhf15
	 dS1a+V9p9JSCJFRF2buS2w/T2EjN8Tky1E3jU31azBUWyw3YlJuS4hCPMAFRudY08s
	 CvFMdlXH4vKsOF5DxjyINU0GDYZnIUylG5p1kOhaCxLbuQL5ZtQuvmCF/cm3jsLRev
	 Kj5aj7Xh0FCNnlzlLLo2bJhfJZ7oBNAeC+MWwyrGvc2XwmBCmCNgwKtr4wvchq89xr
	 GnEAFmizr+51A==
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
Subject: [PATCH v3 01/28] objtool: Remove obsolete noreturns.h entries
Date: Mon, 21 Sep 2026 15:31:02 -0700
Message-ID: <348ed1964fa1e581291f9ab887c801c482a3c104.1790028654.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790028654.git.jpoimboe@kernel.org>
References: <cover.1790028654.git.jpoimboe@kernel.org>
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
index 0e9dfd0a2446c..72ffa71aa19b8 100644
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
@@ -31,7 +28,6 @@ NORETURN(ex_handler_msr_mce)
 NORETURN(hlt_play_dead)
 NORETURN(hv_ghcb_terminate)
 NORETURN(kthread_complete_and_exit)
-NORETURN(kthread_exit)
 NORETURN(kunit_try_catch_throw)
 NORETURN(machine_real_restart)
 NORETURN(make_task_dead)
@@ -44,7 +40,6 @@ NORETURN(vpanic)
 NORETURN(panic_smp_self_stop)
 NORETURN(rest_init)
 NORETURN(rewind_stack_and_make_dead)
-NORETURN(rust_begin_unwind)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
 NORETURN(start_kernel)
-- 
2.55.0

