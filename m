Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8984E0204
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231922; cv=none; b=Xi/QttTCbcXnF7Gy3YnvYqwUFqnd5dIXHRCq0oM3r8trrGzGYTAZ9HyepvP1ntBtL0A1Ic1tA0ZYq+rCeDIw0daAH2B2Hf94KSTbTfYh9TDSo9xyIOaFv5bpHsP4QwVKGDjNZIFQDIA0+JSWw5zCoZrWWxIcCXqh06khzErMNiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231922; c=relaxed/simple;
	bh=PMhgNSXDiVdmizHWRIl6dKKFYKaYUw4PB8vY8udLJgE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qqmkvPHpMZ0P/gTPx2byY1l29SGru4ofBKBln04hAD7cwGxZNC9osf8FHfzr21mHg7P0l4lum/7+KS9A7kjpFTcjEpMLWBWxtL5kXmP4Z1mfb0ydra6/sZgxBiH45HLD4oE5FdG5E3rpcCICuYsFo4ExQZyBovPEApImAtupF5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRTHEFac; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRTHEFac"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-82480e2d376so845305a34.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231916; x=1791836716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iNeqgRL89Z9h6pYYkWfI1GWRV4tMZ1ckcaMGOUQjYY=;
        b=jRTHEFac2muagbQRnDOLX3l5y7OvEJhw5RvZyWkGat+/QhE7QCgqAcu+mZJEOhA33o
         O340kFG05m1ysST4dFVcWWurWAuaLInKXDkTS8ApTyHJt56Jpji6TVq16tJAeZKnky5j
         RnnbJCS9b8iE8pndqCbifQe7bX5mFtxJWooT4YRpYLngMiZtvvuvwrlhfO5mxq+E1Bvq
         4ccAWmSUhc9UbOaWNWf+hJv40g3tkG8p3l1g2LA+DdIlsdAdPjyHKtiNfcfNyYSxR5St
         MtUdHOQJUOKA/lMOvusVJ8e0XbEP2+gPGJ+56Fc5AwC5q1TmwF/jG8lvVpiZ2iZd83dN
         6dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231916; x=1791836716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iNeqgRL89Z9h6pYYkWfI1GWRV4tMZ1ckcaMGOUQjYY=;
        b=vcoUk/JATkPNGcX95vEbPjBp+Xt78iM4qyWmyxMH6xrPfX6eWoXXX/gKxmevNfmlAA
         wjlp78krFDnCCZaA8WBaEuGMUm3to26Hu+ksduy40NRNp2fnvmjcwSVnBUA/6I5UkvrR
         3LQOZXpaVALuTbWrvErsFzIuspwqH2HTkYOs8ZKfHOE78k7CGtn0HP5RxfApgeQj5zrV
         fmlf91b+XEXfiT23etAiTmdK+D9I3aFxLxrzjFhCh1jKrl/M355/A4bwRUD5ABKy8+D1
         dxO3z8lPMgeUONoETrYduIek19gNcqfBtLBHY25H6gyOmX8riAiwApx86TSTCgiKqrOE
         MZMA==
X-Gm-Message-State: AFuF++mGudjKahNoN4saiShw2G3w+pDwPcYcTWPSRLEgd0R90AAkTCxC
	9ns0S+QhOFtpXRa+Jfoqos7/Ck98TUur91/8JosUG1BO++MD1ZxBMH5J
X-Gm-Gg: AYBFou1FVSqJPJ4CeFZyXom1lezm7ncysoA8m79kWaZSNlvSRlDS0+Bk1OEdp4GHtcV
	nnDJHbVKED9VgR/MVnWTGKdctTtz8z+UMks8Zvb/cNjn/LPu51KfGbU0bRhcfUarM1mSzmujhF5
	Yp3+q3mLPKEW/VLVEcPx2nsBf8c46ztYB0UTAYXmOksXmhe4SylD5/yef5ffOvCZp7mcy3+akMb
	owOHk5nbTcPXrGGgo/0NXuIGGI3uO97wkIIK7XDp2hnnG5L+Rmf+AcaRa358ranzDFf6zjYKQqw
	tRx7fzAtiFcMbibYV0hygWaRFJtDJYSlNZChkePB8s4E7ybd8j48jqmUd/A9ayaEUKMgMfARChl
	Yr4iQMJm6TXw1RIxJd+AACFfyf/i3huBcdTGNO63JLzMoMmkYrEkKaWMY/p73No8tnWZuT/FEuo
	D9NXCaqVJsA5NRYLP4mXv0P+go+f9FnAkoohFtffzFh5ixLkfC7rQ6LG2HQ6YTp90kWyvEBhgDU
	YA6ZUFQt1QuACVzzONRDD0=
X-Received: by 2002:a05:6820:c452:10b0:6b7:46e9:9705 with SMTP id 006d021491bc7-6df34680109mr7270463eaf.53.1791231915637;
        Mon, 05 Oct 2026 13:25:15 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-828209a35bcsm429277a34.18.2026.10.05.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:25:15 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: fix dangling check_top after an unexpected recursive dependency
Date: Mon,  5 Oct 2026 15:25:09 -0500
Message-Id: <20261005202509.3461632-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

If the last symbol of a recursive dependency is a choice value,
sym_check_print_recursive() pushes the on-stack cv_stack onto the
dependency stack. If the choice is then not found on the stack, the
function prints "unexpected recursive dependency error" and returns
without removing cv_stack again. check_top is left pointing into the
stack frame of the returned function, and the next dep_stack_remove()
dereferences it:

  AddressSanitizer: stack-use-after-return ... in dep_stack_remove

This can be triggered by an (invalid) Kconfig file in which a symbol is
a choice value of two choices and the second choice depends on it:

  choice
  	prompt "c1"
  config A
  	bool "a"
  endchoice

  choice
  	prompt "c2"
  	depends on A
  config A
  	bool "a"
  endchoice

Jump to the existing cleanup at the end of the function instead of
returning directly.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: d595cea62403 ("kconfig: print more info when we see a recursive dependency")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kconfig/symbol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dcb4b45e6..2e87af098 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1181,7 +1181,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 			break;
 	if (!stack) {
 		fprintf(stderr, "unexpected recursive dependency error\n");
-		return;
+		goto out;
 	}
 
 	for (; stack; stack = stack->next) {
@@ -1226,6 +1226,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		"subsection \"Kconfig recursive dependency limitations\"\n"
 		"\n");
 
+out:
 	if (check_top == &cv_stack)
 		dep_stack_remove();
 }
-- 
2.34.1

