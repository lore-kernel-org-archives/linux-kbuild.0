Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB553B27C6;
	Tue,  8 Sep 2026 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899669; cv=none; b=SU/vwQxX/ArK2Gc3vJbX4QgyoUOeWGd/BkhYwKd8wCoKWu8MHcWz+bleW9cetU3yIUOI3PE6zw962yKMd2yPtQvNRuJc1oYRv9hWU0HnYXkcEnAUSKNSBujpYM6N/c5jxK9Usc+JfHWP8zpobmyewKlFuWMzci11xu4gHVx4UpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899669; c=relaxed/simple;
	bh=iIXlzKNIFZPYaIoTsB1MNXPOdSXQa85fbbIi5YQsFsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoSNEFFKqVrdxoZyugvtcKUhChh3LaPItTzl+KBXAXvh5r9RpVVm/pPKyRH8dGkfYm4ZiB8LzkmjGvvyqKkVsAx4Aoip6P5oiDaBQAdutsY+XWUY71J+Hy7WST2RZ8kZ3LoDUx2ATFfv5YY7J7QL2L2wCKcJ5Eb83wZ2kexTk8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncJu3uo8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncJu3uo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69241F00A3E;
	Tue,  8 Sep 2026 20:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899668;
	bh=auUSf0YXYS+TpoY9s5L91kbbp6WvyGUk3krzfxmQOVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ncJu3uo8vu0PCoq3KY1ILfJdsbz/QhSyKnGswkVd0W7qwZLnysNJpu3pqw76ywxt5
	 4jo2F+sw55XN5tT/UuS6haD6cO9tI/irerV7MlOovzddm5d1tG9VVl64dXkcU1Gdmq
	 mOw+gdKfOOYYdfaKAmBU4pMrWfsrUBO0rnTnm1OAt6Z+Xnk7SrazNML/ySJju/7lWy
	 bNGzQkKq6QgrmE4a6VF5utxJ15BdOJPUZqmFIthL6aOVup6phTod1qniMoqbT4fntj
	 ac/GAH1qnea7D4iFL3VitoFvzaJUqaFmAkZUpnhRwQ7BMpct1NgBxkD1qgvtLJdjh8
	 4F98yVDYVyBQA==
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
Subject: [PATCH v2 01/27] objtool: Remove obsolete noreturns.h entries
Date: Tue,  8 Sep 2026 13:33:13 -0700
Message-ID: <1aed90b30528cfc71bc1849d67f85245bff63b67.1788899473.git.jpoimboe@kernel.org>
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

