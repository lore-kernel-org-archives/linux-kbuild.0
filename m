Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF9246774
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Aug 2026 21:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917250; cv=none; b=pCxNk5w0qTqPGUKVt/VCSopy+odFZLYXNjPFJj1FeDXpp0UIIHMUVOR5VIPI5NpdYcxZiP/VeQYVuKQZzH0gB+NJwFGJdabTn78u5YwJK4UT+t+AQ1vgY9jV7Hfwk1mMfyLiD7psaHBk7Fqon4oscpCn3qzky/zq+mOA6n9xgzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917250; c=relaxed/simple;
	bh=R1Ocnxy5s4ML8UfdoZ1jafHArHGdF3fkqDWYKWsXZVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYVt+T78GbQya6LOQlZLK2tjuawrNX+B+3hLR1QZznZuDy8e/iOsZl+GKLmDemJeZlIme/a3duOnFar0PbaBlZm00Cjt3+JvqqbCdbo04AqExxkRAaWhf0IqH8CqWNkwOS0kUicn6sp32Gri4al1TsEFQVh8wghg+aPQUiDNkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ap7hC5ej; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ap7hC5ej"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954dff6536so20692755e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Aug 2026 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786917247; x=1787522047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKSHWQgwdR30Bs+BMpgTKUy/VKU4EsEuaszA/Toc6Fc=;
        b=ap7hC5ej+SAl76pc5gShNxXaeY4Y/lKvTveU5mx2JROBOxWFUnZlREtzhmgcaXnT/6
         1h34J1mfTlutYmm0YRchkLlhp+a7ZlZCGRpyV91E+ix7AbWQvb4/VOMgmu+6E/z77CsC
         dEtu7/jBlhhleQTSgnB8TnLyulkC05dmIfSdJNNZtr8R+SHw6BxAWxzv00hWo1JRX/SE
         y8/JHIfSBVtTFQRYZ9GS5bBWaynPqGJ+J7TgIMja8tc2oWmXdA6Qmi7T923RFw8/AruN
         eHY7VBFeDiMjij8KYNC49gq7CphiVyuK6QBYFDszzNDPQGAYywJ7lw8Vy3J37lMhq3qM
         0k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786917247; x=1787522047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKSHWQgwdR30Bs+BMpgTKUy/VKU4EsEuaszA/Toc6Fc=;
        b=ei0d229aqDos03VqXJYM1BsgEfUIPM2NqUPxTNs2omKv7TbABOvpVZZdDRVhpD01Vv
         BGrGheS55Tzg0r/BbM0sVuMHoRdQWV1MvfHette7I/bHC5GKuXoEfDdQVtKMJBvgCx5P
         XZDQrd92/dbnlJFbmvVw4JCdciB1HifCjKY9qgj5yUH/VIczahbv3fNlLX4vA/xPbnay
         5Ehw8anasFetnuwXYfCDXZKgurgOvA/pQgjorhpJG9vK+wonPXa5cZ+dZ52anMlCmg61
         X+b0+4lidLCLfB1SPIYtbiH+gaMmBhdqcg8ndxHyoo1qy/tPr17L1tfROzpGZR8fL3Ce
         76Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rrh4WCWq32swZQeikBFob57vAxkPjfMZYhpNMS5sNEEOhlhp+4UQy2A9psCgwqFKP6f3Xy90bNXnmx+buY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDWCxS+sKHRGLYyF6xuPKnKeiLM55L6jYu7MXHg0ifCIXxxXc
	ChhLF8JolBA3kIUyCmj9MBoIVFCufb4nhT6pHtEiCbGW/DBbrvdOPLmS
X-Gm-Gg: AR+sD11TKpKXuFrOVaQEFc07eZqC5YdGidyKB4aGjmilFLDI5ayjHMFSApUFrrF7P8C
	m0/Cng7w3fIR85oQuMgHcVa0byCezS4amwGVYr29uHnmBhjLEiwa8PNEg2fY9Q1IPwzl1DWTQPu
	G5mXF7f05WW57+9iEa3IaHSg4YXlkE7CgtEiPIIeqi8rTbGbq83CZArJ8B0oxo8qBSlw+g7UWaG
	sJPPMl1Sv5DF7QRh7VCves3FlrJv+eS2fO31TzY91Fky1WfAkiv/zOSYagNHXemUfhhRsdI1dHS
	FzKxSt5vDxix9qIu09GnWjakZOLgEoMhg+/+5/qUYmlVQt1rgUpRwlpq9ljXiGySlEJN2wMLxew
	h6LlDoggWmpvXYxJ2SCKW+/AEzK3VQmoJL4/yIviJXltBmhs6bZBURlfyR6lwGtv+DeRq/NYLt4
	bEXcT5ShKlnrHgUuK8hoe2h5fuMZyv0UEs5Joj75kDGC7TxoNyn8Mw40Ws17JTclRUuz4p6VqJ0
	BjtxRAV3MvVGr3+xmotc0PUgK34QGcjFBMqnQc9eMb61k0A/6m9
X-Received: by 2002:a05:600c:37ca:b0:499:858e:de42 with SMTP id 5b1f17b1804b1-49987935039mr306469345e9.6.1786917246843;
        Sun, 16 Aug 2026 14:54:06 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610e18fsm68307625e9.8.2026.08.16.14.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 14:54:06 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: kees@kernel.org,
	vegard.nossum@oracle.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] kconfig: error out for recursive range
Date: Sun, 16 Aug 2026 22:53:54 +0100
Message-ID: <20260816215354.1499059-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, it is possible to create recursive ranges with Kconfig, such as:

config C
  int "Enable C"
  default 1
  range A B

config A
  int "Enable A"
  default 2
  range B C

config B
  int "Enable B"
  default 3
  range A C

The current outcome of this example above, is that all 3 options are set to 2.
There is currently no warning or error if a user attempts this.

Several attributes are already checked for recursion, including 'depends on',
'select', and 'imply', and we can extend this to 'range' for numeric options
(int and hex types).

Recursive ranges are currently not used anywhere in the tree, so it is already
safe to make this a hard error.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/symbol.c                      |  5 +++-
 .../kconfig/tests/err_recursive_dep/Kconfig   | 24 +++++++++++++++++++
 .../tests/err_recursive_dep/expected_stderr   | 13 ++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7e81b3676ee9..e82f330fb8ee 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1196,6 +1196,7 @@ static struct symbol *sym_check_expr_deps(const struct expr *e)
 	case E_GTH:
 	case E_LEQ:
 	case E_LTH:
+	case E_RANGE:
 	case E_UNEQUAL:
 		sym = sym_check_deps(e->left.sym);
 		if (sym)
@@ -1243,7 +1244,9 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
 		sym2 = sym_check_expr_deps(prop->visible.expr);
 		if (sym2)
 			break;
-		if (prop->type != P_DEFAULT || sym_is_choice(sym))
+		if (sym_is_choice(sym))
+			continue;
+		if (prop->type != P_DEFAULT && prop->type != P_RANGE)
 			continue;
 		stack.expr = &prop->expr;
 		sym2 = sym_check_expr_deps(prop->expr);
diff --git a/scripts/kconfig/tests/err_recursive_dep/Kconfig b/scripts/kconfig/tests/err_recursive_dep/Kconfig
index ebdb3ffd8717..bd1ff92bcab2 100644
--- a/scripts/kconfig/tests/err_recursive_dep/Kconfig
+++ b/scripts/kconfig/tests/err_recursive_dep/Kconfig
@@ -61,3 +61,27 @@ config G
 	bool "G"
 
 endmenu
+
+# depends on and range
+
+config H1
+	int
+	depends on H2 < H3
+
+config H2
+	int
+	range H3 H1
+
+config H3
+	int
+	range H1 H2
+
+# range
+
+config I1
+	int
+	range I2 I2
+
+config I2
+	int
+	range I1 I1
diff --git a/scripts/kconfig/tests/err_recursive_dep/expected_stderr b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
index fc2e860af082..08f843087678 100644
--- a/scripts/kconfig/tests/err_recursive_dep/expected_stderr
+++ b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
@@ -36,3 +36,16 @@ error: recursive dependency detected!
 	symbol G depends on G
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
+
+error: recursive dependency detected!
+	symbol H1 depends on H2
+	symbol H2 range value contains H3
+	symbol H3 range value contains H1
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
+subsection "Kconfig recursive dependency limitations"
+
+error: recursive dependency detected!
+	symbol I1 range value contains I2
+	symbol I2 range value contains I1
+For a resolution refer to Documentation/kbuild/kconfig-language.rst
+subsection "Kconfig recursive dependency limitations"
-- 
2.55.0

