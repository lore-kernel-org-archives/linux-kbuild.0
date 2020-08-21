Return-Path: <SRS0=pthm=B7=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F95C433DF
	for <linux-kbuild@archiver.kernel.org>; Fri, 21 Aug 2020 19:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5145A207BB
	for <linux-kbuild@archiver.kernel.org>; Fri, 21 Aug 2020 19:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598036587;
	bh=t1YDRwXpxoJBLErIGTC22ZnWx0ImnyoxJUccV6N8Pqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Y5U6nfiwpCPdQcX8rsOPmJjC1yr0lZ+5+CtW3MeFIpVfv70a+sNDZbAm7jVHTr4sU
	 7XQ0DHx0n1nYwxdgSEh8cTuQkeCqjbJHxYw8uNfDrfvKevVkaQyTCJ3hfNTGiKdZv+
	 di/Ix9ArpkTDWNml0h/idql4fVACRhGuyj1nBMLo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgHUTDG (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 21 Aug 2020 15:03:06 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:62822 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgHUTC5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:02:57 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07LJ23eU027595;
        Sat, 22 Aug 2020 04:02:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07LJ23eU027595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598036526;
        bh=8cSRIBoO/zleevMu8zzDy06lPzwCJYJIGufBDcMF7kI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NCiA6t/JegItLlAzbblsgbvQl+VEZ1hhoSwI8vU0VwZIDuFBkvbLyLR0goXd7nOK8
         qWHmEUJ4yyCeS19xtoZW0/ZeQfhC993xSQyWrqborKOroJD1MAE6C8qtxotPHh0aEZ
         QSWG2w7PmseRvMn/huQoPEdv1/z/2GUiwhuzdOvSYKrJyXZRVDjPjNcmAX8T+xLQRS
         2ekch67bGGbii/rjRrqL9dGTt4XoFpEB5aSeDUnJ+pYo4TWlyWqeEHJqSqmJ8cFu5u
         o+MF7MDdIBPOyqx40Ekp3RGTuEh5EyN9dO7p3982x5JyRWiiduNy/XsvqAPZNsi4Xl
         CWqCH+5Zk4qkA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] gen_compile_commands: use choices for --log_levels option
Date:   Sat, 22 Aug 2020 04:01:52 +0900
Message-Id: <20200821190159.1033740-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821190159.1033740-1-masahiroy@kernel.org>
References: <20200821190159.1033740-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use 'choices' instead of the own code to check if the given parameter
is valid.

I also simplified the help message because, with 'choices', --help
shows the list of valid parameters:

  --log_level {DEBUG,INFO,WARNING,ERROR,CRITICAL}

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch

 scripts/gen_compile_commands.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 1bcf33a93cb9..535248cf2d7e 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -45,24 +45,18 @@ def parse_arguments():
                    'compile_commands.json in the search directory)')
     parser.add_argument('-o', '--output', type=str, help=output_help)
 
-    log_level_help = ('The level of log messages to produce (one of ' +
-                      ', '.join(_VALID_LOG_LEVELS) + '; defaults to ' +
+    log_level_help = ('the level of log messages to produce (defaults to ' +
                       _DEFAULT_LOG_LEVEL + ')')
-    parser.add_argument(
-        '--log_level', type=str, default=_DEFAULT_LOG_LEVEL,
-        help=log_level_help)
+    parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
+                        default=_DEFAULT_LOG_LEVEL, help=log_level_help)
 
     args = parser.parse_args()
 
-    log_level = args.log_level
-    if log_level not in _VALID_LOG_LEVELS:
-        raise ValueError('%s is not a valid log level' % log_level)
-
     directory = args.directory or os.getcwd()
     output = args.output or os.path.join(directory, _DEFAULT_OUTPUT)
     directory = os.path.abspath(directory)
 
-    return log_level, directory, output
+    return args.log_level, directory, output
 
 
 def process_line(root_directory, file_directory, command_prefix, relative_path):
-- 
2.25.1

