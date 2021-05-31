Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1499C47082
	for <linux-kbuild@archiver.kernel.org>; Mon, 31 May 2021 21:12:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85B4260231
	for <linux-kbuild@archiver.kernel.org>; Mon, 31 May 2021 21:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhEaVOd (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 31 May 2021 17:14:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:44718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230032AbhEaVOc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 May 2021 17:14:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DA1F61260;
        Mon, 31 May 2021 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622495572;
        bh=TQ7g+t1TJl7Xuj2apj2QBNz7adir/QisC080h7vhsYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cGb59gez0RAsmz0o6pqUA10TarQHMoiANuJ+HKp4Y9CPUOpqz3gAaQtzzj6A3NN8W
         Xip/zpCZIJX9IvBZYoPe97ExhoD/5zhBaF93rHLsAfdSwjHfSIG59IMPUkk4qLsJ5J
         ztWR4I4GcxLpOBclr885mIH/LFXSPVNRxITm7a5oLxweinqgPuZdIAbstBSEAyc1qu
         LT/OflQcxdNpnqE9TiN5aJxGwj5MXbKGWMR6QOMgtVpCV9+lm2fF8Dpuft1ecm6KNB
         XjTS5A/xpgQPsWGt3eqtW20GhLba8SQ40SaGYpGRJ9XqePb+BZtXTXBmrwQE9pqRHc
         wd9GjeOTjJ9tQ==
Date:   Mon, 31 May 2021 14:12:46 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <YLVRTilQ5k5n+Vmz@archlinux-ax161>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
 <202105191422.2E6748C4E0@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202105191422.2E6748C4E0@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 19, 2021 at 02:37:26PM -0700, Kees Cook wrote:
> I've added this to patch to my -next tree now:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/clang/pgo&id=e1af496cbe9b4517428601a4e44fee3602dd3c15
> 

Would this be appropriate to send? Someone sent some patches based on
this work so it would be nice to solidify how they will get to Linus
if/when the time comes :)

https://lore.kernel.org/r/20210528200133.459022-1-jarmo.tiitto@gmail.com/
https://lore.kernel.org/r/20210528200432.459120-1-jarmo.tiitto@gmail.com/
https://lore.kernel.org/r/20210528200821.459214-1-jarmo.tiitto@gmail.com/
https://lore.kernel.org/r/20210528201006.459292-1-jarmo.tiitto@gmail.com/
https://lore.kernel.org/r/20210528201107.459362-1-jarmo.tiitto@gmail.com/
https://lore.kernel.org/r/20210528201213.459483-1-jarmo.tiitto@gmail.com/

Cheers,
Nathan

======================================

diff --git a/MAINTAINERS b/MAINTAINERS
index c45613c30803..0d03f6ccdb70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14378,9 +14378,13 @@ F:	include/uapi/linux/personality.h
 PGO BASED KERNEL PROFILING
 M:	Sami Tolvanen <samitolvanen@google.com>
 M:	Bill Wendling <wcw@google.com>
+M:	Kees Cook <keescook@chromium.org>
 R:	Nathan Chancellor <nathan@kernel.org>
 R:	Nick Desaulniers <ndesaulniers@google.com>
+L:	clang-built-linux@googlegroups.com
 S:	Supported
+B:	https://github.com/ClangBuiltLinux/linux/issues
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/clang/pgo
 F:	Documentation/dev-tools/pgo.rst
 F:	kernel/pgo/
 
