Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A7452188F;
	Mon, 21 Sep 2026 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029906; cv=none; b=q35fbIY8xP05QQjXrBFOgqFVrYPwdpTZDdQk+EF4mYM/4a3RKxCM/g1j4v0Fhz5oIcB3N06z/PIxXuxAimzBQSU4SRsWAXy7SgT2P4tw7MGO55ousfqrQW/oHNrkJnnKQMOk1lNcAPeGEb1qfV9hS3ozbKn2em4zJvBXjHAQTY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029906; c=relaxed/simple;
	bh=MoxkdQ1PZtbscQc+lhfZEsLtnTOuV5Kr1isBaLFfg/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWzFuV9G0sJ+gqrS0gbNvSpi21P/PinAUED0UzHjpb1VjxbfvGIF1bqEsi5dYIz8BB+8g+OcWv7wyUuFn9t46nu36/HMulS0Q69hbvRk3o3LuG6H1Ijf7aXFSkfmk6fEuRLRGX+ODXdmTUAKdpIbkD9DcqYuKU+YDRL4WSZkONw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCtqSkM1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCtqSkM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A5A1F0089A;
	Mon, 21 Sep 2026 22:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029905;
	bh=oMAVVsJ+ySiw/1VP59+j9m215Ku23i+uiwwAe+dcMn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YCtqSkM1pebd9lLpu4ENYTZdnTWSuwQDEY75WcJNPisqnpzMXElQtEPt4qBm1pTYw
	 mOdwgsl1aBnagG1MbomJJtOQow/AcM0AHrNtS0X4RM6OOB8TXMYTYXY25fLAljpnqI
	 smLwg+s5/0qnBcdzKiOk9edfr3TPtr2LTRL1DVqrEP+jE66tJRguCH4yELm797gcCy
	 hPi7D2bl+CXtelvXotF+T0+rsZY/iyr2/bwPwoA5Ji3u6NJVNFzZD4gIhgf3OupIkM
	 2pglJMxLptmCH87ykrFpAC7tqbJ35LDX8NaIWpq8N09ZmvGwG/w2Q2wlofS7c7nTqO
	 kYhTkZDweH2Gw==
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
	Huacai Chen <chenhuacai@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 15/28] x86/xen: Ignore noreturn status of weak mem_map_via_hcall()
Date: Mon, 21 Sep 2026 15:31:16 -0700
Message-ID: <95d58db2a40544c437e71af6d44de73623e80559.1790028654.git.jpoimboe@kernel.org>
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

Unlike the non-weak version, the weak version of mem_map_via_hcall()
doesn't return.  Tell objtool to ignore that, as the protoype (and the
non-weak version) aren't noreturn so its callers can't assume it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608280214.c28GlIx6-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/platform/pvh/enlighten.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index f2053cbe9b0ce..9f227f06cbaf5 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -37,6 +37,7 @@ void __init __weak mem_map_via_hcall(struct boot_params *ptr __maybe_unused)
 	xen_raw_printk("Error: Could not find memory map\n");
 	BUG();
 }
+ANNOTATE_IGNORE_NORETURN(mem_map_via_hcall);
 
 static void __init init_pvh_bootparams(bool xen_guest)
 {
-- 
2.55.0

