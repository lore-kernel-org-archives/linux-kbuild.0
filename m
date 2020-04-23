Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31739 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgDWHkb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:31 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 07/16] samples: uhid: fix warnings in uhid-example
Date: Thu, 23 Apr 2020 16:39:20 +0900
Message-Id: <20200423073929.127521-8-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>

Fix warnings seen when building for 32-bit architecture.

Use "%xd" for arguments of type size_t to fix the warnings.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

This is the same as Sam's patch in 2014.
https://lkml.org/lkml/2014/7/13/152


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
