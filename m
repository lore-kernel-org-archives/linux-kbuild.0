Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61C6C432BE
	for <linux-kbuild@archiver.kernel.org>; Thu, 19 Aug 2021 00:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C61C2610E9
	for <linux-kbuild@archiver.kernel.org>; Thu, 19 Aug 2021 00:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbhHSA7N (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 18 Aug 2021 20:59:13 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60148 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbhHSA7L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:11 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4l017219;
        Thu, 19 Aug 2021 09:57:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4l017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334669;
        bh=z5Enux3X+2bxuEr7VV8Kw02JAFcpN8X+hEDG69gW3MI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hgT+MEhaLtUUwZYJum0sLX0NN+DTtcKN6Hd1N1YnTvYwkZHJCai7ieYZd69yYTlqJ
         1qRm9B/WyIZyz6hjfltXHYa4lpg+pEl4sCvYPxChqnTu/QqkkCzFc0tmZ1YlPO+lQx
         nOxLIfBgRbnjFufJBnpO9zbDgnjPXq5O3fpLOPQ3suk6GhXP5b8pIKuzrVUEu6E0gl
         yt9egM4I4B7bdgX26uO8yEk33gYFgbVkYbU8au+7WvyvGc0Ba0jONgKp4I0jcOdiNy
         7R6PJBmrOG1LbwNqrABwf/D5PWGDtLWz79upgLBYVO5Eplo75IFHnPm9W+gwgjXhfy
         TJB1bRIERueHA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH 02/13] gen_compile_commands: extract compiler command from a series of commands
Date:   Thu, 19 Aug 2021 09:57:33 +0900
Message-Id: <20210819005744.644908-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current gen_compile_commands.py assumes that objects are always
built by a single command.

It makes sense to support cases where objects are built by a series of
commands:

  cmd_<object> := <command1> ; <command2>

One use-case is <command1> is a compiler command, and <command2> is
an objtool command.

It allows *.cmd files to contain an objtool command so that any change
in it triggers object rebuilds.

If ; appears after the C source file, take the first command.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index b7e9ecf16e56..0033eedce003 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -18,7 +18,7 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
 
 _FILENAME_PATTERN = r'^\..*\.cmd$'
-_LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
+_LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
-- 
2.30.2

