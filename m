Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268869;
	b=EHOe0/+btAOtFiWRllG11mu2DG/Klvnd/cuXIw4UVa8CrkVDVq9RNRn2v+U7+eDAMu1A
	 DZoZ6Uiho+p4La36M0di902LQKvR4fAOxQNGfDNP1RvCd2NzE9MRbv/miDnLj3ujrnOv0
	 pCqeAItSJ8mQxShYfg0v5MQovis6Ggro+uIskX0HXDrrrlzcrK8egoblP7bFd/H4I8Npo
	 LXA7+CfFLxH53Fs7hMzteE3NN/55X1YamKyfrUzdQDkaJZK5NVDzsi+UOzTS7z/W51Kz4
	 tGPwTDQ1+G9nJlMdp/fZul7nhsfkyAb5rEGOyqJ0l6ugdhVeIBRJDARf7WS5EhceDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q41cj2ZOooM3h6vwWHHMv/YWDXL843F9SD+vVvgypeQ=;
	b=JOPZlo4SltNYFijIJxCsLW4UT1IlP21acw3rsABRpZOfCViWGcxz4ZGdsCOWl7W+2UMr
	 aizxO58oaJRKBlNrQQCe26ze9JmXpaEhZf0zfxFM10xwV5gA1gIXEk/beCr+ivaipzEEY
	 be21yN6eaTtoSzR7UrnCK/IK3onnmUhduO7SmE9bRfhA/WQHhV2A5KWZNC9sZfXa1Cj35
	 OWixkMtiPIeC55HVjw0mccJTRwDQk4KfQFx1fBBgRws3va2u98wfZYD+xUwevejoA+gNf
	 VTXuVJ0dh13TbSKlUqHhJBkh+ItDFScQPvdtsCIQ76U3ofy7NYgHY3PI6aRyGAogCCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FleZqdr+;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC3360A2616
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 00:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC3360A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FleZqdr+
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so937899fac.2
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 16:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268867; x=1794873667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q41cj2ZOooM3h6vwWHHMv/YWDXL843F9SD+vVvgypeQ=;
        b=FleZqdr+Sj7u5KHxSqJByB4AQLOOCV3Tqp/tItyRE66214ay7eUXn/EWeGrBbzh6dJ
         +KDoMg70yV98bTSk+R5L8RURL0zeKqm3GHSwvKjmVAGaWp7pxOK/X7sIY1ESBLiYEeen
         fYhYcaI1SXVW35QMv7KZ9qLtj5UzP9tOIfHHKBQZrroksflIbHT+dwGXHdap1J9acu4H
         2yaYyHvbiXSG82LSMKHEfLJrrOceWZUdgQLcGOI3dJth7Qeu3V0h+691i+cYL6ZI7fe/
         nx42Qgs+HgsyTntwmgOqvLGwWqiYwJrT7OlcZOLQ4jWLfgwBsM+PDy+FUK42ZAMy4gDW
         HDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268867; x=1794873667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q41cj2ZOooM3h6vwWHHMv/YWDXL843F9SD+vVvgypeQ=;
        b=mR/6u2y90IOgsy4gqx8LI4MGDQebfowqGj/EM3AKLe7qllWz5oQoxnE4LH4mcRiZpc
         2awFdAqGL/jrsh3gMq5dCHFCIzmWkFMeE1wEcoYhbMxLiufr7OvpoHKEoG/uFAtbuKyQ
         8OnlSdna6duMpO7SQ1YSgw7kZn3hsR2lcEQFxlJGhFk6En+9vPv/TbAYWq5jLFJBQ6Gd
         GgfIfS8EF+d40kTWvpNCq9YnYhTbh5AD5g9lZZFJ8RLajMmqjw8LZbKL1jkuZYk8wo80
         OC18icrWwfNgvR/OSDIJeAfTMCSYTpKL34kt1FOQgd+TslJgaY4a0zdPSVm25PRrFaOt
         1uJw==
X-Forwarded-Encrypted: i=1; AL+hErEy6yEylic7XIrqSK8R710yaP7oP0/iqFr+WnkU4yOWctadak7ZAsUho4Rj6v+nWrOgZ7SnJONVxVJcAPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DnwX8nE6Xf6ezzZV+sG/6Z6+lUgIG2dsmHbS5APqGiCQLq1+s
	CeKEjRK0XfUnqIlMYpJlikCnTlRUHmBd/XsZWDYcpg65CTWClQvnc2FX
X-Gm-Gg: AYBFou34NLPiKBmMIPPARF1pJTGqPHjtE/Af60wuIFnsnMUmGZhyG2kMPmAb+8REDBv
	odpGEgImon467YAVokYOepAoBjVkMaHK4MOyMGjoiIY/Yw+Cb7rTT6ejmlkBDVeo8j8QV8fhJKq
	JSqc6FBr3VAbXKL0HfVQJFSQNXvDjW6o3D4NbpzsVvc8acMiVHa2KZB2UxEvIl3wEHbqfHIqtPb
	VoLQfQAWDz5UoHA+26kRLI0K8fvC1HSTXM3ECx5+WGpXmP+kIu7B0cZszag17gkGx+iN42GeLqW
	Nkvg8YVH1IeLg2Btzjd014YEfCGYvyy3O8cCd1OH1vBeqgeKe47G8RQ42mPRalmKm554LiRCJo4
	+hunSR746tFlF6whyao5aWGNrSz7Xdtq0RysjcsuN3ZW3dDTNA+aSYlOISpRkg3SrEE7zdyNXpg
	alLymLD0+n4SMewWb0St5uNjYvLFGa5nyjUl88Cl0Cu6+4kHdLIZgV+eTbPFyz5drIHeb8RC+7A
	kkxydNXXT0k5ZVZwP+nkqueqVe+7wW9ML5xq8sOxq4Z27DGyG1rCFtfZWXqvA9LFy8hV0QUckLX
	W79H3fneqlj7oUrS/B0eCJaJIkDCk/bE2UlhhWmdvAQ=
X-Received: by 2002:a05:6808:1307:b0:4f6:6041:f0a2 with SMTP id 5614622812f47-5683cc18827mr1019924b6e.27.1794268867525;
        Mon, 09 Nov 2026 16:01:07 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:01:06 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 6/6] tools/include: fix signed shift overflow in 32-bit unaligned accessors
Date: Mon,  9 Nov 2026 18:00:03 -0600
Message-Id: <20261110000003.1719966-7-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

In __get_unaligned_le32() and __get_unaligned_be32() the most significant
byte is promoted to int before being shifted left by 24. If the byte is
0x80 or higher, the result does not fit in an int, which is undefined
behaviour. This happens for every kernel virtual address, e.g. in
sorttable, and UBSan reports:

  tools/include/tools/le_byteshift.h:14: runtime error: left shift of
  255 by 24 places cannot be represented in type 'int'

Cast the byte to uint32_t before shifting.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: a07f7672d7cf ("tools/include: Add byteshift headers for endian access")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/include/tools/be_byteshift.h | 2 +-
 tools/include/tools/le_byteshift.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/tools/be_byteshift.h b/tools/include/tools/be_byteshift.h
index f7d1d1698938..2bda8d199c85 100644
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
index dc8565f39717..e5c78a48a78f 100644
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

