Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9832D9ECB;
	Tue, 30 Jun 2026 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854117; cv=none; b=kx4BltT8V7L0K5hoSiyuWAIcuZJsiQIvKi+fPxu6B2dyBcAeT4MfyK7qTO+uIkh7/nvI+9uNDiRuBZAMin1Hb5iZSs9aafUXbz0gCS4EunscFjB7HAPZUwIgGk6Ub4cbDCeh9bttOUJINMQr/w189HG1wuVnAhF0l9ZPFzWgYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854117; c=relaxed/simple;
	bh=SxuVxMb1T2waXH3FyiQDQOVEgf09efs3zCGT+Za2JYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HrO4Pf90FDRtDWFrWvoBIT4d+2Rm2Xhnw7HhjpPijlZWr8dbooIr4H+QD0XgJPy0vI1acWkMbP9FKd8kDTyPm51WzthONoTQQBfA/h7K5bKHc1HEO3VxlzzGQm4+F6mOW3xSW6ysJpyp65nyjGCJS7PuzHhFSZVf3yStUnPy8kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=EdtM8Syc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="EdtM8Syc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1782854114;
	bh=SxuVxMb1T2waXH3FyiQDQOVEgf09efs3zCGT+Za2JYI=;
	h=From:Date:Subject:To:Cc:From;
	b=EdtM8Sycba926/0T6Zbnc+L91llY3mr5HcEnAv2WKBacP7r4cyWgI/ldpdeLZOWpK
	 NCXTqhM7C3vNzPVqRjQrelF7RCnRBLVJEv9tvNXd1m90GuvLO/M1UtsbgtkzQGKt+1
	 V3nithNmgYvOUW53rwEQF+SPDl4JDXRHHUEqPnp8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 30 Jun 2026 23:15:00 +0200
Subject: [PATCH v2] scripts: headers_install.sh: Normalize __ASSEMBLER__ to
 __ASSEMBLY__
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MwQ6CMAzG8VchPTuzDiLRk+9BOGzYuSYKZIUpI
 by7k8SLx3+b77eCUGQSuBQrREosPPQ5zKGALtj+TopvucFoc9KlNmq2IysrQk/3WJR2rjZYugo
 9Qt6MkTy/d69pcweWaYjLzif8Xn/S+U9KqFDZmpx3Hqv8v76IRaQLczj2NEG7bdsHzvReka8AA
 AA=
X-Change-ID: 20260302-uapi-assembly-0bb7213b41f1
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Nick Huang <sef1548@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782854113; l=1976;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=SxuVxMb1T2waXH3FyiQDQOVEgf09efs3zCGT+Za2JYI=;
 b=kClOf1VMzwA9CX/CVj/HWpw4jHC2oMfwIFrFlCQakbWKthmleYAvExrRVokZBxc/WrpxItspE
 Z8UwXCpH69+DW8SYwLZyxRFfhSGfmysj4o4dy7eONjAJeLgUBpXERgy
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

There is an ongoing effort to replace the usage of __ASSEMBLY__ with
__ASSEMBLER__ throughout the kernel tree, see for example
commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
non-uapi headers"). The latter is automatically provided by all compilers
and preprocessors supported by the kernel, so the explicit definitions
of __ASSEMBLY__ can be removed.

However the UAPI headers might be used with non-GCC-compatible
compilers, which do not define __ASSEMBLER__ automatically.
So this migration may break users. Also during the migration phase, the
UAPI headers will use a mix of *both* __ASSEMBLY__ and __ASSEMBLER__ at
the same time, which is ugly and inconsistent.

For now make sure that the exported UAPI headers consistently use
__ASSEMBLY__ as before.

Link: https://lore.kernel.org/lkml/164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Normalize *to* __ASSEMBLY__.
- Link to v1: https://patch.msgid.link/20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net
---
This should go either through kbuild or asm-generic, I think.
---
 scripts/headers_install.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 9c15e748761c..83e447596878 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -36,6 +36,7 @@ sed -E -e '
 	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
 	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
+	s/__ASSEMBLER__/__ASSEMBLY__/g
 ' $INFILE > $TMPFILE || exit 1
 
 scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260302-uapi-assembly-0bb7213b41f1

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

