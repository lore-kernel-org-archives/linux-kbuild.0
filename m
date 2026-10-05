Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEAD479880
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196865; cv=none; b=PKZbSKwKJS0KvO1Bgq4hzWo0DBso5nK0l8XOTa+E2kbRvuxiqsFkD7TRrGiceDeemy+9H0PkXbog4vwV1a3X6YJyj13Nq+lQxoM97YanNvWLrzpfZGkQ5WE/d4L7zXR+v0kfP8J7G93rFzz0kxWKejPRiu5LLSZJV/fx47obueQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196865; c=relaxed/simple;
	bh=hjDyqy+7Wh3HGgMxP8S19KJrN4Z6qV+kiS7JRei/bKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sXuJeKHDKI611WipxNWstxECCLNKN0PbWanMcWdtnxWs8kBGvKDOnleN+EHsuE9+pMZIcK04QqNBrqrk5F0litPEjP3udyUu7FGFt+lVmbcG76lcpuPN9uFPdr8vXA0ziJ6vGPhtjWhxp1xsh+Q5tkirp6EceBCw8wLMEElVug0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CohYU36s; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CohYU36s"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b4b63so300216fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196863; x=1791801663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JDj7MC8RawEeURWkIOTujBIIoPKsXTEJhQmCTpSYnc=;
        b=CohYU36sBZ2E9ofPAxGFqWfwmekKox6nj/K8WkpkRfyR6Fb3OA1UNRMC+8ny16p9M+
         +v9xThTzacNfQsfpSuPARlQvQQ7AsiF5a37mgIBVH7RbgyVYa78F45iws6tzn1inj+9J
         XtEJLBN6hKNvilTCKEeX9HhULF2BbE+h4yvw7iUCyO7AHkgjlT1FVjiHigNLY2wUDSSn
         1BflqHxdmIUOdK+wio+1s1RbNA/G7sajfe01x7HetvPsg3a5a0EcQcrfLI7xe4inp2Ue
         n+GrFDvoxmebj+2eqrRr8sZ6GYT14c0KcdWH5GIQBvuI+avrPmi2hX7B3h49RrNdCLGL
         loUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196863; x=1791801663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JDj7MC8RawEeURWkIOTujBIIoPKsXTEJhQmCTpSYnc=;
        b=rD1nnoLty/AB4ldEeT8xu7n+eRKbHccA2scSC24TZMpsmMz30olKLI5h2b6toZ06RW
         bX8ODDBmho3fm3DQLrSi1zJNqUu8xW3lVTSjrz6A+ft9yywzqSw/Lj/OX10M31N0dEcO
         B955V4LsnTIIFUnIsTC/hW1oxQNyd2SxhPBuMXfQWjCFcYnjzJw28ZGIMGdTLYg6l4KG
         qHryIsxQEp/TEr1CH/RvTcIzdpOKT/xMwEclv3knHYMnTc3AwXxa4FU96w7Xr4or43Lb
         clKauTgrzPc8lT4eKJgsbRrdKoav9Uk67eswO02M0yifH4gU+8Wi7DBKeBg8oTTZNdeK
         5Abw==
X-Forwarded-Encrypted: i=1; AKwUvBzC1+HKFXO5nqVphU36dh46HqDz2lGNtRMCcOsTGxnk9GxqS27aOg7Z52Ox+waxMkVqLRd6u3xBYIxQ9xY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj09FBW3bIWFPUtH0idtMu3O9k0yxLmVynxshTZtolIZeXL7Nb
	39xflCMUF4LX3kergtYqSUFNvpRAJl7En5d/Bh0y7sosdopiXbnlEOEM
X-Gm-Gg: AYBFou2S5POp9qfVP1Eh8QXItN96S5MZ3/L0vrlOY9MPiJqI7B/1FINmKLYJ2vShvCa
	YNFji7luNsnbz/bRpUyIllCF7+ktwnTMnzfrdJwhdT/nVbZTEjiO9NpRdPSiI3YORrVEWJaEawj
	7X7yY+IlTMGZ0UQBKJ441ZGMoLwVtRIrCAUTAT0LQ1iT7sbcrsTw6W0IBvRvv9Tw1D2Vcy0AFv+
	zcF+2ukgRGWIihnq80Ih15KMukcutH0yYfKHqyX0V/CHQMSoY3rlnqCZRnWFJYlLJZjHlZjBaQ/
	z1/5PYjiwF8EduIgo+BnQyLjZfp0TBXAkGiEAijXA0iwSEiJpkLdNhyk42aHpH7mWrxCKn3/ph+
	kH/I6D/cHLZ1Xn8j09vbbM5ROQ73sZtKwNpfCpwULhSG5hpr8/vydOWtr59vzsMMoKdg7aPHxTR
	VA2yBwzytDNvzlskmODC7bdY4EqhgTqtxTvhu5Bvd9t/6nsrvpyUyxoSmL4pU2ep3tJWWZGbEAH
	nFsPHHrFim7
X-Received: by 2002:a05:6871:6518:b0:470:e96b:43e2 with SMTP id 586e51a60fabf-49e15d4363amr6735160fac.14.1791196862811;
        Mon, 05 Oct 2026 03:41:02 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:01 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] kconfig: fix NULL pointer dereference for defaults taken from choice members
Date: Mon,  5 Oct 2026 05:40:42 -0500
Message-Id: <20261005104050.1786222-2-lzsx618@gmail.com>
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

Since commit f79dc03fe68c ("kconfig: refactor choice value calculation"),
sym_calc_choice() marks the members of a choice SYMBOL_VALID but only
sets their curr.tri; curr.val is left NULL. If a string, int or hex
symbol takes its default from such a choice member, sym_calc_value() and
sym_get_string_default() copy ds->curr.val, so the symbol ends up with a
NULL string value. Depending on symbol order this crashes in conf_read()
(strcmp), sym_get_string_default() (str[0]) or ends up writing
CONFIG_X=(null).

Reproducer:

  choice
          prompt "choice"
  config C1
          bool "c1"
  config C2
          bool "c2"
  endchoice

  config FOO
          bool
          default C2

  config BAR
          string
          default C1

  $ touch .config
  $ KCONFIG_CONFIG=.config scripts/kconfig/conf --olddefconfig Kconfig
  Segmentation fault

Use sym_get_string_value() instead of reading curr.val directly. It
handles all symbol types and returns "y"/"m"/"n" for tristate and bool
symbols.

The resulting .config and savedefconfig output for defconfig,
allyesconfig, allnoconfig, allmodconfig and randconfig on x86_64, arm64,
riscv, powerpc, s390, arm and mips is unchanged.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: f79dc03fe68c ("kconfig: refactor choice value calculation")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kconfig/symbol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dcb4b45e6..de88b13f5 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -546,7 +546,7 @@ void sym_calc_value(struct symbol *sym)
 			if (ds) {
 				sym->flags |= SYMBOL_WRITE;
 				sym_calc_value(ds);
-				newval.val = ds->curr.val;
+				newval.val = (char *)sym_get_string_value(ds);
 			}
 		}
 		break;
@@ -887,7 +887,7 @@ const char *sym_get_string_default(struct symbol *sym)
 			ds = prop_get_symbol(prop);
 			if (ds != NULL) {
 				sym_calc_value(ds);
-				str = (const char *)ds->curr.val;
+				str = sym_get_string_value(ds);
 			}
 		}
 	}
-- 
2.34.1

