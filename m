Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455467;
	b=VYddMTPEDTLBBMRZFqksSZ/U3+libcu0JQSfmrfM/vMQsOyrG5lMRHp2jrlAh23gQDzf
	 ZrBkT+MFx+waAjIlG8j3/sEkvlVr1X16Lb2WcPtBmdozdKAZghPF/vBi6B04iLs9GOG5g
	 Yau4YudyUWw4NjVZi6+iFuUXysLY1DzY9FTqVpcr44PYyX0orIHSHnl3MDajPD+z4HZ4A
	 7EQadACq3uSUdih1GfNUq3sQfUVaPkA7uJqq606dwfl1yvtv62HXnLPyBuiRnoMBh+CkX
	 95vnIq6o4uTZ7/HNnPPrYf/K3pi9c5VoNdIr7yfU3da+YeCFEjPVhrvISMbQ1qeF4vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Tb5yvLH4+4yt/oCyCjvB8qbyFwzO/q/5ycE6lVhneX8=;
	b=Uy34OYwHGXzEs53b5ojH1xY/wvUk7pcIin0AM7zgdksg4k5HhJEDfttxgents3V+fRTd
	 //7b9lIhfgTLub9n5AcURCTsZPgJxtVLeYgHwi6eyAW9IG+kr0yldH+9zVqxUBdcfsKOI
	 PxLBaysPb29p2jrbFIhxFKHfUX4Qcoy2EqX2zO3PYwpysfYHfzvpBSUUr4Ox218NM4GPZ
	 QKxQV0tqDmi+Ry31KISDG2Sff/mQlMZwMQMwZ+Se+1JzpyKF8/8Ys4M3aG10KC4DY04Ko
	 mUL4Ew3Oz6cEgkkVEL4puvD7F7CF5ZkdW5yAcH5NQegqTxz6zrgF+TJgb9Bo1yDxBOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TIPfa4Ow;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE63A606A319
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 00:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE63A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TIPfa4Ow
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2414667a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455466; x=1793060266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tb5yvLH4+4yt/oCyCjvB8qbyFwzO/q/5ycE6lVhneX8=;
        b=TIPfa4OwpNDlK5WEqLvZ8+3z6kPfYniYOqnIf8OU6BG4HcbqvmEjHNbcz9vTraQlMq
         nUvf2tuaRNbEpjw8SVNCRF1yPpEFkdbkQs+dWyaEhUpIVBXgpD6up0XcPiPGqmRYLCei
         N0t+YLVn+xOg6nu9vpmht1mzyedkDoa7CCXab9ZcHKJMvm/OqQLVzt81U5Al2FFlt2MW
         rHiBboR8d5RREb8j83UQMpVFzmn1+jKmotxxfvyEk7ipjsb7CNSOE+4UPASmYcIZdKKG
         SYBI+mCWFjChnrC970OV9zI1Ba8hoNG24nwogdRadQSjJzlqX0zFEaCdhAXvqMsSVD2u
         /glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455466; x=1793060266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tb5yvLH4+4yt/oCyCjvB8qbyFwzO/q/5ycE6lVhneX8=;
        b=DyC4CTjEiw3GzAcxa179GhiYpICwgjahdE5Lz8rB2e2+e+CGQ1fSoN0Ny4cdgRCvcp
         2eprPcogDJ2zJcqJQRW35Vi1LOFVDfrJiryxv5i8QEuPjONNjbOyeje8Yk3sHUlAPQd/
         p/vf74BCraoZEzmMfTfyJFdCHXwOPpDOzU2jUce8fOsXocyLpljcl5wkOuDmVUa92Ic+
         QgdHWvTFlsPHbYYYGwwp8Gcmm1K4PB20O1y/epih2KtV367upTw1FeWRD/wU3knD4KTy
         z6a4pb8wYzsumEGyhBCZk3eE9tjy57IjjfgNu5jfp4HqV2On2BXORlXV7jFHd+tpfAuI
         NhnA==
X-Gm-Message-State: AFq9FYLUE8DEianH0xrPGP0pt3j9O0IYLSmBJtm+i4jOUa43JkrB8mYP
	aXd79NsbEh9M+LcsjdsRBwsW7t1aw9W4+y/t22Xa2P05L1Pl9jOyl/tX
X-Gm-Gg: AYBFou0rMTzLhZcoisqdrZw/iOkSDleSsRwrAge6uo1SE1RVUuHa6ZuZ9KmjZg7Remb
	2Q7nkPJlx6udCnB7LlfKBQv1gpsvLCR6C2AdB9tiOmcZXwKYKsE/PpZO0J14ayBC5MtocZeMuWa
	EBO+SbnDT3ot2YTq/Z1ju2vF2n5EoRwjIiCblO1+bSGLtX5E7IddFddzSSgnyYFF20EfTIKh3Yl
	dHG1r41YzZIoDQsvB6apuryc9fjS4tsx1YiWfuPvvdcMqttsl8eAfLD8RFcj3gw1EFps33Vpekt
	pqceQD0PRvKEOBvlw5+yPxPHqQGO9hF5htBNXwBdzAT/MIw1ydK4b+TZHTFY4DUsmsRvQ0Jj6aD
	PW/Nsj1fd+Dw6jKpIoCwNjJ05fXvAMuZxW/JF92NOK9n9YSPG8aZ4qezzt/kb1DMqbilRDsXYRD
	dmEbHLkmwrCJR+sMWtVjiBCMdDwumMHxRVrB8fBcpgG7nF140uGykZM3ohRMkSt5e+mZU=
X-Received: by 2002:a17:90b:580f:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3aceebf6d03mr8211505a91.27.1792455466027;
        Mon, 19 Oct 2026 17:17:46 -0700 (PDT)
Received: from X1C6 ([2001:569:59ad:3f00:d46d:ec53:e9ce:eae6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm1275198a91.16.2026.10.19.17.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:17:45 -0700 (PDT)
From: Cao Jin <pino.cao2022@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Cao Jin <pino.cao2022@gmail.com>
Subject: [PATCH] kbuild: improve sanity check for ARCH variable on x86
Date: Mon, 19 Oct 2026 17:17:38 -0700
Message-ID: <20261020001738.2607318-1-pino.cao2022@gmail.com>
X-Mailer: git-send-email 2.55.0
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

When building for x86, ARCH=i{4,5,6}86 and x86_32 will fail the build.
Make it catch all name variants.
---
 Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 7c855e6fe544..cd397027891a 100644
--- a/Makefile
+++ b/Makefile
@@ -409,12 +409,10 @@ ARCH		?= $(SUBARCH)
 UTS_MACHINE 	:= $(ARCH)
 SRCARCH 	:= $(ARCH)
 
-# Additional ARCH settings for x86
-ifeq ($(ARCH),i386)
-        SRCARCH := x86
-endif
-ifeq ($(ARCH),x86_64)
-        SRCARCH := x86
+# Additional sanity check for cmdline ARCH settings for x86. This catch
+# more name variants than "i386" and "x86_64".
+ifneq ($(findstring 86,$(ARCH)),)
+    SRCARCH := x86
 endif
 
 # Additional ARCH settings for sparc
-- 
2.55.0

