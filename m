Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6943DAAA0;
	Fri, 28 Aug 2026 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892733; cv=none; b=GnpjAH92JNSi0+T3pDe9YdDCjxGZPVnT0RP6nSuA2SWna6uAeeSldG/IW0G/qdzcC5hNBhU0Y2iTmo8671AoTiONQkvpQTRXiEBn8UhQnKfTpRQK7q6Clvpj+C50UEF/Lxz47Ip+KAvhltcsD0FrFLvbRBDOMmKBvi9gWZQX5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892733; c=relaxed/simple;
	bh=ae0liAwEjTv93X8TeRVVErNMqiemfErxQ5+4BAVEeAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owP5HTtWOpOFQYo9lR4bNfNuk9doehE2aLzKiS8/8ttPKzFJSq6Rt2vJmbhiUqPSz1C46O1XM597EZDwsz7/kjtK/FrQDUgLT/RulxWfSfWsF/ks6WOIq86rTs9uInvs+tp4gd73Zq6aoRnymsK2qMxBNBw/f04D3MAMf2KpJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIZ/TgGY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIZ/TgGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E7D1F00A3F;
	Fri, 28 Aug 2026 04:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892731;
	bh=NXtBeCwx/teWzDc/2bLnx+HQVge3yMIgNBqFbYj3xYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WIZ/TgGYSQtCmlpMlW7y2J5D3sSA1njAGnDMyfWvDKq9rnhKSqNGWSwRzUMYWtW0j
	 rhjKiEoUTq+0jLnxCkb9cMBVNxWBZZozng6srMgD66FGh+SFj4db4voFWiYfXhQrbZ
	 p2ZX+vw0ZFC26kPiX32cr1xhfU1aoymvjY31wcnE18/O8eBSao0QYfXVs/rax+o1rf
	 bqnCl1VybTbuMh7EnTEgBOW+m+5TdzPRt+NGJOuQPv4T8yGIQ3UFURGxwsnqVgF/OA
	 89TBQle88GtMoaWQL2T3vJ9KiTPACujcxHzFOpcWKRyzDHuKJ8QwE+0cCVw32r92i3
	 JWO2EjrUBA6xQ==
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
Subject: [PATCH 21/27] objtool: Fix noreturn detection for non-sibling jumps to SYM_CODE
Date: Thu, 27 Aug 2026 21:51:50 -0700
Message-ID: <d8a6c30639aca44db48dacd979049d2b90d15f34.1787890035.git.jpoimboe@kernel.org>
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

Objtool doesn't consider a jump to be a sibling call if the destination
isn't a function, so srso_alias_untrain_ret()'s jump to
srso_alias_return_thunk() is ignored by objtool and the former is
falsely classified as noreturn.

Change the noreturn detection to consider such cases as effectively
sibling calls, except for one known exception: jumping to .altinstr_aux.

Currently the misclassification is harmless: dead ends aren't marked
when calling a noreturn from an alternative replacement
(CALL_UNTRAIN_RET), they're ignored by rethunk validation, and ORC
generation relies on unwind hints in the SRSO code regardless.

Fix it in the name of robustness and in preparation for a subsequent
patch which generates a list of exported noreturns.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c55851ec389cd..d27303220c29d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -264,8 +264,22 @@ static bool might_return(struct objtool_file *file, struct symbol *func)
 		if (insn->type == INSN_RETURN)
 			return true;
 
-		if (!is_sibling_call(insn))
+		if (!is_sibling_call(insn)) {
+			/*
+			 * Assume a jump into a non-function eventually returns
+			 * to the original caller one way or another, e.g., the
+			 * jump in srso_alias_untrain_ret().
+			 *
+			 * .altinstr_aux is an exception, cpu_feature_enabled()
+			 * jumps there and then right back.
+			 */
+			if (is_static_jump(insn) && insn->jump_dest &&
+			    !insn_func(insn->jump_dest) &&
+			    strcmp(insn->jump_dest->sec->name, ".altinstr_aux"))
+				return true;
+
 			continue;
+		}
 
 		dest = insn_call_dest(insn);
 		if (!dest || !is_noreturn(dest))
-- 
2.55.0

