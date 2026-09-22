Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB8349A3C0
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102778; cv=none; b=FrpQ4MqvfNy3rLwAx7Mkd1ARwoLzAJzPx4aiEd4zI/12PHuP8mMeUEeun/vMeGB31MjQx1Vcv3Ck4XdcnlfGMHomiqPp63SQWNF9zKDmst565m+9GJGVXSfm6fnVBkq+cQLAHWsNOEq0YS6rJLeBY4idolvt3fCLnYfLECr7hNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102778; c=relaxed/simple;
	bh=IuMpNgCx/wsRt/giACaxjy53WAUkwMR2mJuQ09sqhYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyP02XrefqdzpNhpzrK6V47GjclmgsTAGe7Nte3SgyfyYyuRvlWsd5tQVzOj6CAGMCdbK16LWlbpUyLCOo7MFb+uTY2FzsnqVznzoiLd9sYR+ExG16EK+1G+S9KJYPKzUtg8Xv1lk3yv+bFVyPXummTPBV7+kX9cxEj5Drt+C+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scCWnbb0; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scCWnbb0"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4923c9429so150629b6e.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 11:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790102769; x=1790707569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvBW23f2UuBKO8svIifjsjiemFC1LwQ9bznHBbhEXQs=;
        b=scCWnbb0xhmsAtCfiaPQQ/PnR491Vl9Mgp36n3EjZOAeN9cpUrfc6YlI267aUQCQ+h
         Ycdr4njzS5rjrgnwDOVR2u8jSHx37FCQKlvJwxrwQgMqxjsbEuUsoAeFZDG3MY225Yhh
         ePDF3gnibux7M5Yz8RM77vJJ5iNtUA6AQs3OtCPKLlxZXqz5nmWyfYo+TlTyvUx24bZm
         PyWcj0GMGeogWSYhj4XvUumq5wkHOk9RhXGT/ctW1YMeEZEJDly5TqHf4U8o8KR4ytxG
         L1I9c4pt/BvCTUhWeA9qeIc7M3m0aQYq1X7vM3eR/FxIxkOLZgauIrDm+DOdLQ4IY4cW
         PDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102769; x=1790707569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvBW23f2UuBKO8svIifjsjiemFC1LwQ9bznHBbhEXQs=;
        b=emXGsr1fPAN24/VNbgDmrWk6B6omtq3x6J4nRscv7kmkApeUOKo0kh8eCnTjbHnfFA
         ZlDjtI6VeSay7KjZSoyZ+Yug9p6B+5r9oG+LgBdqmB+6u6Adt5ujYVBYq2mlwhCYgEZQ
         e46mwxu1MA93mjys8Ju/Z/MQDwmRjap3g5R9et+L9Pa7EKnaAO7asvgCQvhvYvvLbHdf
         nhYEUUJngxSJM28Ri4OslQSHLY/vUBfPGkwsXxgzAs9JxI7T9vmtewknH3BDIjre44s4
         faFQ3Wdld7bjrlPGmw8lvvnaDTDeuVUyic9V0SJ96Cz1TL7adK+xuSwa6E7w3mo4Mrsj
         W8Aw==
X-Forwarded-Encrypted: i=1; AKwUvByJkIuJw3ilGluTHXwrwUTVElo84MPVfKtsaur0oFtL0QMGqEk+7x5QP3hMfJLIon6QX5ZEsK/vb6no9b8=@vger.kernel.org
X-Gm-Message-State: AFuF++n4GaqNELzkU3ijjK+BVKygBqP9OeOV9OusQrOvZzfHO9b5ekQ+
	g2LcUOqcDnYtF8BT1jIXMPiuqUkm0sPuLPKaKUcgAZpwt9eZdVD0vs7I
X-Gm-Gg: AYBFou1XrtItbHNU1WDJV0Nyu/pjOvWZ7A6g4EZwhUO/5EXHP/ERx3Pu3N+UJmqNeRe
	A58b2Zzs+X9DT0y9ZZJloNNJKOUvDTB/4t1yeAt9lFSRxzWi/0VMdKb7nvosXlI0h1fVmkAjxgt
	dklU6c+vvBzpAHe9S7M72I/lxVJVOwGTYYV/x1TcSEZ18sb/1deXvUlTM3lBFpu9Nom9rgJNvD3
	8oQjuSaBNcsbVoNRhhYupIZ5IQvY6sGGBJf2t1ir782ftChV+h1cHPQ3kRt3YB+cQQn+pM021fM
	8doZ0sTbovDh7FNVHPvN3GuZZckfugpY8eAGHMBKI34yYplnzFmZuvLKISpB1LyGXaZMvrEvYrC
	2LegvWtQ4W1MFY1/e101e+T8C59UgouJ/BmtCOvxccw2e60AdmoUzWVKOwoRb4YEbWptpHKUHY1
	IXWzUo94aHRiFtPDK5Shfb3Ckrj04oqx58K7DjFd16uGPXIz8q2ppOcbbbshg+HskAosrHmGdKM
	B2k69aGATQBEpKkTRLJGSvvPJDsclCabQ5MpDqAANjqo1NCkthtv3fp2SyRbkbYx7eaMVG4GyTP
	8rs8oKjZTaMSVmKqyaTndr8lJ1Om5Tg=
X-Received: by 2002:a05:6808:14d1:b0:4b9:e65b:8c33 with SMTP id 5614622812f47-4d5b8cd7d75mr333208b6e.33.1790102768645;
        Tue, 22 Sep 2026 11:46:08 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4d5c43a24bbsm147545b6e.7.2026.09.22.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:46:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 22 Sep 2026 12:45:58 -0600
Subject: [PATCH v3 4/4] kallsyms: Unroll 24-bit sequence reconstruction in
 get_symbol_seq()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ksyms-tune-v3-4-681a34ea05d9@gmail.com>
References: <20260922-ksyms-tune-v3-0-681a34ea05d9@gmail.com>
In-Reply-To: <20260922-ksyms-tune-v3-0-681a34ea05d9@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790102761; l=1647;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=IuMpNgCx/wsRt/giACaxjy53WAUkwMR2mJuQ09sqhYU=;
 b=yS/yGjzOac4hLV4AjSFZ5EelcHRPIABxP3zNa55tRBvDMQ9hjwXNYUKY/aAcVbDC1o5X/qkv+
 VdoviOApkczAe37evfvRkm/lYAf+lj76e/eHBTzZCKBe70sD1vYOqhi
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms_seqs_of_names[] stores 3-byte big-endian sequence indices that
map alphabetical symbol positions to address-ordered symbol records.
Currently, get_symbol_seq() reconstructs each 24-bit integer using a
3-iteration for-loop that shifts and bitwise-ORs each byte sequentially.
During binary search in kallsyms_lookup_names() and duplicate boundary
scans, this loop introduces branch and loop overhead on the hot lookup
path.

Mark get_symbol_seq() as static inline and unroll the 3-byte extraction
into direct byte shifts: (p[0] << 16) | (p[1] << 8) | p[2]. This
eliminates loop induction variable maintenance and allows the compiler
to generate direct loads and constant shifts.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v3:
- Added as a standalone micro-optimization patch (addresses David
  Laight review).
---
 kernel/kallsyms.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 06c79ad70cfd..8f76403e0e7b 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -281,14 +281,11 @@ unsigned long kallsyms_sym_address(int idx)
 	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
 }
 
-static unsigned int get_symbol_seq(int index)
+static inline unsigned int get_symbol_seq(int index)
 {
-	unsigned int i, seq = 0;
+	const u8 *p = &kallsyms_seqs_of_names[3 * index];
 
-	for (i = 0; i < 3; i++)
-		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
-
-	return seq;
+	return (p[0] << 16) | (p[1] << 8) | p[2];
 }
 
 static int kallsyms_lookup_names(const char *name,

-- 
2.55.0

