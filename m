Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C7647B41C
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196881; cv=none; b=tzbo5Wob386QzVRsSdN6YvVAldMnhWk7GQoj3X7fRBuH2+UAGOj5SZfXcy6iCmL17XIO0vGUUywNR3eet3x69yNPDMARFVQKvrrBpCzENWX7OdBvmAGmE1Y2fP59Nup2Dtv3ibAXx0T/yhh3Hvx2ZGS9nCbUAV0MqbXqGy/MDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196881; c=relaxed/simple;
	bh=lxTV8zb+/ah+Q+pD5ZPJo6Fkfw+aRQuqeJEmjUazSpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XC33KWQS0GaV2dP45oIwD2HBhgXYF6jjy5moShOitQbvx/qN+kOltyS+Bo3otGwkrVO4ijddG6R34POaWeTSRnl9AH0Lvy144hwc0KDCUc6tdoQTbl+8yoJLzilUfYxFXH/rIZ1XBV6MFuLh9/mwxF0/wJ5hRTJIJOnrIg43ERg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdNkHIKb; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdNkHIKb"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6dd7070699eso1340108eaf.3
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196878; x=1791801678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1qzV/hN8nZ4Hd9bI8LartapyGj4b5NFK++8dr498H8=;
        b=IdNkHIKbPE5nDR1pUz4bk9/1RNrLyLvEefiYjTYsib385TLBZkBYkH6RbIVBx92gzL
         lbOxIRfyyL8wMnOW29TT3auwHLkSCKKc5zkWN65mdT5v1pRKYUYjTN9N++zxbGj4j1IA
         vtZtymhLCRnqSwIPIw7Kl1Vk+9N3qoQMmVWAzL13WH3/DyrNMoBj+n/B7joLMa+ts+WC
         h87yVGp7GD26W1kNElHfbfYvrnTlQToJq3zGWTmL1tQG+80Hw/ldiBRZQgly5CNxN2/R
         FMxiv+EPr69g3c61XOm/uwNA+nJ8hv8ITdTur/0N4G2IxZmL3uFzBT29O5pMx0LelY3u
         XUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196878; x=1791801678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1qzV/hN8nZ4Hd9bI8LartapyGj4b5NFK++8dr498H8=;
        b=rVDPj6B0ca1Pw+VrdHkOgwx1IuFFn2UkbKuOyjXNECLUNAptq6tB/zD+lqQbknrM2S
         2qYujIX+vomWtwb24HAB84I7GvEslXt9RbtuWFibQUVPxTgPp/exhdGe2fBPkNRtQFdX
         6ivpQ4HqgJGqUqDtecPVsygRw9YpPunVvQ3kIxXOfamdEjaNppVFYnJfIMtiMHh2nLYF
         tZI1ndYvoPv9e8X8qnBxJ7j5/PRG+SnhSEDtdsh6ypAYgNCZsj3CZRWFd28bA1MwEdIT
         1xEly/9uQ9JRJa9zIR4Ah+eArcQQS6XVC7OXvOiQSI6jhupIGbYJ1f/wD9FyBMV6WCmt
         ZLfA==
X-Forwarded-Encrypted: i=1; AKwUvBwPDkXmdcqeXPrJNMKoEjZNEcMVSISND+oc5Yt3wc2UECmAgv2tCDBbuC8+cj14ZQoxndCXrqYcoFFaZig=@vger.kernel.org
X-Gm-Message-State: AFuF++lGVmxvMt+791k0mJc/jWIZe+bMIXExK1RcLZBAM8sPqQ6ASMWz
	ANxYsFf2WekPFHlcbMiRdX2NWazhcM76xcNELFwLSgzDQ7meRQC18AjS
X-Gm-Gg: AYBFou3pVAL0CS/bZXwoqXO06tVc3QBxJfV3dfcDbZJ88FksLa2Perhvnah/KZKp3i8
	JyMa3u3PXj4RgMiN2/bher23OIHy1/LGAisp5tDybo0nQ1drYPNL1BCrfSPg8d9nRWrLwOOmt6k
	Pnw9YWjX9EfOScJdadtdF4nyUikMi3oWozeEJsVpyMSWR/3yRWmdZqhTJ3NYdLnGH5hi8g3KeY0
	mdKgbnEF6VvpG8O2ikA5I7x4b1693N+hfuAstoEzQmX0G14y1j1uI6ac0nwVdkwG1t1GsW7QAxg
	cD5+xr+f30TJy6oLim7DkFnY7sTmIHXYPfapcQRWjQHFnKu8xDTLvGLNqF1PNvw5KsIkRTw+u2u
	qBNXeY6maGiMfIg1kd6iGQv12Mx3XUmSEw7tjP1WODVPKVgHiKudzqWzS0XW/xt+bbu9ulGfBcV
	8vjgABMvnwffU4MePgx0XkFbKsMDnEtAdBOcRsqekfdzeMTNSP4pr0rtVaH1WoAlU6rGFd8e0Qh
	lDuICqzVi8l
X-Received: by 2002:a05:6820:184c:b0:6df:4bc0:384f with SMTP id 006d021491bc7-6e09e18382amr6405291eaf.50.1791196878033;
        Mon, 05 Oct 2026 03:41:18 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:16 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] modpost: fix pointer arithmetic on NULL in parse_source_files()
Date: Mon,  5 Oct 2026 05:40:48 -0500
Message-Id: <20261005104050.1786222-8-lzsx618@gmail.com>
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
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/mod/sumversion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 3dd28b4d0..4c59e7cfb 100644
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

