Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42139 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964907AbcKDSju (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 14:39:50 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/3] scripts/has-stack-protector: add -fno-PIE
Date: Fri,  4 Nov 2016 19:39:39 +0100
Message-Id: <20161104183940.30692-3-bigeasy@linutronix.de>
In-Reply-To: <20161104183940.30692-1-bigeasy@linutronix.de>
References: <20161104183940.30692-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>

Adding -no-PIE to the fstack protector check. -no-PIE was introduced
before -fstack-protector so there is no need for a runtime check.

Without it the build stops:
|Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong avail=
able but compiler is broken

due to -mcmodel=3Dkernel + -fPIE if -fPIE is enabled by default.

Tagging it stable so it is possible to compile recent stable kernels as
well.

Cc: stable@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 scripts/gcc-x86_64-has-stack-protector.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gcc-x86_64-has-stack-protector.sh b/scripts/gcc-x86_64=
-has-stack-protector.sh
index 973e8c141567..17867e723a51 100755
--- a/scripts/gcc-x86_64-has-stack-protector.sh
+++ b/scripts/gcc-x86_64-has-stack-protector.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
=20
-echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -O0 -mcmod=
el=3Dkernel -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
+echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -O0 -mcmod=
el=3Dkernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
 if [ "$?" -eq "0" ] ; then
 	echo y
 else
--=20
2.10.2

