Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD35616C2
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095083; cv=none; b=Xu9uiGzjdibDGkPpxocc/9DkX69oL/HAoXUtoMqTlvLMBQHpVMphVJiP0nmamRb1pWhIHSsD3fTk/sRDDBsM7OR9md71kSnHZ9F+/LSdhm38NGCwmp11Bt9BolpNEFA5BE8PY2NLn8QcyOFV/Hz1XBIz6BE3JgkKZn/KFx7ZpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095083; c=relaxed/simple;
	bh=1MrC8er/0A3gcbeDls5lmci8wsbLhS0/K5KeXigJ2kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eH9Tt0IuEsAGTI29XcBILeD61ZPQ1IF6ZACOtuK6wSj1p32oSTgIuk5jcQKhNLm52tZsSbEkGy++PArYKQyAV2A2p1utkfzG35OcjOhiB8i4kFCFeEgG3VkPu5qP7PLcwEv7+NrfACCLkm9PFnzmzdL3oV1sLtgyaoRR6WaOE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5Z/7suf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5Z/7suf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so137180f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790095077; x=1790699877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVuL86sa5yiPerOonHoY8IR8lf3tP+mQ9Erkrp58H/A=;
        b=p5Z/7sufstVxL59wS96AGBgmqYg/KmrBuZh1IITOE4XfZhq/47JyGGZcaWgSdehLJ0
         Uk4wMCf/o29D/OnIkyE0//jLVfBFO6BdPx+/Mb/GvXA18/lk0OfXv3kreWSXQedc1BAF
         taRQ9mS70hnQ0El4f9bt9h3nB7qkmo8X5YRLPAL56H/KfluVSlqd588Fn1VYJj24ZBEd
         T0FCYe1Ccoejs+SfXKST7yw1jX/hcJCEMnwzmWG7hZIJdu0fxVopIbJv4mn2cASE2/XV
         +a3ktz2z+drSdaQiKU91I8ZNYw0DbcAvpCN1AdzWj1rQKahnKei5TOVL3LPHZe3zpiCQ
         g/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095077; x=1790699877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVuL86sa5yiPerOonHoY8IR8lf3tP+mQ9Erkrp58H/A=;
        b=rO5xF8NocfDQV41bsr42NFGalZJXj6mb4epX0+ypsNJQN0DjM16hk6d/9uURb1a+N+
         CdAntfdY7j8B9LI+wfNJdUu02rZquoSUCg/jhOH44/OjI2pFI7eJacobR/AFMKREv3hb
         y0hVtIEVLngw3svAS7FwZb0mEk+E/X6kLpVqXdcjQiSLeQo8bbxXMOpK4kEGynRTK/Zj
         tzlgc6QzcMA456QZqYnZ/904IUWjBMptJckfVxe1PH4nkg2fytC2WSEt2F6gjooRfp2g
         1PqGrSxWhQ0qcBTY28oOfrXhiJL5417dnCYvP1NKd57jFCqFANukHZnOVatlsR2jNNH2
         Dhvw==
X-Forwarded-Encrypted: i=1; AKwUvBxdFAH0oo/EvymIngIPLRzKKYAevSbqc8yOLo2SjaWpUczbXovTRpmvXf51Di7b+f584QVQUZk/HOqPsgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kCul30PIjeDUsygh6V2FGngG3OAT37jrV9ULOiq+XmBHktJVme
	2jPJaPJWC+F4wEdf6SJ94O0WyWzSI503nFJyCjZjIelWUkowKUglO6Mh
X-Gm-Gg: AYBFou0iDrYz/ODPkY5sQQLrxD7lFkmqM3POOb40NJuxaqYjz6Xk3btbrImohRCT+YI
	F38tSfv9z0Itp/SLis2QXo3WHce4Dzr/1NL8K1Rvc7VyMyhY4RbwTrWIn+Aw3v7A+Y5iMyWk/xr
	HOqjuy3c8xU5U6qN2t9hqSiON2NAVwjpqkrSEfNj9M4M3sn4jT0hmg35V1G7zZdiUkRaZpSB59v
	LPgXfzXNGvK9sStxh55XOVSv5p9q1hIgL+h8Ow3/nxErHxxuTAVYuX356vL9yCU4bX5BLBwAjCK
	rFkkdZTjw5gKdFti4vNJ20Tp/s//qI+ugLKedOBRECh6TXJ2uWIP+S9Fk7TcgWMW/6IpFiLUEUb
	hUBq4ni2urSUuT1E2Kl8hQa77soLbv8QH9vnbV/Nzd04567WU6ojkI02nU8QBRa1aguail5YDXO
	CS3GEcaX5VxuZDqLIvwUsvQN+j+GHhjNuGQgv6rkt8uyWzPiqazw8TZmr9EWsbHP68lQoUpGNhe
	UWTY9DH6dMEm7Q29SaHz/s51Bb6vWT9hpClcbMxlvS66oSUTYeOeAc1Ph3aH/k=
X-Received: by 2002:a05:6000:387:b0:486:e949:532c with SMTP id ffacd0b85a97d-488670985edmr231416f8f.43.1790095077026;
        Tue, 22 Sep 2026 09:37:57 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862773ee0sm6162192f8f.6.2026.09.22.09.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:37:56 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: n.schier@fritz.com,
	grahamr@qti.qualcomm.com,
	rdunlap@infradead.org,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 1/2] kconfig: add prop_err function to simplify property error handling
Date: Tue, 22 Sep 2026 17:37:48 +0100
Message-ID: <20260922163749.2031594-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922163749.2031594-1-julianbraha@gmail.com>
References: <20260922163749.2031594-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As suggested by Nicolas while reviewing another Kconfig property error [1],
we can add a prop_err() function to simplify the tracking and display of
Kconfig property errors.

Note that the formatting of the error printing is changed slightly
(removing a space) to better match the formatting of warnings. This causes
a change to the expected test output for the existing errors that now call
prop_err().

Link: https://lore.kernel.org/all/20260917-proficient-swift-of-masquerade-0ff7ce@l-nschier-aarch64/ [1]
Assisted-by: LLM
Suggested-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c                        | 23 ++++++++-----
 .../tests/err_num_bounds/expected_stderr      | 20 ++++++------
 .../tests/err_num_mismatch/expected_stderr    |  8 ++---
 .../err_num_non_numeric_ref/expected_stderr   | 32 +++++++++----------
 4 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index bda3e2650216..118af2dde722 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -59,6 +59,16 @@ static void prop_warn(const struct property *prop, const char *fmt, ...)
 	va_end(ap);
 }
 
+static void prop_err(const struct property *prop, const char *fmt, ...)
+{
+	va_list ap;
+	va_start(ap, fmt);
+	fprintf(stderr, "%s:%d:error: ", prop->filename, prop->lineno);
+	vfprintf(stderr, fmt, ap);
+	fprintf(stderr, "\n");
+	va_end(ap);
+}
+
 void _menu_init(void)
 {
 	current_entry = current_menu = &rootmenu;
@@ -246,18 +256,15 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 
 	if (sym2->type != S_UNKNOWN ||
 		!sym_string_valid(sym, sym2->name)) {
-		fprintf(stderr, "%s:%d: error: '%s' is an invalid value for '%s'\n",
-			prop->filename, prop->lineno, sym2->name,
-			sym_type_name(sym->type));
+		prop_err(prop, "'%s' is an invalid value for '%s'",
+			 sym2->name, sym_type_name(sym->type));
 		return 1;
 	}
 
 	if (!sym_string_check_bounds(sym, sym2->name)) {
-		fprintf(stderr,
-			"%s:%d: error: %s constant '%s' is outside the 64-bit %s bounds\n",
-			prop->filename, prop->lineno, sym_type_name(sym->type),
-			sym2->name, sym->type == S_INT ? "signed" : "unsigned");
-
+		prop_err(prop, "%s constant '%s' is outside the 64-bit %s bounds",
+			 sym_type_name(sym->type), sym2->name,
+			 sym->type == S_INT ? "signed" : "unsigned");
 		return 1;
 	}
 
diff --git a/scripts/kconfig/tests/err_num_bounds/expected_stderr b/scripts/kconfig/tests/err_num_bounds/expected_stderr
index 5f89cf4afff8..c012b10bae25 100644
--- a/scripts/kconfig/tests/err_num_bounds/expected_stderr
+++ b/scripts/kconfig/tests/err_num_bounds/expected_stderr
@@ -1,10 +1,10 @@
-Kconfig:51: error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
-Kconfig:55: error: integer constant '-9223372036854775809' is outside the 64-bit signed bounds
-Kconfig:59: error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
-Kconfig:63: error: integer constant '-10000000000000000000' is outside the 64-bit signed bounds
-Kconfig:67: error: integer constant '-9223372036854775809' is outside the 64-bit signed bounds
-Kconfig:67: error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
-Kconfig:71: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
-Kconfig:75: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
-Kconfig:79: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
-Kconfig:79: error: hex constant '0x20000000000000000' is outside the 64-bit unsigned bounds
+Kconfig:51:error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:55:error: integer constant '-9223372036854775809' is outside the 64-bit signed bounds
+Kconfig:59:error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:63:error: integer constant '-10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:67:error: integer constant '-9223372036854775809' is outside the 64-bit signed bounds
+Kconfig:67:error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:71:error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
+Kconfig:75:error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
+Kconfig:79:error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
+Kconfig:79:error: hex constant '0x20000000000000000' is outside the 64-bit unsigned bounds
diff --git a/scripts/kconfig/tests/err_num_mismatch/expected_stderr b/scripts/kconfig/tests/err_num_mismatch/expected_stderr
index 587c34467ae6..058b507396f4 100644
--- a/scripts/kconfig/tests/err_num_mismatch/expected_stderr
+++ b/scripts/kconfig/tests/err_num_mismatch/expected_stderr
@@ -1,4 +1,4 @@
-Kconfig:14: error: 'HEX_SOURCE' is an invalid value for 'integer'
-Kconfig:18: error: 'HEX_SOURCE' is an invalid value for 'integer'
-Kconfig:24: error: 'INT_SOURCE' is an invalid value for 'hex'
-Kconfig:28: error: 'INT_SOURCE' is an invalid value for 'hex'
+Kconfig:14:error: 'HEX_SOURCE' is an invalid value for 'integer'
+Kconfig:18:error: 'HEX_SOURCE' is an invalid value for 'integer'
+Kconfig:24:error: 'INT_SOURCE' is an invalid value for 'hex'
+Kconfig:28:error: 'INT_SOURCE' is an invalid value for 'hex'
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
index 005f855ecbdd..48d78b5c18b1 100644
--- a/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
@@ -1,16 +1,16 @@
-Kconfig:17: error: 'BOOL_SOURCE' is an invalid value for 'integer'
-Kconfig:21: error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
-Kconfig:25: error: 'STRING_SOURCE' is an invalid value for 'integer'
-Kconfig:31: error: 'BOOL_SOURCE' is an invalid value for 'hex'
-Kconfig:35: error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
-Kconfig:39: error: 'STRING_SOURCE' is an invalid value for 'hex'
-Kconfig:45: error: 'BOOL_SOURCE' is an invalid value for 'integer'
-Kconfig:49: error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
-Kconfig:53: error: 'STRING_SOURCE' is an invalid value for 'integer'
-Kconfig:57: error: 'BOOL_SOURCE' is an invalid value for 'integer'
-Kconfig:57: error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
-Kconfig:63: error: 'BOOL_SOURCE' is an invalid value for 'hex'
-Kconfig:67: error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
-Kconfig:71: error: 'STRING_SOURCE' is an invalid value for 'hex'
-Kconfig:75: error: 'BOOL_SOURCE' is an invalid value for 'hex'
-Kconfig:75: error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
+Kconfig:17:error: 'BOOL_SOURCE' is an invalid value for 'integer'
+Kconfig:21:error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
+Kconfig:25:error: 'STRING_SOURCE' is an invalid value for 'integer'
+Kconfig:31:error: 'BOOL_SOURCE' is an invalid value for 'hex'
+Kconfig:35:error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
+Kconfig:39:error: 'STRING_SOURCE' is an invalid value for 'hex'
+Kconfig:45:error: 'BOOL_SOURCE' is an invalid value for 'integer'
+Kconfig:49:error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
+Kconfig:53:error: 'STRING_SOURCE' is an invalid value for 'integer'
+Kconfig:57:error: 'BOOL_SOURCE' is an invalid value for 'integer'
+Kconfig:57:error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
+Kconfig:63:error: 'BOOL_SOURCE' is an invalid value for 'hex'
+Kconfig:67:error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
+Kconfig:71:error: 'STRING_SOURCE' is an invalid value for 'hex'
+Kconfig:75:error: 'BOOL_SOURCE' is an invalid value for 'hex'
+Kconfig:75:error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
-- 
2.55.0

