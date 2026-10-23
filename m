Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738173;
	b=Yrw0zP4Gitp8QPrYfF7HxTmuLk9VY9F83msYKYo3I6ANnKGHb3trBMU85+De27fc8y3w
	 gaCF89NIbVAnR7zCkkcDnZrIKz/nvUbTa3AeS3cXxyLNSa2/Aotc/WrMhIMtsqxNpqkl4
	 UAUcP3oqalK4IIXFhOFBD92OfI8nZE+heuVPHMZ2xPLg0yrkX064gaGGJeQstcaGTs138
	 v1WwMkm95xWKQiuPsDPBSw7TryTGeGpP0vCE8ZTQAV+DOyzrTU4+J0+hPpRv+gN2h7DRr
	 EtUtT7hso8j24obGYlPuflMJLL5egqseYXT/wheQed735tCLed3g9M8Caem728pDOUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738173;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Bbup0xDfsHBOOfWlrbo0j1pUSl8H4qeOPTbrrQ/Kies=;
	b=raPZ+Lw/nFtMhou7jXuf+gVzXMrYI8TQOj+pejir59a8kQBuPBKn8Wc8qrVv7Ekg4Ok+
	 tlD+FvRNWu8ndHaHZhA6JD41mj+FFfh5ProONZ/idjA6qfR0VgHc2DF16vsQ/ZDzkQttS
	 uWFPappI9ngRD99T0bPUvsdVYtyncAFAajhJIXBWIkCD9gPYCM++7JYXgCwRYuicmrXzQ
	 ZtmhKr8bgn8XvwTLJCzNVDS5plZVLATz0YC6o/L6LST//t3tFoNddvc/HpIIKaQTBL8WI
	 R4qLpyzChdUCAEVZu4kflrBar11g6QYI/ipPGA31TBndsFRo4x3rRZhsEeAKut3lDzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iB4voxMc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EB606A331
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Oct 2026 06:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520EB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iB4voxMc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bbup0xDfsHBOOfWlrbo0j1pUSl8H4qeOPTbrrQ/Kies=;
	b=iB4voxMcjx29B9cwX3MwlwobMzY34z141izelK79YBDUeW+G56xQ7slVW5pBGFAC52/xXf
	4UdEgq0H8SM8r4IsUDcscygg3jRDLovrVLRsZ2lNuU48vjmRQ5aXk9IF+qJLJ1/qEcAwwW
	Knn23gjntqmvwyYhR87s1sJ19e6E4J0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-XjNVYYpnMaOb9zi6w3NL-Q-1; Fri,
 23 Oct 2026 02:49:28 -0400
X-MC-Unique: XjNVYYpnMaOb9zi6w3NL-Q-1
X-Mimecast-MFC-AGG-ID: XjNVYYpnMaOb9zi6w3NL-Q_1792738166
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09D831955D8D;
	Fri, 23 Oct 2026 06:49:26 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 24DE519540C2;
	Fri, 23 Oct 2026 06:49:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 02/13] smccc: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 23 Oct 2026 08:48:39 +0200
Message-ID: <20261023064908.66707-3-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/linux/arm-smccc.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2ee..724bcaf0775ad 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -8,7 +8,7 @@
 #include <linux/args.h>
 #include <linux/init.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <linux/uuid.h>
 #endif
 
@@ -313,7 +313,7 @@
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/linkage.h>
 #include <linux/types.h>
@@ -364,7 +364,7 @@ s32 arm_smccc_get_soc_id_version(void);
  */
 s32 arm_smccc_get_soc_id_revision(void);
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Returns whether a specific hypervisor UUID is advertised for the
@@ -413,7 +413,7 @@ static inline u32 smccc_uuid_to_reg(const uuid_t *uuid, int reg)
 	return val;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /**
  * struct arm_smccc_res - Result from SMC/HVC call
@@ -761,5 +761,5 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 	})
 #endif /*CONFIG_ARM64*/
 
-#endif /*__ASSEMBLY__*/
+#endif /*__ASSEMBLER__*/
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.56.0

