Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout.easymail.ca ([64.68.201.169]:50547 "EHLO
	mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752080AbaKDRST (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 12:18:19 -0500
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 15/20] selftests/net: add install target to enable installing test
Date: Tue,  4 Nov 2014 10:11:11 -0700
Message-Id: <5c5e744edcdce1977e35c1e8f0d31956b373bc77.1415117102.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1415117102.git.shuahkh@osg.samsung.com>
References: <cover.1415117102.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1415117102.git.shuahkh@osg.samsung.com>
References: <cover.1415117102.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gregkh@linuxfoundation.org, akpm@linux-foundation.org, mmarek@suse.cz, davem@davemloft.net, keescook@chromium.org, tranmanphong@gmail.com, dh.herrmann@gmail.com, hughd@google.com, bobby.prani@gmail.com, ebiederm@xmission.com, serge.hallyn@ubuntu.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, netdev@vger.kernel.org

Add a new make target to enable installing test. This target
installs test in the kselftest install location and add to the
kselftest script to run the test.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/net/Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 62f22cc..988e722 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -6,11 +6,21 @@ CFLAGS = -Wall -O2 -g
 CFLAGS += -I../../../../usr/include/
 
 NET_PROGS = socket psock_fanout psock_tpacket
+INSTALL_PROGS = run_netsocktests run_afpackettests test_bpf.sh $(NET_PROGS)
 
 all: $(NET_PROGS)
 %: %.c
 	$(CC) $(CFLAGS) -o $@ $^
 
+install: all
+	install $(INSTALL_PROGS) $(INSTALL_KSFT_PATH)
+	echo "\necho \"Start net test ....\"" >> $(KSELFTEST)
+	echo "/bin/sh ./run_netsocktests || echo \"sockettests: [FAIL]\"" >> $(KSELFTEST)
+	echo "/bin/sh ./run_afpackettests || echo \"afpackettests: [FAIL]\"" >> $(KSELFTEST)
+	echo "./test_bpf.sh" >> $(KSELFTEST)
+	echo "echo \"End net test ....\"" >> $(KSELFTEST)
+	echo "echo \"==============================\"" >> $(KSELFTEST)
+
 run_tests: all
 	@/bin/sh ./run_netsocktests || echo "sockettests: [FAIL]"
 	@/bin/sh ./run_afpackettests || echo "afpackettests: [FAIL]"
-- 
1.9.1

