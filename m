Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610320;
	b=jJYjoDYqf5RRC+6lxVSs8BzGxQ27fs1Ib/PgYDSEsuC034dK4eghGbja95ahBzavcQjT
	 yCmzA2T5kPfQVJXOtHcW/6xUzjDRpR1vCfa7ZR2N8I8FkoI4+MNCGcuiwdDWZxD3c68rm
	 D74R9wHfs/Y1zPTygACmMoGj1GhDXPMkCmMtic6+cXTovxPrWODBeNTVpXWEUUuGaKIni
	 aqp1jjeozb/voRNgUcKRNA2Qfzi/uUSW6eAiKXSHJ9+eGRGNkueAzJuoSEIH7pi78uAx5
	 x884oiSjIdClZH72znJB1fDAlRAoV5bPGQB9fj4LY2iin9lPQhw3rO8n6vuCmhrRouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WP1usr8BMOzRwVfaR8RvJCJhQa+qcbSNnudAIzg05fA=;
	b=t/Mlz9esydxH03MMm0Ug7F8ubcl1L30UrFLBREYUE64ykH6zydAN5N/EhGa1ASQb0RC9
	 zPnlX3UZbZSSxwXWI3ALUQmHbmwcZQsKONG91R5e5i8o3Z0UwNTomKMV3vmcCA2xRqyNt
	 1Fi0M/zQZ2JFDxYKmv3wjMDK4y4PvTGhJ1mDievQ7aKNimooCrXez/SeP4Z4GE72KykGH
	 FGe3SnLLpslgspGqD+8DpwWyCm3A79JC6+xVULluFaLYn9PoCqfKYkwP9J6V4Ptt/NuPU
	 gHdDii7x/ZNb68iaAmi/hb2x58j1Y+gapNgjBKr7BFCyoSnoKREhDxkQnAOp2zAs0Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urMHVQfh;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62587606A326
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Nov 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62587606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urMHVQfh
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso547950a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2026 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610318; x=1794215118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP1usr8BMOzRwVfaR8RvJCJhQa+qcbSNnudAIzg05fA=;
        b=urMHVQfhj7AM5rUuICeYfQmGtxdx8xLhyGmGc+THepgzOjGPDtbI0XWfSDyrDxdm9k
         KyAZfXtM42BpKE1gPtld/UqCvN/Hi9YhMY4ObtGfEcJlQBRdMBiZdUJXRmzlra4YxCWo
         KkWZMAp0LCyRzlgV6UGQvWL7knDdAPRq2lJ2JeI8zbGQYUVPfBFe7tmGUEjy+rA5AgL1
         3fVgrBM1sjRFX/iW9nZL3STiA/oJveTVHIFGFZEi69DlGEW9IL1eLukU/KCxCuobLlt7
         kr3N4D342ioMo1KebR2fPOMkMSRPJp/Vtgc/mbOiIaFH4ijlUuoFbvltn1YP74WH4spW
         BfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610318; x=1794215118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP1usr8BMOzRwVfaR8RvJCJhQa+qcbSNnudAIzg05fA=;
        b=IGiEowVUWHN/8Cn33skIdNR3oiCqKHAEEAvE9N7oJpE4Ygu6fFDrQVLHdiOdw0sRP9
         +KCGcV+ruenFsFxPVHr7+vVFhMqyEbhK2RHKgSbi8khK8WjH5W/0paoxX7RRiEK4gDWG
         Od0ucaUjXU8kqdij2nJLC8f8EfrDLGhpu3e9NZTNteylhZ+pqnw9kRnVpyzkLrnMXbFM
         27XOXINj0PZ3DQgz1a7SJAemuwuCOb4zfANRSV4YAdp67DqDP85n8aWtbtNbu1MZkWIN
         KZHSw8QsbpPPVvyRSD3Frpp/mVryrFo3f1GBM6MwMSOEhB0/MwgdvSn3A0iIqlGdC3uM
         CwGA==
X-Gm-Message-State: APuU4Z8TlrOYCBRJEp/HuKTihnWH8fZEqEXPCgh8oMopnhEye934QGqc
	f/ocrvzIEV6Hzjp+inQVL0iDqiJg6gwwlkvosTxtYQHJCVWkKt4KYxMIraIPR4lKK/s=
X-Gm-Gg: AYBFou1UnBiXLa3g8vLgXjrTwzbJ6Okb9szzOeAWGLKHrbN3LooXfJp0c5PI28Sl9oh
	vlqm5YhRxTqOWbadv4jBd8R4tc0435UO1kmrP6nmLXVOmpdeAulrvMN//jjgjfMPCXr3oR0Yn60
	OrnmJyWf6BHqrMGlXiYA+CbMCKgHxQpBrV0s/Lins50d3H0haG57z16Q2QZ/zcWVZohi6z9I4fM
	DfsBCybWP4QhJkF75pMtEMAZUUE7qs2CjuTNUVv2jC48zbNCCjmkjbN4ysHedgRXxUwN0bBxeAh
	jdVnCSQab5J+nvTbsTaCFOOEwfjcUI6uOF5YMRojhzf9Nd/UZMBoR+HkKoxTrdfG+Zqce+fo+nM
	3mtyDOeKB+EYpq9M8SvtlWGpvv1qfnYVXzfJnL80YH4MLbIyANpUre1ofaIgLFyYWN3pTm1TSKP
	K1tU1sH0tT5wvRJad6zwpgI8On6eZ5pBE3ja1HsqCVOyCiImL56vrDrCIORt4XTzZc8FF1E9WUl
	OQTXGkEphhSCxV2AA2IHov46tS4xdNh0sEaXX1kws3MRHN0c5hZSGHbK76dsU6B/+I3bcUiON0I
	HD96QWkWz8IxVcfwjd5d2tn/YSrjJXg29CD9/uYQ+1HyskMi5OvpaQG/8IjHsih03sjSBxTrtFQ
	Vwlc/FylCCE2JAUHXQ9VLxw==
X-Received: by 2002:a05:6402:a50b:10b0:6b4:27a:38f7 with SMTP id 4fb4d7f45d1cf-6b4d46841c0mr4376828a12.22.1793610317411;
        Mon, 02 Nov 2026 01:05:17 -0800 (PST)
Received: from localhost.localdomain ([91.242.55.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm19372105f8f.40.2026.11.02.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:17 -0800 (PST)
From: Ruslan Semchenko <uncleruc2075@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org,
	nsc@kernel.org,
	julianbraha@gmail.com,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Semchenko <uncleruc2075@gmail.com>
Subject: [PATCH] kconfig: preprocess: fix UAF and SEGV on self-referencing variables
Date: Mon,  2 Nov 2026 12:05:00 +0300
Message-ID: <20261102090500.54575-1-uncleruc2075@gmail.com>
X-Mailer: git-send-email 2.47.3
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

In variable_add(), when updating an existing simply expanded variable (:=),
v->value was freed before calling expand_string(value). If the value
referred to the variable itself (e.g. A := $(A)b), variable_expand()
accessed the already freed memory, causing a heap-use-after-free.

Furthermore, for a new variable definition, an uninitialized variable
struct was inserted into variable_list before expanding value. If value
referred to the variable itself (e.g. B := $(B)x), variable_lookup()
found the incomplete variable and dereferenced uninitialized v->value,
causing a segmentation fault.

Fix both issues by computing the new value before modifying the existing
variable or inserting a new one into variable_list.

Signed-off-by: Ruslan Semchenko <uncleruc2075@gmail.com>
---
 scripts/kconfig/preprocess.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 783abcaa5..d48791921 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -293,27 +293,35 @@ void variable_add(const char *name, const char *value,
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
+
+	/*
+	 * Compute the new value before touching the variable. Expanding it may
+	 * refer to the variable itself, which must still see the old value.
+	 */
+	if (flavor == VAR_SIMPLE)
+		new_value = expand_string(value);
+	else
+		new_value = xstrdup(value);
 
+	if (!v) {
+		/* A new variable is not visible until it is fully defined. */
 		v = xmalloc(sizeof(*v));
 		v->name = xstrdup(name);
+		v->value = new_value;
+		v->flavor = flavor;
 		v->exp_count = 0;
 		list_add_tail(&v->node, &variable_list);
+		return;
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
@@ -321,6 +329,7 @@ void variable_add(const char *name, const char *value,
 		strcat(v->value, new_value);
 		free(new_value);
 	} else {
+		free(v->value);
 		v->value = new_value;
 	}
 }
-- 
2.47.3

