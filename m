Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6F341D224
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776931; cv=none; b=bzpgAGs6ZMp07bZ59DhkWy+u+O6pHKmtakcg2TxXCfn5RmliwFnzRKx9sZtLRLMi4mYtq/GdOTdOhMLgFNnCwTy+hfvWiObRvNd48h/23SzDHEUT9b4wzOwCThBfEjHX7S+uBMByJBF/+9kXGI30QYFZc5E8fuQUO7+n67iMHEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776931; c=relaxed/simple;
	bh=6GCvx4EVOSNKyzp+tXGGIXMLeA/q5fZSG5xq+Mpfmmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/RwtABSafIjeljRGOu5waelfyRzaJII3gC2MRSgb78nu34bhKxJDcFRo9aS1U5HzCSehLw/PX2aPYdzanaJH5/5JlreigTvXtrjTh8KCZ8Z/JM+2LejNji+Ooc64lTW3SR9/Mm1wui5P4+fNnjKNZdVaRZUv8IcHr0OIDqdsOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wbd1K1nO; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wbd1K1nO"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66843536f94so4082962d50.3
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785776928; x=1786381728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVIXFzy7/iqHFG79NcAPMMydKMInrcpKO4eP5Ii82bc=;
        b=Wbd1K1nOmdMK71ztQNYAORkjtWuXZxbZ1eZ4KpWqgj+i2FO2iQJtVnkzITe0QXagq5
         E+dzziNNjUcivN6LbrLHMgDngGwCeERs6WKLw0SpmNSxOwbE90SaxgqnUqiCYnXRdPj1
         U6VE7wkCJAw4OG1h2yU1hmqE2uhloLupdTPSBGVHkFVv6wrH/+1kIs44r6mFLDQxpq2j
         aogZQTRjG8mh1Q+yR4WpZAA/dp5Ouq0O61kd/rP0o0diUC2BqtSPG08VSCbRCckWxdDR
         Ut8f2B8QfAXZXBQ59zKtH39xIQQ+0lvvh2QmY2cAQdltcnxHafv/PEz9V15/5DAl+JAm
         rLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785776928; x=1786381728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVIXFzy7/iqHFG79NcAPMMydKMInrcpKO4eP5Ii82bc=;
        b=Xr6R21q8azoNeRcGlwXgtlYS/56oMk1V9s531qwSndSHtl7+oDkCJv7bMCgHx2o4Sv
         cujKH/9+svSOvil8E8nn27dE7CeE8XebiyvK8qQ0zwHzZuHc+LvKiieP43lPoCOL7Obd
         HL/NEQyRinWrVYoD79gLLqtXE8ehn+gjq9VpxOwT/Dq+6PmXW9uoXhpRVNKeL9QKQCCa
         dRNSLJZJfKQIXWimBLddWLyw20UT3BOYYwzDBJD48i/K1hud2CAoEaXFs4UxO47P/Bpf
         XPsXH7ME1PWRafJWzDUIniBgPHa5nMHPKziIdqIg7Agcpsc5aU9Mju4fiHbVUgdUqA+Q
         SBXw==
X-Forwarded-Encrypted: i=1; AHgh+Rom1akFbhCAz37Y2GTIqOwdCwhOe+4/2bWD5YNgsLLuyDnOyykP66tYkkuaE9R3GVJ6RabdMcc/GkEzoeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3j13wDReOycfTKCgS0uaPXEA4/ivZTEQCI7ebblnVlHNTm04
	yGWA4JYePCD6vAId8QAL7IgNObkaKwzMHajxmW+JwwAv5gvp+JIlB1gD
X-Gm-Gg: AR+sD12K0oG1Cj+ay4eMWRVZ4FQ/dW5/TCO0hcWKvTXkXJzo2hmKDwFSJyLwPPh/8Lc
	CdKQvMos1sQJsnitW0NZY6H/E+pU7CZ9PZ2ubRI0e0gXfpxBBcGzRkehbzsRZWuOomIiVHSyp7y
	CuwvddwWK7fI4MEzgS4Qx9SnGgJaVew6zFG5G0KiHOE2aDLpPLJWYv5MQ4jUKn7FhB5KIPQDfc0
	dLDCQ2ZKFuBoEAJp2KE8TD5IwJNCcbWCdHqFB2cZI5LdOdk6hZp24ftcG1+yWrv+6Fm/ddWfHi8
	s/nnAJ02Dyny29Oc3KmDRebOfc6nCFMIlcewOSf8UIy6BGkCGqGkhj6NYAD+hmazyae8yuqW3LQ
	OgNlwSH5OoL8JH7/8GCQZkFZ45NzX6wcUfEy3t/2MVzviLkf3spvSD26yvXyimEUsM4YxHNJz+P
	7xE0085wxPntrwicYbFAeSNBVHHoes+8aFtq6AkFpCUI3vCvsKuWXj28pCeNMU
X-Received: by 2002:a05:690e:412:b0:667:95f9:bcd7 with SMTP id 956f58d0204a3-6694f22a9d8mr10196257d50.49.1785776927829;
        Mon, 03 Aug 2026 10:08:47 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948cff660sm5919696d50.3.2026.08.03.10.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:08:46 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 03 Aug 2026 13:08:42 -0400
Subject: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=6GCvx4EVOSNKyzp+tXGGIXMLeA/q5fZSG5xq+Mpfmmc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIKTkt67tDONuewvFWbu1Za5LmoqqLj5D9b13DGKfyO+
 KSq6d7b8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNeYSTIybOP2U+cLms
 Www/t5Scqqmx+2393s3DbZfl8e+8UFR/7XOjAyXC5vWcgXfshV58LzPHHJ7mclLo94f3HmeW1tk
 GD8/e0dEwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

clang honors a local `register unsigned long x __asm__("$N")` variable
only where it appears as an inline-asm operand; merely reading it does
not produce the contents of that register.  So trap_init() passed an
undefined global pointer to PAL_wrkgp, and load_PCB() stored an undefined
stack pointer into the PCB that swpctx then loaded.  Either one wedges an
early boot.

Read the registers explicitly instead: an inline mov for $gp in
trap_init(), and the file-scope current_stack_pointer for $sp in
load_PCB().  A file-scope register-asm variable is the form clang does
support.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/traps.c | 4 +++-
 arch/alpha/mm/init.c      | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 7631129ac914..5b4f1ae2b74b 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -925,7 +925,9 @@ void
 trap_init(void)
 {
 	/* Tell PAL-code what global pointer we want in the kernel.  */
-	register unsigned long gptr __asm__("$29");
+	unsigned long gptr;
+
+	__asm__ volatile("mov $29, %0" : "=r"(gptr));
 	wrkgp(gptr);
 
 	wrent(entArith, 1);
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 9531cbc761c0..f4d65a60c869 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -63,8 +63,7 @@ pgd_alloc(struct mm_struct *mm)
 static inline unsigned long
 load_PCB(struct pcb_struct *pcb)
 {
-	register unsigned long sp __asm__("$30");
-	pcb->ksp = sp;
+	pcb->ksp = (unsigned long)current_stack_pointer;
 	return __reload_thread(pcb);
 }
 

-- 
2.54.0

