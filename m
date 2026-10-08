Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4473AE707
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477662; cv=none; b=iaEvn6EFpGOV/I4NcKixAKE0/Nwif6JeCk9qMwwhFiIj9c1iNsAWZrqgM3du3FIwxnldZb8z1oQw/Fer6mPWycRGQxGv7n8g79MaPTJSDgcIrFqiPjWOnaQx2gSxKFxAtdSLKZhAq5oXYqYEizYi/JrvSc0uxrtu0TNZwiNyT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477662; c=relaxed/simple;
	bh=CGkt08J1CJ/VMUDa51WjoDDacvdEDDXnqieV0LWPOc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TD6Sh/N1HjDqvmc/qiR1vhqSzjw0BGaPspafHI9qgWTEeZ5Q+dYsFzPA1R9EZVUOioFbhdz8X5OPy55HijV84WQV6b36r/o0bSlMT5vQqEgyhwtAOCs7aZvqO9FACpvNzfnEkQukFfl0VFaM8mWHSQZp594lHxNJGl7MOrhuL6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncg9kAgQ; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncg9kAgQ"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6cfed5dd071so2222827eaf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477657; x=1792082457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ol9KVV9igaZHeICPjqaqiMrJ1pRvQcCPa+Vpo3abd3M=;
        b=ncg9kAgQHBns3QWBJ24TAwvTgAGHN46Z9BldkUYoqD42Zo9sK8BakrGsB8eYmRAuHd
         vfOYGCsNJPGsoIwj9VLK0SMf/LyZBj6HK8V4H0gwJ6SQ1dgVzt/of5/6m6+4AI5OOMNZ
         w1taSeXTEl48HTYWDHARpgVAUzlCX+/+Cys0gZ3fmOxUqSjyIAmL2q4QP3uXNffoARMe
         IYOX9fB8FbKs32iRBWbPDF25dhLXBxcnhtonBJdWdezgetIaYQat8vxbCwmrw3mhl0x7
         /KAPE3HC0XGN/WrbzYOBV7+L7U9uBi/ZjbJOeIyRTUbwTz41Er4qM7smYc+ZTavmfBUP
         Y7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477657; x=1792082457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ol9KVV9igaZHeICPjqaqiMrJ1pRvQcCPa+Vpo3abd3M=;
        b=Y0rvsyxX4oE6aL+BSjn3h3JkP1Lx38IlbIvG6rr9SoJmdQLVhscQ53hhxyQQbpzelD
         uZ4NnTW+cs7AKZwXkCxubPHEiHEyox4TLc/jkIPPKjgfu7rrgdgx/uMwds9+HEpPDrv3
         wRiTTarsEUxGZs8ZtY5hstRFA6ee4FPTmktK2fmbW12wrp98Dnd/7GK785yKAc8cz+Mq
         dKI+LoPnLVPedimbLwmz1vjpD98uwofZ8k5M1l0m1uzk1SQR98O7GhDplFF2GR0hWQjM
         aHfcnHnoa5CtUrPYqrRdh8dV2VPiMXyY+t781/oQd8ABl4+g5R6gavG5jZhAfRmVcm1P
         2/WA==
X-Forwarded-Encrypted: i=1; AKwUvBxAK7WQ3RlLMqHjtFUcdezdrR/SkH+fO7n86eyVEzevzvUK2W2OCFa/yoYDNowRfVEHQ4L6Zugf4elloZI=@vger.kernel.org
X-Gm-Message-State: AFuF++mnmPPPklp2FHUCxBrCRAH+T2pbfYnFGq9g5TkfIwQ86P5OLPPn
	unKiPOT/sMtyvzQOvV19pF29yTZZ/mCSe75anvntYtAIByH8SVA65nqb
X-Gm-Gg: AYBFou12rumyGW9H43R/QW3Y3g4S5X3eGzHpTrWMHQXa+6uvWyIEpc8uydIwxGpjSE7
	dUwJAOz3yRj2hTPB62zJdKE7eEe7dKotU+99yfkHbBJg04ylgTjQ8RHIr3ZFso2QiV1dOqpoJNB
	5YLAfAkkeTvtz4cRsPgNNj1PGobLqr9RCpi6OoErX2bw0net55XRQdOT9pPSpYrDIXah/nQ+7l1
	n4PiaGxw++y6dTF2NUY3xaf5FIK3cazK/H//VC6oAh5tGmMpmaZmIBHSt/rsed242Mrw37XrJ2S
	2SBRNDK8MSkBt+WxqxD8b3KMXoJzFU1aJ5H+cNnR9ydah3jWK1koXoLMJEMhndtylmrvmCVZS3c
	JqFlZ4DCRnRVOwzE1xDkrEC31FqBPo7+yGQsUk8gY/c1+gz4DvsXxPGDjhMDaC1inoGhqQEd1nz
	IZyLTjv7vA6t7BuAdnJvg0OhSD0PUXES2KsqVS40FtJQ3KxwodE0cksrr+4XRQz29ab5WtGGGxk
	TeqAVpFFW4t
X-Received: by 2002:a05:6820:1909:b0:6d7:69c6:5292 with SMTP id 006d021491bc7-6e7a87a417emr4835468eaf.45.1791477657232;
        Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:56 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] modpost: fix pointer arithmetic on NULL in parse_source_files()
Date: Thu,  8 Oct 2026 11:40:33 -0500
Message-Id: <20261008164035.3668885-7-lzsx618@gmail.com>
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

parse_source_files() checks whether a dependency is in the same directory
as the object file with

  (strstr(line, dir) + strlen(dir) - 1) == strrchr(line, '/')

When the dependency is not below dir, strstr() returns NULL and the
pointer arithmetic on NULL is undefined behaviour. This happens for
every module with dependencies outside its own directory, and UBSan
reports:

  scripts/mod/sumversion.c: runtime error: applying non-zero offset
  to null pointer

Check the result of strstr() before using it.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-8-lzsx618@gmail.com

 scripts/mod/sumversion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 3dd28b4d00..4c59e7cfbc 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -364,7 +364,8 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 		}
 
 		/* Check if this file is in same dir as objfile */
-		if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
+		p = strstr(line, dir);
+		if (p && p + dirlen - 1 == strrchr(line, '/')) {
 			if (!parse_file(line, md)) {
 				warn("could not open %s: %s\n",
 				     line, strerror(errno));
-- 
2.34.1

