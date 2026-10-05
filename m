Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1DD47CA73
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196886; cv=none; b=AMRWeQFh4AOmWGKUvPFt0z7851j+f0ICePJLgTyYbcdFXmtdMf3J+wWXCkv2qdhVf7OghzUS1IIwR4vB4FWmQ4z3KW+aoZhnWQuLPyNX/bLfwMig1XF+/xGhSWzXyRMCSIJVF78+zw+lOfhQtAgbQ1bvChXobDu2fQ/pPy10pqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196886; c=relaxed/simple;
	bh=0rh1tGK65GgDdKhLNrne8adrsKWucIOf+haXj8nRc9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e13V/+xOJQVa33cJf5IFmTla9LR7N1A4vnlDAza9/7DEvij0qKaOQUDqOB4pXdso0+b5jwZXQfr8MivgDPIg884VRfKDk1ssOf1BUq7dnzoeKma1OI5w2GaUkCw2ElbJvr8GujOEcwf77XqW91LalWsqbyJ9hLrK9N0RejMTX1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdDc3ltI; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdDc3ltI"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so890907fac.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196882; x=1791801682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9NCXgXEU+eTnZrwsIgbW2+ZLBzY0l64Gt7pEinkNuQ=;
        b=IdDc3ltI1zysuUGj9aOokUy/4mmj1n7wSMK9SjlTIzefDI8/oAEBVU6spJ/Tf5WX0H
         boX3l7imUW2A3pSZT/MWeU+UZc/v1Lemnx6cIgW7V/sEYtA8HbmYrTzmSIRojdw6SiJ1
         FQGrk/1ntL1VVkYoJl3JfPhBAregemT5djrd6uyVtMBJHPmhZb65C4UoJ6HQiGLg1JKP
         txZqRxvcRTuUjYIZNYCOpmz4e7It6ulrEuBE7TxE7InisRfCcDg6cuTUInKA8GO84rvN
         L3+vAWCoiO0FNYv5VW0JbEwUTLNTEPxIbT2rY0VyPAeaODnZJlww5c+AUJ7T4JzgzgTe
         OJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196882; x=1791801682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9NCXgXEU+eTnZrwsIgbW2+ZLBzY0l64Gt7pEinkNuQ=;
        b=Mqv0RRAMPNXbBO2bU7Ac7eaidwXouX/p98DqEjFDrMIlGjbBbz/YiJXKa2Tvx1Ly7q
         BH2HjnnKhr6HdfWc4+rfZnlvulW21oTWHtN4ab/W9G1MDxs+QHxlzv/GSjn5b6wMsm5G
         Xju7AQfUyMavrugKOHxN1s7fk2bdUfQre87QhCoUzyaSfWhGvvDxfbqkqE7UDXPEl4zg
         OxFl2Vl6rbUvriXKk9F0EgiGzY1wK0Muu2dIu08VnEhPbnfsqlKM7KYO+ebj3+U471IA
         q3sEzxai6rMXBthg4oCQBxHfpuixm7CpZPRwf8TiK5z4iB2Uf0/rdNLc03QmrM4spsZx
         0rIA==
X-Forwarded-Encrypted: i=1; AKwUvBzKEkRXPPRNPCMlkv/FIDxH4dgIpAga37fHsLuR2N62zSr/oYcsduG36TvfpbtvXvkOzoovKYWkP56YZ5U=@vger.kernel.org
X-Gm-Message-State: AFuF++kig0a5FI22nFrH8r5XfdRYawjQLPJpSLpe9VhhGdZAeK1FmaQW
	nK7GngoYk2BRiaK014rrlafhPwkdosxu88g2c0+aVXktFujp5woM/aEE
X-Gm-Gg: AYBFou0sEnaNjADkWpCTQsgGwchi7YJAO79lJl+G5HbZB3+jVZ24+KDsl2VLtx+5IzQ
	6mKNRqRK4fwiZ1YbRfQRqV6MI5WoGuNCJ10OhOG9Z17jbS/MqBqmTku9Jocqjp4mBs1FYQR2iqm
	KVZ8hwsKizXHrEx5fGlZRLU2+42PkASyqwi7LaQ1uebXESh0imCZ0hcXYUlLFO4s5sOBd7evr3P
	szmZM6AYXK1wTT/DjyQ2E1kYjU8q6kC/5nuYSybQfhS9s5ugAZD1tGYWUre4om7wUqmMgKIkdw4
	abf+54rbWoCANfUhq8f3SAso4p3be5nO8gslCm+LGOx4ooNTqfx2Ojkuzx9FpyPtRfgpMs2wmB7
	0J1ghL41oNFSpCxqGXDXEp3/UgcX9e3T6SonjfWOq8RzkN/ez83j3C01t9DJ2Cbk9F+p2MKtaiX
	zYXSZWSVuxvcRc33gkHJ3nYr13P/n5MxQuoJ1sjkym8vknqaYo4e9f/2d17ewmZ4oru+9GzulnS
	3E/7UnVaITo
X-Received: by 2002:a05:6870:3928:b0:48f:e21e:1e6f with SMTP id 586e51a60fabf-49e15e70462mr8494216fac.50.1791196882539;
        Mon, 05 Oct 2026 03:41:22 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:22 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] tools/include: fix signed shift overflow in 32-bit unaligned accessors
Date: Mon,  5 Oct 2026 05:40:50 -0500
Message-Id: <20261005104050.1786222-10-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

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
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 tools/include/tools/be_byteshift.h | 2 +-
 tools/include/tools/le_byteshift.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/tools/be_byteshift.h b/tools/include/tools/be_byteshift.h
index f7d1d1698..2bda8d199 100644
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
index dc8565f39..e5c78a48a 100644
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

