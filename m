Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8A3AE189
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477920; cv=none; b=QTZf4kRddzJDAY4AT3Q+lXpAMlSEJzOfFqsWdld1otxKDfEFcFu3v9aTJq6GxoASJdppez1KKe1LWJ16kew16Wvz9CAtolT7DYlMxCni876Meq20AK5Nny8956aU5UmFRSh3ZF6sKAQEtwEqM0fl696UcQk11MHjNCyzNBh3Vn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477920; c=relaxed/simple;
	bh=5PYnFE/zsBkyDW+vipipK1OVktzKt+eBP7yMTnpTo9U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dYcXAQDDxiWl3Fmm0P8wzbnpc4VD8cV1XK4R3nxp/wiIcxr2GCbjqB8dbH1rvq1KK+V1NzQvXxRFlTpcAm+1Xk9sa702ByDzmXB/YbIkKe+/Q6lHkcEpCQrmXzmaickm9kBWO+Fhn41xORpBA3iN27hdNls4I9MUa7Al3D2TGCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWz5f1N9; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWz5f1N9"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4b1ba286f6bso568937b6e.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477917; x=1792082717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuXXcDyEq3+vqBhIoHH0IdXSZPJA/Xb1zKM6JTo4TRo=;
        b=mWz5f1N9cPEpspsjHYXjA/KvlaB3F8TWnI65Sh8QYVoEDUP4YTRtfncfknZHUvWxuq
         DA8Uv2tQQ/gNsvy8qe9PUc0Zn7Xq8+6B5jZXKsPnV0XhWfBRbJJ0LOxhMluAkx9TNLB8
         Y1ciWIE61FZh4+TUFdEuMJU4wgCcZ4eDkPepJe/UzyfxRYakatMndbN42kTPW6FSdUxE
         PATnwCxXN9cdnP46Fhcs5/2aztBWHfKZAwZVQI8TWSOcKrcBk/Y7vmLCHocCKnUzGwV1
         NfkfRSESRCRSNIzBoBTXSawK95Y7i9++TiUCtivKZ6pgCQH09+Nsgp4V+n+ht6UZMs2u
         AjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477917; x=1792082717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuXXcDyEq3+vqBhIoHH0IdXSZPJA/Xb1zKM6JTo4TRo=;
        b=tPsH/YvO3SQyXhmNeZN6Ans7yla/PZqRrVzx6Jkxmz3l2nFxWpeqd68ebXHv2omYUI
         e8BNkm1lWKYj21sciR0WuKsI1TN6dWyS+AF8E4FoLp6R1zlGGfSn1D75DYgJYyph04sr
         237VYoN5YKLzMsTRsKb1NYpY0OmNDb4OtG00JTthEu3BnwDTXc2kxalpoauo7eBeL3A2
         9epTK5Al/RxASA30S4YKr5U6uxbdTWt8Z0SMw6PLyBIlFPboTEw7bj6Nvp7dT+gTS756
         GgHnW+aUFCIdl2CLcjYcj+3VZG1B72EPXtImcHBcMgHvGNlesVmIKxOgvDi9edzsC/h9
         LeVw==
X-Forwarded-Encrypted: i=1; AKwUvBx59iqt415Sc4TKIFMYKGPXDvZMWz2/DRb1mK1O3MZc+kBdkLszJtZ4PESjfuS6Bfy5AEojz68Ta3b2LJc=@vger.kernel.org
X-Gm-Message-State: AFuF++l7IfferV751Xm0cSufF1PbMvwvlDGXH57IVV4QhxFHER5CigVo
	OIN4BgLeGavjKEa8KIHd/u4CvSwMKU1qvo+p+pbYuExyAD6fGSOQO7Jg
X-Gm-Gg: AYBFou3AJtRqA289QiiianzqSHADTszA9jCJX5gLFenJU8MVYoM6MxYlZdQx5tZ8kkj
	nG7zyJT5Qxp50REIG1ybU9reFiEfGAflhtqnpLev7DTxTBUz0YAzZapjCR1T5WKONj6GKbMwDqY
	tD+fJfunmB4dFC0Xvn6U76aJsMKUhX2MqJPfFAh7Dqj71a5QoUtXNGRi2EBQbRER5TcbpgBVxGX
	pP7Q5Iu+E0qe9ydzO13j2b3NME5eHKjM/m7IB3n1Aw6ekW9/ZCptZs7nL9Z+UVXIYZxcrBOhwjd
	zfTJu128K/elwpgIIXLd5NI07gAinXV+8CBnccjsEyExUu4Ly4M0/myr/mpTivEzYha3Hur6Zld
	hzey83cWUTr8eizcfHVpowxRrSPbHRl2aM/hww69RHJecQ1Dadlw9marx8q0fWVsFFtGgwDwoDF
	ys4ZCIUH6vAUcbO1fjCRpj+DjF1l3YK5yjkNWHspLhXYdBKyoEdqoN0D2vBeYVcIus+Bb6AZNnX
	vadN6pb3K+OxA==
X-Received: by 2002:a05:6808:1581:b0:4ec:1bf1:fa82 with SMTP id 5614622812f47-504bf863556mr1925851b6e.46.1791477916974;
        Thu, 08 Oct 2026 09:45:16 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc484f73c7sm6151566b6e.6.2026.10.08.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:12 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: fix use-after-free when a variable refers to itself
Date: Thu,  8 Oct 2026 11:45:04 -0500
Message-Id: <20261008164504.3683811-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a simply expanded variable, variable_add() frees the old value of an
existing variable (or allocates a new variable with an uninitialized
value) before expanding the right-hand side. If the right-hand side
refers to the variable itself, which is a common idiom in Makefiles,
e.g.

  X := 1
  X := $(X) 2

the expansion reads the freed (or uninitialized) value. With ASan this
is reported as a heap-use-after-free, or a SEGV if X was undefined.
Without ASan, X silently ends up as " 2" instead of "1 2".

Expand the right-hand side before updating the variable, initialize the
value of a newly created variable, and only free the old value when it
is actually replaced. Add a test case for this.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: 1175c02506ff ("kconfig: support simply expanded variable")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202433.3460844-1-lzsx618@gmail.com

 scripts/kconfig/preprocess.c                  | 21 ++++++++++++-------
 .../kconfig/tests/preprocess/variable/Kconfig |  5 +++++
 .../tests/preprocess/variable/expected_stderr |  1 +
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 783abcaa5c..db226898c9 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -293,27 +293,33 @@ void variable_add(const char *name, const char *value,
 		if (flavor == VAR_APPEND) {
 			flavor = v->flavor;
 			append = true;
-		} else {
-			free(v->value);
 		}
 	} else {
 		/* For undefined variables, += assumes the recursive flavor */
 		if (flavor == VAR_APPEND)
 			flavor = VAR_RECURSIVE;
+	}
 
+	/*
+	 * Expand the value before touching the variable because the
+	 * right-hand side may refer to the variable itself, like
+	 * "X := $(X) foo".
+	 */
+	if (flavor == VAR_SIMPLE)
+		new_value = expand_string(value);
+	else
+		new_value = xstrdup(value);
+
+	if (!v) {
 		v = xmalloc(sizeof(*v));
 		v->name = xstrdup(name);
+		v->value = NULL;
 		v->exp_count = 0;
 		list_add_tail(&v->node, &variable_list);
 	}
 
 	v->flavor = flavor;
 
-	if (flavor == VAR_SIMPLE)
-		new_value = expand_string(value);
-	else
-		new_value = xstrdup(value);
-
 	if (append) {
 		v->value = xrealloc(v->value,
 				    strlen(v->value) + strlen(new_value) + 2);
@@ -321,6 +327,7 @@ void variable_add(const char *name, const char *value,
 		strcat(v->value, new_value);
 		free(new_value);
 	} else {
+		free(v->value);
 		v->value = new_value;
 	}
 }
diff --git a/scripts/kconfig/tests/preprocess/variable/Kconfig b/scripts/kconfig/tests/preprocess/variable/Kconfig
index 9ce2f95cbd..226114e86a 100644
--- a/scripts/kconfig/tests/preprocess/variable/Kconfig
+++ b/scripts/kconfig/tests/preprocess/variable/Kconfig
@@ -51,3 +51,8 @@ $(warning,$(greeting,Hello))
 
 # Unreferenced parameters are just ignored.
 $(warning,$(greeting,Hello,John,ignored,ignored))
+
+# Simply expanded variable referring to itself.
+X := 1
+X := $(X) 2
+$(warning,X = $(X))
diff --git a/scripts/kconfig/tests/preprocess/variable/expected_stderr b/scripts/kconfig/tests/preprocess/variable/expected_stderr
index a4841c3fdf..7008e3b177 100644
--- a/scripts/kconfig/tests/preprocess/variable/expected_stderr
+++ b/scripts/kconfig/tests/preprocess/variable/expected_stderr
@@ -7,3 +7,4 @@ Kconfig:41: AB = 5
 Kconfig:45: Hello, my name is John.
 Kconfig:50: Hello, my name is .
 Kconfig:53: Hello, my name is John.
+Kconfig:58: X = 1 2
-- 
2.34.1

