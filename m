Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32F3A83AC
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477664; cv=none; b=saT/LKbaDNxZE2UYHC9l2GA68w4v74Dv1tZznQdh9vSRG6JYMZ2YdQK+X8lTvGGskbs66n9vd3OfD68lB4SuzCLsmwy/4BsU2vAuIdY7t+6baBQvcvl08f9fRCNizqNJ9y0NEfT3QNGqyABUBxgyaGa90MCYHMvEXXlPfG3xMl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477664; c=relaxed/simple;
	bh=bcuQ7LMEACKJ3JvNf0UztttIfxoVuo/ehmgNFNCcHrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GszE7dS0DzolXmlXrd2x+FZX8R51SCZGJWUW4tMD7NzG9r8XzstLD+Zacnbe/LppOL6+FybuqMIMAVPVd2b+gMzDasZWyGNeYzHicYo8fBF9TsO1v3SwMpjwGOujUk7wE+wJgTs7Q7Bod68TN72jbcEA37CKwBhxY8HPZruBml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2KTJBxj; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2KTJBxj"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6cfed5dd083so3912973eaf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477660; x=1792082460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2K9maewCfN3/lZMB0AaOdvJAo1a2gEMhfplZw3EyhQ=;
        b=n2KTJBxjlbtj7o2poP2vJj2gyC9Fl0sUvvamI38X+09K11IxCua7FpHFwNO2nkPPAP
         N7fBKLB4miMVSCOXjCMvJyLysyGHyRv0Hzot5FO8Cv7G9EzbsaDy4Nm6Huw8ok12ZqJv
         i9/D5H+f+vTlnfoPfYp430S+bVqa85du4xuAkdEpOtYuGujl+QCX9gonqZi2ZurxY0Pl
         yh6wBCPN708FP+gbDaGr4oL9+zWYs15/Wuk5aU775qmlQJdxpuigcxS8hxnjKb8qvCYU
         dEreLelTKlpPz/gDWgr4M4VoB7Di7n5fiW9ZJjL5/rJFE/AAfjpkLk3Ho2FPo4rfsCJY
         yF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477660; x=1792082460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2K9maewCfN3/lZMB0AaOdvJAo1a2gEMhfplZw3EyhQ=;
        b=zuVHDlpRRpRjUaEmJZ2+dCdK+cHIR8fvbEJXr6b0v2Rci1SmHfK8LI9ozA6aIPO+Za
         RJkT05VDx2qG0ep8EzKqBzYEbcxlle8NNyat8WGu+CbzLQy8BqnVfaPzbMiQokiwiskh
         UOfyRV1/iHCNmsWRSbrJ7XoU7KuRdnd1cvlKySldLaeGDMPjYBFgUkD9qBTDFEVRMBzP
         fkXxuyous6wFDoS6CLE5BZUBHm/mmChYV4L1a3Tu3kxnGoeCiOncZ/NVcmGPaFXoUaJB
         ul0W4cYHF0fnBXftnT1Rd6QNwpnmCWE6b8HTCIU/zoMNrYyTzNbdhtz/rDoYoZgoVRhf
         tt7w==
X-Forwarded-Encrypted: i=1; AKwUvBzi6RJiY3lPArFBezTPWQESMq2/9Xsd1R5fA9HNMfS94V8Hjae4/80GVa1IfF9XxrbJxnPX0MLSa1nzhuA=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ5zlDAlr5UFtAaDYb/5GqNz3GgS/clL6qPFQen0aVh1wvNfGI
	2ZCTDedzp/vnlt1q5DKH7tvUI3ne30Pn1a8tAKuedNMU327l2urEBcdN
X-Gm-Gg: AYBFou2v1PTebE1Rg75mwSN1Jnk8ruKKyvho1xd3G8gJhNfJwPGSGDziR2GH+v/XUyS
	jWnUpME7ePTpzbTf4hdA1bWeA2uvsmlWn+RoJDYmokig1ZMUBlWOxRzaAEEUWznEpXttKFxocK/
	p/baMGvC3Lc+tkmz821vKq7OzihAWy1f9VxCiemtAldOZUUMydW/UuL9xzg6KN8zsxXXzYAqAAE
	8f/YTw4xugjvp2n/Zww6tprkz6YMq7LwXxA3/nflj3iBFCmrMP6J17q79M3Xd8OeCE5+5qpSfTV
	gGABFm8B2veIdqpCn901GDjXzXSL4g78r9EKHUSlTJIBHfx2RfeyiMwzWay338peHLxCvYtERU0
	qej8Zk2bQdp+1/7MYnMfBEsCoGczGGnOHYBNGh6zI4AyX6BH4nMcSGSes6Iy64Ianf+AmvO5L3d
	39H2hNVpX3xXzQq3WAa5k/F3ZXL8oBASVbnV3xLIAaiGe6M8eAn4QDLlmspT4p+mHy+2QlwOZ9W
	OTNGFSnEk7G
X-Received: by 2002:a05:6820:7082:10b0:6da:3a3b:526b with SMTP id 006d021491bc7-6e7a7492ef9mr4091077eaf.57.1791477660425;
        Thu, 08 Oct 2026 09:41:00 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:59 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] tools/include: fix signed shift overflow in 32-bit unaligned accessors
Date: Thu,  8 Oct 2026 11:40:35 -0500
Message-Id: <20261008164035.3668885-9-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In __get_unaligned_le32() and __get_unaligned_be32() the most significant
byte is promoted to int before being shifted left by 24. If the byte is
0x80 or higher, the result does not fit in an int, which is undefined
behaviour. This happens for every kernel virtual address, e.g. in
sorttable, and UBSan reports:

  tools/include/tools/le_byteshift.h:14: runtime error: left shift of
  255 by 24 places cannot be represented in type 'int'

Cast the byte to uint32_t before shifting.

Fixes: a07f7672d7cf ("tools/include: Add byteshift headers for endian access")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-10-lzsx618@gmail.com

 tools/include/tools/be_byteshift.h | 2 +-
 tools/include/tools/le_byteshift.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/tools/be_byteshift.h b/tools/include/tools/be_byteshift.h
index f7d1d16989..2bda8d199c 100644
--- a/tools/include/tools/be_byteshift.h
+++ b/tools/include/tools/be_byteshift.h
@@ -11,7 +11,7 @@ static inline uint16_t __get_unaligned_be16(const uint8_t *p)
 
 static inline uint32_t __get_unaligned_be32(const uint8_t *p)
 {
-	return p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3];
+	return (uint32_t)p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3];
 }
 
 static inline uint64_t __get_unaligned_be64(const uint8_t *p)
diff --git a/tools/include/tools/le_byteshift.h b/tools/include/tools/le_byteshift.h
index dc8565f397..e5c78a48a7 100644
--- a/tools/include/tools/le_byteshift.h
+++ b/tools/include/tools/le_byteshift.h
@@ -11,7 +11,7 @@ static inline uint16_t __get_unaligned_le16(const uint8_t *p)
 
 static inline uint32_t __get_unaligned_le32(const uint8_t *p)
 {
-	return p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24;
+	return p[0] | p[1] << 8 | p[2] << 16 | (uint32_t)p[3] << 24;
 }
 
 static inline uint64_t __get_unaligned_le64(const uint8_t *p)
-- 
2.34.1

