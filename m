Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510655;
	b=4giL+XvWwsuJ1pZZGN7CVLtKcHqMi/f7D4x3GeZYXaMjSmb25Z+ybFJIfkaeuXHnANa1
	 9apAgY6JifS9rOqzt5kbsOHYUnhd5KW9uHlJhrl/0P7iLwoMsW3AFVda6nWJpPFIxfM4n
	 L+7RQVpmEn0VwDvclnbtLD9NlqJLBvFC/30qoOe3tEIeWj8omh1j3UNdcw7epFCvqZFwH
	 fHUBQ5toPrgRuTHmqJPOAkr9dtOx4S8pnmqwtwLLiKNkAjyeNqAwJvR6Obh36Wg+FmFbM
	 JFfS12hHsEz4398UOT+z3yHLM4bVz4ALH+YtY+JZvEw6QVUwVERyMt/MTN2qwjQf09Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iJES4c1zt04ATTqBrOD099uz63BPLO9693DxWaADcTk=;
	b=sLMf8EJmkolN96V1CyCiJmhD0epus9jqLGKKmdsUbhCbf8/n/APnslkMIq4WjxvUo40g
	 XOOuqN8YwyRDOa9wlm0kVCvCrYRl8yZJD4tUm61cERu7QYs29jL2geJFDBK0NKEkpR/Di
	 mIJpUGnAygbcu3cwnb++4XelJGqn/rS0o1nyyQDeyUoRW+KVEhofEo+OoEoZmq4SHNYEB
	 4U8pXTBg43cpyDV56KQ3EdWCyl0n/qMA5iAbJlFTWK72uLzIwr+jw6KiCl+AWWuZgixTx
	 mxKj6vglwZ7XqoDuuPolA9jEaNxHD39Ytp3kv1+6gkfyFnVvKl34SajrSzCiOZxNccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QsqbptSh;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07F60A3812
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 15:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD07F60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QsqbptSh
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so6422314eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510653; x=1793115453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJES4c1zt04ATTqBrOD099uz63BPLO9693DxWaADcTk=;
        b=QsqbptShaHFrbV6skdVUphOjUtLbFT9W7sSrNviP60wYjpm2pqB6plUf/bzU9tHsim
         324/kBtsvzaca84SPzshRBQgdhj7flT/Sjh8XJ5rXbx1oFC3bDNBrEodDgMhS93LhAGM
         R/nZF4PODySofaK6jt129DvyFKqIu/u0Xno+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510653; x=1793115453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJES4c1zt04ATTqBrOD099uz63BPLO9693DxWaADcTk=;
        b=kccrivxHjiAvnrk1K8mc2HYBERHY2Ogimq6lDM39LgkDyhaKRXyUIYQw6+zAm3g5zN
         o/A2Qi/P+M2dTz+cei4RauXr8VzEsR90N/vOMguNoO9xlsNdmr7d1yVWXouQlY7uh3cu
         uLPysXyn80C8vShk9/yIdAAyaXaYqrbzs3KB96gq3MsDZilkRL4igC8zhff05PMhLOed
         PCWliPsPMugfLNe8bwWlTUdPzAF0k1B+2kuwISPPbZWqxIZK9NYTBSnRP/MAVYP76cgw
         OsHJ7w95cNxuSwZQ8ZMRyJ5xlWp1pB5UnoT10YXeGqPNXZ5U6YcvY72NuswQSaIGfcA7
         P+yw==
X-Gm-Message-State: AFq9FYJEXHysspcLqyHK+SIXbp/dzub/eXcLcayi4WxZKofD79KLGnZE
	8g/ipo/Ov5tSqxcblMfJ4tNTTvt48G0zbDQVMjiL1/1AP8zFPmFglOi6b30f2y0u0g==
X-Gm-Gg: AYBFou3q4FVZ7X+1DL7AH8+2VzRtmziijd2SzVlfxeG1CamnmHfCmLoieHk4y3BsAx8
	HUMKst2QoF46GZ+3+W7229pacC0ZemVgjewl/FZAf7wv4jaJvjV3bFZj1OK/a7NQ6JLTUOS4J1v
	DTe1Dv+3ly1uDsYe3qzqbDKAU77MH1L/FO/IXT/YffoIW3Kw7jDOj9RDeBM4h0OZ4JdNYtpV97Q
	o1Ij69dQE90spDZ6RmHfrAug2QSo+/BIg8mJdqGrfbQZBFGNZMwxibdLrGDtvhUvwn+Q39G81XV
	91ASe+6csNkZba1R0keX/xk8NtX4fZxz0UYvEWXkuok8OpWDqef+ZY4BVS73R52Ll/cmKJATXE8
	hFMaZjejzwOpPkJZVP3P/axxTk/sRHOVjKWvT16llVxCZjn2FOgnR6lkJw3QThdycRFLap8FiG/
	aV2VEBvcx564J1SYRBFKQPEB2Dg4rc6y+yQy5myDbRzpmHIAhPLWdcQF3MgyzfJysxzzgb2M6O6
	SIIvRCK0AMHRmJwXOuHlUSeJM99yN0BOQivT5rywUif5IiSfby/EpzVuBw=
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr21629268eec.37.1792510652513;
        Tue, 20 Oct 2026 08:37:32 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 2/7] scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
Date: Tue, 20 Oct 2026 08:35:20 -0700
Message-ID: <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

This adds the following commits from upstream:

f3451d12532b meson: Only take the version from dtc's own git repository
7a1e01792600 libfdt: pass sources as keyword argument to library()
8c37c14c95d9 fdtget: Use libfdt iterators instead of open coded loops
89c99ce78ac8 pylibfdt: Add add_mem_rsv() and del_mem_rsv()
3750493c8b0f pylibfdt: Add address_cells() and size_cells()
0748c384fde6 pylibfdt: Grow the FdtSw buffer geometrically
5008d1d6a356 pylibfdt: Replace removed SWIG Python 2 compatibility macros
66e1201c3775 libfdt: fdt_check_full: Add can_assume(PERFECT) check
214372a27398 tests: Replace trees.S/dumptrees with treegen for making test dtbs
4df9ca4c8ddb tests: Add treegen, a pure C replacement for trees.S + dumptrees
f116f4800edc tests: Dont have test cases link directly against example dtb data
9b53b9a4c2f9 tests: Add missing unterminated_memrsv to dumptrees
5f919a25d71b ci: Merge make and meson jobs using build matrix
6c1426dfa963 ci: Add macOS support to install-deps.sh
23fd89bc8ed8 ci: Move FreeBSD CI from Cirrus CI to GitHub Actions
3ad5ebbdd9d5 ci: Upgrade actions/checkout v4 to v6 for Node.js 24 support
4ad496846a12 Set default permissions for workflows
c0e1d0fd58d4 livetree: Fix a comparison of integers with different signedness
d245851f0629 tests: Avoid -Wconstant-logical-operand warnings in integer-expressions.c
a74b952f94c8 tests: Fix mkdir() call for Windows compatibility
d320877b07d1 tests: More portable installation of SIGINT handler
84d13508d59d tests: Remove unused cleanup() mechanism from tests
8f48565e5cfe Bump version to v1.8.1
25a368100a98 docs: Improvements to release creation tooling
040c1f7e29e2 libfdt: Revert accidental ABI breakage
b1337df19598 Bump version to v1.8.0
83cdc93ca900 ci: Add macOS build to GitHub Actions
1aaa44849b9a ci: Skip swig install for mingw32 Windows build
dd1c7f1a919e docs: Add CLAUDE.md referencing AGENTS.md
7fdf750154e9 docs: Add release tagging procedure and finalize-release script
5c35036b2c83 docs: Add AI contribution guidelines
f57e7df35df4 libfdt: fix UBSAN null pointer in fdt_property()
2164019f8483 checks: Add missing phandle_references prereq to interrupts_property
47d7c01ba8a1 libfdt: Fix bugs with unchecked usage of fdt_num_mem_rsv()
f551be7b39c8 libfdt: Standardise returns annotation in function documentation

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/checks.c        |   2 +-
 scripts/dtc/fdtget.c        | 207 +++++++++++++-------------
 scripts/dtc/fdtput.c        | 280 +++++++++++++++++++++++++++---------
 scripts/dtc/libfdt/fdt_ro.c |   2 +
 scripts/dtc/libfdt/fdt_rw.c |  41 +++++-
 scripts/dtc/libfdt/fdt_sw.c |   3 +-
 scripts/dtc/libfdt/libfdt.h |  70 +++++----
 scripts/dtc/livetree.c      |   2 +-
 scripts/dtc/version_gen.h   |   2 +-
 9 files changed, 391 insertions(+), 218 deletions(-)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 946c1429e0f1..a6037ed08000 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -1769,7 +1769,7 @@ static void check_interrupts_property(struct check *c,
 			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
 	}
 }
-WARNING(interrupts_property, check_interrupts_property, &phandle_references);
+WARNING(interrupts_property, check_interrupts_property, NULL, &phandle_references);
 
 static const struct bus_type graph_port_bus = {
 	.name = "graph-port",
diff --git a/scripts/dtc/fdtget.c b/scripts/dtc/fdtget.c
index c922f82246c6..c61696912cda 100644
--- a/scripts/dtc/fdtget.c
+++ b/scripts/dtc/fdtget.c
@@ -39,6 +39,43 @@ static void report_error(const char *where, int err)
 	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
 }
 
+/**
+ * Shows a list of cells in the requested format
+ *
+ * @param disp		Display information / options
+ * @param data		Data to display
+ * @param len		Maximum length of buffer
+ * @param size		Data size to use for display (e.g. 4 for 32-bit)
+ * @return 0 if ok, -1 on error
+ */
+static int show_cell_list(struct display_info *disp, const char *data, int len,
+			  int size)
+{
+	const uint8_t *p = (const uint8_t *)data;
+	char fmt[3];
+	int value;
+	int i;
+
+	fmt[0] = '%';
+	fmt[1] = disp->type ? disp->type : 'd';
+	fmt[2] = '\0';
+	for (i = 0; i < len; i += size, p += size) {
+		if (i)
+			printf(" ");
+		switch (size) {
+		case 4: value = fdt32_ld((const fdt32_t *)p); break;
+		case 2: value = fdt16_ld((const fdt16_t *)p); break;
+		case 1:
+		default:
+			value = *p;
+			break;
+		}
+		printf(fmt, value);
+	}
+
+	return 0;
+}
+
 /**
  * Displays data of a given length according to selected options
  *
@@ -52,17 +89,19 @@ static void report_error(const char *where, int err)
  */
 static int show_data(struct display_info *disp, const char *data, int len)
 {
-	int i, size;
-	const uint8_t *p = (const uint8_t *)data;
+	int size;
 	const char *s;
-	int value;
 	int is_string;
-	char fmt[3];
 
 	/* no data, don't print */
 	if (len == 0)
 		return 0;
 
+	if (disp->type == 'r') {
+		fwrite(data, 1, len, stdout);
+		return 0;
+	}
+
 	is_string = (disp->type) == 's' ||
 		(!disp->type && util_is_printable_string(data, len));
 	if (is_string) {
@@ -85,17 +124,8 @@ static int show_data(struct display_info *disp, const char *data, int len)
 				"selected data size\n");
 		return -1;
 	}
-	fmt[0] = '%';
-	fmt[1] = disp->type ? disp->type : 'd';
-	fmt[2] = '\0';
-	for (i = 0; i < len; i += size, p += size) {
-		if (i)
-			printf(" ");
-		value = size == 4 ? fdt32_to_cpu(*(const uint32_t *)p) :
-			size == 2 ? (*p << 8) | p[1] : *p;
-		printf(fmt, value);
-	}
-	return 0;
+
+	return show_cell_list(disp, data, len, size);
 }
 
 /**
@@ -107,24 +137,21 @@ static int show_data(struct display_info *disp, const char *data, int len)
  */
 static int list_properties(const void *blob, int node)
 {
-	const struct fdt_property *data;
 	const char *name;
+	const void *p;
 	int prop;
 
-	prop = fdt_first_property_offset(blob, node);
-	do {
-		/* Stop silently when there are no more properties */
-		if (prop < 0)
-			return prop == -FDT_ERR_NOTFOUND ? 0 : prop;
-		data = fdt_get_property_by_offset(blob, prop, NULL);
-		name = fdt_string(blob, fdt32_to_cpu(data->nameoff));
-		if (name)
+	fdt_for_each_property_offset(prop, blob, node) {
+		p = fdt_getprop_by_offset(blob, prop, &name, NULL);
+		if (p && name)
 			puts(name);
-		prop = fdt_next_property_offset(blob, prop);
-	} while (1);
-}
+	}
 
-#define MAX_LEVEL	32		/* how deeply nested we will go */
+	if ((prop < 0) && (prop != -FDT_ERR_NOTFOUND))
+		return prop;
+
+	return 0;
+}
 
 /**
  * List all subnodes in a node, one per line
@@ -135,47 +162,21 @@ static int list_properties(const void *blob, int node)
  */
 static int list_subnodes(const void *blob, int node)
 {
-	int nextoffset;		/* next node offset from libfdt */
-	uint32_t tag;		/* current tag */
-	int level = 0;		/* keep track of nesting level */
 	const char *pathp;
-	int depth = 1;		/* the assumed depth of this node */
-
-	while (level >= 0) {
-		tag = fdt_next_tag(blob, node, &nextoffset);
-		switch (tag) {
-		case FDT_BEGIN_NODE:
-			pathp = fdt_get_name(blob, node, NULL);
-			if (level <= depth) {
-				if (pathp == NULL)
-					pathp = "/* NULL pointer error */";
-				if (*pathp == '\0')
-					pathp = "/";	/* root is nameless */
-				if (level == 1)
-					puts(pathp);
-			}
-			level++;
-			if (level >= MAX_LEVEL) {
-				printf("Nested too deep, aborting.\n");
-				return 1;
-			}
-			break;
-		case FDT_END_NODE:
-			level--;
-			if (level == 0)
-				level = -1;		/* exit the loop */
-			break;
-		case FDT_END:
-			return 1;
-		case FDT_PROP:
-			break;
-		default:
-			if (level <= depth)
-				printf("Unknown tag 0x%08X\n", tag);
-			return 1;
-		}
-		node = nextoffset;
+	int subnode;
+
+	fdt_for_each_subnode(subnode, blob, node) {
+		pathp = fdt_get_name(blob, subnode, NULL);
+		if (pathp == NULL)
+			pathp = "/* NULL pointer error */";
+		if (*pathp == '\0')
+			pathp = "/";	/* root is nameless */
+		puts(pathp);
 	}
+
+	if (subnode < 0 && (subnode != -FDT_ERR_NOTFOUND))
+		return subnode;
+
 	return 0;
 }
 
@@ -231,7 +232,7 @@ static int show_data_for_item(const void *blob, struct display_info *disp,
  * @param filename	Filename of blob file
  * @param arg		List of arguments to process
  * @param arg_count	Number of arguments
- * @param return 0 if ok, -ve on error
+ * @return 0 if ok, -ve on error
  */
 static int do_fdtget(struct display_info *disp, const char *filename,
 		     char **arg, int arg_count, int args_per_step)
@@ -240,7 +241,7 @@ static int do_fdtget(struct display_info *disp, const char *filename,
 	const char *prop;
 	int i, node;
 
-	blob = utilfdt_read(filename);
+	blob = utilfdt_read(filename, NULL);
 	if (!blob)
 		return -1;
 
@@ -252,44 +253,50 @@ static int do_fdtget(struct display_info *disp, const char *filename,
 				continue;
 			} else {
 				report_error(arg[i], node);
+				free(blob);
 				return -1;
 			}
 		}
 		prop = args_per_step == 1 ? NULL : arg[i + 1];
 
-		if (show_data_for_item(blob, disp, node, prop))
+		if (show_data_for_item(blob, disp, node, prop)) {
+			free(blob);
 			return -1;
+		}
 	}
+
+	free(blob);
+
 	return 0;
 }
 
-static const char *usage_msg =
-	"fdtget - read values from device tree\n"
-	"\n"
-	"Each value is printed on a new line.\n\n"
-	"Usage:\n"
+/* Usage related data. */
+static const char usage_synopsis[] =
+	"read values from device tree\n"
 	"	fdtget <options> <dt file> [<node> <property>]...\n"
 	"	fdtget -p <options> <dt file> [<node> ]...\n"
-	"Options:\n"
-	"\t-t <type>\tType of data\n"
-	"\t-p\t\tList properties for each node\n"
-	"\t-l\t\tList subnodes for each node\n"
-	"\t-d\t\tDefault value to display when the property is "
-			"missing\n"
-	"\t-h\t\tPrint this help\n\n"
+	"\n"
+	"Each value is printed on a new line.\n"
 	USAGE_TYPE_MSG;
-
-static void usage(const char *msg)
-{
-	if (msg)
-		fprintf(stderr, "Error: %s\n\n", msg);
-
-	fprintf(stderr, "%s", usage_msg);
-	exit(2);
-}
+static const char usage_short_opts[] = "t:pld:" USAGE_COMMON_SHORT_OPTS;
+static struct option const usage_long_opts[] = {
+	{"type",              a_argument, NULL, 't'},
+	{"properties",       no_argument, NULL, 'p'},
+	{"list",             no_argument, NULL, 'l'},
+	{"default",           a_argument, NULL, 'd'},
+	USAGE_COMMON_LONG_OPTS,
+};
+static const char * const usage_opts_help[] = {
+	"Type of data",
+	"List properties for each node",
+	"List subnodes for each node",
+	"Default value to display when the property is missing",
+	USAGE_COMMON_OPTS_HELP
+};
 
 int main(int argc, char *argv[])
 {
+	int opt;
 	char *filename = NULL;
 	struct display_info disp;
 	int args_per_step = 2;
@@ -298,20 +305,14 @@ int main(int argc, char *argv[])
 	memset(&disp, '\0', sizeof(disp));
 	disp.size = -1;
 	disp.mode = MODE_SHOW_VALUE;
-	for (;;) {
-		int c = getopt(argc, argv, "d:hlpt:");
-		if (c == -1)
-			break;
-
-		switch (c) {
-		case 'h':
-		case '?':
-			usage(NULL);
+	while ((opt = util_getopt_long()) != EOF) {
+		switch (opt) {
+		case_USAGE_COMMON_FLAGS
 
 		case 't':
 			if (utilfdt_decode_type(optarg, &disp.type,
 					&disp.size))
-				usage("Invalid type string");
+				usage("invalid type string");
 			break;
 
 		case 'p':
@@ -333,7 +334,7 @@ int main(int argc, char *argv[])
 	if (optind < argc)
 		filename = argv[optind++];
 	if (!filename)
-		usage("Missing filename");
+		usage("missing filename");
 
 	argv += optind;
 	argc -= optind;
@@ -344,7 +345,7 @@ int main(int argc, char *argv[])
 
 	/* Check for node, property arguments */
 	if (args_per_step == 2 && (argc % 2))
-		usage("Must have an even number of arguments");
+		usage("must have an even number of arguments");
 
 	if (do_fdtget(&disp, filename, argv, argc, args_per_step))
 		return 1;
diff --git a/scripts/dtc/fdtput.c b/scripts/dtc/fdtput.c
index a363c3cabc59..fdb581a24271 100644
--- a/scripts/dtc/fdtput.c
+++ b/scripts/dtc/fdtput.c
@@ -9,6 +9,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <errno.h>
 
 #include <libfdt.h>
 
@@ -18,6 +19,8 @@
 enum oper_type {
 	OPER_WRITE_PROP,		/* Write a property in a node */
 	OPER_CREATE_NODE,		/* Create a new node */
+	OPER_REMOVE_NODE,		/* Delete a node */
+	OPER_DELETE_PROP,		/* Delete a property in a node */
 };
 
 struct display_info {
@@ -51,7 +54,7 @@ static void report_error(const char *name, int namelen, int err)
  * @param arg		List of arguments from command line
  * @param arg_count	Number of arguments (may be 0)
  * @param valuep	Returns buffer containing value
- * @param *value_len	Returns length of value encoded
+ * @param value_len	Returns length of value encoded
  */
 static int encode_value(struct display_info *disp, char **arg, int arg_count,
 			char **valuep, int *value_len)
@@ -62,16 +65,12 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 	int len;		/* length of this cell/string/byte */
 	int ival;
 	int upto;	/* the number of bytes we have written to buf */
-	char fmt[3];
 
 	upto = 0;
 
 	if (disp->verbose)
 		fprintf(stderr, "Decoding value:\n");
 
-	fmt[0] = '%';
-	fmt[1] = disp->type ? disp->type : 'd';
-	fmt[2] = '\0';
 	for (; arg_count > 0; arg++, arg_count--, upto += len) {
 		/* assume integer unless told otherwise */
 		if (disp->type == 's')
@@ -82,12 +81,7 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 		/* enlarge our value buffer by a suitable margin if needed */
 		if (upto + len > value_size) {
 			value_size = (upto + len) + 500;
-			value = realloc(value, value_size);
-			if (!value) {
-				fprintf(stderr, "Out of mmory: cannot alloc "
-					"%d bytes\n", value_size);
-				return -1;
-			}
+			value = xrealloc(value, value_size);
 		}
 
 		ptr = value + upto;
@@ -96,8 +90,35 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 			if (disp->verbose)
 				fprintf(stderr, "\tstring: '%s'\n", ptr);
 		} else {
-			int *iptr = (int *)ptr;
-			sscanf(*arg, fmt, &ival);
+			fdt32_t *iptr = (fdt32_t *)ptr;
+			char *endptr;
+
+			errno = 0;
+			switch (disp->type) {
+			case 'x':
+				ival = strtoul(*arg, &endptr, 16);
+				break;
+			case 'o':
+				ival = strtoul(*arg, &endptr, 8);
+				break;
+			case 'i':
+				ival = strtol(*arg, &endptr, 0);
+				break;
+			case 'u':
+				ival = strtoul(*arg, &endptr, 0);
+				break;
+			default: /* 0 or 'd' */
+				ival = strtol(*arg, &endptr, 10);
+			}
+
+			if (*endptr != '\0' || errno) {
+				if (disp->verbose) {
+					fprintf(stderr,
+						"Couldn't parse \"%s\" as an integer\n",
+						*arg);
+				}
+				return -1;
+			}
 			if (len == 4)
 				*iptr = cpu_to_fdt32(ival);
 			else
@@ -117,19 +138,59 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 	return 0;
 }
 
-static int store_key_value(void *blob, const char *node_name,
+#define ALIGN(x)		(((x) + (FDT_TAGSIZE) - 1) & ~((FDT_TAGSIZE) - 1))
+
+static char *realloc_fdt(char *fdt, int delta)
+{
+	int new_sz = fdt_totalsize(fdt) + delta;
+	fdt = xrealloc(fdt, new_sz);
+	fdt_open_into(fdt, fdt, new_sz);
+	return fdt;
+}
+
+static char *realloc_node(char *fdt, const char *name)
+{
+	int delta;
+	/* FDT_BEGIN_NODE, node name in off_struct and FDT_END_NODE */
+	delta = sizeof(struct fdt_node_header) + ALIGN(strlen(name) + 1)
+			+ FDT_TAGSIZE;
+	return realloc_fdt(fdt, delta);
+}
+
+static char *realloc_property(char *fdt, int nodeoffset,
+		const char *name, int newlen)
+{
+	int delta = 0;
+	int oldlen = 0;
+
+	if (!fdt_get_property(fdt, nodeoffset, name, &oldlen))
+		/* strings + property header */
+		delta = sizeof(struct fdt_property) + strlen(name) + 1;
+
+	if (newlen > oldlen)
+		/* actual value in off_struct */
+		delta += ALIGN(newlen) - ALIGN(oldlen);
+
+	return realloc_fdt(fdt, delta);
+}
+
+static int store_key_value(char **blob, const char *node_name,
 		const char *property, const char *buf, int len)
 {
 	int node;
 	int err;
 
-	node = fdt_path_offset(blob, node_name);
+	node = fdt_path_offset(*blob, node_name);
 	if (node < 0) {
 		report_error(node_name, -1, node);
 		return -1;
 	}
 
-	err = fdt_setprop(blob, node, property, buf, len);
+	err = fdt_setprop(*blob, node, property, buf, len);
+	if (err == -FDT_ERR_NOSPACE) {
+		*blob = realloc_property(*blob, node, property, len);
+		err = fdt_setprop(*blob, node, property, buf, len);
+	}
 	if (err) {
 		report_error(property, -1, err);
 		return -1;
@@ -147,7 +208,7 @@ static int store_key_value(void *blob, const char *node_name,
  * @param in_path	Path to process
  * @return 0 if ok, -1 on error
  */
-static int create_paths(void *blob, const char *in_path)
+static int create_paths(char **blob, const char *in_path)
 {
 	const char *path = in_path;
 	const char *sep;
@@ -163,10 +224,11 @@ static int create_paths(void *blob, const char *in_path)
 		if (!sep)
 			sep = path + strlen(path);
 
-		node = fdt_subnode_offset_namelen(blob, offset, path,
+		node = fdt_subnode_offset_namelen(*blob, offset, path,
 				sep - path);
 		if (node == -FDT_ERR_NOTFOUND) {
-			node = fdt_add_subnode_namelen(blob, offset, path,
+			*blob = realloc_node(*blob, path);
+			node = fdt_add_subnode_namelen(*blob, offset, path,
 						       sep - path);
 		}
 		if (node < 0) {
@@ -189,27 +251,31 @@ static int create_paths(void *blob, const char *in_path)
  * @param node_name	Name of node to create
  * @return new node offset if found, or -1 on failure
  */
-static int create_node(void *blob, const char *node_name)
+static int create_node(char **blob, const char *node_name)
 {
 	int node = 0;
-	char *p;
+	const char *p;
+	char *path = NULL;
 
 	p = strrchr(node_name, '/');
 	if (!p) {
 		report_error(node_name, -1, -FDT_ERR_BADPATH);
 		return -1;
 	}
-	*p = '\0';
+
+	*blob = realloc_node(*blob, p + 1);
 
 	if (p > node_name) {
-		node = fdt_path_offset(blob, node_name);
+		path = xstrndup(node_name, (size_t)(p - node_name));
+		node = fdt_path_offset(*blob, path);
+		free(path);
 		if (node < 0) {
 			report_error(node_name, -1, node);
 			return -1;
 		}
 	}
 
-	node = fdt_add_subnode(blob, node, p + 1);
+	node = fdt_add_subnode(*blob, node, p + 1);
 	if (node < 0) {
 		report_error(p + 1, -1, node);
 		return -1;
@@ -218,14 +284,68 @@ static int create_node(void *blob, const char *node_name)
 	return 0;
 }
 
+/**
+ * Delete a property of a node in the fdt.
+ *
+ * @param blob		FDT blob to write into
+ * @param node_name	Path to node containing the property to delete
+ * @param prop_name	Name of property to delete
+ * @return 0 on success, or -1 on failure
+ */
+static int delete_prop(char *blob, const char *node_name, const char *prop_name)
+{
+	int node = 0;
+
+	node = fdt_path_offset(blob, node_name);
+	if (node < 0) {
+		report_error(node_name, -1, node);
+		return -1;
+	}
+
+	node = fdt_delprop(blob, node, prop_name);
+	if (node < 0) {
+		report_error(node_name, -1, node);
+		return -1;
+	}
+
+	return 0;
+}
+
+/**
+ * Delete a node in the fdt.
+ *
+ * @param blob		FDT blob to write into
+ * @param node_name	Name of node to delete
+ * @return 0 on success, or -1 on failure
+ */
+static int delete_node(char *blob, const char *node_name)
+{
+	int node = 0;
+
+	node = fdt_path_offset(blob, node_name);
+	if (node < 0) {
+		report_error(node_name, -1, node);
+		return -1;
+	}
+
+	node = fdt_del_node(blob, node);
+	if (node < 0) {
+		report_error(node_name, -1, node);
+		return -1;
+	}
+
+	return 0;
+}
+
 static int do_fdtput(struct display_info *disp, const char *filename,
 		    char **arg, int arg_count)
 {
-	char *value;
+	char *value = NULL;
 	char *blob;
+	char *node;
 	int len, ret = 0;
 
-	blob = utilfdt_read(filename);
+	blob = utilfdt_read(filename, NULL);
 	if (!blob)
 		return -1;
 
@@ -236,82 +356,102 @@ static int do_fdtput(struct display_info *disp, const char *filename,
 		 * store them into the property.
 		 */
 		assert(arg_count >= 2);
-		if (disp->auto_path && create_paths(blob, *arg))
+		if (disp->auto_path && create_paths(&blob, *arg))
 			return -1;
 		if (encode_value(disp, arg + 2, arg_count - 2, &value, &len) ||
-			store_key_value(blob, *arg, arg[1], value, len))
+			store_key_value(&blob, *arg, arg[1], value, len))
 			ret = -1;
 		break;
 	case OPER_CREATE_NODE:
 		for (; ret >= 0 && arg_count--; arg++) {
 			if (disp->auto_path)
-				ret = create_paths(blob, *arg);
+				ret = create_paths(&blob, *arg);
 			else
-				ret = create_node(blob, *arg);
+				ret = create_node(&blob, *arg);
 		}
 		break;
+	case OPER_REMOVE_NODE:
+		for (; ret >= 0 && arg_count--; arg++)
+			ret = delete_node(blob, *arg);
+		break;
+	case OPER_DELETE_PROP:
+		node = *arg;
+		for (arg++; ret >= 0 && arg_count-- > 1; arg++)
+			ret = delete_prop(blob, node, *arg);
+		break;
 	}
-	if (ret >= 0)
+	if (ret >= 0) {
+		fdt_pack(blob);
 		ret = utilfdt_write(filename, blob);
+	}
 
 	free(blob);
+
+	if (value) {
+		free(value);
+	}
+
 	return ret;
 }
 
-static const char *usage_msg =
-	"fdtput - write a property value to a device tree\n"
-	"\n"
-	"The command line arguments are joined together into a single value.\n"
-	"\n"
-	"Usage:\n"
+/* Usage related data. */
+static const char usage_synopsis[] =
+	"write a property value to a device tree\n"
 	"	fdtput <options> <dt file> <node> <property> [<value>...]\n"
 	"	fdtput -c <options> <dt file> [<node>...]\n"
-	"Options:\n"
-	"\t-c\t\tCreate nodes if they don't already exist\n"
-	"\t-p\t\tAutomatically create nodes as needed for the node path\n"
-	"\t-t <type>\tType of data\n"
-	"\t-v\t\tVerbose: display each value decoded from command line\n"
-	"\t-h\t\tPrint this help\n\n"
+	"	fdtput -r <options> <dt file> [<node>...]\n"
+	"	fdtput -d <options> <dt file> <node> [<property>...]\n"
+	"\n"
+	"The command line arguments are joined together into a single value.\n"
 	USAGE_TYPE_MSG;
-
-static void usage(const char *msg)
-{
-	if (msg)
-		fprintf(stderr, "Error: %s\n\n", msg);
-
-	fprintf(stderr, "%s", usage_msg);
-	exit(2);
-}
+static const char usage_short_opts[] = "crdpt:v" USAGE_COMMON_SHORT_OPTS;
+static struct option const usage_long_opts[] = {
+	{"create",           no_argument, NULL, 'c'},
+	{"remove",	     no_argument, NULL, 'r'},
+	{"delete",	     no_argument, NULL, 'd'},
+	{"auto-path",        no_argument, NULL, 'p'},
+	{"type",              a_argument, NULL, 't'},
+	{"verbose",          no_argument, NULL, 'v'},
+	USAGE_COMMON_LONG_OPTS,
+};
+static const char * const usage_opts_help[] = {
+	"Create nodes",
+	"Delete nodes (and any subnodes)",
+	"Delete properties if they already exist",
+	"Automatically create nodes as needed for the node path",
+	"Type of data",
+	"Display each value decoded from command line",
+	USAGE_COMMON_OPTS_HELP
+};
 
 int main(int argc, char *argv[])
 {
+	int opt;
 	struct display_info disp;
 	char *filename = NULL;
 
 	memset(&disp, '\0', sizeof(disp));
 	disp.size = -1;
 	disp.oper = OPER_WRITE_PROP;
-	for (;;) {
-		int c = getopt(argc, argv, "chpt:v");
-		if (c == -1)
-			break;
-
+	while ((opt = util_getopt_long()) != EOF) {
 		/*
 		 * TODO: add options to:
-		 * - delete property
-		 * - delete node (optionally recursively)
 		 * - rename node
 		 * - pack fdt before writing
 		 * - set amount of free space when writing
-		 * - expand fdt if value doesn't fit
 		 */
-		switch (c) {
+		switch (opt) {
+		case_USAGE_COMMON_FLAGS
+
 		case 'c':
 			disp.oper = OPER_CREATE_NODE;
 			break;
-		case 'h':
-		case '?':
-			usage(NULL);
+		case 'r':
+			disp.oper = OPER_REMOVE_NODE;
+			break;
+		case 'd':
+			disp.oper = OPER_DELETE_PROP;
+			break;
 		case 'p':
 			disp.auto_path = 1;
 			break;
@@ -319,6 +459,8 @@ int main(int argc, char *argv[])
 			if (utilfdt_decode_type(optarg, &disp.type,
 					&disp.size))
 				usage("Invalid type string");
+			if (disp.type == 'r')
+				usage("Unsupported raw data type");
 			break;
 
 		case 'v':
@@ -330,18 +472,22 @@ int main(int argc, char *argv[])
 	if (optind < argc)
 		filename = argv[optind++];
 	if (!filename)
-		usage("Missing filename");
+		usage("missing filename");
 
 	argv += optind;
 	argc -= optind;
 
 	if (disp.oper == OPER_WRITE_PROP) {
 		if (argc < 1)
-			usage("Missing node");
+			usage("missing node");
 		if (argc < 2)
-			usage("Missing property");
+			usage("missing property");
 	}
 
+	if (disp.oper == OPER_DELETE_PROP)
+		if (argc < 1)
+			usage("missing node");
+
 	if (do_fdtput(&disp, filename, argv, argc))
 		return 1;
 	return 0;
diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
index 63494fb7ad90..11f2e2ee0be3 100644
--- a/scripts/dtc/libfdt/fdt_ro.c
+++ b/scripts/dtc/libfdt/fdt_ro.c
@@ -191,6 +191,8 @@ int fdt_num_mem_rsv(const void *fdt)
 	int i;
 	const struct fdt_reserve_entry *re;
 
+	FDT_RO_PROBE(fdt);
+
 	for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
 		if (fdt64_ld_(&re->size) == 0)
 			return i;
diff --git a/scripts/dtc/libfdt/fdt_rw.c b/scripts/dtc/libfdt/fdt_rw.c
index 90ea14e944cc..850aafe44d27 100644
--- a/scripts/dtc/libfdt/fdt_rw.c
+++ b/scripts/dtc/libfdt/fdt_rw.c
@@ -166,7 +166,11 @@ int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size)
 
 	FDT_RW_PROBE(fdt);
 
-	re = fdt_mem_rsv_w_(fdt, fdt_num_mem_rsv(fdt));
+	err = fdt_num_mem_rsv(fdt);
+	if (err < 0)
+		return err;
+
+	re = fdt_mem_rsv_w_(fdt, err);
 	err = fdt_splice_mem_rsv_(fdt, re, 0, 1);
 	if (err)
 		return err;
@@ -179,10 +183,15 @@ int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size)
 int fdt_del_mem_rsv(void *fdt, int n)
 {
 	struct fdt_reserve_entry *re = fdt_mem_rsv_w_(fdt, n);
+	int num;
 
 	FDT_RW_PROBE(fdt);
 
-	if (n >= fdt_num_mem_rsv(fdt))
+	num = fdt_num_mem_rsv(fdt);
+	if (num < 0)
+		return num;
+
+	if (n >= num)
 		return -FDT_ERR_NOTFOUND;
 
 	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
@@ -283,6 +292,13 @@ int fdt_setprop_placeholder_namelen(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
+int fdt_setprop_placeholder(void *fdt, int nodeoffset,
+			    const char *name, int len, void **prop_data)
+{
+	return fdt_setprop_placeholder_namelen(fdt, nodeoffset, name,
+					       strlen(name), len, prop_data);
+}
+
 int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
 			int namelen, const void *val, int len)
 {
@@ -299,6 +315,13 @@ int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
+int fdt_setprop(void *fdt, int nodeoffset, const char *name,
+		const void *val, int len)
+{
+	return fdt_setprop_namelen(fdt, nodeoffset, name, strlen(name), val,
+				   len);
+}
+
 int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 		   const void *val, int len)
 {
@@ -439,8 +462,10 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	FDT_RO_PROBE(fdt);
 
-	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
-		* sizeof(struct fdt_reserve_entry);
+	err = fdt_num_mem_rsv(fdt);
+	if (err < 0)
+		return err;
+	mem_rsv_size = (err + 1) * sizeof(struct fdt_reserve_entry);
 
 	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
@@ -498,12 +523,14 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 int fdt_pack(void *fdt)
 {
-	int mem_rsv_size;
+	int err, mem_rsv_size;
 
 	FDT_RW_PROBE(fdt);
 
-	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
-		* sizeof(struct fdt_reserve_entry);
+	err = fdt_num_mem_rsv(fdt);
+	if (err < 0)
+		return err;
+	mem_rsv_size = (err+1) * sizeof(struct fdt_reserve_entry);
 	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
 			fdt_size_dt_strings(fdt));
 	fdt_set_totalsize(fdt, fdt_data_size_(fdt));
diff --git a/scripts/dtc/libfdt/fdt_sw.c b/scripts/dtc/libfdt/fdt_sw.c
index 4c569ee7eb0d..96d4cf571319 100644
--- a/scripts/dtc/libfdt/fdt_sw.c
+++ b/scripts/dtc/libfdt/fdt_sw.c
@@ -330,7 +330,8 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
 	ret = fdt_property_placeholder(fdt, name, len, &ptr);
 	if (ret)
 		return ret;
-	memcpy(ptr, val, len);
+	if (len)
+		memcpy(ptr, val, len);
 	return 0;
 }
 
diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
index 81aaf7cbae13..ca91d712efe8 100644
--- a/scripts/dtc/libfdt/libfdt.h
+++ b/scripts/dtc/libfdt/libfdt.h
@@ -225,7 +225,7 @@ int fdt_next_node(const void *fdt, int offset, int *depth);
  * @fdt:	FDT blob
  * @offset:	Offset of node to check
  *
- * Return: offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
+ * returns: offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
  */
 int fdt_first_subnode(const void *fdt, int offset);
 
@@ -237,8 +237,8 @@ int fdt_first_subnode(const void *fdt, int offset);
  * After first calling fdt_first_subnode(), call this function repeatedly to
  * get direct subnodes of a parent node.
  *
- * Return: offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
- *         subnodes
+ * returns: offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
+ *          subnodes
  */
 int fdt_next_subnode(const void *fdt, int offset);
 
@@ -307,7 +307,7 @@ fdt_set_hdr_(size_dt_struct)
  * fdt_header_size - return the size of the tree's header
  * @fdt: pointer to a flattened device tree
  *
- * Return: size of DTB header in bytes
+ * returns: size of DTB header in bytes
  */
 size_t fdt_header_size(const void *fdt);
 
@@ -315,7 +315,7 @@ size_t fdt_header_size(const void *fdt);
  * fdt_header_size_ - internal function to get header size from a version number
  * @version: device tree version number
  *
- * Return: size of DTB header in bytes
+ * returns: size of DTB header in bytes
  */
 size_t fdt_header_size_(uint32_t version);
 
@@ -462,7 +462,7 @@ static inline uint32_t fdt_get_max_phandle(const void *fdt)
  * highest phandle value in the device tree blob) will be returned in the
  * @phandle parameter.
  *
- * Return: 0 on success or a negative error-code on failure
+ * returns: 0 on success or a negative error-code on failure
  */
 int fdt_generate_phandle(const void *fdt, uint32_t *phandle);
 
@@ -475,7 +475,12 @@ int fdt_generate_phandle(const void *fdt, uint32_t *phandle);
  * or any other (0,0) entries reserved for expansion.
  *
  * returns:
- *     the number of entries
+ *     the number of entries, on success
+ *     -FDT_ERR_ALIGNMENT,
+ *     -FDT_ERR_BADMAGIC,
+ *     -FDT_ERR_BADVERSION,
+ *     -FDT_ERR_BADSTATE,
+ *     -FDT_ERR_TRUNCATED, standard meanings
  */
 int fdt_num_mem_rsv(const void *fdt);
 
@@ -510,7 +515,7 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
  * useful for finding subnodes based on a portion of a larger string,
  * such as a full path.
  *
- * Return: offset of the subnode or -FDT_ERR_NOTFOUND if name not found.
+ * returns: offset of the subnode or -FDT_ERR_NOTFOUND if name not found.
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
@@ -551,7 +556,7 @@ int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
  * Identical to fdt_path_offset(), but only consider the first namelen
  * characters of path as the path name.
  *
- * Return: offset of the node or negative libfdt error value otherwise
+ * returns: offset of the node or negative libfdt error value otherwise
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
@@ -749,7 +754,7 @@ static inline struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
  * Identical to fdt_get_property(), but only examine the first namelen
  * characters of name for matching the property name.
  *
- * Return: pointer to the structure representing the property, or NULL
+ * returns: pointer to the structure representing the property, or NULL
  *         if not found
  */
 #ifndef SWIG /* Not available in Python */
@@ -851,7 +856,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
  * Identical to fdt_getprop(), but only examine the first namelen
  * characters of name for matching the property name.
  *
- * Return: pointer to the property's value or NULL on error
+ * returns: pointer to the property's value or NULL on error
  */
 #ifndef SWIG /* Not available in Python */
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
@@ -924,8 +929,8 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset);
  * Identical to fdt_get_alias(), but only examine the first @namelen
  * characters of @name for matching the alias name.
  *
- * Return: a pointer to the expansion of the alias named @name, if it exists,
- *	   NULL otherwise
+ * returns: a pointer to the expansion of the alias named @name, if it exists,
+ *	    NULL otherwise
  */
 #ifndef SWIG /* Not available in Python */
 const char *fdt_get_alias_namelen(const void *fdt,
@@ -955,8 +960,8 @@ const char *fdt_get_alias(const void *fdt, const char *name);
  * Identical to fdt_get_symbol(), but only examine the first @namelen
  * characters of @name for matching the symbol name.
  *
- * Return: a pointer to the expansion of the symbol named @name, if it exists,
- *	   NULL otherwise
+ * returns: a pointer to the expansion of the symbol named @name, if it exists,
+ *	    NULL otherwise
  */
 #ifndef SWIG /* Not available in Python */
 const char *fdt_get_symbol_namelen(const void *fdt,
@@ -1220,7 +1225,7 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
  * one or more strings, each terminated by \0, as is found in a device tree
  * "compatible" property.
  *
- * Return: 1 if the string is found in the list, 0 not found, or invalid list
+ * returns: 1 if the string is found in the list, 0 not found, or invalid list
  */
 int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
 
@@ -1230,7 +1235,7 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
  * @nodeoffset: offset of a tree node
  * @property: name of the property containing the string list
  *
- * Return:
+ * returns:
  *   the number of strings in the given property
  *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
  *   -FDT_ERR_NOTFOUND if the property does not exist
@@ -1274,7 +1279,7 @@ int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
  * If non-NULL, the length of the string (on success) or a negative error-code
  * (on failure) will be stored in the integer pointer to by lenp.
  *
- * Return:
+ * returns:
  *   A pointer to the string at the given index in the string list or NULL on
  *   failure. On success the length of the string will be stored in the memory
  *   location pointed to by the lenp parameter, if non-NULL. On failure one of
@@ -1364,7 +1369,7 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
  * of the name. It is useful when you want to manipulate only one value of
  * an array and you have a string that doesn't end with \0.
  *
- * Return: 0 on success, negative libfdt error value otherwise
+ * returns: 0 on success, negative libfdt error value otherwise
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
@@ -1484,7 +1489,7 @@ static inline int fdt_setprop_inplace_u64(void *fdt, int nodeoffset,
  * @val: new value of the 32-bit cell
  *
  * This is an alternative name for fdt_setprop_inplace_u32()
- * Return: 0 on success, negative libfdt error number otherwise.
+ * returns: 0 on success, negative libfdt error number otherwise.
  */
 static inline int fdt_setprop_inplace_cell(void *fdt, int nodeoffset,
 					   const char *name, uint32_t val)
@@ -1930,12 +1935,8 @@ int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
  *	-FDT_ERR_BADLAYOUT,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
-static inline int fdt_setprop(void *fdt, int nodeoffset, const char *name,
-			      const void *val, int len)
-{
-	return fdt_setprop_namelen(fdt, nodeoffset, name, strlen(name), val,
-				   len);
-}
+int fdt_setprop(void *fdt, int nodeoffset, const char *name,
+		const void *val, int len);
 
 /**
  * fdt_setprop_placeholder_namelen - allocate space for a property
@@ -1997,13 +1998,8 @@ int fdt_setprop_placeholder_namelen(void *fdt, int nodeoffset, const char *name,
  *	-FDT_ERR_BADLAYOUT,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
-static inline int fdt_setprop_placeholder(void *fdt, int nodeoffset,
-					  const char *name, int len,
-					  void **prop_data)
-{
-	return fdt_setprop_placeholder_namelen(fdt, nodeoffset, name,
-					       strlen(name), len, prop_data);
-}
+int fdt_setprop_placeholder(void *fdt, int nodeoffset,
+			    const char *name, int len, void **prop_data);
 
 /**
  * fdt_setprop_u32 - set a property to a 32-bit integer
@@ -2084,7 +2080,7 @@ static inline int fdt_setprop_u64(void *fdt, int nodeoffset, const char *name,
  *
  * This is an alternative name for fdt_setprop_u32()
  *
- * Return: 0 on success, negative libfdt error value otherwise.
+ * returns: 0 on success, negative libfdt error value otherwise.
  */
 static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
 				   uint32_t val)
@@ -2294,7 +2290,7 @@ static inline int fdt_appendprop_u64(void *fdt, int nodeoffset,
  *
  * This is an alternative name for fdt_appendprop_u32()
  *
- * Return: 0 on success, negative libfdt error value otherwise.
+ * returns: 0 on success, negative libfdt error value otherwise.
  */
 static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
 				      const char *name, uint32_t val)
@@ -2405,8 +2401,8 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name);
  * creating subnodes based on a portion of a larger string, such as a
  * full path.
  *
- * Return: structure block offset of the created subnode (>=0),
- *	   negative libfdt error value otherwise
+ * returns: structure block offset of the created subnode (>=0),
+ *          negative libfdt error value otherwise
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
diff --git a/scripts/dtc/livetree.c b/scripts/dtc/livetree.c
index 5d72abceb526..8baed1fca8c5 100644
--- a/scripts/dtc/livetree.c
+++ b/scripts/dtc/livetree.c
@@ -1234,7 +1234,7 @@ void fixup_phandles(struct dt_info *dti, const char *name)
 				continue;
 
 			offset = strtol(soffset, NULL, 0);
-			if (offset < 0 || offset + 4 > p->val.len) {
+			if (offset < 0 || (unsigned int)offset + 4 > p->val.len) {
 				if (quiet < 1)
 					fprintf(stderr,
 						"Warning: Label %s contains invalid offset for property %s in node %s\n",
diff --git a/scripts/dtc/version_gen.h b/scripts/dtc/version_gen.h
index 122e684e76a1..0e11fc60b1f8 100644
--- a/scripts/dtc/version_gen.h
+++ b/scripts/dtc/version_gen.h
@@ -1 +1 @@
-#define DTC_VERSION "DTC 1.7.2-g53373d13"
+#define DTC_VERSION "DTC 1.8.1-gf3451d12"
-- 
2.56.0.212.g129ede20d9-goog

