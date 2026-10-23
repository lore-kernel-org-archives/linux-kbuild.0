Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738188;
	b=hpQ+mQvG5IG+8N/4u7/B7sgbepNd0aML9h4vgViXiMoHi9toxb1sc3ke/rITRS9QyH9T
	 iIT31pH212sGokeyFktS/PPwtSJikKpeDkD0NgZ80PIt7AUHo4wyz57hYSeWNz3/hWtLn
	 MEjdbMXwXSNuHlxaFYw88GFBWrISv9oZnP8cBf373bM/5SNcYnbWqW/vjiKllDCn6+r+2
	 R0YnKdT/+TdJMO3dT2sEfBnvR5vQyRijteo/CX9bCrfAxyMVW4SXbnQdHmlokxImkuXWR
	 pFSBxCFLi+rKP8k67L5yJRCWAZ6qhCHZH65sBjLlBw4QFCrw5XtW1yV9sqD65QWhMhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738188;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=pnsGwwPy3Map2dMpDSsf/qA7ETBcYenhQwqHxWWkosM=;
	b=KVPqc8V/7puge9o1QVfHcjIKhuiNcdocPtyYp5GHvOodff6oo4275QzHGsIO22xJ+ttj
	 iNIpeU7algg9s7mWLpNdQ+QAjudJXLEl+q07UWeV/VeC6q1alziT9mM9eI7sx+8Sz0gKz
	 WHbUGEc2LKuclCZcmItspgvOGBD0Zhp3Mn6TgW0AQ/7rh1iSWfdc/aQG0WBwOQJsw+J3A
	 I/PyI/ZcAy2gUnb/FbeEgt/qG9iDEy3LFrOb+iKVsY1bR0O12msijeaSIbcnXYIqbhh2Z
	 ysMAmDljJpndobGg7I/w9yvR1hv4TisIfnIh6LpgsRP5/oxEeYZrsiSC8OCvTWhtDTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XhMOXD7n;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6F606A334
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Oct 2026 06:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A6F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XhMOXD7n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnsGwwPy3Map2dMpDSsf/qA7ETBcYenhQwqHxWWkosM=;
	b=XhMOXD7nHyPJQit5Yi3exsI5u2mAOytMxpBfyu68JEFrAEcM579xBIwM0w2F2XXF2TOYmR
	bDMdIoSIksloGgf3GeFAi+zReni7UyYyMByeOQg4p6IjZ/H0C4Z5ftfHulR30srsceYZMe
	3v0e7FhCRntFiScVErmCfQ8yoLwiy+0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509-NOIb37YxPOqDns404ySJug-1; Fri,
 23 Oct 2026 02:49:42 -0400
X-MC-Unique: NOIb37YxPOqDns404ySJug-1
X-Mimecast-MFC-AGG-ID: NOIb37YxPOqDns404ySJug_1792738181
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57D0B195606A;
	Fri, 23 Oct 2026 06:49:41 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 94D311956095;
	Fri, 23 Oct 2026 06:49:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 05/13] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in ptrace uapi header
Date: Fri, 23 Oct 2026 08:48:42 +0200
Message-ID: <20261023064908.66707-6-thuth@redhat.com>
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

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/include/uapi/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 2ef917957005c..15e6bff56b609 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -110,7 +110,7 @@
 #define PT_DATA_ADDR		0x10004
 #define PT_TEXT_END_ADDR	0x10008
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * This struct defines the way the registers are stored on the
@@ -149,6 +149,6 @@ struct pt_regs {
 #define ARM_VFPREGS_SIZE ( 32 * 8 /*fpregs*/ + 4 /*fpscr*/ )
 
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI__ASM_ARM_PTRACE_H */
-- 
2.56.0

