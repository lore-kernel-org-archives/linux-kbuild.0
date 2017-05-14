Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bbox.sascha.silbe.org ([84.201.25.44]:59721 "EHLO
        bbox.sascha.silbe.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759302AbdENRJq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 May 2017 13:09:46 -0400
From: Sascha Silbe <x-linux@infra-silbe.de>
Subject: [PATCH v2] kbuild: add explicit ARM support for tar-pkg
Date: Sun, 14 May 2017 19:09:42 +0200
Message-Id: <20170514170942.27944-1-x-linux@infra-silbe.de>
In-Reply-To: <CAK7LNASc7NgthfZCWFT=3FhRQxxJuuzDVjT8GHik5A0+zBVxpw@mail.gmail.com>
References: <CAK7LNASc7NgthfZCWFT=3FhRQxxJuuzDVjT8GHik5A0+zBVxpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

buildtar warns when an architecture doesn't have an explicit rule on
what files to copy, even when the generic rule works just fine. Add a
rule for ARM that does the same as the explicit rule, but avoids the
warning.

Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
---
v1→v2: rebased on top of todays linus master, including commit 152e6744ebfc

Not duplicating the rule would have been nice from a maintenance point
of view, but doesn't fit the current code structure very well. It also
avoids breakage if the generic rule ever gets adjusted to something
else that doesn't work for ARM.


 scripts/package/buildtar | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e046bff33589..ea84ba67619b 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -108,6 +108,9 @@ case "${ARCH}" in
 			cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		fi
 		;;
+	arm)
+		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
+		;;
 	*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
 		echo "" >&2
-- 
2.11.0

