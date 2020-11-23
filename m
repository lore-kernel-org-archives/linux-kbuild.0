Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE48C64E8A
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 Nov 2020 04:55:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08B662145D
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 Nov 2020 04:55:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="PV2/7AQ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgKWEzV (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 22 Nov 2020 23:55:21 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:27311 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgKWEzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Nov 2020 23:55:19 -0500
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 0AN4sGHj016676;
        Mon, 23 Nov 2020 13:54:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0AN4sGHj016676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606107261;
        bh=OiWvzr+PPEES1+WiZtvnEdTynTSS1JuRWBS71ZMozL0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PV2/7AQ0QWcMI4GeBHWkFmhLprNvWXA7F0X+mazSUI/NL/HRSztRTK8hY5wV6Evmh
         9fuAhyVgxyoJ2NaqYA8BEziqNaWwwVaoKRpsMnSTjw82RFu4QAyAT0ZxwVKWvVCXmE
         yoWM+Z6tQ2DIb0j/JGHKjAX0KTgRDdARgMI0wJ0gis8GmplVHksz2DwHqaMepKA5Me
         IM5CC+R5trZADC2JQgjAXfZ2wNqvfWRYPYOfVl52aGQzttp+fLd/4WBGjjDw4QfyHR
         CnLuj8UbJxUTYY46Pjn/cmWY1jO4B7rY7wvMcSTPRjI8kl/chQIqZ8HZ+aywhrL+sK
         lSoJvGzSOUocA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] kbuild: doc: document subdir-y syntax
Date:   Mon, 23 Nov 2020 13:54:03 +0900
Message-Id: <20201123045403.63402-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123045403.63402-1-masahiroy@kernel.org>
References: <20201123045403.63402-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no explanation about subdir-y.

Let's document it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 159e470f2616..6332b9ca7942 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -319,6 +319,20 @@ more details, with real examples.
 	that directory specifies obj-y, those objects will be left orphan.
 	It is very likely a bug of the Makefile or of dependencies in Kconfig.
 
+	Kbuild also supports dedicated syntax, subdir-y and subdir-m, for
+	descending into subdirectories. It is a good fit when you know they
+	do not contain kernel-space objects at all. A typical usage is to let
+	Kbuild descend into subdirectories to build tools.
+
+	Examples::
+
+		subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
+		subdir-$(CONFIG_MODVERSIONS) += genksyms
+		subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+
+	Unlike obj-y/m, subdir-y/m does not need the trailing slash since this
+	syntax is always used for directories.
+
 	It is good practice to use a `CONFIG_` variable when assigning directory
 	names. This allows kbuild to totally skip the directory if the
 	corresponding `CONFIG_` option is neither 'y' nor 'm'.
-- 
2.25.1

