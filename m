Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03CF175A8A;
	Tue, 15 Sep 2026 00:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430870; cv=fail; b=Yg+44Gk4PJ2KXLlwD/4DPR+kuS5fhIs16KVs30U+fPqOaV6ESS2gUzGCKdbf+TRw2RdnAV46DFIw9NPM3k8laXEj9v1f8NfyinT49cXqJDxPQed0XndIiNdpj76PW+pU+io1HSuWnoLm6r1ZsFtFEqc6vwJfyqHhLl07aLNT9GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430870; c=relaxed/simple;
	bh=I8ThdAhcB7Nfj5O1GKCuaKG1TRSWnSga2c+2M8UnhEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bSNU77Be4OyU0nAvgLzQbfp55VfagudTFjUCaXOZLznqyD6oPfgyCM/BlRuTJSLYSB3YPNE8+jsGjXl9/bEC8lwi32+MdF4fexsBT0k9TOXqw1uG5edvVIGRlaRquZPPQ4yQj0+v3gw3pA8CCAjOsfe7KUPwBLa/qhTsX7Yx7ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FsKsBbtn; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FsKsBbtn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCxwH3FRPsVSNwLwtiiIeoptSJ8DiIyms7TvdwmphGwoMPiwK7WzEm/3yaAans6rCsUh9O6+SLjWFT1wKIjJ2FCvYNWdFTh+hWEnvkrcJKRu6hbMRh5Q9DMj5d+61JnYewdjGWtzjmWSTtFgscnYbRIEQoAi+sQzsyMaLOlDxBuJIFCCmWqyFIOMUephrJmbs8dOPvnq6XPT+C88ESR144kQPcCsfeU6V0S5MVbYF5l4OMYmHl5eVSoyOyWDX59tGk2AoI5ZmZP7Jokathj4oC3BbmemtxNKnXcgq07UKiKe1Tzap9LQcHQRzx+x/YPOnJE/9OH7LtLA8PCsh7VgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xkMU347kaSfWFryZeqGC40DMaph4QovCAQOdybBudA=;
 b=M2boUwiXZHeWGEJLGYzCF7DkT9VhUwg/Z4dDhdmJgFd/JHDLCJ5y0z9Qg10z3jdDA7ZsUMh1pw5KPWfkoH3my8f5jw0bXMswjWiKSWz0QerMkQDfVxzWT7nrC9x843lxdqqW+E/rJgKj8srrQuoXwCD0ygdLsnqQ1MQv3j83afcyT9SOraz90fU0Jpydj1b/E+SZ7zZ36xixmcxRpkZ239jD7GnBVmCcpQchN/TU1O4sMaUqD/KRMLE61mlEd+qGPBiyRaNiN9Cobje9522mIclVAIswc15iRusENMY9YOyn3TKIK4YU+x/3V4JruIGOvhq10Nlf2Ud/AAkLnozr5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xkMU347kaSfWFryZeqGC40DMaph4QovCAQOdybBudA=;
 b=FsKsBbtn3LlOmI3YNV7VcFG8V3HhLuxktqdLbfIX8B9qAdzivYMgDfh98CNBMTdHg/JfE1UxSQVay2yEIJNvyKyn5hV3FNQ4GCGdJ7YhPhgcEx58CNPjA+qMotYPhHzXBoJPaLhkymcO6AfenRPpO7WXt5kUftrzAGH/OmjGKcu+UkbHGsuAj+p9l4iJSmIREE64Y8fe6TfmS7jq0DGbB3joBi/7IhHBTn+eG5iAC4rAaAMHThaMiVu0rM8EN1s/dg/0pUp9e1dMXBOvqJKKaZgWSLapYIYFXv3iuU89IJcBapX3q2wVA5ODHGlXSC/cs8DFQTj3ksgjW67DVnItWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 00:07:42 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 00:07:42 +0000
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
Subject: [PATCH 1/2] make: parallelize tags generation
Date: Mon, 14 Sep 2026 20:07:34 -0400
Message-ID: <20260915000735.1146790-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915000735.1146790-1-ynorov@nvidia.com>
References: <20260915000735.1146790-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:408:112::10) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca2b27f-3340-4b8c-d4dc-08df12bd5ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	DIytuZyKATAVfFTjlMduBbhFOmuB1K/Ow9d5tZZc/V1wlgfkDwXFBqbfQFJ6zOr6mAX8n9FGorZ0k2qkR28iTWEc4tuxPcM7u+netMY4TPExSTSiZxJ4/FrUuQZBW3JfPBjzS6DNJ5Hw3C8VP7MTgGRZdnrRPueGeaaRfhYFwT+rQZfLulOFejtEW3+rkLFIv8nUMzxuAn1oMMwobssRrqi9GQ0AlLb4ZyZyPVYhqlJp9WAE0fyZDv3WyElLYrxAw9W6hZ1g6QysFbGSjJ7GalLqP2YobDaJyz/Xn2i9WIpEEyo8IfsfpvGoC72LqxSTPsKmA3PZ2XDxKRKwEm/n7hAPEdMBwifUzmF+RuOr/ZmmG7Kx5d1YAAXJ0GXG0CgsFLDHp6gmUeJZTlKf1B91FNONkY0qv3Unpm4VzgJbfTv8lVlicxyqB4N0siJJZTN1XB+sjuRDy2G9N4IxzMcveSSd8GxEQnIgVI8ml3CjwYoHx7jRhsLp+W7E5V5iy5J/Fxeil3vMdOVBpOOll1XAbPGJZQHkP/UOE/Arc+HVwFG63MAc5Nf+VkFGdHpPvc9+F9S6qGGy7RZDfY36a2VNkniWFLCbGvISyq2LmHyRzugOqiA7Q+gQIv3Ss5bu9swSAy+7X8NQZsJnWJPHOttWHPF/N7SPG+cz1U2YQSTTH9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K9ZfhKdSek8g/4E5ae7FvQTUF6I1xlCbHjtgCw803qUV7cCYAr6iFGfbuIO4?=
 =?us-ascii?Q?Sh3XTPMzg3sGu/wj81xIKJuQyIxzqz1ERHF1pcWodullBYWHBL76mjmiyPsU?=
 =?us-ascii?Q?SXh0LFTSSOsFTgmz/THwNCYtjM9jqnJykWjs4g5FLfFP1pKGs+2BLp/6Yek/?=
 =?us-ascii?Q?NvZDSLM3qDghrbLclec2EL6s6yCX7gP3WUYFpWK9g+rw0Wg/QQs1F5l1LVFo?=
 =?us-ascii?Q?0HrDOSauwRVZTA+PFW5K4lnUPDBh1zvOFq9Gvz9V8ATtnFneLW+jsV9NA6k7?=
 =?us-ascii?Q?PTvohQ2343qgv8ou1gvePVojGyi9dl8kDVgwVJeqDBX2qHyjT888UMFBU5/s?=
 =?us-ascii?Q?3kaHYpijE9HlAXOk5dbLrOqIwUt6cWQieTyxXZLepE7XphE0unxm6mONWFPX?=
 =?us-ascii?Q?RkDiQS97SvUNihNsZBUvMpxthEVnqcPc5DdR+cxEbyqNJ/1EH+Tw6YjwPHq9?=
 =?us-ascii?Q?2mcPfMX989zu/KlMxCrXFrzKksaTkDdgk8vEbAAaHCCZgQ2Zn5wuHKJThlFZ?=
 =?us-ascii?Q?QRxzkokxjU/h8Gm8YzkQAFv3zFBzcTd9UNUPMcFpkctdd4k1ktqrMk9uAnp7?=
 =?us-ascii?Q?m+ylk5X1Gu+p6LTZjN4uC6faAPe79/np5j0MH1rNNE02Id/9V2Ks9RhFb/ZQ?=
 =?us-ascii?Q?BlC3ACQruSH4IZg4POvQtt2Tz4cjX/bfROBI8u48mNusYMf6MZ6ZR9R1UQ2W?=
 =?us-ascii?Q?mCycWFMkTk9dgj9smvrPOB+vT93ugrC+RFwfRDONijavMqcKoSpUSw/RmDYS?=
 =?us-ascii?Q?Gz7dIVKyNHKTa9FtjWMpKGVgXfY3CV4sTWnLufNCvXW6BJfdbor8iYzN1XqM?=
 =?us-ascii?Q?bHVWzjNXTa8F/t4mpo6KhNIHJ/7x7s5sPHbMqJN/k+SkRXbM6UyshRpmIhhx?=
 =?us-ascii?Q?PNTTihGo3recK6BOV1PiQYqTvLaviPIY9n/3mcQo+wVJC492c7WT2UuVpRT9?=
 =?us-ascii?Q?2r/fCU7OyKwYV5P1j7RgA2O9jyKHEzDETXky33Oy3mh3dkjAq6cQRnBk4TEC?=
 =?us-ascii?Q?RgamznftM1NI2sVYSptGShf88Yuu8Ii9fUBBKBS7XmAkXDpZZf1KTcZxsCoS?=
 =?us-ascii?Q?ZhcOUFKk8lxZM6fgKVBIOWLMgAnKSYpHl2ehcBteefNbhXlwVaXbq0DH+2bz?=
 =?us-ascii?Q?1kEn0aXGa7sSgMy0HhcrD2/ymMzZEq84yOaih/ODpJsiNcdkz/smKCc0MwB3?=
 =?us-ascii?Q?OiEkOoOZehiddpKQdqXBRgpMLNS1mmtjOR6r0isSmii/H3hJlpIErIY7v/zA?=
 =?us-ascii?Q?z/TLNFJ3iwX2Nt9kunqQ6rUbS5paKSutX2APG8OLujhRoch9CwAMULb4QfOI?=
 =?us-ascii?Q?y3V98OnKDx7pE8XmgdyHmyfdZN2705kTaur3PUtS9FICg+l76Jek7xL8wCvS?=
 =?us-ascii?Q?jDAvyhr/imNhuhW8D+sv+RD5NdahQoGQHRO4xmAdGjFNJ6BcdIUlx38r9oTz?=
 =?us-ascii?Q?yfi78XuFhaeeuTK2XGQ+n9d++Qvoy024GqBqweoD8BfuoH8rivvH4/Ngf3eB?=
 =?us-ascii?Q?8AlBKjGMTs53Vr2cgMccGEeL0+AOCn70BrCDe4gnwFBi8dcpVYZQQNcGgoY9?=
 =?us-ascii?Q?Q8M0iMLx5ZThtz4lVly5af9k/A9GVey5+a60IIgnxD9wTD8q1+FTJgHFxR/y?=
 =?us-ascii?Q?yr5TAg+LdjV/yFTP2E7Ua4Jg3sXxknVNsA169dtC1kvynUQLv7mjQwSg2xtc?=
 =?us-ascii?Q?S9tI21nwnAn7ICvrVVVcRCLwgZgdW3J4l/BnBHOwZhHaG3V12QDWBDi3BbKu?=
 =?us-ascii?Q?6OvR5BLzyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca2b27f-3340-4b8c-d4dc-08df12bd5ce3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:07:42.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdbNZeQ6tgx/ofc3kBKVV2gjyumlyZFbetAfxJW41nrjXoT5VUJCmX1ll28VM7wjjmWapuXSWmEHI8Fw5ZLcFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

Generate per-directory tags in parallel with Exuberant or Universal Ctags.
A recursive make shares the caller's jobserver, allowing make -jN tags to
schedule directory jobs concurrently, then join them to get the traditional
tags file.

Allow compiled-source discovery to find no source references in a batch
of .cmd files, while still propagating grep errors.

The performance of the current vs parallel tags generation with

		time make -j8 ALLSOURCE_ARCHS=all tags

is:

         real         user          sys
Before:  4m40.797s    4m14.229s     0m39.341s
After:   1m39.203s    9m1.450s      2m7.552s

Assisted-by: OpenAI Codex
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 Documentation/kbuild/kbuild.rst |   9 +++
 Makefile                        |   5 +-
 scripts/Makefile.tags           |   9 +++
 scripts/tags.sh                 | 137 +++++++++++++++++++++++++++++---
 4 files changed, 148 insertions(+), 12 deletions(-)
 create mode 100644 scripts/Makefile.tags

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 5a9013bacfb7..61587adeedba 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -317,6 +317,15 @@ To get all available archs you can also specify all. E.g.::
 
     $ make ALLSOURCE_ARCHS=all tags
 
+With Exuberant or Universal Ctags, ``make -jN tags`` generates tags for
+directories in parallel and merges them into a single sorted ``tags`` file.
+The jobs share make's jobserver with other build targets. For example::
+
+    $ make -j8 ALLSOURCE_ARCHS=all tags
+
+Per-directory tag files are temporary and are removed after merging.
+Every invocation regenerates the complete tags file.
+
 IGNORE_DIRS
 -----------
 For tags/TAGS/cscope targets, you can choose which directories won't
diff --git a/Makefile b/Makefile
index 66654fa71655..6f3945fa3fc6 100644
--- a/Makefile
+++ b/Makefile
@@ -2260,7 +2260,10 @@ clean: $(clean-dirs)
 quiet_cmd_tags = GEN     $@
       cmd_tags = $(BASH) $(srctree)/scripts/tags.sh $@
 
-tags TAGS cscope gtags: FORCE
+tags: FORCE
+	+$(call cmd,tags)
+
+TAGS cscope gtags: FORCE
 	$(call cmd,tags)
 
 # Generate rust-project.json (a file that describes the structure of non-Cargo
diff --git a/scripts/Makefile.tags b/scripts/Makefile.tags
new file mode 100644
index 000000000000..d5967a3ac496
--- /dev/null
+++ b/scripts/Makefile.tags
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Directory tag shards share the parent make's jobserver.
+
+.PHONY: tags
+tags: $(shell cat $(tags_tmp)/shards)
+	$(Q)$(BASH) $(srctree)/scripts/tags.sh tags-merge $(tags_tmp)
+
+%.tags: %.files
+	$(Q)$(BASH) $(srctree)/scripts/tags.sh tags-worker $@
diff --git a/scripts/tags.sh b/scripts/tags.sh
index 41e38df96984..b001e0f78d2f 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -121,8 +121,12 @@ all_compiled_sources()
 {
 	{
 		echo include/generated/autoconf.h
-		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
+		# A .cmd batch with no source references is not an error.
+		find $ignore -name "*.cmd" -exec sh -c '
+			pattern=$1
+			shift
+			grep -Poh "$pattern" "$@" || [ "$?" -eq 1 ]
+		' sh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
@@ -130,7 +134,9 @@ all_compiled_sources()
 
 all_target_sources()
 {
-	if [ -n "$COMPILED_SOURCE" ]; then
+	if [ -n "$tags_input" ]; then
+		sed -n 's/^s //p' "$tags_input.files"
+	elif [ -n "$COMPILED_SOURCE" ]; then
 		all_compiled_sources
 	else
 		all_sources
@@ -139,6 +145,10 @@ all_target_sources()
 
 all_kconfigs()
 {
+	if [ -n "$tags_input" ]; then
+		sed -n 's/^k //p' "$tags_input.files"
+		return
+	fi
 	find ${tree}arch/ -maxdepth 1 $ignore \
 	       -name "Kconfig*" -not -type l -print;
 	for arch in $ALLSOURCE_ARCHS; do
@@ -282,12 +292,24 @@ setup_regex()
 	done
 }
 
-exuberant()
+setup_ctags()
 {
 	CTAGS_EXTRA="extra"
 	if $1 --version 2>&1 | grep -iq universal; then
 	    CTAGS_EXTRA="extras"
 	fi
+	CTAGS_KCONFIG=n
+	if $1 --list-languages | grep -iq kconfig; then
+		CTAGS_KCONFIG=y
+	fi
+	export CTAGS_EXTRA CTAGS_KCONFIG
+}
+
+exuberant()
+{
+	if [ -z "$CTAGS_EXTRA" ]; then
+		setup_ctags "$1"
+	fi
 	setup_regex exuberant asm c
 	# identifiers to ignore by ctags
 	local ign=(
@@ -312,16 +334,75 @@ exuberant()
 		static
 	)
 	all_target_sources | \
-	xargs $1 -a -I "$(IFS=','; echo "${ign[*]}")" \
+	xargs -r $1 -a "${tags_flags[@]}" -I "$(IFS=','; echo "${ign[*]}")" \
 	--$CTAGS_EXTRA=+fq --c-kinds=+px --fields=+iaS --langmap=c:+.h \
-	"${regex[@]}"
+	"${regex[@]}" || return
 
 	KCONFIG_ARGS=()
-	if ! $1 --list-languages | grep -iq kconfig; then
+	if [ "$CTAGS_KCONFIG" != y ]; then
 		setup_regex exuberant kconfig
 		KCONFIG_ARGS=(--langdef=kconfig --language-force=kconfig "${regex[@]}")
 	fi
-	all_kconfigs | xargs $1 -a "${KCONFIG_ARGS[@]}"
+	all_kconfigs | xargs -r $1 -a "${tags_flags[@]}" "${KCONFIG_ARGS[@]}"
+}
+
+# Call in a subshell so error handling and cleanup stay local to the operation.
+setup_tags_tmp()
+{
+	set -eo pipefail
+	tmp=$(mktemp -d .tmp_tags.XXXXXX)
+	trap 'rm -rf "$tmp"' EXIT
+	trap 'exit 1' HUP INT TERM
+}
+
+# Let recursive make schedule directory shards using the caller's jobserver.
+parallel_tags()
+(
+	local tmp
+	setup_tags_tmp
+	# Workers inherit these capabilities instead of probing for each directory.
+	setup_ctags ${CTAGS:-ctags}
+
+	{
+		all_target_sources | sed 's/^/s /'
+		all_kconfigs | sed 's/^/k /'
+	} | LC_ALL=C sort -u | awk -v tmp="$tmp" '
+		{
+			dir = substr($0, 3)
+			if (!sub(/\/[^\/]*$/, "", dir))
+				dir = "."
+			if (!(dir in ids)) {
+				ids[dir] = ++n
+				print tmp "/" n ".tags"
+			}
+			out = tmp "/" ids[dir] ".files"
+			if (out != previous) {
+				if (previous != "")
+					close(previous)
+				previous = out
+			}
+			print >> out
+		}' > "$tmp/shards"
+	${MAKE:-make} -f "${tree}scripts/Makefile.tags" tags_tmp="$tmp"
+)
+
+merge_tags()
+(
+	local tmp
+	setup_tags_tmp
+
+	# Read filenames from stdin to avoid command-line length limits.
+	{
+		tr '\n' '\0' < "$1/shards"
+		# sort requires at least one input, even when there are no shards.
+		printf '/dev/null\0'
+	} | LC_ALL=C sort -m -u --files0-from=- | cut -f2- > "$tmp/merged"
+	mv "$tmp/merged" tags
+)
+
+remove_struct_forward_declarations()
+{
+	LC_ALL=C sed -e '/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' "$@"
 }
 
 emacs()
@@ -366,11 +447,45 @@ case "$1" in
 		;;
 
 	"tags")
-		rm -f tags
-		xtags ${CTAGS:-ctags}
+		# Recursive recipes also run in dry-run, touch and question modes.
+		# Only normal invocations may generate intermediate files.
+		case ${MAKEFLAGS%% *} in
+		*n*) exit 0 ;;
+		*t*) touch tags; exit $? ;;
+		*q*) exit 1 ;;
+		esac
+		if ${CTAGS:-ctags} --version 2>&1 | grep -Eiq 'exuberant|universal'; then
+			parallel_tags
+			exit $?
+		else
+			rm -f tags
+			xtags ${CTAGS:-ctags}
+		fi
 		remove_structs=y
 		;;
 
+	"tags-worker")
+		tags_input=${2%.tags}
+		# Never expose an incomplete shard after an error or interruption.
+		setup_tags_tmp
+		tags_flags=(-f "$tmp/tags" --sort=no --tag-relative=no)
+		exuberant ${CTAGS:-ctags}
+		# Sort once per changed directory. Prefix records so the final merge
+		# keeps pseudo-tags ahead of all regular tag names.
+		remove_struct_forward_declarations "$tmp/tags" | awk '
+			{
+				sub(/^!_TAG_FILE_SORTED\t0\t/, "!_TAG_FILE_SORTED\t1\t")
+				print (/^!_TAG_/ ? "0\t" : "1\t") $0
+			}' | LC_ALL=C sort --parallel=1 -u > "$tmp/sorted"
+		mv "$tmp/sorted" "$2"
+		exit 0
+		;;
+
+	"tags-merge")
+		merge_tags "$2"
+		exit $?
+		;;
+
 	"TAGS")
 		rm -f TAGS
 		xtags etags
@@ -380,5 +495,5 @@ esac
 
 # Remove structure forward declarations.
 if [ -n "$remove_structs" ]; then
-    LC_ALL=C sed -i -e '/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' $1
+	remove_struct_forward_declarations -i "$1"
 fi
-- 
2.53.0

