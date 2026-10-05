Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EBA43F8CB
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231887; cv=none; b=CSQ6G5KIsfl/Fnmna6E84CykC9Mq9wYHrJiOoZhnc5WOjp9q0bArbHhqEzw6DEkHtffkOBvThGxYKWWjBpvcJd3FZbp2e8QIxdeAsMD6SQENau9DaZioTdoW+z0LVOr6CGq3EXZVNFV+ApLU/I7NdhdZA6dCKwVS9kKwkP2DFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231887; c=relaxed/simple;
	bh=jmTMucWYGQFKnMjqnlPVCplSDTU2Veuev6wShH0XE/k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=llgN0IFzrS6h/Yi31izbsYzemGenmNpM9VhXCE8A65G7moIwxACgan1umDdFPrZ+2zpaarvwsfuszXudGMu2eenDft6wR+dTmVm5VI1qHzlqOrqaazlt+0OtlBdQqydtFpaaY+TOcM6ecZ2JDXDygRunjMmrYJwUEoDYmzjDBeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdCq9H6T; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdCq9H6T"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48ed460be50so1257533fac.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 13:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231884; x=1791836684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qqRgcO/AZeDpuarAytPRHqtFdoLEfnXj6tihzK2Sew=;
        b=KdCq9H6TfyL6QPCeIjl64s3dDMl22T7GIsnuUzG8XNndds2LLgVzbPpJO1V2y0Nxzv
         kCIuS7OaFVsi3wp96L7nxUV3BLXVjLnj12VjBl+Mm9N7JGwrRIwUctyiC6ACf1L7CWhT
         Bo1hR+HrejgR9jX6AlMSkBB3i82GmHVyiLvmh04Yb7DXb/nRgQm6gVxkKAXswh16f+H2
         qjQAreAxaMVg0FlyfYIgFckK+KyaIKBcYBGdyHFk1+cCB4UbZ6Lt6kdle5+d/NG0pXO5
         6b5ImZg2IsJieqVGZxb4JkA1ruShxl3TjSNfycBwxk2je8nJbxZyqvKvuknuluWHTp6J
         4d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231884; x=1791836684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qqRgcO/AZeDpuarAytPRHqtFdoLEfnXj6tihzK2Sew=;
        b=lBKKPxST39k3dRASqbfqMGlvvoWhJllQlTkL2GZ5CBBRdSTTPVsFOWQb6CcEM6eRxz
         0D2xeC8Fqpjt3kQy73VymOFyiBPAAP+zOwiFxpvFfsa2jz8VqnEuI2vLT/re16CQ1fCo
         E9HDxM+xjNF3Tc0zpuoPJrkLwrKBVnSJqpOb7UbNCJoNcaWvovufGNCMAfKPFtYwTk6S
         W1IhmIK6uWLDs7CBjziea1RiWWGdwsNfo/kYIiNd4n3vvQNeDGO4VmpP2SLRxFodAMs6
         /zgNnhg7tCstLkSILGll2AKOBGQdn5brf2JKMGbiz+rEs9/wfn+J1j9BAzUMyRy9PvMe
         c62g==
X-Gm-Message-State: AFuF++klrxX90ZkzvNzKQ2Y9J1/oGY2JFV+VAmEzAQb4oKMbzArfie0k
	HsOyDiOxYuziz+2EAcvu0bEFJYZhix84Nhd2zDUzK7vI7OS/I963zA8ii0mtT5pu
X-Gm-Gg: AYBFou2MXlEORLqzDdEoy/uAYqSbacwz14HzlisufurQNBWQMVmMWRUtpm9f1wE0m4W
	BEPqyWWO3lIdogGlYSUAbvoM93jf98DYQv+lxfkVV3mP/JJWesrBXMn99WnMK6gq4EDHD/ju93c
	pO9f80epcbgtldc1IgWLl30qKKIxkROsXkwo2NkVomEmbtb0mVLRsjmZ5Elau2ioo1lxJ0suQii
	WoCeWFsGifhhAmQRU2OgjjODBBaJJjwU6qBxu5L59+WiFaoajD3yf6Z8+nou2QQrjEkzPoQYf6k
	OGSYn+iZWFqPVnxZQvcv1uMwJrrut2J/52oPvhjshfQI8eb4elMzzN9gEjK1XCe44AhFYtbPpCa
	sfSiqYnSWEOeYhknRQY+SebEWGsRuNSFauzl6yLQuNkFzD8u6irvrQtdlLZwQT+fmSo/rxZ6Zrw
	rsS1BrDU4+yG1ua3EVyb0u4AlxwONNjGLp8Um5xjIzJsO1LcfH74Y8aEs/NWWmCmYfshGH8etXf
	0mOowHNWncKIA==
X-Received: by 2002:a05:6871:3415:b0:47d:2b69:8d11 with SMTP id 586e51a60fabf-49e3a891f1amr6657581fac.31.1791231884430;
        Mon, 05 Oct 2026 13:24:44 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e98e47b7bsm1040760fac.15.2026.10.05.13.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:24:43 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: fix use-after-free when a variable refers to itself
Date: Mon,  5 Oct 2026 15:24:33 -0500
Message-Id: <20261005202433.3460844-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

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
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kconfig/preprocess.c                  | 21 ++++++++++++-------
 .../kconfig/tests/preprocess/variable/Kconfig |  5 +++++
 .../tests/preprocess/variable/expected_stderr |  1 +
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 783abcaa5..db226898c 100644
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
index 9ce2f95cb..226114e86 100644
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
index a4841c3fd..7008e3b17 100644
--- a/scripts/kconfig/tests/preprocess/variable/expected_stderr
+++ b/scripts/kconfig/tests/preprocess/variable/expected_stderr
@@ -7,3 +7,4 @@ Kconfig:41: AB = 5
 Kconfig:45: Hello, my name is John.
 Kconfig:50: Hello, my name is .
 Kconfig:53: Hello, my name is John.
+Kconfig:58: X = 1 2
-- 
2.34.1

