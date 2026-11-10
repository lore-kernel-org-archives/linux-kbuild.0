Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332134;
	b=M1OALTnk1vAjP6Ps7xti05CIPSGCeJZ646Gp3m3+yosHnXoAg412y/QEy9a6VGcEiZWK
	 HnZFwIwnMz5wFWIb/wVpg7cucvRLcHYL1iR7EVrwMgJ1neyb1RcEpSFeMSys6sqWdW9Xn
	 4GHrwbJAyk7c3nh+OKxaq1F+VnAqK4iIws1FGkYBXSex9f9BXC4UnXvPLICpKfOKTT0D3
	 n8Jpwm014uxW9MiGeQ1JzpSM+KSWvGKQdOSOTNv4ehcfg0xnsaEe62LALQJ4RHR5PsMLM
	 n35g5eCC6Dzk17IKQkEtNyD6ukjzz5SlC7rFGOJWXkfybpubBIRgM+7avHOzZRPggEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
	b=m0nycntjrxPOSEQBSNS4x9jfwcqXObEnqjRPjciHRvUle63Sp+E0m4EfpOvi4t5Np0Ys
	 V4HMpzPhu/7whb7Qdn200SWuvtf6tdiwWZdeJXZpsAVpU/jBfQB3FNmaOsB29FGFRQMOa
	 0lS7PEx05pDr3MUk3QBmSRs6i5TfNJT5fYGFvFxJ7Juh7X/g2Zw3Nz3aGVleFDHlYLa+Q
	 6jR3ZgCNx2LvgFdBJiYnMpCdsbzSIncKP/NPIixdT+P2fzEM14QsRdCsmMZbLom0rG6Tw
	 nKnJ2ZQXT4rftEGEmBcMai+SONRyUUH8pAi26zS/4t2/Ct2ySBmCmkznp3Iur1a21oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N/ceMGKt";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA0606A338
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 17:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EA0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N/ceMGKt
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1561888f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332132; x=1794936932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
        b=N/ceMGKtm+i6+xJoY9ITibg1IKT9/vxsdjK+ngauxjr0ae1Y7JjZGyDukNRKhbP7ED
         s3VJ80RzGE1YDa5olmFvHx2oHsnzrAcI8w8RkH6qp/gTkFqdylf9LBs44eFvi9HMKydn
         pDs9XnFbwxjFRI9kBCvwmfqSeU4ruP1ZbQOujrQ1wpnxRShtrDJ91RncqrI1CaZUUZax
         zYHzR/1taog5P0miN5xqemiagnB4QfBLKaLFvWiOC6AvrqmROL7wgpoqr0SG5S6eUO/A
         xTaWP1Q+gAoh8YfCXZWFXbrinXxzwsNvd+b7F3+5CXu/s7Yj7Ak3qHawQTY654pzTnHA
         qlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332132; x=1794936932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpDhzH5Qx8/VLDHYrm11J0sajgb1E/uiBbLWkBFWCBk=;
        b=ZP3mSJMaHB9TDkI+S9caSMzEN5IGv6TWzlMAlJJwK2gfA5mQJ/eUQofPt6JfW03YLR
         VgpR6CCPLGYpdlYtMn97RKrPDwzknWzMB5aKTtr0sThI747cTdz0XirsPN0TJjkn196Y
         ywVIgeBc+RbEWzzmS4fNyJr2LeQtIfT+o9rMhJIOOMsxpYRhNCBsMDcZQzXs2UPWbh+P
         azyb7FsgG+ZRLtCbNEb3pxE8ip/+RrK6h/VfXS8bH3ViE59HTjFE/C8iwJLJ4Qqb60bl
         mCmMDIZMzFssdxHAP5rEfgfIkpoWfjJWABW7Xkt/r+ajHBnpam6n99cKj5l0EUn6RM0a
         c0Eg==
X-Forwarded-Encrypted: i=1; AL+hErHZDJFyfTJieXE0N+DtDvpl3gA/NGPuMEnFCb/VxuQhvAsp0TfafiTDCRjhDEbu4KrR2ClVaTy9UQyqymg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+OZdxAOpZfGcnVLQh9qGbxBGCBQxV2+FvWMXJPvK2xXaPRQoC
	H+wURQD+56X5useQ2zRrYGbn7uZmvPZIqhvzXsh8yd0a5fu7/jupGdD3
X-Gm-Gg: AYBFou2ODwozBJfdLeRhTE5yKI7zNE2TLEMFqAxADSOpq2lTbyA/9nVwhEL7uLTModb
	R92l+rbgYvr/HAjug8zkFBcYtQdQKtHq6VDXwh5ggjALAi05/U2t4+SDiVBKLlVgoFdhCugTtn6
	sSJkkQ+xpnlICIWqYCr+VvK8Nh9ZAcwcAY9bJi0WB2BBSrx/vA6pgqa15GayQ13cBwKVxj9jS/L
	+f7BxwQpLgxB60foZc59R75vOPpnHXp+AmxIVkE0HISLhMiJ2xK62BKR/MVzyh/YcFRhiiy+VCz
	FGqDrsbyesrS8ZGmiGbJ/UmYYrkN7dQdtqmcmnxo0hfYDYJcEr4y1CVt6Nhclp9z4eoPVDT8yjV
	n6nSea+efRKF3pjvMXyI8gE4VHUZqoKLS9nA0LFOpWjRJNO44MRJ/wpPW2NpC2zlaYM4CvJ56LA
	FTBqPFPTliYkKEW7Csk7TW3j+cuhXmGXpp8GlW5ngp7EYZj4+W1LG7YqSDFSNm89GQn5ALHlCIU
	wTQjU2wW7oo3Uw9kCT/yXGSQCGKxvyX4ZHPw6Q4yFxrMqF8bR9a+rhYkabX1owYwhHTSOvsT2aM
	QV+vkMTUiKuUaVcyoCFxRxyfy05mmIQo4xooRlhA4Tdtzxp4PKvDXrirOxOatMGL+Y33g5iwQ6m
	gFEMpDmJA321NqVkgvg==
X-Received: by 2002:a05:6000:40c8:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-498302fb9f3mr6993067f8f.35.1794332132102;
        Tue, 10 Nov 2026 09:35:32 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:31 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 1/3] kconfig: print the output of expr_alloc_and() instead of printing '&&'
Date: Tue, 10 Nov 2026 17:35:24 +0000
Message-ID: <20261110173526.1548434-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110173526.1548434-1-julianbraha@gmail.com>
References: <20261110173526.1548434-1-julianbraha@gmail.com>
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

Clean up expression printing for 'select' and 'imply' (which ANDs the
select/imply targets), to properly call expr_alloc_and() and print the
output, instead of printing a literal ' && '. 

This is necessary to ensure that any '&&' at the end of those lines can
wrap properly.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 1a3ad09a92d2..2b2166edeb25 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -761,19 +761,16 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
 				 enum prop_type tok, const char *prefix)
 {
-	bool hit = false;
+	struct expr *expr = NULL;
 	struct property *prop;
 
-	for_all_properties(sym, prop, tok) {
-		if (!hit) {
-			str_append(r, prefix);
-			hit = true;
-		} else
-			str_printf(r, " && ");
-		expr_gstr_print(prop->expr, r);
-	}
-	if (hit)
+	for_all_properties(sym, prop, tok)
+		expr = expr_alloc_and(expr, prop->expr);
+	if (expr) {
+		str_append(r, prefix);
+		expr_gstr_print(expr, r);
 		str_append(r, "\n");
+	}
 }
 
 /*
-- 
2.56.0

