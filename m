Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30762 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgD2Dq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:28 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 06/15] samples: uhid: fix warnings in uhid-example
Date: Wed, 29 Apr 2020 12:45:18 +0900
Message-Id: <20200429034527.590520-7-masahiroy@kernel.org>
In-Reply-To: <20200429034527.590520-1-masahiroy@kernel.org>
References: <20200429034527.590520-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf <bpf@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

From: Sam Ravnborg <sam@ravnborg.org>

Fix warnings seen when building for 32-bit architecture.

Use "%xd" for arguments of type size_t to fix the warnings.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 samples/uhid/uhid-example.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/uhid/uhid-example.c b/samples/uhid/uhid-example.c
index b72d645ce828..015cb06a241e 100644
--- a/samples/uhid/uhid-example.c
+++ b/samples/uhid/uhid-example.c
@@ -165,7 +165,7 @@ static int uhid_write(int fd, const struct uhid_event *ev)
 		fprintf(stderr, "Cannot write to uhid: %m\n");
 		return -errno;
 	} else if (ret != sizeof(*ev)) {
-		fprintf(stderr, "Wrong size written to uhid: %ld != %lu\n",
+		fprintf(stderr, "Wrong size written to uhid: %zd != %zu\n",
 			ret, sizeof(ev));
 		return -EFAULT;
 	} else {
@@ -236,7 +236,7 @@ static int event(int fd)
 		fprintf(stderr, "Cannot read uhid-cdev: %m\n");
 		return -errno;
 	} else if (ret != sizeof(ev)) {
-		fprintf(stderr, "Invalid size read from uhid-dev: %ld != %lu\n",
+		fprintf(stderr, "Invalid size read from uhid-dev: %zd != %zu\n",
 			ret, sizeof(ev));
 		return -EFAULT;
 	}
-- 
2.25.1
