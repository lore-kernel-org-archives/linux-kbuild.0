Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268856;
	b=ZR44b5SQMbJmUZuf1N5cxNTjOQawlt8+0Htwt5RowWAKbfQkQMwMVtAriEnJUeykBqwz
	 n8ZGYffnhQYcZDpnCaITABx59yGD6540kvUzde/CVoXoJF4R3D9stZ9IW3ZFUiookrIlL
	 ddf4IHxBs2m2XHw+cqTPoooRBeVSXUQ0+yjPkEzigo0QfDB24+hxb+2c8T0mFpDCslTK8
	 tvWSsxMo+wV/2qX07wvF7lPmv+eMaYi/enONQRRyzjRPpcwrGNUvBwtuJDZV1mI6JYZPI
	 AMuHIBpvsO97lc5av8raowUFh6Uzq1S2HpK3hbBVVA1d3DmnEDdZkAaNJ4yHTJYhIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C6v8yQiRwIXyjVO4a2RoDhFAswA1B+x9SGkBxm38Q8M=;
	b=OwTdJuw78sGPiwuOrvDiCra1URzLc7cMmIZ8aF5kurFIBjEKsWKYpd3RrONxlSdvr61w
	 qJ+3y/e6FxFsk7HeeO+d5RcGWBjCJkQ95d3TUmpboUy+KN+igyDoTj7szhgUi835qzjTb
	 4D9F3gjyNB+LUEaZiCokTw+uY/fKkSig1n3SOlB40RsJ4ZsR3oAIGNuv4UV1qwVJoDFf5
	 cZJGcmBFYspH8FP86mv+9WAKn2fExkTa+WWmLHmDaUrFumULKtd/G1aM+8YV4Vfk1D9IT
	 itt7Z8VSwA9mIixczdkTc14B85DQq1stGqvdIEadm2xGQvbM4JuKDH74UksRJM6IKUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPJnytAt;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F97606A336
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 00:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F97606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPJnytAt
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b28d9537bcso1022079b6e.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 16:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268855; x=1794873655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6v8yQiRwIXyjVO4a2RoDhFAswA1B+x9SGkBxm38Q8M=;
        b=OPJnytAtrZ+lmd5q6j8qQvodlISbdEptBXRcHBqqmcF6HwF0V3HZzMzJzqmTbLq3O+
         fP18zRwfcJTF7Ax8klYWwgkGSyHJghSWj+1eHnxTYZrCt2+SDtbPoblWDYdfv4V5zZQa
         GXhcRcBUrmLEriYbS11Q2zWio4d2UIDit8p1a3RVxtr5R/lswQbcWH7gKRIXB+nzQsTb
         ncT+uL2KXQY5H8Kepkt1ENSIihkznYwDz23S+FIW4gqh+q/crCMZI7kY7tQwHNnOa6ZE
         E0bdOdkVnmXSoX0EwieICtSLbLULCfHEl6iwJyv/p12pVKhQa1V3SMEkKoSAuTYo/y8/
         yjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268855; x=1794873655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6v8yQiRwIXyjVO4a2RoDhFAswA1B+x9SGkBxm38Q8M=;
        b=u4I2rolG6unYN6ZRBhBw3jZtODlXfYoFSGqqBCjvuVtV1bhMwjR28mr9c76YmOlbd6
         oOQUcs3ZgPJpJBXrKc7BTbQyzOVslYOl5LW5+RkZetUvh1KldqFxf15Zq8dPUxZsmLgV
         84jBXL4F3JHpSIecplcHmirDIDjhtqU67lYdRDruPh8SWmAA+IFOLvTKhf8lZIJ2qfDT
         9SutrO6nLXw1+ks7QcIMaYKp9Fc85sb6vVrrwip5rp305nBHQC35EdVKreA6HEf9kogV
         8x9mcUk8tYVf4J8Z+0Sn6QzskeQq6O4nW1wOogHjNY34RqrCLswFhXiHmCdD9MYVVwYv
         8krw==
X-Forwarded-Encrypted: i=1; AL+hErGHdjJ8VwY8ya35yQR2kifzWPbB+l3dxOLzCb5EcvSH78aBn7nzI+qDaVAQ0Rr4ofsoPkZCc5EqBdO1bEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z83qlCY4jQZLL+Fxq0sHxMsBLclFuUovYXaREi2lTAx6UWMDxhf
	4rvEZHkGkqDHJ9jnlU13pjHM/vD/qOsqzuL9enaf4HYLhqxrL6zIzQAh
X-Gm-Gg: AYBFou1Q83kb4aqgb4qexUDqjZXpP8nXUzlJhmhF/P8yXwn8Isy+KkWj+siTMOsLDi1
	kXrtv2wxr0Bt7PJQeFlYlTpdbD7Z2YxJoCPAabn6znDNGeUryRZWmA7yIKOS4E7BmIs4mwOPj+0
	FVjy7QwENLohBM+gxRGl64zzspXcSTSzMy4gqxPNVrRrun6dJHXp7/MYwCQ8pSoGpLOGw1enX/Q
	0Xhfo/R99qRWIEtAce77hXrIr+pYZI05tecI7bC5xjPSmuNIaO/xoU63RzT7XsnddaBDIIPczZL
	Asx+FmzpwehTYu+FGYXIitQBmqalhRwOSJX4G9o1MUhZazfKQfuRYXfcD3ckvqpjoFU8E7HsCmm
	cr4U3l3K/aestTjRHTYZOyskoWv+gSzBqvQL1Gs7nwO0qCuwbfr2+4nWRLRvaOX2pjadoYbMBZb
	qKhox8d8nFLXFZVAB1GMRQeB+taGT3z8n2LfgS2xGEfmD4TKqtcEIQmzwlAIVG7Jp/tP/mnr3Dr
	NJsy6sUC3qX6M0ju4HTJ/YsJ85MG3qVCKCLV6/8X3sVSZtrKkoWoF/wmi/VsYt9CSYwuujzUQxN
	jA/7VoXEql0v6bYowBOSoDtNwHtMdKOVkvR5qD8W37Q=
X-Received: by 2002:a05:6808:124d:b0:4b8:4703:db92 with SMTP id 5614622812f47-5688130178dmr490167b6e.27.1794268854914;
        Mon, 09 Nov 2026 16:00:54 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:00:54 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 1/6] genksyms: fix infinite loop on declarations with parameter lists
Date: Mon,  9 Nov 2026 17:59:58 -0600
Message-Id: <20261110000003.1719966-2-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

decl_specifier_seq updates the global decl_spec, which is used by the ','
action of init_declarator_list to give each further declarator the
specifiers of the declaration. However, decl_specifier_seq is also used
for parameter declarations, so for a declaration such as

  int a, f(int);

decl_spec is clobbered by the specifiers of the parameter "int" by the
time the ',' action runs. The action then links the parameter's own token
node back into its chain, creating a cycle, and copy_list_range() loops
forever while allocating memory:

  $ printf 'int a, f(int);\n' | scripts/genksyms/genksyms
  (hangs)

Before commit 45c9c4101d3d ("genksyms: fix memory leak when the same
symbol is added from source") the same corruption did not hang but
silently recorded a wrong type for subsequent declarators (e.g. for
"int f(long), a;" the type of "a" was recorded as "int f ( long a").

Only set decl_spec in decl_specifier_seq_opt, which is used at the
declaration level, and let decl_specifier_seq just return the last
specifier. Struct and union member declarations use a new
member_decl_specifier_seq_opt that does not touch decl_spec, so a
struct body nested in a parameter list cannot clobber it either.

The generated symtypes and CRCs for 149 preprocessed kernel source files
(1128 exported symbols) are unchanged, and no new bison conflicts are
introduced.

Found by fuzzing genksyms with ASan/UBSan.

The problem was found with ASan and UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/genksyms/parse.y | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index cabcd146f3aa..7cc0336a7954 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -201,13 +201,28 @@ init_declarator:
 /* Hang on to the specifiers so that we can reuse them.  */
 decl_specifier_seq_opt:
 	/* empty */				{ decl_spec = NULL; }
+	| decl_specifier_seq			{ decl_spec = *$1; }
+	;
+
+/*
+ * Unlike decl_specifier_seq_opt, this does not touch decl_spec, so that
+ * a struct/union body nested in a parameter list does not clobber the
+ * specifiers of the enclosing declaration.
+ */
+member_decl_specifier_seq_opt:
+	/* empty */				{ $$ = NULL; }
 	| decl_specifier_seq
 	;
 
+/*
+ * Do not set decl_spec here; decl_specifier_seq is also used for parameter
+ * declarations, which would clobber the specifiers of the enclosing
+ * declaration, e.g. "int a, f(long);".
+ */
 decl_specifier_seq:
-	attribute_opt decl_specifier		{ decl_spec = *$2; }
-	| decl_specifier_seq decl_specifier	{ decl_spec = *$2; }
-	| decl_specifier_seq ATTRIBUTE_PHRASE	{ decl_spec = *$2; }
+	attribute_opt decl_specifier		{ $$ = $2; }
+	| decl_specifier_seq decl_specifier	{ $$ = $2; }
+	| decl_specifier_seq ATTRIBUTE_PHRASE	{ $$ = $2; }
 	;
 
 decl_specifier:
@@ -456,7 +471,7 @@ member_specification:
 	;
 
 member_declaration:
-	decl_specifier_seq_opt member_declarator_list_opt ';'
+	member_decl_specifier_seq_opt member_declarator_list_opt ';'
 		{ $$ = $3; dont_want_type_specifier = false; }
 	| error ';'
 		{ $$ = $2; dont_want_type_specifier = false; }
-- 
2.34.1

