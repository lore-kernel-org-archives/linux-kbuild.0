Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE971A6814;
	Tue, 15 Sep 2026 00:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430875; cv=fail; b=QvrFn256kjA0MwllMBqnDBcVNFR7Z/zZqsVWRtVwDfHvwMY7FYI+Xm+oskwYPLB13/8KRgKoID29BOVU43kLKT4b4CtPUgJdPAHR4cwjmb/q9Vh63dwXvJA2qSOigjWPwB7GROXNA6nKVvFynkJgqLMZrljlNyjtnwuvfV6taeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430875; c=relaxed/simple;
	bh=YtmAwkg/MIjt7uW5Aw2EhmBWgG82W1vZ+XWQvjPYyuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ouZOYK6Z4xCFLlTgHAwlqMx+Y/2taX9LocdynYnPNVzhBvUiDbVxicve6FAnOSXAXU76XPYOeSN8X6Lp9P4l5wSnF1/SH2vS3PVLWzAgotP2x/i8emyrouJx+TttR2IChMAF22dRPnsPnZ7UFGGjbzJvvhXHZjk1VSDpdWONlDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FkUzDc7U; arc=fail smtp.client-ip=40.93.194.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FkUzDc7U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odnPBL0F0fgTHTymRqsK4VP5/lzGSyTk/dWF9VD8axQbfCWpDnkEzK+u0++OwLqX5uaTRa1m79huDD22KWSRLz66VuuYuYjWFsay4rRW1/9XW4I/G6rLMzFKBXRLmAlrwHWLSgI+OTZyMWr4Ml48NvE6nJWgoDD5Hl62/gavtHV01Gw/V6KtaVdH82MxNx3fFM78FysGuLQv+k0h2Q9cCt0eTocZ9o/fNPMIJh2GGWJeobQuwyPUkFQccjXDxiZLllvXKCN6eJEJsjb4LVb10qV6KJ5rum6WN6q38YXyCJZLm4pJTVjWJJnoOE/8oxIOzvpXGITeqcUpaPaSze6JLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBD0RMU7RV+jffkCzbcjdc2pe1wj2UEoOLyWiu9GBbM=;
 b=t9AJxbysu4jFLm4YjLOgWrw7c7sdYHci3GrcaiAak3NuFGTmW8zOu+3oP9b8FlUaRGm8IiDe0XzHkGapGIwd9lJhB89TfwoGFU+ZlpMpCt62cX6Itd6O4mCd29XEnk/kRGgiC/2a5o3nWnb8gBOnZCDnMsMrvDQZJhvyb4dnYuh1Xx47qLnluDpZUuEcI4XqYA2ccz5b/tRKNEfw3vB4qBG6NqibiWla9Vxi+SdcaYYYvyDRjQOaThpbe8M116t9FEEh9Rgg+PASPfuPaxp3yOxMbjN8bdkCW7lAQj1wo/UjEUUrV25bBi6jg6tsC0cOC7VwSdiOJ3wUx4XIHYDuRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBD0RMU7RV+jffkCzbcjdc2pe1wj2UEoOLyWiu9GBbM=;
 b=FkUzDc7UNcGQhGRC0pKl7DlGova5LYvH0i3y/O1mXEL6B1bhJv5ecu0BQc9j9GU6cI9u9o6hs3jincXEMpfBjw9D5WygBXAYDUC+ruCAMNsX5tRLiOgTL1wPwX7fe/E43JJqxXIomSmGVFPoKcei1Hz4g3EzQVVm4BvniEBf6mJfOL+NQ5Xo9wCGdlRQt0lQe4f4ieOWNElap3LBSP7kIXOEgwd9NuBd4NSVm1hbpLBeUDYW4YhSgwJreKb2I7FgO42PI9SvaFEbBzv/zeoCDuKNaQW9qbtC00mtzXEgpJ/XXE7eRZCfvhxSopFyw9yB8P/DIRkZIEb+udufq2liDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 00:07:47 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 00:07:46 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] make: cache per-directory tags
Date: Mon, 14 Sep 2026 20:07:35 -0400
Message-ID: <20260915000735.1146790-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915000735.1146790-1-ynorov@nvidia.com>
References: <20260915000735.1146790-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0044.namprd15.prod.outlook.com
 (2603:10b6:208:237::13) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acb0992-dd90-404e-b415-08df12bd5ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	3RbalKjtZbUz4osf1f6VFGuOs4ztqwuEd1Ky0dFQpuIp18l9ajek3P2ieTHFTtxZQK2CmSCdN1IaW5scAy0OdEi5FNHofs5nnT7TQZDMn67+vT3Ia/y3IFVZbwBXP2WNLJIhCIRctUw+esZFzlVQYSpfMkavMmiPUcodwmSOL++yv9Aj3K0Qyi3cACF2iHxV6dj2/gtQoDilHW+aqhqeF5kGekLpFVUAzV1fDkitIs0Ra9YwhCSEHFLnOM4VwhwYYNfbx3L16dzdx1Kf3mlHbLzKG95MdyCj+LlXE9e/HfaVkuiV6pRn8GZFF3QWCFi6Co89siEHc8lKWNAHd9DyNiXQtURaxkcIvcyZPLtzkMMTYHZqcrdUmKZnoroVYQgQvaK7NtBHcx/jiSbeGsVVrqKV5L8l+k3tcKyrreQwhYJhZU1dJHLN9wuZq8CC0xFOsr2RQ93NCcSDn4tsCuu4+4bepKZkCce6Uyc1+Wdk3Q+YmKLI+t8ckyfkbwwY4H3pQvt2eeJKIQE6LwmvhMQVcQ7/NnStJPrdabwqggX8xfbicM9WazSK+r0S7UE1Vn5HjzMbAM1MSAeNpGEPmNboRgxGVYYKglffYzVIA2hjOHQsgjoLOLZqJuREslrAaOSISnItnQlawrwTQuffQvVx0zaceh86hFTqF8iyKDn8H48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oYhKnlupSJ8y6X+XK6d1FTswGPV+QxXUiF9H/SOoq9A/PX3dVDWLIjY18zsF?=
 =?us-ascii?Q?n2CgYO7K0GYffLoyUc7StP5MN7IqZo63byuIyr1iDZyQWJCsLO8XZhrhIcnG?=
 =?us-ascii?Q?3e4dd/IeuCYO+/PGwQIEkKtLOf5sG+0VWcmQbaAmmOR9cOh2Jc4EhT/Hpkzq?=
 =?us-ascii?Q?XI/CQ6cNjGkLqQ2fccU0ZUUumItqoOqDqeNJVn4ZnFt+PHVTHUIOxShDhqX0?=
 =?us-ascii?Q?KKk5Y2YY0TdvrrpcaN88/WYt/PbQPp0cZBbP8baXJGY0pfOBfLOUBRLdnyk8?=
 =?us-ascii?Q?YWT/cGHBCzQL/X3upCFmm6l5teubyLBw2jIPBMd0roj35ivDTOv7BvijVKl3?=
 =?us-ascii?Q?GpmE/vRFiPX0ecm4h9AUt8/ylOpXFY81L34YC8IBFpfPPBb1txHy16yia+bv?=
 =?us-ascii?Q?Z/crd8oRPe5M5kHc6OQJeHYxcShir31hE2WiwfJ8rU0XlcfdtBtvCf9gQhXT?=
 =?us-ascii?Q?j1CbYh6NZXU5o7irEWwjr9geQEFo16xZt+u2thtLyoUX9WVEMWZ+gI2kowb1?=
 =?us-ascii?Q?mCcl6kSg/E5Bc6ZgR57rdxHRdLQpoJ4wIqBIuyxqLi6yDjWdjPmQml2VdBpg?=
 =?us-ascii?Q?8REESwKv77WiPEgdU4IVBaaw1UB3q4WySFVd6UAi47qjppnoozHUVLbYu4zE?=
 =?us-ascii?Q?FOgpCTOFE+s8O/J/LI7w8kzj+tgJDxMmiCMedqMSLoqpwpLK0T3ztx8n0UB5?=
 =?us-ascii?Q?zPARRSVqIclhf1FujYYbxcUHUdN5LHrxQ3298+j0No6shRcJSZlN8R/qdnkP?=
 =?us-ascii?Q?JtVjrGKxhBmhb9NqvGVksTT1bFcXP80wD2/KG067LlOaU854AUqol5ln7/Lh?=
 =?us-ascii?Q?78YKyTb1J0Qbqea2TgGft6nNtRwmmtyiSwsV8gx/FFn6ycKArdlW2c8eqr8r?=
 =?us-ascii?Q?pPxE+EVYUgXkeryKKb0y67PWRI8PCw6Ov1ZUTxgxmb+UpA4LaFZRmgk1U32C?=
 =?us-ascii?Q?Vt+4KE5AzAh/stCH2oKO80gsbMeHfoGhwXXauPYfQnwrlzTW16ABnmwtTciU?=
 =?us-ascii?Q?3mLzPov/hxuXaEHIY1LYXQKdQ2uWunpcCt8CXUzdu3Nn4NG9Fmd/qsUsHWPr?=
 =?us-ascii?Q?5R1QhUkS0zevEoUlypDy6Aw2gvf4a8jVsB1oGC366o69dQhUDO3mCKr6RbuM?=
 =?us-ascii?Q?cNs4skuPboyir5RR7qtMevAo6kyxyW02agRw11c2jOc58whHuOd0dEe9BNL/?=
 =?us-ascii?Q?Tlodt0ar19VxViAn+lhbvW0hqZGRH4INxUbyrWlKSuIEriOfxwimw/uhApA6?=
 =?us-ascii?Q?93WoIVIiApAwzaIqCStJWQl3Jzv7PCrQL6JkmLt/JRHHU1oL2x6S7XA3hcxt?=
 =?us-ascii?Q?xdHPw/Ujq7mZE+57XT8JM0Yqwh28dcE8FMIdnbQnFq4PSsSz9ejiEIL3B4cN?=
 =?us-ascii?Q?PCFqVtwTmEf9IdDCHzxg4L8+vzOfQI7iX2IYqrFQycdCItNMmCc9zGK4zf+C?=
 =?us-ascii?Q?A22pPu3z1yRtqR9yspcanZcn8pP4aZ+3BdZ3DScLP7ezE7HjpNn1dGIVI0I4?=
 =?us-ascii?Q?PsktvmrqGDTBoIwWgPgoip646uARiCrejfO57CN3s0vK6DSzg4zdCevy5HZe?=
 =?us-ascii?Q?rXGa4pnYghHhvJgxuVw2m3agcDP1vc2GeIlIsstajfIw9r4vllcikCfjNzpE?=
 =?us-ascii?Q?cqgOQ66RqHx7uF/ot3t63KFDkjSkobZBP9RwThG+y+xBbU431kAfw2sDqaDF?=
 =?us-ascii?Q?8DQMb6Og8KogD3U1V/grUxf8+jh3dFOjl/jlhhMZP5HCXfJwKTVOOIlCWG57?=
 =?us-ascii?Q?dvpXn2Mwnw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acb0992-dd90-404e-b415-08df12bd5ec6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:07:46.1322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vT0dW6t+UHrDmGjMkbbmfh/d/TqjOXjXgT0elsiNnCztOtqYs8hoIOeHUYo4uJOnhDA3/cS3cBQktn92wEtIRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

Reuse directory tag files across make tags invocations. Track source
files and per-directory input lists with make dependencies so only changed
entries are indexed again. Reuse the source inventory and dependency rules
when the selected file list is unchanged. Ignore references to missing
sources in stale .cmd files before building cache lists and dependencies.

Record cache locations, so obsolete files can be pruned after a successful
run, including after an earlier interrupted update.

Document manual recovery from corrupt caches and require one invocation
at a time per build directory, without concurrent cache cleanup.

Mirror source directories for out-of-tree builds and keep external inputs
under .tags.external in the build tree.

Caching doesn't measurably affect clean 'make tags' execution time, and
substantially improves on subsequent runs:

                            real          user          sys
Clean tags generation       1m39.203s     9m1.450s      2m7.552s
Single file updated         0m7.738s      0m7.042s      0m4.031s
Unchanged sources           0m0.722s      0m0.482s      0m0.304s

The cache is kept compressed, and occupies approximately 150 MB,
less than 10% of the final tags file size.

Assisted-by: OpenAI Codex
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 .gitignore                      |   1 +
 Documentation/kbuild/kbuild.rst |  43 ++++++++-
 Makefile                        |   1 +
 scripts/Makefile.tags           |  14 ++-
 scripts/tags.sh                 | 153 +++++++++++++++++++++++++++++---
 5 files changed, 193 insertions(+), 19 deletions(-)

diff --git a/.gitignore b/.gitignore
index 9875120ea7bd..df1e931d0140 100644
--- a/.gitignore
+++ b/.gitignore
@@ -137,6 +137,7 @@ patches
 series
 
 # ctags files
+.tags.*
 tags
 !tags/
 TAGS
diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 61587adeedba..0f6c4ebb939f 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -323,8 +323,47 @@ The jobs share make's jobserver with other build targets. For example::
 
     $ make -j8 ALLSOURCE_ARCHS=all tags
 
-Per-directory tag files are temporary and are removed after merging.
-Every invocation regenerates the complete tags file.
+Each directory has a cached input list and tag file: ``mm/.tags.files`` and
+``mm/.tags.zst``, for example. Out-of-tree builds mirror these paths in the
+build directory, leaving the source tree untouched. Inputs outside both trees
+are cached under ``.tags.external/`` in the build directory.
+
+Each cached tag file is sorted, carries an internal header/data prefix, and is
+compressed with ``zstd -1``. This requires zstd 1.5.6 or later (overridable
+with ``ZSTD``).
+The final merge temporarily decompresses the shards, uses ``sort -m``, and
+removes the prefixes, producing a normal uncompressed ``tags`` file without
+re-sorting unchanged directories. Temporary files are removed after merging;
+allow disk space for the decompressed shards as well as the final output.
+Obsolete shards and their input lists are removed after a successful run.
+
+The build root holds the shared ``.tags.inputs``, ``.tags.settings``,
+``.tags.shards``, ``.tags.dependencies``, and ``.tags.locations`` manifests.
+The complete source list is cached in ``.tags.inputs``. When it is unchanged,
+the per-directory lists and dependency rules are reused without regenerating
+or comparing them. Make still checks source timestamps on every invocation.
+Missing per-directory input lists are regenerated automatically.
+
+Each invocation checks the source lists, but only directories with changed
+sources, file lists, or the ctags command or version are indexed again. The
+final ``tags`` file is merged only when needed. Added and deleted sources
+and changes to architecture selection or ignored directories are detected
+automatically. ``make mrproper`` removes the cache and shared manifests.
+
+Changes to ctags configuration files or an executable replacement with the
+same command and version are not detected. After such changes, remove
+``.tags.settings`` in the build directory to force regeneration on the next
+``make tags`` invocation.
+
+Missing tag files are rebuilt automatically. Existing cache files are not
+checked for corruption on unchanged runs. If a merge reports a corrupt
+cache file, remove that file and rerun ``make tags``, or remove
+``.tags.settings`` to rebuild all cached tags.
+
+Run only one ``make tags`` invocation at a time in a given build directory.
+Concurrent invocations, including those selecting different architectures,
+are not supported. Do not run cache cleanup or ``make mrproper`` alongside
+tag generation.
 
 IGNORE_DIRS
 -----------
diff --git a/Makefile b/Makefile
index 6f3945fa3fc6..62531970d004 100644
--- a/Makefile
+++ b/Makefile
@@ -1810,6 +1810,7 @@ $(mrproper-dirs):
 	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
 
 mrproper: clean objtool_mrproper $(mrproper-dirs)
+	$(Q)$(BASH) $(srctree)/scripts/tags.sh tags-clean
 	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.rmeta' \) \
diff --git a/scripts/Makefile.tags b/scripts/Makefile.tags
index d5967a3ac496..2274669e06f0 100644
--- a/scripts/Makefile.tags
+++ b/scripts/Makefile.tags
@@ -1,9 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Directory tag shards share the parent make's jobserver.
 
-.PHONY: tags
-tags: $(shell cat $(tags_tmp)/shards)
-	$(Q)$(BASH) $(srctree)/scripts/tags.sh tags-merge $(tags_tmp)
+.DEFAULT_GOAL := tags
+tag_shards := $(shell cat .tags.shards)
 
-%.tags: %.files
+include .tags.dependencies
+
+tags: $(tag_shards) .tags.shards .tags.settings \
+      $(srctree)/scripts/tags.sh $(srctree)/scripts/Makefile.tags
+	$(Q)$(BASH) $(srctree)/scripts/tags.sh tags-merge
+
+%.zst: %.files .tags.settings $(srctree)/scripts/tags.sh \
+       $(srctree)/scripts/Makefile.tags
 	$(Q)$(BASH) $(srctree)/scripts/tags.sh tags-worker $@
diff --git a/scripts/tags.sh b/scripts/tags.sh
index b001e0f78d2f..b541228d0045 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -119,6 +119,7 @@ all_sources()
 
 all_compiled_sources()
 {
+	local file
 	{
 		echo include/generated/autoconf.h
 		# A .cmd batch with no source references is not an error.
@@ -128,7 +129,12 @@ all_compiled_sources()
 			grep -Poh "$pattern" "$@" || [ "$?" -eq 1 ]
 		' sh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
-	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
+	} | while IFS= read -r file; do
+		# Old .cmd files may reference sources removed since the last build.
+		if [ -f "$file" ]; then
+			printf '%s\n' "$file"
+		fi
+	done | xargs -r realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
 }
 
@@ -356,24 +362,81 @@ setup_tags_tmp()
 }
 
 # Let recursive make schedule directory shards using the caller's jobserver.
+# The scan is unconditional so additions and deletions are also noticed.
 parallel_tags()
 (
-	local tmp
+	local tmp file
+	# Older zstd versions mishandle hidden paths with --output-dir-mirror.
+	if ! ${ZSTD:-zstd} --version | awk '
+		match($0, /v[0-9]+\.[0-9]+\.[0-9]+/) {
+			split(substr($0, RSTART + 1, RLENGTH - 1), v, ".")
+			ok = (v[1] * 10000 + v[2] * 100 + v[3] >= 10506)
+		}
+		END { exit !ok }'; then
+		echo "make tags requires zstd 1.5.6 or later" >&2
+		exit 1
+	fi
 	setup_tags_tmp
 	# Workers inherit these capabilities instead of probing for each directory.
 	setup_ctags ${CTAGS:-ctags}
 
 	{
+		# Invalidate caches written before shards were compressed.
+		printf '%s\n' 'shard-format=distributed-zstd-v1'
+		printf '%s\n' "${CTAGS:-ctags}"
+		${CTAGS:-ctags} --version
+	} > "$tmp/settings"
+
+	{
+		# Include the generator so changes to the cache format rebuild lists.
+		cksum "$0"
 		all_target_sources | sed 's/^/s /'
 		all_kconfigs | sed 's/^/k /'
-	} | LC_ALL=C sort -u | awk -v tmp="$tmp" '
-		{
-			dir = substr($0, 3)
+	} | LC_ALL=C sort -u > "$tmp/inputs"
+
+	# A matching inventory is not sufficient if a cached input list was lost.
+	if [ -f .tags.shards ]; then
+		while IFS= read -r file; do
+			if [ ! -f "${file%.zst}.files" ]; then
+				rm -f .tags.inputs
+				break
+			fi
+		done < .tags.shards
+	fi
+
+	if ! cmp -s "$tmp/inputs" .tags.inputs ||
+	   [ ! -f .tags.shards ] || [ ! -f .tags.dependencies ]; then
+		# Publish inputs last: an interrupted update must regenerate the lists.
+		rm -f .tags.inputs
+		# Resolve source paths once so out-of-tree caches stay in the build tree.
+		sed -n 's/^[sk] //p' "$tmp/inputs" | tr '\n' '\0' |
+			xargs -0 -r realpath -e -- > "$tmp/paths"
+		awk -v tmp="$tmp" -v source_root="$(realpath "${srctree:-.}")/" \
+		    -v build_root="$(pwd -P)/" '
+		BEGIN {
+			printf "" > (tmp "/dependencies")
+			printf "" > (tmp "/lists")
+		}
+		/^[sk] / {
+			file = substr($0, 3)
+			getline path < (tmp "/paths")
+			# Prefer the more specific root when one tree contains the other.
+			if (index(path, source_root) == 1 &&
+			    (length(source_root) >= length(build_root) ||
+			     index(path, build_root) != 1))
+				path = substr(path, length(source_root) + 1)
+			else if (index(path, build_root) == 1)
+				path = substr(path, length(build_root) + 1)
+			else
+				path = ".tags.external" path
+			dir = path
 			if (!sub(/\/[^\/]*$/, "", dir))
 				dir = "."
+			base = (dir == "." ? "" : dir "/") ".tags"
 			if (!(dir in ids)) {
 				ids[dir] = ++n
-				print tmp "/" n ".tags"
+				print base ".zst"
+				print n, base ".files" > (tmp "/lists")
 			}
 			out = tmp "/" ids[dir] ".files"
 			if (out != previous) {
@@ -382,8 +445,49 @@ parallel_tags()
 				previous = out
 			}
 			print >> out
-		}' > "$tmp/shards"
-	${MAKE:-make} -f "${tree}scripts/Makefile.tags" tags_tmp="$tmp"
+			print base ".zst: " file > (tmp "/dependencies")
+		}' "$tmp/inputs" | LC_ALL=C sort > "$tmp/shards"
+	fi
+
+	# Record all locations before publishing lists so interrupted builds can
+	# still prune files left by earlier source selections.
+	if [ -f "$tmp/shards" ] || [ ! -f .tags.locations ]; then
+		{
+			for file in .tags.locations .tags.shards "$tmp/shards"; do
+				if [ -f "$file" ]; then
+					cat "$file"
+				fi
+			done
+		} | LC_ALL=C sort -u > "$tmp/locations"
+		mv "$tmp/locations" .tags.locations
+	fi
+
+	if [ -f "$tmp/lists" ]; then
+		local id dir
+		while read -r id file; do
+			dir=${file%/*}
+			if [ "$dir" != "$file" ] && [ ! -d "$dir" ]; then
+				mkdir -p "$dir"
+			fi
+			if ! cmp -s "$tmp/$id.files" "$file"; then
+				mv "$tmp/$id.files" "$file"
+			fi
+		done < "$tmp/lists"
+	fi
+	for file in settings shards dependencies; do
+		if [ -f "$tmp/$file" ] && ! cmp -s "$tmp/$file" ".tags.$file"; then
+			mv "$tmp/$file" ".tags.$file"
+		fi
+	done
+	if [ ! -f .tags.inputs ]; then
+		mv "$tmp/inputs" .tags.inputs
+	fi
+	${MAKE:-make} -f "${tree}scripts/Makefile.tags"
+	if ! cmp -s .tags.locations .tags.shards; then
+		LC_ALL=C comm -23 .tags.locations .tags.shards | remove_tag_shards
+		cp .tags.shards "$tmp/locations"
+		mv "$tmp/locations" .tags.locations
+	fi
 )
 
 merge_tags()
@@ -391,15 +495,26 @@ merge_tags()
 	local tmp
 	setup_tags_tmp
 
+	# Use only current shards, excluding directories removed since last run.
+	# Expand into the temporary directory; cleanup also covers decode failures.
+	xargs -r ${ZSTD:-zstd} -q -d --output-dir-mirror="$tmp" -- < .tags.shards
 	# Read filenames from stdin to avoid command-line length limits.
 	{
-		tr '\n' '\0' < "$1/shards"
+		sed "s|^|$tmp/|; s/\.zst$//" .tags.shards | tr '\n' '\0'
 		# sort requires at least one input, even when there are no shards.
 		printf '/dev/null\0'
 	} | LC_ALL=C sort -m -u --files0-from=- | cut -f2- > "$tmp/merged"
 	mv "$tmp/merged" tags
 )
 
+# Remove both files belonging to each listed shard, preserving path boundaries.
+remove_tag_shards()
+{
+	while IFS= read -r file; do
+		printf '%s\0' "$file" "${file%.zst}.files"
+	done | xargs -0 -r rm -f --
+}
+
 remove_struct_forward_declarations()
 {
 	LC_ALL=C sed -e '/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' "$@"
@@ -465,7 +580,7 @@ case "$1" in
 		;;
 
 	"tags-worker")
-		tags_input=${2%.tags}
+		tags_input=${2%.zst}
 		# Never expose an incomplete shard after an error or interruption.
 		setup_tags_tmp
 		tags_flags=(-f "$tmp/tags" --sort=no --tag-relative=no)
@@ -476,16 +591,28 @@ case "$1" in
 			{
 				sub(/^!_TAG_FILE_SORTED\t0\t/, "!_TAG_FILE_SORTED\t1\t")
 				print (/^!_TAG_/ ? "0\t" : "1\t") $0
-			}' | LC_ALL=C sort --parallel=1 -u > "$tmp/sorted"
-		mv "$tmp/sorted" "$2"
+			}' | LC_ALL=C sort --parallel=1 -u |
+			${ZSTD:-zstd} -q -1 --single-thread -c > "$tmp/sorted.zst"
+		mv "$tmp/sorted.zst" "$2"
 		exit 0
 		;;
 
 	"tags-merge")
-		merge_tags "$2"
+		merge_tags
 		exit $?
 		;;
 
+	"tags-clean")
+		set -eo pipefail
+		for file in .tags.locations .tags.shards; do
+			if [ -f "$file" ]; then
+				remove_tag_shards < "$file"
+			fi
+		done
+		rm -f .tags.{inputs,settings,shards,dependencies,locations}
+		exit 0
+		;;
+
 	"TAGS")
 		rm -f TAGS
 		xtags etags
-- 
2.53.0

