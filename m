Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738219;
	b=SbArxgQwLS0y8A6gHndmOMAF57ZVR7HDQw0VbZIAfZpWMbzsVfRrpLVFk6iVLp9G3GyN
	 RP1RxO8Xt1jHXtFCt9M/5KFWcP7+ToeMXbSd2hotkpepghueWPto9m5dHuRXW8eGIigTD
	 ZwrLjs28kMxos/+YYOF7ujuWaS5l0N16hx7cWAKewC4SAaSF88+Il3I/V7JJ1Nd4XLTqt
	 eOSuSy+kbhEqmVz/n/nprIdLUdtG17q+Qe4pi0XGZuZOIpFEE5ed0f5Bxa5FCiGBscYf2
	 +Kdo/cGPFk4lV6GOmPv+9F72AtUueU1Kti/3R3CpLoHLkFTgVfeZWP2dy5xWmwFnS9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738219;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=g+zDfkV7W3mK9yy6qtJ/PyGkiFHI5UxGEdxpEKnA6Jo=;
	b=nnNZ/Dcqxk1h9XF4lbrW7OUEXDudem66AiEuD+q/hfbGeTr8yvhtOMlDSkMRxZ8s7rPA
	 qADMnVZzvLDFrz5QeJVosgAUQORR2Rdp3vqXn8Lr23v30rbX/DvCJoFpjwrtYYoIfjImk
	 0CtAYYww7iQr8O69TkQosf6+xiVL9Ta33+FwCzFEPx6JYxJYjCgTkWFM0hrbl1edoFUcv
	 j5+/GVcwtQT6FEB/0YmNLB/6u5+hBdLnzL11C9fzcxRechXtpUOfpK2uYjChwGu7cp4QE
	 84D4Ll6PGB/2dU42tu0ztzv/qyF4dj+KAA32hYJkvbxzwjKjhPmpnWUNp6FoOOQD2Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aoA8uBEQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56C606A328
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Oct 2026 06:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B56C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aoA8uBEQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+zDfkV7W3mK9yy6qtJ/PyGkiFHI5UxGEdxpEKnA6Jo=;
	b=aoA8uBEQHb/lafoBEO8ubDeXTFqOOD13cOsw+FSfxzMFt7nTgZFadXgvkvYUUak+RrpPOr
	eGZGRLdRyYTd8//veRVX5kmsskF1zt+4JJ0pt65G6cPDe5MmX6PpWmrLp8q6MjsBCYoMTm
	68hIszTwPVO7pZUqHKvydMA5teZwLr4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-r-jURbIBMXG8ve_GmI9YAQ-1; Fri,
 23 Oct 2026 02:50:13 -0400
X-MC-Unique: r-jURbIBMXG8ve_GmI9YAQ-1
X-Mimecast-MFC-AGG-ID: r-jURbIBMXG8ve_GmI9YAQ_1792738212
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAB1D1955BC4;
	Fri, 23 Oct 2026 06:50:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B7A41956095;
	Fri, 23 Oct 2026 06:50:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 10/13] uapi: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Fri, 23 Oct 2026 08:48:47 +0200
Message-ID: <20261023064908.66707-11-thuth@redhat.com>
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
 Documentation/dev-tools/checkuapi.rst | 2 +-
 include/uapi/linux/a.out.h            | 4 ++--
 include/uapi/linux/const.h            | 4 ++--
 include/uapi/linux/edd.h              | 4 ++--
 include/uapi/linux/hdlc/ioctl.h       | 4 ++--
 include/uapi/linux/types.h            | 4 ++--
 tools/include/uapi/linux/const.h      | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/dev-tools/checkuapi.rst b/Documentation/dev-tools/checkuapi.rst
index 9072f21b50b0c..3c9a3a58c24da 100644
--- a/Documentation/dev-tools/checkuapi.rst
+++ b/Documentation/dev-tools/checkuapi.rst
@@ -273,7 +273,7 @@ Consider this change::
     -typedef unsigned __bitwise __poll_t;
     +typedef unsigned short __bitwise __poll_t;
 
-     #endif /*  __ASSEMBLY__ */
+     #endif /*  __ASSEMBLER__ */
      #endif /* _UAPI_LINUX_TYPES_H */
     EOF
 
diff --git a/include/uapi/linux/a.out.h b/include/uapi/linux/a.out.h
index 5fafde3798e57..cbcc37674e64c 100644
--- a/include/uapi/linux/a.out.h
+++ b/include/uapi/linux/a.out.h
@@ -10,7 +10,7 @@
 
 #endif /* __STRUCT_EXEC_OVERRIDE__ */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* these go in the N_MACHTYPE field */
 enum machine_type {
@@ -247,5 +247,5 @@ struct relocation_info
 };
 #endif /* no N_RELOCATION_INFO_DECLARED.  */
 
-#endif /*__ASSEMBLY__ */
+#endif /*__ASSEMBLER__ */
 #endif /* _UAPI__A_OUT_GNU_H__ */
diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
index 565f309b9df8b..6d89e477fc79c 100644
--- a/include/uapi/linux/const.h
+++ b/include/uapi/linux/const.h
@@ -13,7 +13,7 @@
  * leave it unchanged in asm.
  */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _AC(X,Y)	X
 #define _AT(T,X)	X
 #else
@@ -28,7 +28,7 @@
 #define _BITUL(x)	(_UL(1) << (x))
 #define _BITULL(x)	(_ULL(1) << (x))
 
-#if !defined(__ASSEMBLY__)
+#if !defined(__ASSEMBLER__)
 /*
  * Missing asm support
  *
diff --git a/include/uapi/linux/edd.h b/include/uapi/linux/edd.h
index 0fe3e02aec653..566f206964862 100644
--- a/include/uapi/linux/edd.h
+++ b/include/uapi/linux/edd.h
@@ -53,7 +53,7 @@
 #define EDD_MBR_SIG_NR_BUF 0x1ea  /* addr of number of MBR signtaures at EDD_MBR_SIG_BUF
 				     in boot_params - treat this as 1 byte  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define EDD_EXT_FIXED_DISK_ACCESS           (1 << 0)
 #define EDD_EXT_DEVICE_LOCKING_AND_EJECTING (1 << 1)
@@ -187,6 +187,6 @@ struct edd {
 	unsigned char edd_info_nr;
 };
 
-#endif				/*!__ASSEMBLY__ */
+#endif				/*!__ASSEMBLER__ */
 
 #endif /* _UAPI_LINUX_EDD_H */
diff --git a/include/uapi/linux/hdlc/ioctl.h b/include/uapi/linux/hdlc/ioctl.h
index b06341acab5ec..0905383d72aa5 100644
--- a/include/uapi/linux/hdlc/ioctl.h
+++ b/include/uapi/linux/hdlc/ioctl.h
@@ -35,7 +35,7 @@
 #define LMI_CCITT		3 /* ITU-T Annex A */
 #define LMI_CISCO		4 /* The "original" LMI, aka Gang of Four */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 typedef struct {
 	unsigned int clock_rate; /* bits per second */
@@ -90,5 +90,5 @@ typedef struct {
 
 /* PPP doesn't need any info now - supply length = 0 to ioctl */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* __HDLC_IOCTL_H__ */
diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
index 48b933938877d..00743f894e7e3 100644
--- a/include/uapi/linux/types.h
+++ b/include/uapi/linux/types.h
@@ -4,7 +4,7 @@
 
 #include <asm/types.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #ifndef	__KERNEL__
 #ifndef __EXPORTED_HEADERS__
 #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
@@ -59,5 +59,5 @@ typedef __u32 __bitwise __wsum;
 
 typedef unsigned __bitwise __poll_t;
 
-#endif /*  __ASSEMBLY__ */
+#endif /*  __ASSEMBLER__ */
 #endif /* _UAPI_LINUX_TYPES_H */
diff --git a/tools/include/uapi/linux/const.h b/tools/include/uapi/linux/const.h
index 565f309b9df8b..6d89e477fc79c 100644
--- a/tools/include/uapi/linux/const.h
+++ b/tools/include/uapi/linux/const.h
@@ -13,7 +13,7 @@
  * leave it unchanged in asm.
  */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _AC(X,Y)	X
 #define _AT(T,X)	X
 #else
@@ -28,7 +28,7 @@
 #define _BITUL(x)	(_UL(1) << (x))
 #define _BITULL(x)	(_ULL(1) << (x))
 
-#if !defined(__ASSEMBLY__)
+#if !defined(__ASSEMBLER__)
 /*
  * Missing asm support
  *
-- 
2.56.0

