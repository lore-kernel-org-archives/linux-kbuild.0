Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC963D16E2;
	Fri, 28 Aug 2026 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892729; cv=none; b=anvHTwMlKySpGDeGIcifBiGCoH5VB+0eZUsFN3Pd6IQa8sVqnWFcxNvWprltAmBjz6xouPwjxOi3o54LLCdfR6hpC+HsuvHioiWpTmfs9z85bVlw/Ox8QLoql4uahPoQ8uOl5UoSIFZeahETW+W6F5voTvtjQonFYy259rtRxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892729; c=relaxed/simple;
	bh=38+V5eWfdyUtykT7i6weS0PX+rdW2i6FUhGg/knvi8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9kKge9R8qmqIUgLSzka/GMJfuKufGU358ec8XNBkf+vmsfZJCdunIt9Az9F8hRSRu/b6Jm1Zs9umlrWTAAj5ccDjYZezdQlZ5GTruQHE1wmekbp2or3z+Tqt99xNytKRMllkhmqLHLc5GA7enwLLNQqLRUXGqzfCi+0mMJ/AT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsxeR4Jb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsxeR4Jb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136041F00A3F;
	Fri, 28 Aug 2026 04:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892728;
	bh=QCPC2VydWNhBNTfMl1c4YlqwNYEoCQHQqQsxRdGOi6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FsxeR4JbYkH/M8xs/73HsrxnTvw+pviVBtoq+ROLeZZT8B9Zh8P6JYyk5rsS5/DT1
	 MWAnBTj9L4N16G3NP8UgXvp9YkCP920cQjHlaDWsz63f2rkkig56LXgStWzvRqu1R1
	 zBUjoW6ZS3FDyA7w5r5DDHQh2hS5Ayt4rLq8iPYIaIul5EeKbe2b6M7AwT3xJmo4qI
	 CK1jFSSNFAwClB61kGm9KKPKEYkB4xdDIHpsDTes1bnMvt08NbT8UAjipPuhACpdbx
	 DzdNnXhmqHwKHGsHr7AinmFs8SrSmziEkiFpJXGhUTUAyyTmxQJnz+1GAKQnRxGZkE
	 R9A6s+AgDPDHA==
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
Subject: [PATCH 16/27] objtool: Detect noreturns in weak functions
Date: Thu, 27 Aug 2026 21:51:45 -0700
Message-ID: <9142b469c79880bd3a33db6e4f7c27d3a40e43c5.1787890035.git.jpoimboe@kernel.org>
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

The skipping of weak functions in the noreturn detection logic is a bit
weird, as a function's return/noreturn ABI shouldn't change regardless
of which version gets linked.

Fix that, and update the global noreturns list as needed.

Note that abort() now needs to be added to the list: while objtool on
vmlinux.o can detect that its noreturn, modules have no way of knowing.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c     | 3 ---
 tools/objtool/noreturns.h | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index ddb8dbe7f71d9..c55851ec389cd 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -260,9 +260,6 @@ static bool might_return(struct objtool_file *file, struct symbol *func)
 	struct instruction *insn;
 	struct symbol *dest;
 
-	if (is_weak_sym(func))
-		return true;
-
 	func_for_each_insn(file, func, insn) {
 		if (insn->type == INSN_RETURN)
 			return true;
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index cd41f580ccb72..26f62f98bc8ef 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -11,15 +11,14 @@ NORETURN(__kunit_abort)
 NORETURN(__module_put_and_kthread_exit)
 NORETURN(__stack_chk_fail)
 NORETURN(__ubsan_handle_builtin_unreachable)
+NORETURN(abort)
 NORETURN(acpi_processor_ffh_play_dead)
 NORETURN(do_exit)
 NORETURN(kthread_complete_and_exit)
 NORETURN(kunit_try_catch_throw)
 NORETURN(mpt_halt_firmware)
-NORETURN(nmi_panic_self_stop)
 NORETURN(panic)
 NORETURN(vpanic)
-NORETURN(panic_smp_self_stop)
 NORETURN(rewind_stack_and_make_dead)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
-- 
2.55.0

