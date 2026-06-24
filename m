Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D8D358367
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 04:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782276470; cv=none; b=VhmSTWXeBUhsIJTQlUt9lCJVINgve0frlOBEGMiDGbl7HYW6Nape0SN5IMGz/5PsQnBCu8Am4fvWtldUXsy83I47Sb0aCtKajCXZ7T3xpcpPuQMocIN/NAiBG0HakYQwhD14uSH1H8Tlt9wl29eqef2EJscY5vOx0A8PxhcdBtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782276470; c=relaxed/simple;
	bh=jRPLZg+8fNMW5u2wGN78PrvNp59RpT5vmLJ7fYW+9oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FAOa6h/rP4njTTFHF5943dDdsID9CNydfA3EjZkuhegnhrUbfrFNheEeH8I/CHdupysXekb1T94SDh/kj/zIzsAHPF+QOZzUZScGvCjdnIOLDsv3zHZczWPc3jJ6QonMnse7+JbqsVdl23hj4+rQVFFJHTKIZz+/4Xaj/aI/wxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVkF63FN; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVkF63FN"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bc871ecdfso668771eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 21:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782276468; x=1782881268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRwHfaKON0xRqsVNb+TGm3rmHJoOA8bDDixkKlocDy0=;
        b=hVkF63FNnRDE7pElUtzzmPVQTxYz+RlYZYE1IL977ea25UVTQq1PR2sEdjizjjUXDq
         UpQT3wJQDgMhR+G/5lzTFUoxrhqHiKre1gDjjsfGMS3FuYJwBcxq9UxSHUceULKqw0gB
         UfeUca3D6og11ntRIz1eDb1BO9jDtAPpidavGms5ll7ZdVUHNsVe095X3R8lJHqNpBUb
         uyQ5HgbPpjul437SCDpItEqlRZMkx16LqFIA9koWGcX3N6EdFWk+/0B5m8tNYXAtyLEj
         LXHpDpv/Hx+ALavYCqukpEtJfGJnbpFqUVmnEorDo8sxFHHoQ0O4BKlI7dOv6bxSaJFg
         XNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782276468; x=1782881268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRwHfaKON0xRqsVNb+TGm3rmHJoOA8bDDixkKlocDy0=;
        b=SlgXfp9Tavj2p0eh2CWcEwv3Uk8oxASvhB0GD4j6a9eq9D1c8UwCyGytFWnRdHl/FB
         gGGcVtgydHu7snHwO9oyN4uQeaOdqBCE49Y7f0Er/mU6ez3Kw/1hPKn+dFFCb5U9RpIm
         MhVodA1/2vBJQ2pH/VemOrFHJaLtT6RniY6a4zqd04QjVm74oc/OTCQvqBosuBLmJyZl
         jzI3WCilINh3fyMl7shjl6/Kw5BEeGBviVq9C9a6JQlv9sOYFYwrnWvGcW9uvDU0uTLY
         3Jk3JXA0mK6E7fzqSljHmfe9v7WnbB/rELoXUSbXRQ5jAZXUAKFSXg6RFJkc/jjNAvP5
         ZMNw==
X-Gm-Message-State: AOJu0YxX29eZjPf28ptgaN+m+Y16QDyvSQn02mdDhN3tIK8lgD0xWKv7
	qdVqJCmQzJHP2+99+nQVN/N+/tZYiRNb4nUf0zs1dUKQeN2uTUJYNg/N
X-Gm-Gg: AfdE7cn64HlkwRB6gxgehXd87/zPrhT97gUfM+XafMiWqKrrMo9aeVSyvSg+CN21aGM
	E9xSYDeXjPaRLsgtnhFlvP2t+uyI0pn10m8Sqq8w30xJD4bvGy3aSQ/x7oKdMRrQb+fPLVHznYh
	1Zn2atvbWVjfumAm9aH/jaTjD3X1I75C2670FMkaLPbKupX6fGpA9B6tUCl9akmTe5fwbQP8lej
	tu7jgfx9PPUziaR4lqs05hVoAHdV04Dst2+N6+ki/EbnHDjP2WV6vUQFGTmfeH+Vl63+JW501GJ
	gPLwTsnM4dUYD5EX4y3St4R4iPn1CeNS13MfqU8VHHUDaD4YbJwraP7gFZsV2k5rCUfUtbvFuRp
	xUpqV4WaI25RQOPKrxxoMRkKYgZ7dJCqe65lN8ZlnLsk1QwcdGD3k+iYfJKyGltH0sfVMCYqlHY
	BZ8Aji1SayGjku+CE=
X-Received: by 2002:a05:7300:d518:b0:304:5db8:da95 with SMTP id 5a478bee46e88-30c6938977dmr1842774eec.23.1782276467886;
        Tue, 23 Jun 2026 21:47:47 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:548:421c:c183:7a07:f0d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5c5e20easm8715259eec.18.2026.06.23.21.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:47:47 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH v2] modpost: prevent leak when early return no suffix .o in read_symbols()
Date: Wed, 24 Jun 2026 11:47:42 +0700
Message-ID: <20260624044742.144852-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The allocation for elf info symsearch and hdr from parse_elf() haven't
been released when return because of modname didn't have suffix ".o".
And it seems like the suffix ".o" check did not depends on parse_elf()
to succeed first. So, move the suffix ".o" check before checking
parse_elf() result to prevent resource leak when the modname didn't have
suffix ".o" and return early.

This is reported by Coverity Scan as "Resource leak".

Fixes: 8c9ce89c5b63 ("modpost: simplify mod->name allocation")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
v1 -> v2:
- Move the suffix ".o" check before parse_elf() instead of adding
  parse_elf_finish() in the suffix ".o" check because the suffix ".o"
  check did not depends on parse_elf() and to minimize overhead handling
  the check (suggested by Nathan Chancellor).
- To make the subject title represents the new change better, change the
  subject title from "modpost: release allocation when early return no
  suffix .o in read_symbols()" to "modpost: prevent leak when early
  return no suffix .o in read_symbols()".

v1:
https://lore.kernel.org/all/20260610052550.187006-1-robertusdchris@gmail.com/

 scripts/mod/modpost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..6eb2714521a7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1580,14 +1580,14 @@ static void read_symbols(const char *modname)
 	struct elf_info info = { };
 	Elf_Sym *sym;
 
-	if (!parse_elf(&info, modname))
-		return;
-
 	if (!strends(modname, ".o")) {
 		error("%s: filename must be suffixed with .o\n", modname);
 		return;
 	}
 
+	if (!parse_elf(&info, modname))
+		return;
+
 	/* strip trailing .o */
 	mod = new_module(modname, strlen(modname) - strlen(".o"));
 

base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
-- 
2.54.0

