Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727824AbgAJWFm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jan 2020 17:05:42 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 23/26] kbuild/deb-pkg: annotate libelf-dev dependency as :native
Date: Fri, 10 Jan 2020 17:05:16 -0500
Message-Id: <20200110220519.28250-18-sashal@kernel.org>
In-Reply-To: <20200110220519.28250-1-sashal@kernel.org>
References: <20200110220519.28250-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Ard Biesheuvel <ardb@kernel.org>

[ Upstream commit 8ffdc54b6f4cd718a45802e645bb853e3a46a078 ]

Cross compiling the x86 kernel on a non-x86 build machine produces
the following error when CONFIG_UNWINDER_ORC is enabled, regardless
of whether libelf-dev is installed or not.

  dpkg-checkbuilddeps: error: Unmet build dependencies: libelf-dev
  dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
  dpkg-buildpackage: warning: (Use -d flag to override.)

Since this is a build time dependency for a build tool, we need to
depend on the native version of libelf-dev so add the appropriate
annotation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index e0750b70453f..786c5ab37d00 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -136,7 +136,7 @@ mkdir -p debian/source/
 echo "1.0" > debian/source/format
 
 echo $debarch > debian/arch
-extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev)"
+extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
 extra_build_depends="$extra_build_depends, $(if_enabled_echo CONFIG_SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
 
 # Generate a simple changelog template
-- 
2.20.1
