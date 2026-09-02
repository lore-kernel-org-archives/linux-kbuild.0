Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4AE4AA1C8
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Sep 2026 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365639; cv=none; b=QJw7w1b4xIxma9qGI0MwbQBWlsv9tfab4rwuQzPFHlhZiKQFea4ftdO92h5VdpKHyADZvWRd9b603zZdriazXrbpOcBpx3Gv6u4xr0FHUsnDv2jIAu43zDQlrbojyHi4kW1vKYb9I7K4sgZd0b6TSHyR36vRoMKgcuyFOtQJwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365639; c=relaxed/simple;
	bh=gOExmsjx/Dcw2wBkDJUC85QTuE+P4KTcC0JuSpPzL5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKcvfqgityBqbS9fFf8qqoQN68RWeZ6Ghqb8Bxx51DZVUk3jTiavcx9qF8XJPGsCoBOqdibIUFZvZTuL827ta0vnRPOvpZYsoqIQ66Dj9z9C/V4IAazuXHxcrlLmQxGMfAMLdIT4Kff6WsleKGkSvAMrAuztjs0yfKqUm/9eWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FudFBLt4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FudFBLt4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so157819366b.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Sep 2026 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788365635; x=1788970435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMuR3JomgDMugPyGGiXTImTTtVXWnO9TCZlsIbkVMNU=;
        b=FudFBLt4IAItVgQNVKimfU7yHvNPp16x96UsnajygmYZpKdvMZsoujXXvdoZgs0Ibt
         MO8+x/bGSpFAGUk7KfLmBPRRmd8w14jNm6/d0DnN4jwsJsXXIa+WIkahK8flWYqTeuMg
         gQd3dbt7WiHdel8hyNWF3m2IaSzdP2EjwWPsBQdGUO8tWViyMMedd6onO5Seua2EzKAS
         6UF6JNdOsCiCD7UN7e1EXhu8eWfNFAcyQMHoGKYEcspSInsru+WFPZgQ7cI05Y8I/+ta
         q+yDT6lokVdTzGqYF/La1qvDtk6PqRVcWWUH+dAPbmYHBQoO5OnfkVBd9+p99luYkjY/
         K+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365635; x=1788970435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMuR3JomgDMugPyGGiXTImTTtVXWnO9TCZlsIbkVMNU=;
        b=TrMO3Er4wVaBNpk4xdex1nM09EG27X9QR9/AJ/nF256/sPH7JlPWB3073PDCw8LxSU
         7uqhh1X8mmb58dErcaybGdl1u0OM/jq6/69ps9+bzdmg5i4BJ/kyKHJdvF27g2gVuKK6
         HQYn0RmbNjDXt/K+a6io5Yh4DnrDjhKmdAzLOuy9nqn7sm55T/0NG/9EGKxey16Odqmg
         k3bTlSF6hPg4fi9a2oW2CV4yVTBM2NkbgdTx9dFl46q3LG3fPdtPoP7oAd0X9ddbh+bo
         hqY6v2B313kRO7vk0mZItt/7khIabns6btfnfrv9P6wqYUi5GYj9U732minpUVOLCLZN
         Pb4A==
X-Gm-Message-State: AFuF++miKdAc3meaoWEY2+gyToVCe19dgOgfg44Ks0iKCulnLCkEevas
	SqyDpma2Fzulrxbm+Po8hK04Iucnf2E8+w3tw5KMBi2/hjhx0aviIxgC
X-Gm-Gg: AYBFou0XurPEgTJOgR4r8OExtiY06t4MkrqyPlEE2GameyUFccm0dr5ZL9WJWPVKA1A
	GL3F52Zw7puhlvQz68m4BaNDUG7/f8Wo03k5Xli8/sFE4r8e8B+1LYreLwaeyoPsK7cFuQrgHED
	9Kazqm5FN00sbQoRfsacl1D6+qFhCCJX/lT1VKWVei8OMO2E/Url8+PtwCd+2/1KgDRtdz+7tUC
	aNiwOKbug+iSNr9S5E5m67p/shrGhg/lNJk0jFAwZFXyrUKSAIIjzJmSMNN59+YYMffRPqr1K2+
	jTisBYs7orz8pEaD6LcPgl+5GcMu2dtZXiQo39t+pgh9AwXL4G1S1W9nIOaSrgAZ9LFOTrCJQ3h
	a5Hvp4gl9tPCnqEq0D0UU2uxZPI4LTy1w77C1Tg82sAdhScE51x+avzu/30G519I5gCR+InBTnT
	9qolIM9VS5d6Nl4l/IKXdJY6RksMeYVJnyHpa8bP+mAifGfvE73WMehsk=
X-Received: by 2002:a17:907:3ea1:b0:c20:33db:41d3 with SMTP id a640c23a62f3a-c25d5476414mr370581766b.11.1788365634473;
        Wed, 02 Sep 2026 09:13:54 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:48::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm167062066b.32.2026.09.02.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:13:53 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [PATCH] kbuild: don't delete in-flight filechk temporaries in asm-headers
Date: Wed,  2 Sep 2026 09:13:47 -0700
Message-ID: <20260902161347.4163577-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2d69b891e646 ("kbuild: Support generated asm-headers in
subdirectories") switched the stale-wrapper sweep in
scripts/Makefile.asm-headers from $(wildcard $(obj)/*.h) to a find(1)
invocation, so that generated headers in subdirectories are considered.

The two do not match the same set of files. Make's $(wildcard) uses glob
semantics, where a leading '.' has to be matched explicitly, whereas
find's -name uses fnmatch() without FNM_PERIOD, so '*.h' matches
dotfiles as well. filechk writes its output to $(dir $@).tmp_$(notdir $@)
before renaming it into place, so such a scratch file, if it happens to
exist in $(obj) when the sub-make is parsed, is now picked up in
old-headers. It appears in neither generic-y, generated-y nor syscall-y,
is therefore classified as unwanted, and cmd_remove deletes it.

On x86 this races with archprepare, which lists both asm-generic and
arch/x86/include/generated/asm/cpufeaturemasks.h as prerequisites. Under
-j they run concurrently against the same directory, and the build fails
intermittently:

  mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory
  make[1]: *** [arch/x86/Makefile:269: arch/x86/include/generated/asm/cpufeaturemasks.h] Error 1

The same commit also converted the generic wrapper rule to filechk, so
those wrappers now create .tmp_*.h in $(obj) too and can race among
themselves.

Restore the previous behaviour by excluding dotfiles from the sweep.
Subdirectories, which is what the find(1) conversion was for, keep being
descended into. While at it, quote the -name argument: it is currently
expanded by the shell against the build directory before find sees it.

Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirectories")
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
#regzbot introduced: 2d69b891e646

 scripts/Makefile.asm-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index b38931314ad7c..f1c3d287c14b0 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -48,7 +48,7 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
 # Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
+old-headers := $(shell test -d $(obj) && find $(obj) -name '*.h' ! -name '.*')
 unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
 
 filechk_wrap = echo "\#include <asm-generic/$*.h>"
-- 
2.53.0-Meta

