Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391355AbgBNQJt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Feb 2020 11:09:49 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 376/459] bpf, btf: Always output invariant hit in pahole DWARF to BTF transform
Date: Fri, 14 Feb 2020 11:00:26 -0500
Message-Id: <20200214160149.11681-376-sashal@kernel.org>
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Chris Down <chris@chrisdown.name>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andriin@fb.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org

From: Chris Down <chris@chrisdown.name>

[ Upstream commit 2a67a6ccb01f21b854715d86ff6432a18b97adb3 ]

When trying to compile with CONFIG_DEBUG_INFO_BTF enabled, I got this
error:

    % make -s
    Failed to generate BTF for vmlinux
    Try to disable CONFIG_DEBUG_INFO_BTF
    make[3]: *** [vmlinux] Error 1

Compiling again without -s shows the true error (that pahole is
missing), but since this is fatal, we should show the error
unconditionally on stderr as well, not silence it using the `info`
function. With this patch:

    % make -s
    BTF: .tmp_vmlinux.btf: pahole (pahole) is not available
    Failed to generate BTF for vmlinux
    Try to disable CONFIG_DEBUG_INFO_BTF
    make[3]: *** [vmlinux] Error 1

Signed-off-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Andrii Nakryiko <andriin@fb.com>
Link: https://lore.kernel.org/bpf/20200122000110.GA310073@chrisdown.name
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/link-vmlinux.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 4363799403561..408b5c0b99b1b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -108,13 +108,13 @@ gen_btf()
 	local bin_arch
 
 	if ! [ -x "$(command -v ${PAHOLE})" ]; then
-		info "BTF" "${1}: pahole (${PAHOLE}) is not available"
+		echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
 		return 1
 	fi
 
 	pahole_ver=$(${PAHOLE} --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/')
 	if [ "${pahole_ver}" -lt "113" ]; then
-		info "BTF" "${1}: pahole version $(${PAHOLE} --version) is too old, need at least v1.13"
+		echo >&2 "BTF: ${1}: pahole version $(${PAHOLE} --version) is too old, need at least v1.13"
 		return 1
 	fi
 
-- 
2.20.1
