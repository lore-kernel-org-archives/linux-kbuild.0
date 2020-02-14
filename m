Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392531AbgBNQQC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Feb 2020 11:16:02 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 201/252] kbuild: use -S instead of -E for precise cc-option test in Kconfig
Date: Fri, 14 Feb 2020 11:10:56 -0500
Message-Id: <20200214161147.15842-201-sashal@kernel.org>
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 3bed1b7b9d79ca40e41e3af130931a3225e951a3 ]

Currently, -E (stop after the preprocessing stage) is used to check
whether the given compiler flag is supported.

While it is faster than -S (or -c), it can be false-positive. You need
to run the compilation proper to check the flag more precisely.

For example, -E and -S disagree about the support of
"--param asan-instrument-allocas=1".

$ gcc -Werror --param asan-instrument-allocas=1 -E -x c /dev/null -o /dev/null
$ echo $?
0

$ gcc -Werror --param asan-instrument-allocas=1 -S -x c /dev/null -o /dev/null
cc1: error: invalid --param name ‘asan-instrument-allocas’; did you mean ‘asan-instrument-writes’?
$ echo $?
1

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/Kconfig.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3b2861f47709b..79455ad6b3863 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -20,7 +20,7 @@ success = $(if-success,$(1),y,n)
 
 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
-cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /dev/null)
+cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /dev/null)
 
 # $(ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise
-- 
2.20.1
