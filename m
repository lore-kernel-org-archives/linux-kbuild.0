Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32ABC64E75
	for <linux-kbuild@archiver.kernel.org>; Wed, 25 Nov 2020 14:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A623E2076B
	for <linux-kbuild@archiver.kernel.org>; Wed, 25 Nov 2020 14:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729901AbgKYOiU (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 25 Nov 2020 09:38:20 -0500
Received: from codesynthesis.com ([188.40.148.39]:49814 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbgKYOiU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Nov 2020 09:38:20 -0500
Received: from brak.codesynthesis.com (unknown [105.226.15.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 6F6FE5F1EC;
        Wed, 25 Nov 2020 14:38:18 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id B71A01A800C5; Wed, 25 Nov 2020 16:38:14 +0200 (SAST)
Date:   Wed, 25 Nov 2020 16:38:14 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: kconfig: diagnostics cleanups
Message-ID: <boris.20201125161355@codesynthesis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I am preparing a set of patches that clean up kconfig diagnostics and
make it more consistent both internally and with respect to other
tools (like compilers). However, a couple of changes that I would like
to make could be controversial so I want to discuss them before wasting
everyone's time with patches:

1. Add 'warning' word to $(warning-if) output:

-  fprintf(stderr, "%s:%d: %s\n", ...);
+  fprintf(stderr, "%s:%d: warning: %s\n", ...);

   This makes it consistent with the rest of the warnings printed by
   kconfig.

2. Print $(info) output to stderr instead of stdout.

I realize the current behavior is consistent with GNU make (on which
it is based) but at the same time it's inconsistent with the rest of
kconfig (#1) or does not seem to make much sense (#2), at least to
me.

To elaborate on #2, $(info) is still diagnostics, just a different
level compared to $(warning-if) and $(error-if). It's not clear to
me why it should go to stdout.

If we needed the ability to print something to stdout, we could add
another function, such as $(print). However, I can't think of a good
reason why we would need to; this, for example, has the potential to
mess up with the terminal-based UI (which is written to stdout).

I've done a search and as far as I can see, neither $(warning) nor
$(info) is currently used anywhere in the kernel outside the kconfig
testsuite. So these changes shouldn't have any backwards-compatibility
issues.

Thoughts?
