Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08F308F32
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985231; cv=none; b=l8kNE2ygtceV+aJMS8CYYkBDN+RXN5wemqCAcNi67MAm/SH8Q56+nv+e0INVehDLEFEbTXrb5Qxsg2IGFlEd2QrrLZFWVNW4IDxDKZYblcG9u9TRBhiNd4IAuustDU4JUi8NRPqtF9E+oaICGVO2s9AszbPFWSxHzt6cgSTsQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985231; c=relaxed/simple;
	bh=hydbCaab/EWyoVk3da0dXjQ57V7LhZsKsoKJ0wzAONY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Re2hVW4QQ3z/k2GxiMZeGXAxaAU2Kz3fmQx6PBFwTVoU0DcP2gtztf1GQOzaeUpAe/E4S91SMqQq3xCqrGt2cPuMCUKPo4x30D1PvA/Z3p2uRDZwEJcP8ynEX+nUoKPVPfYoISX3qMIEU4uYI+VZNnro4x0K8gWcMr2AFJUwU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1X+pYIl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1X+pYIl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso2662114f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985224; x=1792590024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2B7ER7FYHITix5EMYlnelspg6YZbJ+Fz6NOFFuDdLQ=;
        b=m1X+pYIl588AdWfAAoWmtefNPdqEQXATnk6q1Gq+oRBKMtoS9xc6zAeLtnlq/Ut6VV
         kn314GJ8EWgy4CTYGE86nQhWvl4a38DXxH1wQb49QJ+X+sC2ppFJJTmAYOxEuTUtl70w
         Yr8Bnkf9/R1y7ImlRJnjMJGGtca4Trs3bNB29A/nTjr99a710reiGw4IScqbotd+yjAm
         8TL02ALLaFtQysi6To51k4uyNF84LsqVoFGVmKTVmZaflaiy06RGYlCEmHyjYx9u9u9z
         y6mzHX+7s74Gg9teZzW2SqeFWeyx0haMEVNsV0Jj5S7wcU0OT+f+s2NtLeMO0cRFkqy+
         Olrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985224; x=1792590024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2B7ER7FYHITix5EMYlnelspg6YZbJ+Fz6NOFFuDdLQ=;
        b=qs+o9Z3SFP/XbSL678rz77HXJWhjeB+8XYfOLxJ9sT0tt0Tg1wrUcXtkm3vjui4zzd
         qNu6KdUzE2vmkgG19s3AoKYh7FSbF90rDo/0PoHcvC1MKLPtUUJTIZVP+u5C+8AgC/gz
         zU6x9MBJiYzHUesfI+g+PexAZ1uLymKIJQZKJf+ZZroYjaIk5kW88pOy+YBrzboIpOxg
         GIr8ILNav3MzVikU2LuDsp42cbNLURepGlWkjuC0t8WIVT0NFEFyHsl8wa0X40nUyRSp
         CGgFstiB5c2FNA6YbjW5mu+0wfPXbQVA7UMCqLf0EKpF7t5G6YPAY25DHp/DXqPNFnPr
         YUxQ==
X-Forwarded-Encrypted: i=1; AKwUvByua/j4rnvrgpQiMC0jbkWlUA/6H3pVYbYmA7t+8QO0OC/70wxce6u/ubvQoQ+YNBpEc8A7SSMdQjLPkpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkl52zOHh0znJEaoJVTqJ/BZO5/dK78qDMtEEhO1YPhHJrohbv
	CGUgo4mHVB3ADecg8YNA94fQrZ4fKxnrjCTdyLxrfQRKeUfvGKuqS/tE
X-Gm-Gg: AYBFou2j0FY7nRNQ11b3padfx37/YAdLRheuPnCW3gve8R3kOYVVtO8TS471UJ3wXZ3
	fHjsGboAlu76Z+ZEDtiUcUUxjwzjTjc4n7xOcQ+q8A2f9N1FGGd/XHgm4aJQROQDyOEmukRlesl
	FeaZIkXrUW62GjJUH3SfM5dPlFdpCOZhzfdVa0ytI8QPwHDzQu3YUJ5MhkFz7TZSa/rfke15b1u
	N0vCTZLRu8V6X9mRWzXmw4DNgA7qq4SDv3a56VT/7/EYFa2FjUuhc/BohPVM7aUzJcSK9VZl8w7
	QhM8bwy642pOrDw6FSN40MJuy/nb8MCOiyu6TlFhjf2j0r1IKdfaAi2u64XAC569sKJp/1I9Rev
	5ZY1UOSLh3WPkLXOcOom9cRR5tHxnQFlYuVbNgSFVzZn/zrbE815OrGGdokVHeWyQHEGIMXssj2
	EHm/dCyETJ1CqAYfPY/RDVQcbcm0/34kXfxQPCKW7oZlHDSk5xk+ZGNeqT+rJSbj1CsG/rHiC1i
	DZZqS75ix8W61G2Ai/T7+GqhJPApQTiLIXzEx8AoVvsjzcPDraNO00+L/UXN+j66s0my5/PoA==
X-Received: by 2002:a5d:5b87:0:b0:48c:5c2e:434d with SMTP id ffacd0b85a97d-48dbaae84eemr23223313f8f.21.1791985222697;
        Wed, 14 Oct 2026 06:40:22 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm12036009f8f.43.2026.10.14.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:40:22 -0700 (PDT)
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
Subject: [PATCH v2 1/2] kconfig: add prop_err function to simplify property error handling
Date: Wed, 14 Oct 2026 14:40:16 +0100
Message-ID: <20261014134017.2310819-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014134017.2310819-1-julianbraha@gmail.com>
References: <20261014134017.2310819-1-julianbraha@gmail.com>
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

Note that the formatting of the warning printing is changed slightly
(adding a space) to better match the formatting used by gcc. This causes
a change to the expected test output for the existing warnings that call
prop_warn() and menu_warn().

Link: https://lore.kernel.org/all/20260917-proficient-swift-of-masquerade-0ff7ce@l-nschier-aarch64/ [1]
Assisted-by: LLM
Suggested-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- adjust warning and error printing to match gcc (Nicolas)

Link to v1:
https://lore.kernel.org/linux-kbuild/20260922163749.2031594-1-julianbraha@gmail.com/
---
 scripts/kconfig/menu.c                        | 27 ++++++++++++-------
 .../tests/err_transitional/expected_stderr    |  2 +-
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index bda3e2650216..db5ba57125c5 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -43,7 +43,7 @@ void menu_warn(const struct menu *menu, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
-	fprintf(stderr, "%s:%d:warning: ", menu->filename, menu->lineno);
+	fprintf(stderr, "%s:%d: warning: ", menu->filename, menu->lineno);
 	vfprintf(stderr, fmt, ap);
 	fprintf(stderr, "\n");
 	va_end(ap);
@@ -53,7 +53,17 @@ static void prop_warn(const struct property *prop, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
-	fprintf(stderr, "%s:%d:warning: ", prop->filename, prop->lineno);
+	fprintf(stderr, "%s:%d: warning: ", prop->filename, prop->lineno);
+	vfprintf(stderr, fmt, ap);
+	fprintf(stderr, "\n");
+	va_end(ap);
+}
+
+static void prop_err(const struct property *prop, const char *fmt, ...)
+{
+	va_list ap;
+	va_start(ap, fmt);
+	fprintf(stderr, "%s:%d: error: ", prop->filename, prop->lineno);
 	vfprintf(stderr, fmt, ap);
 	fprintf(stderr, "\n");
 	va_end(ap);
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
 
diff --git a/scripts/kconfig/tests/err_transitional/expected_stderr b/scripts/kconfig/tests/err_transitional/expected_stderr
index b52db4f680f4..ba317850c043 100644
--- a/scripts/kconfig/tests/err_transitional/expected_stderr
+++ b/scripts/kconfig/tests/err_transitional/expected_stderr
@@ -1,4 +1,4 @@
-Kconfig:46:warning: config symbol defined without type
+Kconfig:46: warning: config symbol defined without type
 Kconfig:7: error: transitional symbols can only have help sections
 Kconfig:14: error: transitional symbols can only have help sections
 Kconfig:21: error: transitional symbols can only have help sections
-- 
2.55.0

