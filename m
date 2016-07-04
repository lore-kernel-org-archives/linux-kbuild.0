Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:52794 "EHLO
	smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753828AbcGDNzJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jul 2016 09:55:09 -0400
From: "Tautschnig, Michael" <tautschn@amazon.co.uk>
Subject: [PATCH] scripts: Fix size mismatch of kexec_purgatory_size
Date: Mon, 4 Jul 2016 13:55:04 +0000
Message-ID: <BE389624-FFFE-42F1-A89F-5E5598190D4A@amazon.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4D79288BAE707244A17A0CCC53700D7D@ant.amazon.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.com>, Vivek Goyal <vgoyal@redhat.com>

bin2c is used to create a valid C file out of a binary file where two
symbols will be globally defined: <name> and <name>_size. <name> is
passed as the first parameter of the host binary.

Building using goto-cc reported that the purgatory binary code (the only
current user of this utility) declares kexec_purgatory_size as 'size_t'
where bin2c generate <name>_size to be 'int' so in a 64-bit host where
sizeof(size_t) > sizeof(int) this type mismatch will always yield the
wrong value for big-endian architectures while for little-endian it will
be wrong if the object laid in memory directly after
kexec_purgatory_size contains non-zero value at the time of reading.

This commit changes <name>_size to be size_t instead.

Note:

Another way to fix the problem is to change the type of
kexec_purgatory_size to be 'int' as there's this check in code:
(kexec_purgatory_size <= 0)

Signed-off-by: Michael Tautschnig <tautschn@amazon.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
---
 scripts/basic/bin2c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/basic/bin2c.c b/scripts/basic/bin2c.c
index af187e6..c3d7eef 100644
--- a/scripts/basic/bin2c.c
+++ b/scripts/basic/bin2c.c
@@ -29,7 +29,8 @@ int main(int argc, char *argv[])
 	} while (ch != EOF);

 	if (argc > 1)
-		printf("\t;\n\nconst int %s_size = %d;\n", argv[1], total);
+		printf("\t;\n\n#include <linux/types.h>\n\nconst size_t %s_size = %d;\n",
+		       argv[1], total);

 	return 0;
 }
--
2.7.3.AMZN
