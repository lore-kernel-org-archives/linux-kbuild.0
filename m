Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527AE3AF64D
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477653; cv=none; b=BKaaS1fGBt6WsrBoXEZhydaLJjvwZwnaIqNzpe0HqeWQvfs45bh8G8yCN89f2030ABGOn+x7hA6/J62dklJ8YxpP8XowxepB+F0SV8H7pnmsKoXDgHhGBvQL/OIVfraAcApZtxOJ7YbDnuePnlZl+Q9/PpQfdiaaa4Zy+V9bvc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477653; c=relaxed/simple;
	bh=Pa8rCN/ylvIhfOP3MUtjtxQn4ZgMu6lbTjYns755EKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J+Xs87urU9TRDzqtYZ65YlseNz82UiONacuas2DuauYBBSKmqtVZkDQcHuTLyiybsoFYu2ZGvVxc/jZjExrW0tB2jcBjE3xp6DXG03bMN0l/VpLT/97bRZ9bkoGJrrWwyI++biXrvszkZTTsOlTN/M/p5/RO2BeUk1nxadI9JmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWYQ6hmz; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWYQ6hmz"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d7a9e2eb24so3056960eaf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477651; x=1792082451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zsCIkE01nFQonqFuKVR3/gHQNrFrhYBKFETrHyf3kw=;
        b=SWYQ6hmzecxf/aO6XuQD75GiZGij6IkBml5qhTAo1qfiV6PaI6r18KzYOubFTgAoJ/
         f8rNazZPfvgejxr3LcW2ETIXcJCX5mLR3U7kbzjze11qeHf879pnombKssYJfuTLMS+q
         cFBhmiu42PMVuVRdLzGWq8llZWivta0K/uDtbjAL+TJHZaDcdjRaVQ/aAXseqeEgOA3k
         uhX8gJ4yITpNI4dH+ounx1UKTg9MoOI11sGS94lbPFPvqLpFHlWhfW7YtQxyd5GjdMRi
         jLPaFuCzEH42Lxad4dJFKk/trqBTnF4ZGCkd4BaJbbOeTkyWQlklZVjPReeA2pdGz4CJ
         VVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477651; x=1792082451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+zsCIkE01nFQonqFuKVR3/gHQNrFrhYBKFETrHyf3kw=;
        b=LXOOd7MJ91vj+D4QxS2yjNvs4rsiBrW9Neh08Vvwm1FG2djueg04Q8XoZvgyIe2CXu
         B/cfJNkbGChkBJCpbqs7l57RySQulzfEh7yAcrl/Cai81cF79Xi6JD06lgW85EdLFrjR
         q3WzXjX+rR8izUomj3JWBnvab2s40Q2wzTZ9v6A/MwQE3tw/Dyi7Yk5SvCMUtoAmIbi8
         Y6NZznEbAi2rJtQgPAcTwkFG1GvxzqC3uprqaV4VvJ066bUl3NaWU97ZaAaF9b9oDPL4
         kBmRw8t0M87R1l4t2f1Bzi+PjRyI6s91Fc+dDPyUuA5CuLal2bkFRWwPw+rI8DmhHZ9M
         XrVA==
X-Forwarded-Encrypted: i=1; AKwUvBzT0586pdgfsnugt2TDC/7uTTvJ0gNhQE68n7R6wc6FOpAzHEEdYEjlmmqBoNx8FOoqJhwG0AW0Wn1jJe4=@vger.kernel.org
X-Gm-Message-State: AFuF++nVbPpoB6j+evN6tuKwj7aeUzRhRq1XyZDzZoT7vV9W63FC/twv
	NULeS6tVU7w51dToS+gvMZauCOLbgN1T8sly9+vn6XS1KXBKmtYkXmsDOlvF1w==
X-Gm-Gg: AYBFou3P3cU6mhJIWPOkQ2YV+Mb91MzEaX6APN4pkiWGyAQtoM5eWvWZaO1Y420Ty/w
	tJWjI+H+QTselBpL9P25LcPpcD0HLd8/YwhWCSRN13Y7a/fMNdrvkkYSj5IFiTm2ibhAiirQroX
	S+/1QMlK3BdzdADjaAKs6v2qa4bg9RzE/2m+vmw2jx5T+LCUhk6/x1rJyPIY53EAPnv/j/q3TvG
	TO/7m9p3/B+QW+8WFNH9zGSF999XO3ENbsQeKIY9n6AKyiu5Sxbhso8PMBAjxBhbJLFMQhE0RtY
	fASZzK2TM3l0RN8mEtX2jW/Ud125kcKQfRIohIp/d+0/wHSuqMmd+XQ0KGVz1KNMWhY2Jod8Eg9
	1jyELrbjszUN0LX1mGJKs5AQvXzVUs3Ln4OJX7uHxDMe6aqHDsvwrOoiWBU1jTuYGWNqa6hGCis
	I5fXyIyLxCNuXaEu3VJYBmLNCnMR/HCfN+QccBVF2nrW1+7EWaCERQsI5tUZJBYePbSUj4QMlJf
	Myj6+Dlus9D
X-Received: by 2002:a05:6820:4dec:b0:6d8:b1c9:6c9b with SMTP id 006d021491bc7-6e7a65db9e7mr4805418eaf.21.1791477650971;
        Thu, 08 Oct 2026 09:40:50 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:48 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] fixdep: fix out-of-bounds read on a comment ending with a backslash
Date: Thu,  8 Oct 2026 11:40:29 -0500
Message-Id: <20261008164035.3668885-3-lzsx618@gmail.com>
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

When skipping a comment, parse_dep_file() treats a backslash as escaping
the next character and skips it unconditionally. If the backslash is the
last character of the file, this steps over the terminating NUL and the
loop keeps reading beyond the end of the buffer:

  $ printf 'foo.o: foo.c\n# x\\' > foo.d
  $ touch foo.c
  $ scripts/basic/fixdep foo.d foo.o cc
  AddressSanitizer: heap-buffer-overflow ... in parse_dep_file

Only skip the character after the backslash if it is not the terminating
NUL.

Found by fuzzing fixdep with ASan/UBSan.

Fixes: bc6df812a152 ("fixdep: parse Makefile more correctly to handle comments etc.")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-4-lzsx618@gmail.com

 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 54063d9804..9b57fe5554 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -280,7 +280,7 @@ static void parse_dep_file(char *p, const char *target)
 				 * escaped newlines continue the comment across
 				 * multiple lines.
 				 */
-				if (*p == '\\')
+				if (*p == '\\' && *(p + 1) != '\0')
 					p++;
 				p++;
 			}
-- 
2.34.1

