Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A5047ACC3
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196876; cv=none; b=O9zyb/GgjiOpslnNshPf1Qvq1YVuAwxv+rlE7iJ1Lh2WAIi/chNUrwX+rNh1Yfg8dQpcGUTKYGZL/DlYzypWH5hTT82tAnz956vMnyp4PI3S+R0N5MgXvn2LY+R/34XSJO+s3RGDy32s+W9VJLap5LZ/JsV3iwMZbDBU0ubBn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196876; c=relaxed/simple;
	bh=g/eNTFqxuuppdHnI35672oygmBVEsqrmKjaxjuyYrDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GPG7I+rwbWb/K3/Q2qCHpo6lVO+pY0ksL2HfnhhgU8p+a8uQthRx4F0KUxogwzaq8YpdTDGKRY0Esr+i7wOD00ux+hO+gdNZ1CPUvbJhN0KFgD5ht9HWOpEtd6Vm0HBXq9zEUo/TkA7gECqKuRPgn+WBwxLuLbtAhph9bxIsJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLc9MM8t; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLc9MM8t"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dd095da1aso1012187fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196873; x=1791801673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGZ5ZZOvvMUSJIZ5k2mtv9p3eLgV/w0D4Pp68kB/ghc=;
        b=NLc9MM8tDv7USExycvf/gpvE611jmjbMVm8TphOE8K9Og8Yblri5QL3vD2RqDTXpgt
         8xgMGLE6Y13hTs66JU8YuNxsLH0qdJlhYiGIHDrUkMWcgOErufYfI5PWwtzmgYcULexj
         sUVvdmS9w4HLaxhIdhRzdjOnMwU/sLkUMtzOaDgfnIt5kZJ6x4xcxTJYn/BGqUfdOfba
         hWp8dU0ttoOeW5jz0dZYcVr4hOTrnxVLqniP+Y4ebtvhju3gNfF9PoqFEM6L3OSyuMB3
         tCZqgpcSoL0cFNB+3+tWsmexoqi/z3zQCGHgT2aFf7Ai+GjhRDDBbe6MptxzNB2BIBu/
         7hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196873; x=1791801673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AGZ5ZZOvvMUSJIZ5k2mtv9p3eLgV/w0D4Pp68kB/ghc=;
        b=BPJQFvO+Z5eGmVPTONkvJ1bpnxtHcwid/Gm6OEB6qoVzO3ZKWgG9q4iclVt+UbUJHp
         kS3vqTAsVftRTMDDACQOdyQzcdBGpElGRUm6o/uhAtRwex2jAD4vGuDEa5f1ruuxqQ9i
         Tgv3UZJi6IpmGXvzii8JkboDAoxdfWknnLqVDL2UgC5d1mRXinBDNsxBwLM+HxEBhMrk
         mCK/RTrt3/qjzQXjAny7XEu11dV/2DMvpunA6LIdL3PpEEOnUT3+wOzjHqiTHvOVF5fv
         ktJBlOTCA+relLWA4L13Wl9irso5mhlu3KR8W2t98M20ChIHBvIR1dKZeuSRjTQV90SW
         +BzA==
X-Forwarded-Encrypted: i=1; AKwUvBzrMcIDoEO1WGmu02Bi3bZ332IN2Ty/QHeU/+sBVGuZ2TRnfqAYI3zltTkTf3cJjyUGFRqhrDuV3FVNmDY=@vger.kernel.org
X-Gm-Message-State: AFuF++knBNkjkvCGmfei+F5UMp9MrGtpYCBwBAiTBynn3PIZkSdPnmGk
	HiNriGW/UyFxt6eOreJHUbuR1BbSxHXAGoS17al8pRRQWfrfMlzM9gpL
X-Gm-Gg: AYBFou3firn3ZEnD0SDpUsXluQ8w/q8kXUVeEsQxbRwcgN9Pp5VB6vkTOyvqwZvEzbA
	lhO1xXbt22SCIKOHnmUY50ALoGTKNhc64rLBE/XrPfurWL1Gm1au0ShOKLNaOUmX5dbNzQw8mom
	7xRE+tqjw/LkMYGOo9044yG6FKISZ3/4en0zQc8+OvC/uZUlRjcr1VZBPems11n6OD/8jiLmQfQ
	8rtaHJ0sYLBi+xYNuRNNeqV5IBIZ5OTrqeV8tjm9TOruyRj18EtLmHPINndbdOd7mpVCdhxb9Ax
	uwK0pBDQO+jWc8jhL9h3orbRy9t/rYIxNNBFVH00LDvZWZGSqC/SuZxnCyKL+IH+JobAtAs1v/4
	fvsUsMyBesH3sG8sNI+IJJ1W09Z3pW6IJT2+kcDwnPwzjFZW3SZxiVFX3SdeJcFhr7fiqdUejWv
	/2NDSrZ5qj15oaKDdrsO+S1x3zchHX3ijlj1rAbZ5grjxE3sle+J3Tp/062vOI/CqyQkP4vWqMx
	uSPtgg3Agri
X-Received: by 2002:a05:6870:9a0b:b0:475:a1ec:961f with SMTP id 586e51a60fabf-49e15e0f0c5mr9334765fac.33.1791196872990;
        Mon, 05 Oct 2026 03:41:12 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:11 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] modpost: fix stack out-of-bounds read for unterminated PNP ids
Date: Mon,  5 Oct 2026 05:40:46 -0500
Message-Id: <20261005104050.1786222-6-lzsx618@gmail.com>
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

do_pnp_device_entry() and do_pnp_card_entry() copy the PNP id into a
local acpi_id[PNP_ID_LEN] buffer to upper-case it, and then print it with
"%s". A PNP id that uses all PNP_ID_LEN characters, e.g. "PNP0C0F1", is
accepted by the compiler without a terminating NUL (the kernel is built
with -Wno-unterminated-string-initialization), so the local copy is not
NUL-terminated and printing it reads past the end of the stack buffer:

  AddressSanitizer: stack-buffer-overflow ... in printf_common
    ... do_pnp_device_entry scripts/mod/file2alias.c

Limit the printed length to the size of the id buffers.

Found by fuzzing modpost with ASan/UBSan.

Fixes: 72638f598ec9 ("PNP: fix broken pnp lowercasing for acpi module aliases")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/mod/file2alias.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 61a831c18..7685fb513 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -573,8 +573,9 @@ static void do_pnp_device_entry(struct module *mod, void *symval)
 	/* fix broken pnp bus lowercasing */
 	for (unsigned int i = 0; i < sizeof(acpi_id); i++)
 		acpi_id[i] = toupper((*id)[i]);
-	module_alias_printf(mod, false, "pnp:d%s*", *id);
-	module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
+	module_alias_printf(mod, false, "pnp:d%.*s*", (int)sizeof(*id), *id);
+	module_alias_printf(mod, false, "acpi*:%.*s:*",
+			    (int)sizeof(acpi_id), acpi_id);
 }
 
 /* looks like: "pnp:dD" for every device of the card */
@@ -594,8 +595,9 @@ static void do_pnp_card_entry(struct module *mod, void *symval)
 			acpi_id[j] = toupper(id[j]);
 
 		/* add an individual alias for every device entry */
-		module_alias_printf(mod, false, "pnp:d%s*", id);
-		module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
+		module_alias_printf(mod, false, "pnp:d%.*s*", PNP_ID_LEN, id);
+		module_alias_printf(mod, false, "acpi*:%.*s:*",
+				    PNP_ID_LEN, acpi_id);
 	}
 }
 
-- 
2.34.1

