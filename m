Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14773AAF60
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477650; cv=none; b=gYpgwz8V2h1nTCKjToxCd/O5FnzAMjIynYwMTiGJl5utdYGfKKSvtbxV+C9XGOeExYbMfWpe7FwCF9+2xbXS1JAMlKunB0AvFB+bJeuipFRA+YmxlD0IqHYjgQ9Vfl/7czCyZR/s66cTtKcuE8/HD4Va9xXwvjdQq/QDPktShw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477650; c=relaxed/simple;
	bh=nTSUElvav/B7C0i2SfQbJmtMkYgxdqSu9+/cbg/x+Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hICNfa/yVEIPLs3ah9ET8/ePsvNpDCyy91+VhNH/wUv3oKlWYPE07/HVF5lGNY4cepHIhadRBHxwiQf8uyhM1P3ItyCCr6LzAU8+M3bP7qRcO3MwlNKizuJtHzw6M2um48o2pvMDJ2kqvAmh7xbvOqtj+3Sjc3e290YUxG8jg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAsnbnlR; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAsnbnlR"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dd7070699eso3993718eaf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477647; x=1792082447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/1rFcmNXCnnMZLlSh42dy2a0QU3arkNufkFJbf+SQs=;
        b=PAsnbnlRsYzM1X0By8oKwCmx7vQfc+JH9lHAjL1vj6jK5IQ9nR+ZxwuGcE13T8Xrm9
         /+/cthG6zWiYznLJwIffGs6uRotX7wmFobW3o1Xx41BhJveBkksoS7OWfWEsiyrGM+8+
         hzR6rBQcRGlkhCi1T27oNIeYviKpPbbSQm6xh5XYjnr7zKdnQA4Lkcnt7QVZmGF4vsRl
         0ZR3K/KpVxxB3RGAxPZ3+wZ6jbHMPjToIRZ43sAyMntYT01FUiPCTQmc+lRjStFRe4Pa
         qh/0YWgyD/XCrpX6O/kTS59BYmFBkuhY3/go7TzrGHSwPnijZillleNwiEnHyObvMX2E
         /ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477647; x=1792082447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/1rFcmNXCnnMZLlSh42dy2a0QU3arkNufkFJbf+SQs=;
        b=SnlXxfbKOZTns764ak9sU8Y912F4z3R4oe7Dc4dkJviCrXtd6Ni1evERyTszPsQxlM
         c81mc/O45QTULUA8CxJl3RfengSEn+2cK+B6GRCMYkVBbSwBQ8q3AUPr65UKp6iDi3fX
         R+ulyf78pI8c6emXB90uK7wGbL2QET5wJdqLDIRu1+Mg4S1/0VWErQwlFjLS9gcgBkOY
         BfzmjnF1BWm/Fev7Sfn7Szfre7zeCqS9/+LJNdy/6n+35lz6q6YW+9VG1rpWI2kdPfOJ
         pwSuvuvbnu6BilBGioPR1eBhBcxT3g/jzeAQV6tTufKBFhMsqzrUJILPcpInea4Fp9Py
         jddg==
X-Forwarded-Encrypted: i=1; AKwUvBzjEgC35Mh5242vZLdF/bSfxmDPfXJPcA/STG0irr8dgkRTwHtEZ6H5XeEbVIJdJuHW2yF+ImN84UWReRs=@vger.kernel.org
X-Gm-Message-State: AFuF++lThiFH7oMduPB+yX88WUK05ERv0JV46iEVpYxyCDYntdgDe+A4
	ZjIWN2DBlFIDr0H4gV/QPxmJqF6LvlLb6SVh1L4jwDP+2kH44t4kBTj3Atws/g==
X-Gm-Gg: AYBFou10AitDTuZAktgaRVyb5qipwDILBoQMC//mihRDk79NsyOcrfqomwhcA+H935u
	3feUMd2qk9S69UEZfVKD1vyFN7MGfISYu4QYJzyRkkTmA7HtQLW6E4hlvuZm0lpYHpK7XEj/w0B
	g7+rcA5HC5VNQxTR6VHsy2QtecpCnscFIEa/dePQz49RsS0/HeElf0Wurj9nfMv9CtY0ty7HfaZ
	iwo6QftrXyshl9qBqBzlco4VnO+vVvluxsa3t3r4uc0qdFl/VU612ES5oPO/8PMPjt2vl7nf5QN
	oO7qu/1UXcUjYCjFnoRwjgNtOfaTsuLYf10Ml0nloRcjx4A75NAvLCsiG7ogJDXPB+VsyXPuM9Q
	tla+usr50dbIbo8FOIJuoOsQoo5/bEEP1RKlbuRM4jmjV5A5XYRLV5buF9XgL+CKseLNL/2lmc9
	sKKL9sLKtiZTRP27CkImimDm7nKgz1PXY70YSlLpLAfXBFKd35/ROzc6G6G7AB/EpbZSGdeDdAz
	MCpvET/NEWe
X-Received: by 2002:a05:6820:1996:b0:6b1:a812:9871 with SMTP id 006d021491bc7-6e7a65ce1a9mr5282168eaf.18.1791477647336;
        Thu, 08 Oct 2026 09:40:47 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:47 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] genksyms: fix infinite loop on declarations with parameter lists
Date: Thu,  8 Oct 2026 11:40:28 -0500
Message-Id: <20261008164035.3668885-2-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-3-lzsx618@gmail.com

 scripts/genksyms/parse.y | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index cabcd146f3..7cc0336a79 100644
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

