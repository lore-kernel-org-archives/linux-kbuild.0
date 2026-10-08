Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999443A453B
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477934; cv=none; b=aXIfn+CUE1UAFO5JGMg/2ZcLfcgaR1qxfkZMGjxKvjDPavqfSQZhDACyzGihXZCzRYJrJ65cdLvMdf6LpZczk0CQ5RxMsfWrQv5DKKuRMYIBdu7KP07VZCSKlM+UQO4VQBlBFrgWC7fV4uBEjVhVM4sMjKLpkftcsAZD5sD6Hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477934; c=relaxed/simple;
	bh=OslvAEuCF6cBCtTZDYW4H4/nIuq7etdvDTspNStbkGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PLuX61c12XJ4cmqOg23Lx8926gfYvVNMAKmby+vW7mHek7lDjxvz0G4xB9O8UxCgpwovKClzDNQhLIJA70A9dv+NwNCLmtH/l4GIUl8Qi4giBQ6VMStYrz42oJkWkIk+xDte6oAHJfA3kPtupazXE/48BmLW+jjgYenIecCMf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l76V+QGp; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l76V+QGp"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d7e06dbcccso2211625eaf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477932; x=1792082732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKBPPF1RRr88KNBz9nrVdefWmPTx4J32YFZ8CbEMgRs=;
        b=l76V+QGppBtZXxP9ocoa/t4oSSFyRdkJ8chvA7e5+dKLf8OVaxE6x6z3AiFV8FhP0+
         bwFP8tyx0gybmA50MY5o9HItOk/3WUvPnF95Fi2KDhhTobqfWi1aDMZLXRExtHggFZWr
         gL7Fef8qbQN8UxoGB5HPa2ZCp3CtA+ovs0ywgiaXyAj4J4/G3dkRe0eLgzz24cmGC0jk
         27FbxNMeOgZ+LplhQAITc6sHBRcz2ZQf823J8nF8oy/FN+Uo/KGWxuUfvlf5dXKyhThG
         xKzhqSYfGEOnPfOmIxUyButqkGp1+IFXFXdhmZNP3+JGOKUUE01lwz5fXYvL0+7rhVnH
         3/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477932; x=1792082732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKBPPF1RRr88KNBz9nrVdefWmPTx4J32YFZ8CbEMgRs=;
        b=u9P5Tqj/Cn0Nber9C8WnOD+hpl9BWhWqiyEPFgz8giw77Rb1HMthjsI+wAXwR7Zhro
         rENbmLfF68YGtBr/vcmb3AmmvK9AKHOeAlKjaXN1aCWfYFqNuJC4TuM1aaXc1m0X1RGl
         yUb1t8jlrWVeg3Pvp4IXyiPiGuXYD0tYZB/GX96Qkj52/CFRZ501lpPTZLzdN3VBDzxk
         RDiJBhwwW97b2P/XdviSyQSBA7OAYrjSLC/T1PTMz9sFBe9ECnkvvcaLxgqnf0KaGxU4
         /jJydKkBRpqrEZ0/XAE7T1itkdivwUitHFLpan/f1R0sPRaVJdZFj1gIeQVH02veXazq
         5jqw==
X-Forwarded-Encrypted: i=1; AKwUvBzoTqDzta1rNGl9wPfXVArvaT/oV7NdZZyeVRlhOzadBbmuD70iPOP6oqWd3mMDRmiO4pAUNtJQ0bN0E7A=@vger.kernel.org
X-Gm-Message-State: AFuF++lONONDRfoJUMrBq1v5jKs4Lojzc24Ft9DPDDCMNd1TXsW48bPe
	T9YFGqThi6uZ85E3O8KSbTyMlC4IhYakpQpsPfTEHwxEZ32fieje88xy
X-Gm-Gg: AYBFou3A8zwUysCt7O417Z69rBoq+0BpnTcqfNo39pmYtVpkl5yzP7yW2pPZxcC8pQZ
	HYwAZsEppYcR/9n9uSoDVt2l+VvtuO2BhZUmsn0dojCTjZKhJ/MVbT+rweC7ABirHchbVHtsemy
	HA1uSOn/g0Q0RnmTm02UupWCJs8D/p7++yckjd3jZ0twm7OXbZ2jVFKxmQvPDP1ldDIj/IL1H9p
	GKq4b+2n0b4Z9wiuvwcsdKeY1tQfVv7v6S3uemvhBOIoOIIzVMBq6HOJQ16RW8y7y8iJyeXbqfQ
	bAkCkBkBkVptVqJtnVd+GkKQYrCCoSBUtvUSlTvxalSm+KuCi+23Zs7hlHHUvIzSPc0igJqBABH
	LzfN5fbnUcD0DIdJEoaZUdLkSUHwJQgQYIoczZS1XpHu+E2hJVQtEOncT//d8UJibvaiSkkhbqR
	bOImAfaWeVUlLKZwKjjTienCXIEM3HI9uqcKozWDRut+/svLh9wLNk/DWSJmrOs7xQuiZ1HPJW5
	bTciM6104cGKQ==
X-Received: by 2002:a05:6820:61b:b0:6d7:cd0c:752a with SMTP id 006d021491bc7-6e7a899f44amr5561416eaf.54.1791477932256;
        Thu, 08 Oct 2026 09:45:32 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82fc9fcb01bsm82763a34.23.2026.10.08.09.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:31 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: fix dangling check_top after an unexpected recursive dependency
Date: Thu,  8 Oct 2026 11:45:28 -0500
Message-Id: <20261008164528.3685545-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202509.3461632-1-lzsx618@gmail.com

 scripts/kconfig/symbol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dcb4b45e67..2e87af0985 100644
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

