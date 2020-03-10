Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:28070 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgCJKPN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 06:15:13 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] int128: fix __uint128_t compiler test in Kconfig
Date: Tue, 10 Mar 2020 19:12:50 +0900
Message-Id: <20200310101250.22374-2-masahiroy@kernel.org>
In-Reply-To: <20200310101250.22374-1-masahiroy@kernel.org>
References: <20200310101250.22374-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, George Spelvin <lkml@sdf.org>, Masahiro Yamada <masahiroy@kernel.org>, Dan Williams <dan.j.williams@intel.com>, David Howells <dhowells@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Krzysztof Kozlowski <krzk@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Patrick Bellasi <patrick.bellasi@arm.com>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, linux-kernel@vger.kernel.org

The support for __uint128_t is dependent on the target bit size.

GCC that defaults to the 32-bit can still build the 64-bit kernel
with -m64 flag passed.

However, $(cc-option,-D__SIZEOF_INT128__=0) is evaluated against the
default machine bit, which may not match to the kernel it is building.

Theoretically, this could be evaluated separately for 64BIT/32BIT.

  config CC_HAS_INT128
          bool
          default !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) if 64BIT
          default !$(cc-option,$(m32-flag) -D__SIZEOF_INT128__=0)

I simplified it more because the 32-bit compiler is unlikely to support
__uint128_t.

Fixes: c12d3362a74b ("int128: move __uint128_t compiler test to Kconfig")
Reported-by: George Spelvin <lkml@sdf.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 20a6ac33761c..4f717bfdbfe2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -767,8 +767,7 @@ config ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	bool
 
 config CC_HAS_INT128
-	def_bool y
-	depends on !$(cc-option,-D__SIZEOF_INT128__=0)
+	def_bool !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) && 64BIT
 
 #
 # For architectures that know their GCC __int128 support is sound
-- 
2.17.1
